Received: from pc-5.tkhnl.demon.nl
	([195.11.235.101] helo=intranet.turnkiek.nl ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18P26k-0002c4-00
	for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2002 14:57:06 +0000
Reply-To: <wolff@turnkiek.nl>
From: "Carl Wolff" <wolff@turnkiek.nl>
To: "'David Woodhouse'" <dwmw2@infradead.org>, <wolff@turnkiek.nl>
Cc: <linux-mtd@lists.infradead.org>, <vanee@turnkiek.nl>
Subject: RE: problem using jffs2 on DiskOnChip 
Date: Thu, 19 Dec 2002 16:29:33 +0100
Message-ID: <000301c2a773$6f5d5360$446410ac@lt-gw8l30j.turnkiek.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <12900.1040292850@passion.cambridge.redhat.com>
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

Hello David,

OK. Two questions:
1) Does JFFS2 actually work on a DiskOnChip?
2) Other alternatives? We need a powersafe filesystem on DiskOnChip.


Thanks, and happy newyear, I'm going on holiday now.

Carl.


> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@redhat.com]On Behalf Of David
> Woodhouse
> Sent: donderdag 19 december 2002 11:14
> To: wolff@turnkiek.nl
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: problem using jffs2 on DiskOnChip 
> 
> 
> 
> wolff@turnkiek.nl said:
> > Short read: 0x10 bytes at 0x000001f0 instead of requested 44 
> 
> The DiskOnChip hardware driver hasn't been used much with 
> anything other 
> than NFTL. It appears not to do a full read if you ask it to 
> read a range 
> of data which crosses a page boundary. Fix it accordingly by 
> putting an 
> appropriate loop in instead of...
> 
>         /* Don't allow a single read to cross a 512-byte 
> block boundary */
>         if (from + len > ((from | 0x1ff) + 1))
>                 len = ((from | 0x1ff) + 1) - from;
> 
> --
> dwmw2
> 
> 
> 
