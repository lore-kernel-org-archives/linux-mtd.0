Received: from [213.203.150.91] (helo=mail.gnudd.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JzRJf-0004OL-Bn
	for linux-mtd@lists.infradead.org; Fri, 23 May 2008 07:03:51 +0000
Date: Fri, 23 May 2008 09:03:42 +0200
From: Alessandro Rubini <rubini-list@gnudd.com>
To: jamessteward@optusnet.com.au
Subject: Re: Help needed with MTD on AT91SAM9263-EK please.
Message-ID: <20080523070342.GA25241@mail.gnudd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Sender: rubini-list@gnudd.com
In-Reply-To: <1211524684.6203.13.camel@torchwood>
References: <1211524684.6203.13.camel@torchwood>
	<1211437223.6129.82.camel@Ubuntu-Desktop>
	<80b317760805222326j57e6bc11sfe0beef9ab68267b@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> The NAND flash was erased and root jffs2 image written using the SAM-BA
> utility

This is likely the source of problems. The crc layout used by sam-ba
may well be different from what mtd uses.

I had tons of problems with the 9260 when programming the nand flash
from sam-ba, and I only programmed u-boot (writing all the rest from
u-boot or linux). I never had problem with 9263-ek, as long as I
didn't write linux stuff from sam-ba.

So you should only write the boot code with sam-ba, and write your
kernel and filesystem from either u-boot or linux. You'll probably
want to erase and re-program the boot loader from itself, to get rid
of remaining wrong sam-ba bits.

hope this helps
/alessandro
