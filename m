Received: from riker.dsl.inconnect.com
	([209.140.76.229] helo=ns1.rikers.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15UBPX-0007y5-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Aug 2001 19:17:00 +0100
Message-ID: <3B703045.FDD45F99@Rikers.org>
Date: Tue, 07 Aug 2001 12:15:33 -0600
From: Tim Riker <Tim@Rikers.org>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: mtd lilo
References: <3B6FD798.17986BCA@sri.crossvue.com>  <3B6E01BA.2B394136@sri.crossvue.com> <4758.997179115@redhat.com> <31492.997190095@redhat.com>
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

hmmm.

Can the FAQ get updated?

ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs/mtd/mtd-jffs-HOWTO.txt

The DOC section says to use nftl_format

David Woodhouse wrote:
> 
> dpathirana@sri.crossvue.com said:
> >  I formatted it with the nftl_format, how does this affect lilo?? How
> > can I figure out if it's still there??
> 
> You probably removed the BIOS completely then. You can't use LILO without a
> BIOS to provide INT 13h functionality.
> 
> Reformat the DiskOnChip with the DFORMAT utility, and you should get the
> BIOS back. You shouldn't need to use nftl_format - I'm severely tempted to
> remove it from CVS.
> 
> --
> dwmw2
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Tim Riker - http://rikers.org/ - short SIGs! <g>
All I need to know I could have learned in Kindergarten
... if I'd just been paying attention.
