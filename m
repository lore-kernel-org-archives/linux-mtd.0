Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R5VqK-0000Zj-56
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2011 04:52:32 +0000
Received: by fxg7 with SMTP id 7so4357907fxg.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 Sep 2011 21:52:31 -0700 (PDT)
Subject: Re: Request for comments: UBI PEBs as a multiple of erase size
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Paul Herbert <kevin.herbert@meraki.net>
Date: Mon, 19 Sep 2011 07:55:11 +0300
In-Reply-To: <40BCDFDF-F9C8-46C5-99F8-E56050E8B32C@meraki.net>
References: <40BCDFDF-F9C8-46C5-99F8-E56050E8B32C@meraki.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1316408116.24366.51.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-09-13 at 12:36 -0700, Kevin Paul Herbert wrote:
> I came across a situation where I wanted to be able to use the same
> pre-built (with UBI) image on two different FLASH devices, one of
> which having a larger erase size than the other. I actually did not
> notice that the device I was using had a different erase size, which
> caused UBI to quietly corrupt my FLASH.
> 
> I have a patch to UBI (kernel and ubinize) to store the size of a PEB
> in the EC header, reject attaching if the PEB size is not equal to or
> an integer multiple of the erase size, and treat multiple erase blocks
> as a "cluster" for I/O operations.
> 
> I looked through a few months of archives to see if this is a common
> problem, and I don't see this as being discussed. Is there interest in
> me publishing this patch for inclusion in the kernel. The only
> downside I can see of my change is that it adds an additional 32 bit
> quantity to struct ubi_ec_hdr, reducing the available free header
> byets from 35 to 31. For backwards compatibility, if this field is
> zero, I treat it as PEB size == erase size.
> 
> It seems to me that having the PEB size in the header, regardless of
> supporting multiple erase blocks as a single PEB, is a useful
> consistency check.
> 
> Comments please?

I think we do have this kind of "protection" in UBIFS, but non in UBI.
Please, go ahead and send patches!

-- 
Best Regards,
Artem Bityutskiy
