Received: from miranda.axis.se ([193.13.178.2])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GPEw-0000y4-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2002 19:49:54 +0000
From: johan.adolfsson@axis.com
Message-ID: <058201c294c0$11de2cc0$a3b270d5@homeip.net>
Reply-To: <johan.adolfsson@axis.com>
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>,
   "David Woodhouse" <dwmw2@infradead.org>
Cc: <joakim.tjernlund@lumentis.se>,
   "Herman Oosthuysen" <Herman@wirelessnetworksinc.com>,
   <linux-mtd@lists.infradead.org>
References: <IGEFJKJNHJDCBKALBJLLOEENFIAA.joakim.tjernlund@lumentis.se> <5807.1038241193@passion.cambridge.redhat.com> <20021125183858.GA26478@wohnheim.fh-wedel.de>
Subject: Re: JFFS2 Config / FAQ
Date: Mon, 25 Nov 2002 21:20:17 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

----- Original Message -----
From: "Jörn Engel" <joern@wohnheim.fh-wedel.de>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <joakim.tjernlund@lumentis.se>; "Herman Oosthuysen"
<Herman@wirelessnetworksinc.com>; <linux-mtd@lists.infradead.org>
Sent: den 25 november 2002 19:38
Subject: Re: JFFS2 Config / FAQ


> On Mon, 25 November 2002 16:19:53 +0000, David Woodhouse wrote:
> > joakim.tjernlund@lumentis.se said:
> > >  I think it's 5 blocks currently. It should be possible to lower that
> > > count, but that needs testing.
> >
> > It was tested. It broke. http://mhonarc.axis.se/jffs-dev/msg01495.html
>
> Yes, it broke with a smaller number. But wether that smaller number
> was 4, 1 or 0 is unknown.
>
> I would expect 3 or 4 to be fine, but not bet more than a beer on it.
>
> Jörn

We applied the following patch to test:
--- os/linux/fs/jffs2/nodelist.h        23 Apr 2002 13:18:37 -0000
1.1.1.3
+++ os/linux/fs/jffs2/nodelist.h        12 Jul 2002 10:11:57 -0000
@@ -223,10 +223,10 @@
 #define ALLOC_DELETION 1       /* Deletion node. Best to allow it */
 #define ALLOC_GC       2       /* Space requested for GC. Give it or die */

-#define JFFS2_RESERVED_BLOCKS_BASE 3
/* Number
 of free blocks there must be before we... */
-#define JFFS2_RESERVED_BLOCKS_WRITE (JFFS2_RESERVED_BLOCKS_BASE + 2)
/* ... al
low a normal filesystem write */
+#define JFFS2_RESERVED_BLOCKS_BASE 0
/* Number
 of free blocks there must be before we... */
+#define JFFS2_RESERVED_BLOCKS_WRITE (JFFS2_RESERVED_BLOCKS_BASE + 1)
/* ... al
low a normal filesystem write */
 #define JFFS2_RESERVED_BLOCKS_DELETION (JFFS2_RESERVED_BLOCKS_BASE + 1)
/
* ... allow a normal filesystem deletion */
-#define JFFS2_RESERVED_BLOCKS_GCTRIGGER (JFFS2_RESERVED_BLOCKS_BASE + 3)
/* ... wa
ke up the GC thread */
+#define JFFS2_RESERVED_BLOCKS_GCTRIGGER (JFFS2_RESERVED_BLOCKS_BASE + 1)
/* ... wa
ke up the GC thread */
 #define JFFS2_RESERVED_BLOCKS_GCBAD (JFFS2_RESERVED_BLOCKS_BASE + 1)
/* ... pi
ck a block from the bad_list to GC */
 #define JFFS2_RESERVED_BLOCKS_GCMERGE (JFFS2_RESERVED_BLOCKS_BASE)
/* ... me
rge pages when garbage collecting */

Our JFFS2 partition was only 5x64kB (2MB flash total, kernel+cramfs the
rest)

/Johan
