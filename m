Received: from blood.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19foo4-0001DQ-QX
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jul 2003 23:43:29 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: "Matthew Dharm" <mdharm@momenco.com>,
	"Holly Gates" <hgates@eink.com>
Date: Fri, 25 Jul 2003 10:47:11 +1200
References: <NEBBLJGMNKKEEMNLHGAIKEKODCAA.mdharm@momenco.com>
In-Reply-To: <NEBBLJGMNKKEEMNLHGAIKEKODCAA.mdharm@momenco.com>
MIME-Version: 1.0
Message-Id: <20030724224326.6B6D54230@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Smartmedia block mapping
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 25 July 2003 10:33, Matthew Dharm wrote:
> The sddr09 driver in linux/usb/drivers/storage/ actually contains a
> software implementation of the block-mapping needed.  The SDDR-09
> actually forces the host to do this instead of making the device do
> it.
>
> If you can find an SDDR-09 device, and are willing to re-write the
> driver (it currently does not support any sort of raw access), then
> you could do what you're trying to do.

Thanx for that info Matt.

This would indicate that the SDDR-09 would allow you to use YAFFS and JFFS2 
too!


>
> Matt
