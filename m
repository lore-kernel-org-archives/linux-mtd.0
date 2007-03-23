Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HUoZ5-0003xb-Cl
	for linux-mtd@lists.infradead.org; Fri, 23 Mar 2007 14:32:40 -0400
Subject: Re: JFFS2 SUMMARY nodes aren't working
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <1174670673.26465.333.camel@gentoo-jocke.transmode.se>
References: <1174569321.26465.308.camel@gentoo-jocke.transmode.se>
	<46028675.30200@ru.mvista.com>
	<1174571529.26465.311.camel@gentoo-jocke.transmode.se>
	<1174670673.26465.333.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Fri, 23 Mar 2007 19:32:31 +0100
Message-Id: <1174674751.26465.338.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-03-23 at 18:24 +0100, Joakim Tjernlund wrote:
> On Thu, 2007-03-22 at 14:52 +0100, Joakim Tjernlund wrote:
> > On Thu, 2007-03-22 at 16:36 +0300, Vitaly Wool wrote:
> > > Joakim Tjernlund wrote:
> > > 
> > > >On a fresh JFFS2 root FS image with summary nodes there is no
> > > >difference in mount time when enabling summary support in kernel(2.6.20,
> > > >powerpc).
> > > >  
> > > >
> > > Can you please elaborate on how you got the image with summary nodes?
> > 
> > >From my JFFS2 build script:
> > mkfs.jffs2 -e 0x20000 -b -d jffs2root -o "${JFFS2FILE}.tmp" || exit
> > sumtool -e 0x20000 -b -i "${JFFS2FILE}.tmp" -o "${JFFS2FILE}" || exit
> > 
> > 
> > sumtool --version
> > sumtool: revision 1.9
> > > 
> > > Vitaly
> > > 
> > > 
> 
> I found that an all empty FS took about the same time to mount
> which I find very strange.
> 
> Looking into the code in scan.c I found that even though I have
> cleanmarkers in all EB:s, JFFS2 still scans the whole EB. Do
> you really need to scan the whole area after the cleanmarker?
> Should be enough to only check a few words after the clean marker
> and if that is 0xffffffff then assume that the EB is clean
> since it had a valid clean marker at the beginning.
> 
> Below is the code in scan thats doing the scanning:
> 
>  	more_empty:
> 			inbuf_ofs = ofs - buf_ofs;
> 			(printk(KERN_CRIT "Found empty flash at 0x%08x  0x%08x 0x%08x \n", ofs, inbuf_ofs, buf_len));
> 			while (inbuf_ofs < buf_len) {
> 				if (*(uint32_t *)(&buf[inbuf_ofs]) != 0xffffffff) {
> 					printk(KERN_WARNING "Empty flash at 0x%08x ends at 0x%08x\n",
> 					       empty_start, ofs);
> 					if ((err = jffs2_scan_dirty_space(c, jeb, ofs-empty_start)))
> 						return err;
> 					goto scan_more;
> 				}
> 
> 				inbuf_ofs+=4;
> 				ofs += 4;
> 			}
> 			/* Ran off end. */
> 

This ugly hack makes mount extreamly fast(and I am not using SUMMARY
either):

diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index b98661a..383fa2c 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -850,6 +850,9 @@ scan_more:
                                jffs2_link_node_ref(c, jeb, ofs | REF_NORMAL, c
 
                                ofs += PAD(c->cleanmarker_size);
+                               if (*(uint32_t *)(&buf[ofs-buf_ofs]) == 0xfffff
+                                       return BLK_STATE_CLEANMARKER;
+                               }
                        }
                        break;
