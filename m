Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QBid2-0000BP-EM
	for linux-mtd@lists.infradead.org; Mon, 18 Apr 2011 07:12:13 +0000
Received: by ewy3 with SMTP id 3so1456814ewy.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Apr 2011 00:12:09 -0700 (PDT)
Subject: Re: UBI partitioning in embedded device?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.1104180839510.30071@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1104180839510.30071@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 18 Apr 2011 10:09:15 +0300
Message-ID: <1303110555.2815.25.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-04-18 at 08:44 +0200, Ricard Wanderlof wrote:
> Are there any opinions here on the partitioning of a flash memory in an 
> embedded device when using UBI?
> 
> Principially, one could let UBI manage the whole flash as one mtd 
> partition, except possibly some boot area due to restriction in the boot 
> ROM of the system in question.

FYI, IBM people were able to implement boot initial boot loader with the
limit of 4KiB for the whole initial boot loader, and it supported R/O
UBI (but not UBIFS of course).

>  But is it wise to do so, assuming for 
> instance there is data in part of the flash that you really want to avoid 
> loosing, such as calibration data?

The best way to not lose it is to have several copy of it, IMO.

>  Of course, theoretically, once the 
> kernel has access to one part of the flash it could clobber anything, 
> still, the mtd code has been proven for years whereas UBI is relatively 
> young, so one idea would be to partition that flash into several mtd 
> partitions (e.g. boot, running system, and calibration data), and let UBI 
> handle these separately. That could minimize the risk of UBI clobbering 
> the calibration data when operating on the running system, for instance.
> 
> Any thoughts?

You can let UBI manage your calibration data in a static UBI volume. But
additionally, you can have a separate calibration data back-up
partition, just in case.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
