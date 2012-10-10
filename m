Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TLyB4-0003VT-2D
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 15:26:31 +0000
Subject: Re: mkfs.ubifs problem when output file really isn't in the UBIFS
 root directory
From: Marcus Prebble <marcus.prebble@axis.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
In-Reply-To: <1349868630.20594.16.camel@sauron.fi.intel.com>
References: <1348242118.2552.1460.camel@lnxprebble2.se.axis.com>
 <1349367416.20373.75.camel@sauron.fi.intel.com>
 <1349708696.2552.1821.camel@lnxprebble2.se.axis.com>
 <1349851661.20594.6.camel@sauron.fi.intel.com>
 <1349859856.2552.1962.camel@lnxprebble2.se.axis.com>
 <1349861452.20594.12.camel@sauron.fi.intel.com>
 <1349865249.2552.1965.camel@lnxprebble2.se.axis.com>
 <1349868630.20594.16.camel@sauron.fi.intel.com>
Content-Type: multipart/mixed; boundary="=-EGu7VfoCSN9CoZC/aetb"
Date: Wed, 10 Oct 2012 17:26:25 +0200
Message-ID: <1349882785.2552.1987.camel@lnxprebble2.se.axis.com>
MIME-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=-EGu7VfoCSN9CoZC/aetb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Artem,

Big thanks for the provided patch. It seems to solve the problem we here
at Axis and other users were having.
When trying to break it (unsuccessfully) I found that if the directory
of the output file was non-existent then the function would return -1
(correct), but the error messages were:

"realpath: no such file or directory"
"Error: output file cannot be in the UBIFS root directory"

which was a tad confusing. Please find attached a new diff (based off
yours) with a few minor suggested changes.

Kind regards,

/Marcus Prebble



On Wed, 2012-10-10 at 13:30 +0200, Artem Bityutskiy wrote:
> On Wed, 2012-10-10 at 12:34 +0200, Marcus Prebble wrote:
> > I will implement and come back with a patch when I have time.
> 
> I actually went ahead and cooked something. Could you please review and
> give it a test? Inlined below and also attached. Thanks!
> 
> 
> From 7c1b939f2cf0141dfb1969d51b4157a75f55ddac Mon Sep 17 00:00:00 2001
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Date: Wed, 10 Oct 2012 14:23:18 +0300
> Subject: [PATCH] mkfs.ubifs: rewrite path checking
> 
> We use the 'in_path()' function to check whether the output image is
> withing the mkfs.ubifs root directory or not. However, this function
> is not correct and it fails for the following situation, as
> Marcus Prebble <marcus.prebble@axis.com> reports:
> 
> 1. We have our root file-system mounted at / and want to build an image
>    out of it.
> 2. We have tmpfs mounted at /tmp
> 3. We mount the root file-system under /tmp/newroot
> 4. We run mkfs.ubifs with -r /tmp/newroot -o /tmp/image
> 
> And this fails. It fails because 'in_path()' misses this use-case.
> 
> This patch re-implements the check completely. Now we use 'realpath()'
> to find canonical paths and just check that the output file is not
> under the root mkfs.ubifs directory.
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> ---
>  mkfs.ubifs/mkfs.ubifs.c | 116 +++++++++++++++---------------------------------
>  1 file changed, 37 insertions(+), 79 deletions(-)
> 
> diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
> index 149806b..885c202 100644
> --- a/mkfs.ubifs/mkfs.ubifs.c
> +++ b/mkfs.ubifs/mkfs.ubifs.c
> @@ -20,6 +20,7 @@
>   *          Zoltan Sogor
>   */
>  
> +#define _XOPEN_SOURCE 500 /* For realpath() */
>  #define PROGRAM_NAME "mkfs.ubifs"
>  
>  #include "mkfs.ubifs.h"
> @@ -235,93 +236,50 @@ static char *make_path(const char *dir, const char *name)
>  }
>  
>  /**
> - * same_dir - determine if two file descriptors refer to the same directory.
> - * @fd1: file descriptor 1
> - * @fd2: file descriptor 2
> - */
> -static int same_dir(int fd1, int fd2)
> -{
> -	struct stat stat1, stat2;
> -
> -	if (fstat(fd1, &stat1) == -1)
> -		return -1;
> -	if (fstat(fd2, &stat2) == -1)
> -		return -1;
> -	return stat1.st_dev == stat2.st_dev && stat1.st_ino == stat2.st_ino;
> -}
> -
> -/**
> - * do_openat - open a file in a directory.
> - * @fd: file descriptor of open directory
> - * @path: path relative to directory
> - * @flags: open flags
> + * is_contained - determine if a file is beneath a directory.
> + * @file: file path name
> + * @dir: directory path name
>   *
> - * This function is provided because the library function openat is sometimes
> - * not available.
> + * This function returns %1 if @file is accessible from the @dir directory and
> + * %0 otherwise. In case of error, returns %-1.
>   */
> -static int do_openat(int fd, const char *path, int flags)
> +static int is_contained(const char *file, const char *dir)
>  {
> -	int ret;
> -	char *cwd;
> +	char *file_base, *copy, *real_file, *real_dir, *p;
>  
> -	cwd = getcwd(NULL, 0);
> -	if (!cwd)
> +	/* Make a copy of the file path because 'dirname()' can modify it */
> +	copy = strdup(file);
> +	if (!copy)
>  		return -1;
> -	ret = fchdir(fd);
> -	if (ret != -1)
> -		ret = open(path, flags);
> -	if (chdir(cwd) && !ret)
> -		ret = -1;
> -	free(cwd);
> -	return ret;
> -}
> +	file_base = dirname(copy);
>  
> -/**
> - * in_path - determine if a file is beneath a directory.
> - * @dir_name: directory path name
> - * @file_name: file path name
> - */
> -static int in_path(const char *dir_name, const char *file_name)
> -{
> -	char *fn = strdup(file_name);
> -	char *dn;
> -	int fd1, fd2, fd3, ret = -1, top_fd;
> +	/* Turn the paths into the canonical form */
> +	real_file = malloc(PATH_MAX);
> +	if (!real_file) {
> +		free(copy);
> +		return -1;
> +	}
>  
> -	if (!fn)
> +	real_dir = malloc(PATH_MAX);
> +	if (!real_dir) {
> +		free(real_file);
> +		free(copy);
> +		return -1;
> +	}
> +	if (!realpath(file_base, real_file)) {
> +		perror("realpath");
>  		return -1;
> -	top_fd = open("/", O_RDONLY);
> -	if (top_fd != -1) {
> -		dn = dirname(fn);
> -		fd1 = open(dir_name, O_RDONLY);
> -		if (fd1 != -1) {
> -			fd2 = open(dn, O_RDONLY);
> -			if (fd2 != -1) {
> -				while (1) {
> -					int same;
> -
> -					same = same_dir(fd1, fd2);
> -					if (same) {
> -						ret = same;
> -						break;
> -					}
> -					if (same_dir(fd2, top_fd)) {
> -						ret = 0;
> -						break;
> -					}
> -					fd3 = do_openat(fd2, "..", O_RDONLY);
> -					if (fd3 == -1)
> -						break;
> -					close(fd2);
> -					fd2 = fd3;
> -				}
> -				close(fd2);
> -			}
> -			close(fd1);
> -		}
> -		close(top_fd);
>  	}
> -	free(fn);
> -	return ret;
> +	if (!realpath(dir, real_dir)) {
> +		perror("realpath");
> +		return -1;
> +	}
> +
> +	p = strstr(real_file, real_dir);
> +	free(real_dir);
> +	free(real_file);
> +	free(copy);
> +	return !!p;
>  }
>  
>  /**
> @@ -376,7 +334,7 @@ static int validate_options(void)
>  
>  	if (!output)
>  		return err_msg("no output file or UBI volume specified");
> -	if (root && in_path(root, output))
> +	if (root && is_contained(output, root))
>  		return err_msg("output file cannot be in the UBIFS root "
>  			       "directory");
>  	if (!is_power_of_2(c->min_io_size))
> -- 
> 1.7.11.4
> 
> 
> 


--=-EGu7VfoCSN9CoZC/aetb
Content-Disposition: attachment;
	filename="0002-mkfs.ubifs-rewrite-path-checking.patch"
Content-Type: text/x-patch;
	name="0002-mkfs.ubifs-rewrite-path-checking.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

diff --git a/mtd-utils/mkfs.ubifs/mkfs.ubifs.c b/mtd-utils/mkfs.ubifs/mkfs.ubifs.c
index a361df9..dce21ae 100644
--- a/mtd-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/mtd-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -252,7 +252,10 @@ static char *make_path(const char *dir, const char *name)
  */
 static int is_contained(const char *file, const char *dir)
 {
-	char *file_base, *copy, *real_file, *real_dir, *p;
+	char *real_file = NULL;
+	char *real_dir = NULL;
+	char *file_base, *copy;
+	int ret = -1;
 
 	/* Make a copy of the file path because 'dirname()' can modify it */
 	copy = strdup(file);
@@ -262,31 +265,29 @@ static int is_contained(const char *file, const char *dir)
 
 	/* Turn the paths into the canonical form */
 	real_file = malloc(PATH_MAX);
-	if (!real_file) {
-		free(copy);
-		return -1;
-	}
+	if (!real_file)
+		goto out_free;
 
 	real_dir = malloc(PATH_MAX);
-	if (!real_dir) {
-		free(real_file);
-		free(copy);
-		return -1;
-	}
+	if (!real_dir)
+		goto out_free;
+
 	if (!realpath(file_base, real_file)) {
-		perror("realpath");
-		return -1;
+		perror("realpath file");
+		goto out_free;
 	}
 	if (!realpath(dir, real_dir)) {
-		perror("realpath");
-		return -1;
+		perror("realpath directory");
+		goto out_free;
 	}
 
-	p = strstr(real_file, real_dir);
-	free(real_dir);
-	free(real_file);
+	ret = strstr(real_file, real_dir) ? 1 : 0;
+
+out_free:
 	free(copy);
-	return !!p;
+	free(real_file);
+	free(real_dir);
+	return ret;
 }
 
 /**
@@ -346,9 +347,13 @@ static int validate_options(void)
 
 	if (!output)
 		return err_msg("no output file or UBI volume specified");
-	if (root && is_contained(output, root))
-		return err_msg("output file cannot be in the UBIFS root "
-			       "directory");
+	if (root) {
+		if ((tmp = is_contained(output, root)) < 0)
+			return err_msg("failed to perform output file root check");
+		else if (tmp)
+			return err_msg("output file cannot be in the UBIFS root "
+			               "directory");
+	}
 	if (!is_power_of_2(c->min_io_size))
 		return err_msg("min. I/O unit size should be power of 2");
 	if (c->leb_size < c->min_io_size)

--=-EGu7VfoCSN9CoZC/aetb--
