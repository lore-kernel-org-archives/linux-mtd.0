Received: from wall.comdev.cc ([63.150.62.162] helo=cleanup.comdev.cc)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16WlIG-0007kA-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Feb 2002 21:32:24 +0000
Message-ID: <3C5B0B3A.374C46F@comdev.cc>
Date: Fri, 01 Feb 2002 13:40:10 -0800
From: Adam Wozniak <adam.wozniak@comdev.cc>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>,
 	linux-mtd@lists.infradead.org
Subject: Re: debugging strategies for jffs2
References: <3C5AD150.1A3B9AAE@comdev.cc>  <20020201142405.79130.qmail@web20309.mail.yahoo.com> <9323.1012576311@redhat.com> <30239.1012586688@redhat.com> <3C5ADFC8.BD97CFFF@comdev.cc> <3C5AF025.F61F91F6@comdev.cc>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Adam Wozniak wrote:
> 
> 000000 19 85 e0 02 00 00 00 44 a4 ef 22 3e 00 00 10 4c
> 000010 00 00 1c 19 00 00 81 a4 00 00 00 00 00 32 d3 26
> 000020 00 00 0d 9d 00 00 0d 9e 00 00 0d 9e 00 00 00 00
> 000030 00 00 c0 00 00 00 00 00 01 00 00 00 00 00 00 00
> 000040 cf 8c 20 63
> 000044
> 
> This all by itself is enough to hose things.
> 
> The interesting bit to me is that the csize is 0x0000c000
> and the dsize is 0x00000000.  Is this perhaps causing problems?
> 

At fs/jffs2/gc.c,v 1.52, line 460:

        fill:
                ri.magic = JFFS2_MAGIC_BITMASK;
                ri.nodetype = JFFS2_NODETYPE_INODE;
                ri.totlen = sizeof(ri);
                ri.hdr_crc = crc32(0, &ri, sizeof(struct
jffs2_unknown_node)-4);
 
                ri.ino = inode->i_ino;
                ri.version = ++f->highest_version;
                ri.offset = start;
                ri.csize = end - start;
                ri.dsize = 0;
                ri.compr = JFFS2_COMPR_ZERO;

This seems backwards to me.  Shouldn't ri.dsize = end-start and ri.csize
= 0 ???

--Adam
-- 
Adam Wozniak (KG6GZR)   COM DEV Wireless - Digital and Software Systems
awozniak@comdev.cc      3450 Broad St. 107, San Luis Obispo, CA 93401
                        http://www.comdev.cc
                        Voice: (805) 544-1089       Fax: (805) 544-2055
