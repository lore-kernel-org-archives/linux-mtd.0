Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P1YTh-0000LT-E6
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2010 05:48:19 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 1A9D01B401B
	for <linux-mtd@lists.infradead.org>;
	Fri,  1 Oct 2010 05:48:14 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] mkfs.jffs2: convert to common.h helpers
Date: Fri,  1 Oct 2010 01:49:12 -0400
Message-Id: <1285912152-10188-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1285911810-9555-1-git-send-email-vapier@gentoo.org>
References: <1285911810-9555-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v2
	- convert a few alloc funcs too

 mkfs.jffs2.c |  159 +++++++++++++++++-----------------------------------------
 1 files changed, 47 insertions(+), 112 deletions(-)

diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
index 528a7fe..256eec4 100644
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -80,7 +80,7 @@
 #undef basename
 
 //#define DMALLOC
-//#define mkfs_debug_msg    error_msg
+//#define mkfs_debug_msg    errmsg
 #define mkfs_debug_msg(a...)	{ }
 
 #define PAD(x) (((x)+3)&~3)
@@ -138,64 +138,6 @@ uint32_t find_hardlink(struct filesystem_entry *e)
 	return 0;
 }
 
-static void verror_msg(const char *s, va_list p)
-{
-	fflush(stdout);
-	fprintf(stderr, "%s: ", PROGRAM_NAME);
-	vfprintf(stderr, s, p);
-}
-static void error_msg(const char *s, ...)
-{
-	va_list p;
-
-	va_start(p, s);
-	verror_msg(s, p);
-	va_end(p);
-	putc('\n', stderr);
-}
-
-static void error_msg_and_die(const char *s, ...)
-{
-	va_list p;
-
-	va_start(p, s);
-	verror_msg(s, p);
-	va_end(p);
-	putc('\n', stderr);
-	exit(EXIT_FAILURE);
-}
-
-static void vperror_msg(const char *s, va_list p)
-{
-	int err = errno;
-
-	if (s == 0)
-		s = "";
-	verror_msg(s, p);
-	if (*s)
-		s = ": ";
-	fprintf(stderr, "%s%s\n", s, strerror(err));
-}
-
-static void perror_msg(const char *s, ...)
-{
-	va_list p;
-
-	va_start(p, s);
-	vperror_msg(s, p);
-	va_end(p);
-}
-
-static void perror_msg_and_die(const char *s, ...)
-{
-	va_list p;
-
-	va_start(p, s);
-	vperror_msg(s, p);
-	va_end(p);
-	exit(EXIT_FAILURE);
-}
-
 extern char *xreadlink(const char *path)
 {
 	static const int GROWBY = 80; /* how large we will grow strings by */
@@ -207,7 +149,7 @@ extern char *xreadlink(const char *path)
 		buf = xrealloc(buf, bufsize += GROWBY);
 		readsize = readlink(path, buf, bufsize); /* 1st try */
 		if (readsize == -1) {
-			perror_msg("%s:%s", PROGRAM_NAME, path);
+			sys_errmsg("%s:%s", PROGRAM_NAME, path);
 			return NULL;
 		}
 	}
@@ -221,7 +163,7 @@ static FILE *xfopen(const char *path, const char *mode)
 {
 	FILE *fp;
 	if ((fp = fopen(path, mode)) == NULL)
-		perror_msg_and_die("%s", path);
+		sys_errmsg_die("%s", path);
 	return fp;
 }
 
@@ -285,13 +227,13 @@ static struct filesystem_entry *add_host_filesystem_entry(const char *name,
 		 * device nodes), but if they _do_ exist the specified mode had
 		 * better match the actual file or strange things will happen.... */
 		if ((mode & S_IFMT) != (sb.st_mode & S_IFMT)) {
-			error_msg_and_die ("%s: file type does not match specified type!", path);
+			errmsg_die ("%s: file type does not match specified type!", path);
 		}
 		timestamp = sb.st_mtime;
 	} else {
 		/* If this is a regular file, it _must_ exist on disk */
 		if ((mode & S_IFMT) == S_IFREG) {
-			error_msg_and_die("%s: does not exist!", path);
+			errmsg_die("%s: does not exist!", path);
 		}
 	}
 
@@ -370,7 +312,7 @@ static struct filesystem_entry *recursive_add_host_directory(
 
 
 	if (lstat(hostpath, &sb)) {
-		perror_msg_and_die("%s", hostpath);
+		sys_errmsg_die("%s", hostpath);
 	}
 
 	entry = add_host_filesystem_entry(targetpath, hostpath,
@@ -378,7 +320,7 @@ static struct filesystem_entry *recursive_add_host_directory(
 
 	n = scandir(hostpath, &namelist, 0, alphasort);
 	if (n < 0) {
-		perror_msg_and_die("opening directory %s", hostpath);
+		sys_errmsg_die("opening directory %s", hostpath);
 	}
 
 	for (i=0; i<n; i++)
@@ -393,7 +335,7 @@ static struct filesystem_entry *recursive_add_host_directory(
 
 		xasprintf(&hpath, "%s/%s", hostpath, dp->d_name);
 		if (lstat(hpath, &sb)) {
-			perror_msg_and_die("%s", hpath);
+			sys_errmsg_die("%s", hpath);
 		}
 		if (strcmp(targetpath, "/") == 0) {
 			xasprintf(&tpath, "%s%s", targetpath, dp->d_name);
@@ -417,7 +359,7 @@ static struct filesystem_entry *recursive_add_host_directory(
 				break;
 
 			default:
-				error_msg("Unknown file type %o for %s", sb.st_mode, hpath);
+				errmsg("Unknown file type %o for %s", sb.st_mode, hpath);
 				break;
 		}
 		free(dp);
@@ -439,7 +381,7 @@ static struct filesystem_entry *recursive_add_host_directory(
 #define GETCWD_SIZE 0
 #else
 #define SCANF_PREFIX "511"
-#define SCANF_STRING(s) (s = malloc(512))
+#define SCANF_STRING(s) (s = xmalloc(512))
 #define GETCWD_SIZE -1
 inline int snprintf(char *str, size_t n, const char *fmt, ...)
 {
@@ -486,7 +428,7 @@ static int interpret_table_entry(struct filesystem_entry *root, char *line)
 	}
 
 	if (!strcmp(name, "/")) {
-		error_msg_and_die("Device table entries require absolute paths");
+		errmsg_die("Device table entries require absolute paths");
 	}
 
 	xasprintf(&hostpath, "%s%s", rootdir, name);
@@ -512,7 +454,7 @@ static int interpret_table_entry(struct filesystem_entry *root, char *line)
 			mode |= S_IFLNK;
 			break;
 		default:
-			error_msg_and_die("Unsupported file type '%c'", type);
+			errmsg_die("Unsupported file type '%c'", type);
 	}
 	entry = find_filesystem_entry(root, name, mode);
 	if (entry) {
@@ -532,7 +474,7 @@ static int interpret_table_entry(struct filesystem_entry *root, char *line)
 		parent = find_filesystem_entry(root, dir, S_IFDIR);
 		free(tmp);
 		if (parent == NULL) {
-			error_msg ("skipping device_table entry '%s': no parent directory!", name);
+			errmsg ("skipping device_table entry '%s': no parent directory!", name);
 			free(name);
 			free(hostpath);
 			return 1;
@@ -571,7 +513,7 @@ static int interpret_table_entry(struct filesystem_entry *root, char *line)
 				}
 				break;
 			default:
-				error_msg_and_die("Unsupported file type '%c'", type);
+				errmsg_die("Unsupported file type '%c'", type);
 		}
 	}
 	free(name);
@@ -684,10 +626,10 @@ static void full_write(int fd, const void *buf, int len)
 		ret = write(fd, buf, len);
 
 		if (ret < 0)
-			perror_msg_and_die("write");
+			sys_errmsg_die("write");
 
 		if (ret == 0)
-			perror_msg_and_die("write returned zero");
+			sys_errmsg_die("write returned zero");
 
 		len -= ret;
 		buf += ret;
@@ -787,12 +729,12 @@ static unsigned int write_regular_file(struct filesystem_entry *e)
 
 	statbuf = &(e->sb);
 	if (statbuf->st_size >= JFFS2_MAX_FILE_SIZE) {
-		error_msg("Skipping file \"%s\" too large.", e->path);
+		errmsg("Skipping file \"%s\" too large.", e->path);
 		return -1;
 	}
 	fd = open(e->hostname, O_RDONLY);
 	if (fd == -1) {
-		perror_msg_and_die("%s: open file", e->hostname);
+		sys_errmsg_die("%s: open file", e->hostname);
 	}
 
 	e->ino = ++ino;
@@ -824,7 +766,7 @@ static unsigned int write_regular_file(struct filesystem_entry *e)
 		unsigned char *tbuf = buf;
 
 		if (len < 0) {
-			perror_msg_and_die("read");
+			sys_errmsg_die("read");
 		}
 
 		while (len) {
@@ -915,7 +857,7 @@ static void write_symlink(struct filesystem_entry *e)
 
 	len = strlen(e->link);
 	if (len > JFFS2_MAX_SYMLINK_LEN) {
-		error_msg("symlink too large. Truncated to %d chars.",
+		errmsg("symlink too large. Truncated to %d chars.",
 				JFFS2_MAX_SYMLINK_LEN);
 		len = JFFS2_MAX_SYMLINK_LEN;
 	}
@@ -1356,7 +1298,7 @@ static void recursive_populate_directory(struct filesystem_entry *dir)
 				}
 				break;
 			default:
-				error_msg("Unknown mode %o for %s", e->sb.st_mode,
+				errmsg("Unknown mode %o for %s", e->sb.st_mode,
 						e->fullname);
 				break;
 		}
@@ -1598,14 +1540,7 @@ void process_buffer(int inp_size) {
 void parse_image(){
 	int ret;
 
-	file_buffer = malloc(erase_block_size);
-
-	if (!file_buffer) {
-		perror("out of memory");
-		close (in_fd);
-		close (out_fd);
-		exit(1);
-	}
+	file_buffer = xmalloc(erase_block_size);
 
 	while ((ret = load_next_block())) {
 		process_buffer(ret);
@@ -1643,15 +1578,15 @@ int main(int argc, char **argv)
 			case 'D':
 				devtable = xfopen(optarg, "r");
 				if (fstat(fileno(devtable), &sb) < 0)
-					perror_msg_and_die(optarg);
+					sys_errmsg_die("%s", optarg);
 				if (sb.st_size < 10)
-					error_msg_and_die("%s: not a proper device table file", optarg);
+					errmsg_die("%s: not a proper device table file", optarg);
 				break;
 
 			case 'r':
 			case 'd':	/* for compatibility with mkfs.jffs, genext2fs, etc... */
 				if (rootdir != default_rootdir) {
-					error_msg_and_die("root directory specified more than once");
+					errmsg_die("root directory specified more than once");
 				}
 				rootdir = xstrdup(optarg);
 				break;
@@ -1663,11 +1598,11 @@ int main(int argc, char **argv)
 
 			case 'o':
 				if (out_fd != -1) {
-					error_msg_and_die("output filename specified more than once");
+					errmsg_die("output filename specified more than once");
 				}
 				out_fd = open(optarg, O_CREAT | O_TRUNC | O_RDWR, 0644);
 				if (out_fd == -1) {
-					perror_msg_and_die("open output file");
+					sys_errmsg_die("open output file");
 				}
 				break;
 
@@ -1690,21 +1625,21 @@ int main(int argc, char **argv)
 
 			case 'h':
 			case '?':
-				error_msg_and_die(helptext);
+				errmsg_die("%s", helptext);
 
 			case 'v':
 				verbose = 1;
 				break;
 
 			case 'V':
-				error_msg_and_die("revision %s\n", revtext);
+				errmsg_die("revision %s\n", revtext);
 
 			case 'e': {
 						  char *next;
 						  unsigned units = 0;
 						  erase_block_size = strtol(optarg, &next, 0);
 						  if (!erase_block_size)
-							  error_msg_and_die("Unrecognisable erase size\n");
+							  errmsg_die("Unrecognisable erase size\n");
 
 						  if (*next) {
 							  if (!strcmp(next, "KiB")) {
@@ -1712,7 +1647,7 @@ int main(int argc, char **argv)
 							  } else if (!strcmp(next, "MiB")) {
 								  units = 1024 * 1024;
 							  } else {
-								  error_msg_and_die("Unknown units in erasesize\n");
+								  errmsg_die("Unknown units in erasesize\n");
 							  }
 						  } else {
 							  if (erase_block_size < 0x1000)
@@ -1751,52 +1686,52 @@ int main(int argc, char **argv)
 			case 'c':
 					  cleanmarker_size = strtol(optarg, NULL, 0);
 					  if (cleanmarker_size < sizeof(cleanmarker)) {
-						  error_msg_and_die("cleanmarker size must be >= 12");
+						  errmsg_die("cleanmarker size must be >= 12");
 					  }
 					  if (cleanmarker_size >= erase_block_size) {
-						  error_msg_and_die("cleanmarker size must be < eraseblock size");
+						  errmsg_die("cleanmarker size must be < eraseblock size");
 					  }
 					  break;
 			case 'm':
 					  if (jffs2_set_compression_mode_name(optarg)) {
-						  error_msg_and_die("Unknown compression mode %s", optarg);
+						  errmsg_die("Unknown compression mode %s", optarg);
 					  }
 					  break;
 			case 'x':
 					  if (jffs2_disable_compressor_name(optarg)) {
-						  error_msg_and_die("Unknown compressor name %s",optarg);
+						  errmsg_die("Unknown compressor name %s",optarg);
 					  }
 					  break;
 			case 'X':
 					  if (jffs2_enable_compressor_name(optarg)) {
-						  error_msg_and_die("Unknown compressor name %s",optarg);
+						  errmsg_die("Unknown compressor name %s",optarg);
 					  }
 					  break;
 			case 'L':
-					  error_msg_and_die("\n%s",jffs2_list_compressors());
+					  errmsg_die("\n%s",jffs2_list_compressors());
 					  break;
 			case 't':
 					  jffs2_compression_check_set(1);
 					  break;
 			case 'y':
-					  compr_name = malloc(strlen(optarg));
+					  compr_name = xmalloc(strlen(optarg));
 					  sscanf(optarg,"%d:%s",&compr_prior,compr_name);
 					  if ((compr_prior>=0)&&(compr_name)) {
 						  if (jffs2_set_compressor_priority(compr_name, compr_prior))
 							  exit(EXIT_FAILURE);
 					  }
 					  else {
-						  error_msg_and_die("Cannot parse %s",optarg);
+						  errmsg_die("Cannot parse %s",optarg);
 					  }
 					  free(compr_name);
 					  break;
 			case 'i':
 					  if (in_fd != -1) {
-						  error_msg_and_die("(incremental) filename specified more than once");
+						  errmsg_die("(incremental) filename specified more than once");
 					  }
 					  in_fd = open(optarg, O_RDONLY);
 					  if (in_fd == -1) {
-						  perror_msg_and_die("cannot open (incremental) file");
+						  sys_errmsg_die("cannot open (incremental) file");
 					  }
 					  break;
 #ifndef WITHOUT_XATTR
@@ -1818,23 +1753,23 @@ int main(int argc, char **argv)
 		}
 	}
 	if (warn_page_size) {
-		error_msg("Page size for this system is by default %d", page_size);
-		error_msg("Use the --pagesize=SIZE option if this is not what you want");
+		errmsg("Page size for this system is by default %d", page_size);
+		errmsg("Use the --pagesize=SIZE option if this is not what you want");
 	}
 	if (out_fd == -1) {
 		if (isatty(1)) {
-			error_msg_and_die(helptext);
+			errmsg_die("%s", helptext);
 		}
 		out_fd = 1;
 	}
 	if (lstat(rootdir, &sb)) {
-		perror_msg_and_die("%s", rootdir);
+		sys_errmsg_die("%s", rootdir);
 	}
 	if (chdir(rootdir))
-		perror_msg_and_die("%s", rootdir);
+		sys_errmsg_die("%s", rootdir);
 
 	if (!(cwd = getcwd(0, GETCWD_SIZE)))
-		perror_msg_and_die("getcwd failed");
+		sys_errmsg_die("getcwd failed");
 
 	if(in_fd != -1)
 		parse_image();
-- 
1.7.3.1
