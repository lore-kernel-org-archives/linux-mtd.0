Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D0xi4-0007z8-Q2
	for linux-mtd@lists.infradead.org; Tue, 15 Feb 2005 03:05:30 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: "Steven J. Magnani" <steve@digidescorp.com>, linux-mtd@lists.infradead.org
In-Reply-To: <004a01c512c2$60b92930$6ffea8c0@banana>
References: <004a01c512c2$60b92930$6ffea8c0@banana>
Content-Type: multipart/mixed; boundary="=-MNjEqGeqGyhMpD9KkG8L"
Date: Tue, 15 Feb 2005 11:04:48 +0300
Message-Id: <1108454688.26412.18.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Cc: 
Subject: RE: Bug in jffs2/scan.c re: incorrect assumption of "all clean"block
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-MNjEqGeqGyhMpD9KkG8L
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Well, I've looked trough your debug output and the code and think the
following patch should fix the bug.

On Mon, 2005-02-14 at 12:24 -0600, Steven J. Magnani wrote:
> Artem -
> 
> I'm assuming when you say "JFFS2 dbg L1 output" you mean the kernel log
> contents when CONFIG_JFFS2_FS_DEBUG=1. That seems to be WAY too much
> output for the kernel to handle.
> 
> I built a kernel with just scan.c at L1 debugging, the output is
> attached. This is completely reproducible the first time I mount this
> image created by mkfs.jffs2.
> 
> The part is NOR flash (Intel 28F320C3).
> 
> Steve
> 
> -----Original Message-----
> From: Artem B. Bityuckiy [mailto:dedekind@infradead.org] 
> Sent: Monday, February 14, 2005 7:24 AM
> To: Steven J. Magnani
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: Bug in jffs2/scan.c re: incorrect assumption of "all
> clean"block
> 
> 
> Could you please send your JFFS2 dbg L1 output?
> 
> Is your flash NOR or NAND?
> 
> On Thu, 2005-02-10 at 16:44 -0600, Steven J. Magnani wrote:
> > Hello MTD folk,
> > 
> > I'm not hooked into the MTD list so please cc: me on any replies. Also
> 
> > please note that this is my first experience with this code, so excuse
> 
> > me if I've gone off base.
> > 
> > I believe there is a bug in fs/jffs2/scan.c that causes it to 
> > incorrectly assume a block with a cleanmarker is "all clean". This 
> > causes an "Eep. Block 0xXXXXXXXX taken from free_list had free_size of
> 
> > 0xXXXXXXXX!!" to go off when jffs2_do_reserve_space() is called later.
> > 
> > There are 4 conditions that have to be met in a particular block for 
> > the bug to surface:
> > 
> > * The block has a cleanmarker
> > * The end of the block has to be free space (0xFF)
> > * The block has JFFS2_NODETYPE_INODEs
> > * The block does NOT have any JFFS2_NODETYPE_DIRENTs
> > 
> > The test that governs the "all clean" assumption is as follows (cf. 
> > scan.c 1.118 line 435)
> > 
> > 	if (buf_ofs == jeb->offset && jeb->used_size ==
> > PAD(c->cleanmarker_size) && 
> > 	    c->cleanmarker_size && !jeb->dirty_size &&
> > !jeb->first_node->next_in_ino) {
> > 
> > The bug is that there is no test that checks whether any 
> > JFFS2_NODETYPE_INODEs have been seen. Since only 
> > JFFS2_NODETYPE_DIRENTs are counted as used, and JFFS2_NODETYPE_INODEs 
> > are counted as unchecked, I think that the correction should look like
> 
> > this:
> > 
> > 	if (buf_ofs == jeb->offset && ((jeb->used_size +
> > jeb->unchecked_size) == PAD(c->cleanmarker_size)) &&
> > 	    c->cleanmarker_size && !jeb->dirty_size &&
> > !jeb->first_node->next_in_ino) {
> > 
> > 
> > This seems consistent with what is done at line 631:
> > 
> > 	if ((jeb->used_size + jeb->unchecked_size) ==
> > PAD(c->cleanmarker_size) && !jeb->dirty_size 
> > 		&& (!jeb->first_node || !jeb->first_node->next_in_ino) )
> > 
> > ...although the two are still not checking quite the same set of 
> > conditions.
> > 
> > Comments? I can provide a JFFS2 image that triggers the problem if 
> > someone is interested in stepping through it.
> > 
> > Steve Magnani
> > Digital Design Corporation
> > www.digidescorp.com
> > 
> > 
> > 
> > 
> > ______________________________________________________
> > Linux MTD discussion mailing list 
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.

--=-MNjEqGeqGyhMpD9KkG8L
Content-Disposition: attachment; filename=scan.c.diff
Content-Type: text/x-patch; name=scan.c.diff; charset=KOI8-R
Content-Transfer-Encoding: 7bit

--- scan.c	2005-02-14 16:30:11.000000000 +0300
+++ /home/dedekind/tmp/scan.c_modified	2005-02-15 10:55:53.879765568 +0300
@@ -433,7 +433,7 @@
 			/* If we're only checking the beginning of a block with a cleanmarker,
 			   bail now */
 			if (buf_ofs == jeb->offset && jeb->used_size == PAD(c->cleanmarker_size) && 
-			    c->cleanmarker_size && !jeb->dirty_size && !jeb->first_node->next_in_ino) {
+			    c->cleanmarker_size && !jeb->dirty_size && !jeb->first_node->next_phys) {
 				D1(printk(KERN_DEBUG "%d bytes at start of block seems clean... assuming all clean\n", EMPTY_SCAN_SIZE(c->sector_size)));
 				return BLK_STATE_CLEANMARKER;
 			}

--=-MNjEqGeqGyhMpD9KkG8L--
