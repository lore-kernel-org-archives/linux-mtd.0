Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTsTY-0000Zt-QG
 for linux-mtd@lists.infradead.org; Wed, 09 Oct 2013 12:02:49 +0000
Date: Wed, 9 Oct 2013 09:02:22 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH/TRIVIAL] mtd: Use MTD_BLOCK_MAJOR instead of the magic
 number
Message-ID: <20131009120221.GB31294@localhost>
References: <1381276748-5426-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <CAN8TOE-9XRW9QJ7+sSis+Omo0eVAGVHOXD70P4L8FNbLut=9Dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN8TOE-9XRW9QJ7+sSis+Omo0eVAGVHOXD70P4L8FNbLut=9Dg@mail.gmail.com>
Cc: trivial@kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 08, 2013 at 06:15:21PM -0700, Brian Norris wrote:
> On Tue, Oct 8, 2013 at 4:59 PM, Ezequiel Garcia
> <ezequiel.garcia@free-electrons.com> wrote:
> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> > ---
> >  drivers/mtd/mtdblock.c    | 2 +-
> >  drivers/mtd/mtdblock_ro.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
> > index 2aef5dd..53884cc 100644
> > --- a/drivers/mtd/mtdblock.c
> > +++ b/drivers/mtd/mtdblock.c
> > @@ -373,7 +373,7 @@ static void mtdblock_remove_dev(struct mtd_blktrans_dev *dev)
> >
> >  static struct mtd_blktrans_ops mtdblock_tr = {
> >         .name           = "mtdblock",
> > -       .major          = 31,
> > +       .major          = MTD_BLOCK_MAJOR,
> >         .part_bits      = 0,
> >         .blksize        = 512,
> >         .open           = mtdblock_open,
> > diff --git a/drivers/mtd/mtdblock_ro.c b/drivers/mtd/mtdblock_ro.c
> > index 92759a9..70d27b4 100644
> > --- a/drivers/mtd/mtdblock_ro.c
> > +++ b/drivers/mtd/mtdblock_ro.c
> > @@ -70,7 +70,7 @@ static void mtdblock_remove_dev(struct mtd_blktrans_dev *dev)
> >
> >  static struct mtd_blktrans_ops mtdblock_tr = {
> >         .name           = "mtdblock",
> > -       .major          = 31,
> > +       .major          = MTD_BLOCK_MAJOR,
> >         .part_bits      = 0,
> >         .blksize        = 512,
> >         .readsect       = mtdblock_readsect,
> 
> Patch looks good. I'll probably apply soon. Although I might like to
> see the following fixed along with it:
> 
> Why does MTD_BLOCK_MAJOR (and MTD_CHAR_MAJOR) live in
> include/linux/mtd/mtd.h and not include/uapi/linux/major.h?
> 

Ah, nice catch. How about something like this?

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index f9bfe52..9e1471e 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -24,14 +24,12 @@
 #include <linux/uio.h>
 #include <linux/notifier.h>
 #include <linux/device.h>
+#include <linux/major.h>
 
 #include <mtd/mtd-abi.h>
 
 #include <asm/div64.h>
 
-#define MTD_CHAR_MAJOR 90
-#define MTD_BLOCK_MAJOR 31
-
 #define MTD_ERASE_PENDING	0x01
 #define MTD_ERASING		0x02
 #define MTD_ERASE_SUSPEND	0x04
diff --git a/include/uapi/linux/major.h b/include/uapi/linux/major.h
index 6a8ca98..620252e 100644
--- a/include/uapi/linux/major.h
+++ b/include/uapi/linux/major.h
@@ -54,6 +54,7 @@
 #define ACSI_MAJOR		28
 #define AZTECH_CDROM_MAJOR	29
 #define FB_MAJOR		29   /* /dev/fb* framebuffers */
+#define MTD_BLOCK_MAJOR		31
 #define CM206_CDROM_MAJOR	32
 #define IDE2_MAJOR		33
 #define IDE3_MAJOR		34
@@ -105,6 +106,7 @@
 #define IDE6_MAJOR		88
 #define IDE7_MAJOR		89
 #define IDE8_MAJOR		90
+#define MTD_CHAR_MAJOR		90
 #define IDE9_MAJOR		91
 
 #define DASD_MAJOR		94

--

If you think this is OK, you can take this patch and I'll cook
another one moving MTD_xxx_MAJOR as above.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
