Received: from smtp7.wanadoo.fr ([193.252.22.24])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1Duuyu-0003AZ-MB
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2005 12:30:14 -0400
Received: from me-wanadoo.net (unknown [127.0.0.1])
	by mwinf0709.wanadoo.fr (SMTP Server) with ESMTP id 754FA1C000B4
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Jul 2005 18:30:06 +0200 (CEST)
From: Jean-Philippe Francois <jp.francois@cynove.com>
To: jbi130@yahoo.com
In-Reply-To: <87u0iq7r6o.fsf@nimrod.unx.ca>
References: <87u0iq7r6o.fsf@nimrod.unx.ca>
Content-Type: text/plain
Message-Id: <1121790604.2565.61.camel@fedorabox>
Mime-Version: 1.0
Date: Tue, 19 Jul 2005 18:30:05 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Support for Intel strataflash.
Reply-To: jp.francois@cynove.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-07-19 at 17:26, jbi130@yahoo.com wrote:
> I recently receive a PPC8555 evaluation board with 8 MB Intel
> strataflash ROM.  I'm using 2.6.12 and am trying to get this setup as
> an MTD device for use with JFFS2.
> 
> On boot all I see is:
> physmap flash device: 800000 at ff800000
> 
> (the flash is at physical address 0xff800000).
> 
> I also had to enable 'Support for ROM chips in bus mapping' for this
> physmap to take place.
> 
> I'm assuming that the CFI probe isn't properly detecting this chip.
> Does that mean that it isn't fully supported?  I use similar options
> on a similar board that uses AMD flash and it works fine.
> 
In the RAM/ROM/FLash chip driver section, did you select
Detect flash chips by CFI probe
and
Support for Intel/Sharp flash chip ?

JP Francois
