Received: from eos.telenet-ops.be ([195.130.132.40])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190nxy-0006mU-O1
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 20:32:10 +0100
From: Bob Koninckx <bob.koninckx@mech.kuleuven.ac.be>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1049271603.4175.4.camel@imladris.demon.co.uk>
References: <1049057380.1180.36.camel@pc-002>
	 <1049095079.16365.768.camel@imladris.demon.co.uk>
	 <1049142569.1913.11.camel@pc-002>
	 <1049150862.16365.793.camel@imladris.demon.co.uk>
	 <1049269724.25405.8.camel@pc086-2.mech.kuleuven.ac.be>
	 <1049271603.4175.4.camel@imladris.demon.co.uk>
Message-Id: <1049311926.3315.12.camel@pc-002>
Mime-Version: 1.0
Date: 02 Apr 2003 21:32:06 +0200
Content-Type: multipart/mixed; boundary="=-G7ATE73w3iIK2E9evFZn"
cc: linux-mtd@lists.infradead.org
cc: ecos-discuss@sources.redhat.com
Subject: Re: jffs2 / eCos
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-G7ATE73w3iIK2E9evFZn
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2003-04-02 at 10:20, David Woodhouse wrote:
> On Wed, 2003-04-02 at 08:48, Bob Koninckx wrote:
> > > We should just fix jffs2_read_inode_range() to handle reads which don't
> > > start at the beginning of a node. It's not hard.
> > 
> > I removed the above mentioned check and now it _appears_ to work
> > correctly. Is this all that needs to be done ?
> 
> Can you show me the patch or resulting code? 


Just commented the lines containing the test out. Anyway, if you want a
patch to see it for yourself... :-)


> 
> > Are there similar issues when writing to the filesys ?
> 
> No, writing should be fine -- but you really do want to try to ensure
> that you don't get writes split up into 256-byte chunks, since that'll
> waste space on the file system (till it gets GC'd and merged).


Certainly won't be before the week-end. You don't have by any chance any
(standard) test cases, do you ? Any suggestions to seriously test it
(apart from creating a file that is larger than 256 bytes and checking
with the debugger that no "holes" are left)

Thanks for looking after this so far anyway,

Bob

>  
-- 
----------------------------------------------------------------------
ir. Bob Koninckx
Katholieke Universiteit Leuven
Division Production Engineering,                   tel.  +32 16 322535
Machine Design and Automation                      fax.  +32 16 322987
Celestijnenlaan 300B                  bob.koninckx@mech.kuleuven.ac.be
B-3001 Leuven Belgium               http://www.mech.kuleuven.ac.be/pma
----------------------------------------------------------------------

--=-G7ATE73w3iIK2E9evFZn
Content-Disposition: attachment; filename=jffs.patch
Content-Type: text/plain; name=jffs.patch; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

? jffs.patch
Index: read.c
===================================================================
RCS file: /cvs/ecos/ecos/packages/fs/jffs2/current/src/read.c,v
retrieving revision 1.3
diff -u -5 -r1.3 read.c
--- read.c	5 Feb 2003 00:00:40 -0000	1.3
+++ read.c	2 Apr 2003 19:18:14 -0000
@@ -175,16 +175,16 @@
 			D1(printk(KERN_DEBUG "Filling non-frag hole from %d-%d\n", offset, offset+holesize));
 			memset(buf, 0, holesize);
 			buf += holesize;
 			offset += holesize;
 			continue;
-		} else if (frag->ofs < offset && (offset & (PAGE_CACHE_SIZE-1)) != 0) {
-			D1(printk(KERN_NOTICE "Eep. Overlap in ino #%u fraglist. frag->ofs = 0x%08x, offset = 0x%08x\n",
-				  f->inocache->ino, frag->ofs, offset));
-			D1(jffs2_print_frag_list(f));
-			memset(buf, 0, end - offset);
-			return -EIO;
+//		} else if (frag->ofs < offset && (offset & (PAGE_CACHE_SIZE-1)) != 0) {
+//			D1(printk(KERN_NOTICE "Eep. Overlap in ino #%u fraglist. frag->ofs = 0x%08x, offset = 0x%08x\n",
+//				  f->inocache->ino, frag->ofs, offset));
+//			D1(jffs2_print_frag_list(f));
+//			memset(buf, 0, end - offset);
+//			return -EIO;
 		} else if (!frag->node) {
 			uint32_t holeend = min(end, frag->ofs + frag->size);
 			D1(printk(KERN_DEBUG "Filling frag hole from %d-%d (frag 0x%x 0x%x)\n", offset, holeend, frag->ofs, frag->ofs + frag->size));
 			memset(buf, 0, holeend - offset);
 			buf += holeend - offset;

--=-G7ATE73w3iIK2E9evFZn--
