Received: from ihemail2.lucent.com ([192.11.222.163]
	helo=ihemail2.firewall.lucent.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A7iuh-0001Uz-PC
	for <linux-mtd@lists.infradead.org>; Thu, 09 Oct 2003 23:05:40 +0100
Received: from ixstar.ih.lucent.com (h135-1-99-7.lucent.com [135.1.99.7])
	ESMTP id h99M45N02908	for <linux-mtd@lists.infradead.org>;
	Thu, 9 Oct 2003 17:04:06 -0500 (CDT)
To: manningc2@actrix.gen.nz
From: "Greg A. Martin" <gregmartin@lucent.com>
Date: Thu, 9 Oct 2003 17:04:01 -0500
Message-ID: <000601c38eb1$3fe677d0$1a53b987@na02.lucent.com>
MIME-Version: 1.0
In-Reply-To: <20031009174133.8C422474D@blood.actrix.co.nz>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: RE: Nand Flash with 2048 Byte Page sizes
Reply-To: gregmartin@lucent.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks for suggestion (and volunteering?) to get guidance. I am in the
early stages of porting u-boot with nand support to a PowerPC 405GP
system. I am currently just trying to make sure the hardware is designed
properly.  Any suggestions are welcome. My biggest concern now (and
ignorance) is how to allocate the spare bytes for the additional ecc
required
for the larger page size. Another question I have is the current structures
(nand_chip and/or nand_flash_dev) don't seem to have enough information
about
the number of column address bytes and page address bytes that need to be
sent
to the device.


-----Original Message-----
From: Charles Manning [mailto:manningc2@actrix.gen.nz]
Sent: Thursday, October 09, 2003 12:47 PM
To: gregmartin@lucent.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: Nand Flash with 2048 Byte Page sizes


On Friday 10 October 2003 03:04, David Woodhouse wrote:
> On Thu, 2003-10-09 at 08:50 -0500, Greg A. Martin wrote:
> > Hi,
> > I haven't seen any references yet to the newer NAND devices from
> > Samsung that have 2048 byte pages with 64 bytes extra data. The Part
> > numbers are K9F1G08U0M and K92G08U0M. These are 1 and 2 Gbit devices
> > with 11 bit column addresses and 16 or 17 bit page addresses that need
> > two byte read commands. Any idea if support for these devices will be
> > forth coming soon, or do I get to blaze a trail?
>
> You get to blaze a trail. :)

I'd like to suggest that when you go blaze that trail you ask guidance
before
and you go. There are many possible direction, but certain of these are more
useful to the file systems that get to use the code.

-- Charles
