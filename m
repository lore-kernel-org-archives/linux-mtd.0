Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kwuu2-0003a1-Fd
	for linux-mtd@lists.infradead.org; Mon, 03 Nov 2008 08:35:14 +0000
Message-ID: <490EB956.5050700@nokia.com>
Date: Mon, 03 Nov 2008 10:41:58 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "J. Scott Merritt" <merrij3@rpi.edu>
Subject: Re: ubinize corrections
References: <20081102142315.453628de.merrij3@rpi.edu>
In-Reply-To: <20081102142315.453628de.merrij3@rpi.edu>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

J. Scott Merritt wrote:
> Dear list,
> 
> I believe that I have stumbled upon two problems with the latest version
> of ubinize.c in mtd-utils - one serious, and one not so serious.
> 
> - First, the easy one: At line 457, I believe that we should be printing
> args.subpage_size rather than ui.min_io_size.
> 
> - More seriously, I believe that the "flags" field in the ubigen_vol_info
> structures is not being properly initialized.  Line 494 allocates memory
> for these structures with malloc, so they are not cleared to zero.  The
> read_section function updates the flag field if the AUTO-RESIZE flag is
> specified, but does not otherwise initialize or clear it.
> 
> I reckon the latter problem could be repaired either with calloc, or by
> modifying read_section to more directly set/clear the flag.
> 
> Thanks, Scott.

I agree.  Here's the patch:


From: Adrian Hunter <ext-adrian.hunter@nokia.com>
Date: Mon, 3 Nov 2008 10:36:32 +0200
Subject: [PATCH] ubinize: correct subpage_size print and initialise vol_info to zero

Reported-by: "J. Scott Merritt" <merrij3@rpi.edu>
Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 ubi-utils/new-utils/src/ubinize.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/ubi-utils/new-utils/src/ubinize.c b/ubi-utils/new-utils/src/ubinize.c
index ebd5aa0..4f3e8a1 100644
--- a/ubi-utils/new-utils/src/ubinize.c
+++ b/ubi-utils/new-utils/src/ubinize.c
@@ -454,7 +454,7 @@ int main(int argc, char * const argv[])
        verbose(args.verbose, "LEB size:      %d", ui.leb_size);
        verbose(args.verbose, "PEB size:      %d", ui.peb_size);
        verbose(args.verbose, "min. I/O size: %d", ui.min_io_size);
-       verbose(args.verbose, "sub-page size: %d", ui.min_io_size);
+       verbose(args.verbose, "sub-page size: %d", args.subpage_size);
        verbose(args.verbose, "VID offset:    %d", ui.vid_hdr_offs);
        verbose(args.verbose, "data offset:   %d", ui.data_offs);
 
@@ -491,7 +491,7 @@ int main(int argc, char * const argv[])
                goto out_dict;
        }
 
-       vi = malloc(sizeof(struct ubigen_vol_info) * sects);
+       vi = calloc(sizeof(struct ubigen_vol_info), sects);
        if (!vi) {
                errmsg("cannot allocate memory");
                goto out_dict;
