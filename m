Received: from 213-229-28-240.static.adsl-line.inode.at ([213.229.28.240]
	helo=contec-int.at)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BxlzY-0001If-Ry
	for linux-mtd@lists.infradead.org; Thu, 19 Aug 2004 08:26:06 -0400
From: Manfred Gruber <gruber.m@utanet.at>
To: linux-mtd@lists.infradead.org
Date: Thu, 19 Aug 2004 14:30:39 +0200
References: <200408191006.06637.gruber.m@utanet.at>
	<1092910597.14552.1683.camel@hades.cambridge.redhat.com>
	<m33c2j76eb.fsf@maxwell.lnxi.com>
In-Reply-To: <m33c2j76eb.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Message-Id: <200408191430.39167.gruber.m@utanet.at>
Subject: Re: JFFS2 with AM29LV256M
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi !

Am Donnerstag, 19. August 2004 12:45 schrieben Sie:
> > Hmmm ok, so it's do_write_oneword() which is broken.
>
> Possibly it still could be the chip. do_write_oneword since it
> is read the data back anyway confirms that the data read back is
> what was written.  I don't believe the write_buffer code path
> does any but the most rudimentary sanity checks.

This is correct. read_oneword does a check but also with paching this out the 
problem is there.

I found out that the first write one block works the secound not, any idea ?
copy a file first come in the write one block function: 

MTD do_write_buffer(): WRITE 0x0028e9c0(0x00000069)
MTD do_write_oneword(): WRITE 0x0028e9d8(0x6161616a)
MTD do_write_oneword(): WRITE addr 0x0028e9d8
MTD do_write_oneword(): WRITE oldd 0x6161616a curd (0x6161616a)
MTD do_write_oneword(): WRITE oldd 0x6161616a curd (0x6161616a)
MTD do_write_oneword(): WRITE 0x0028e9dc(0xffffff61)
MTD do_write_oneword(): WRITE addr 0x0028e9dc
MTD do_write_oneword(): WRITE oldd 0xffffff61 curd (0xffffff61)
MTD do_write_oneword(): WRITE oldd 0xffffff61 curd (0xffffff61)

secound come in the write one block function:

MTD do_write_buffer(): WRITE 0x0028e9e0(0xe0021985)
MTD do_write_buffer(): WRITE 0x0028f0c0(0x728ea668)
MTD do_write_buffer(): WRITE 0x0028f100(0xbc68ad56)
MTD do_write_oneword(): WRITE 0x0028ea24(0x978d0902)
MTD do_write_oneword(): WRITE addr 0x0028ea24
MTD do_write_oneword(): WRITE oldd 0xff640800 curd (0xff240800)
MTD do_write_oneword(): software timeout
MTD do_write_oneword(): WRITE addr 0x0028ea24
MTD do_write_oneword(): WRITE oldd 0xff640800 curd (0xff240800)
MTD do_write_oneword(): software timeout
MTD do_write_oneword(): WRITE addr 0x0028ea24
MTD do_write_oneword(): WRITE oldd 0xff640800 curd (0xff240800)

Any idea ?

Thanks,regards 
