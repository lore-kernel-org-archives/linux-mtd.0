Received: from wall.comdev.cc ([63.150.62.162] helo=cleanup.comdev.cc)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16WmpH-0007sq-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Feb 2002 23:10:36 +0000
Message-ID: <3C5B2246.2ABBCEFD@comdev.cc>
Date: Fri, 01 Feb 2002 15:18:30 -0800
From: Adam Wozniak <adam.wozniak@comdev.cc>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: Re: debugging strategies for jffs2
References: <3C5B0B3A.374C46F@comdev.cc>  <3C5AD150.1A3B9AAE@comdev.cc> <20020201142405.79130.qmail@web20309.mail.yahoo.com> <9323.1012576311@redhat.com> <30239.1012586688@redhat.com> <3C5ADFC8.BD97CFFF@comdev.cc> <3C5AF025.F61F91F6@comdev.cc> <4597.1012605105@redhat.com>
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

David Woodhouse wrote:
> 
> adam.wozniak@comdev.cc said:
> > > The interesting bit to me is that the csize is 0x0000c000
> > > and the dsize is 0x00000000.  Is this perhaps causing problems?
> >
> > At fs/jffs2/gc.c,v 1.52, line 460:
> >         fill:
> >                 ri.magic = JFFS2_MAGIC_BITMASK;
> >                 ri.nodetype = JFFS2_NODETYPE_INODE;
> >                 ri.totlen = sizeof(ri);
> >                 ri.hdr_crc = crc32(0, &ri, sizeof(struct jffs2_unknown_node)-4);
> >                   ri.ino = inode->i_ino;
> >                 ri.version = ++f->highest_version;
> >                 ri.offset = start;
> >                 ri.csize = end - start;
> >                 ri.dsize = 0;
> >                 ri.compr = JFFS2_COMPR_ZERO;
> 
> > This seems backwards to me.  Shouldn't ri.dsize = end-start and
> > ri.csize = 0 ???
> 
> Eep, yes that would probably do it. Well spotted. That obviously wasn't one
> of my more coherent days :)
> 
> I've fixed it in v1.61 and v1.52.2.1 (on jffs2-2_4-branch) now - don't chuck
> your filesystem away though, I'll implement a workaround and ask you to test
> it.

Here's the workaround I came up with:
in scan.c:

                /* FIXME: Why do we believe totlen? */
                DIRTY_SPACE(4);
                *ofs += 4;
                return 0;
        }
 
        // TODO WOZ FIXED
 
        /* older code confused dsize and csize in some cases, fix that
here */
        if (ri.dsize == 0 && ri.compr == JFFS2_COMPR_ZERO)
        {
                ri.dsize = ri.csize;
                ri.csize = 0;
                ri.node_crc = crc32(0, &ri, sizeof(ri)-8);
        }
 
        if (ri.csize) {
                /* Check data CRC too */
                unsigned char *dbuf;
                __u32 crc;

--Adam
-- 
Adam Wozniak (KG6GZR)   COM DEV Wireless - Digital and Software Systems
awozniak@comdev.cc      3450 Broad St. 107, San Luis Obispo, CA 93401
                        http://www.comdev.cc
                        Voice: (805) 544-1089       Fax: (805) 544-2055
