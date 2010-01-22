Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NYLvu-0007uW-15
	for linux-mtd@lists.infradead.org; Fri, 22 Jan 2010 16:00:30 +0000
Subject: Re: [PATCH 3/4] MTD: blkdevs: make hotplug work
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Maxim Levitsky <maximlevitsky@gmail.com>
In-Reply-To: <1264174506.24012.21.camel@maxim-laptop>
References: <1264174316.24012.17.camel@maxim-laptop>
	<1264174506.24012.21.camel@maxim-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 22 Jan 2010 17:59:34 +0200
Message-ID: <1264175974.4494.4.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alex Dubov <oakad@yahoo.com>, joern <joern@logfs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-01-22 at 17:35 +0200, Maxim Levitsky wrote:
> >From 368127067f4d39ba89096e4a5cb3be2dee361bad Mon Sep 17 00:00:00 2001
> From: Maxim Levitsky <maximlevitsky@gmail.com>
> Date: Fri, 22 Jan 2010 15:00:55 +0200
> Subject: [PATCH 3/4] MTD: blkdevs: make hotplug work
> 
> This changes the blkdev common module for translation layers
> to survive when underlying mtd device disappears.
> 
> To do so the following conceptual changes were made:
> 
> * disk queue and thread are now one per mtd device
>  This was it is easy to flush and destroy the queue
> 
> * the struct mtd_blktrans_dev will now be freed automaticly when last user
>  of the device quits.
>  All existing translation layers are adjusted
> 
> * ->open and release function of the translation layer will never be called
>  twise or more in the row.
>  This makes code simplier.
>  Also the ->release will be called just before mtd device disappears
>  This and above is the only visable changes on the outside.
> 
> Tested with mtdblock, ssfdc and my own sm_ftl on top of physicly hotplugable
> nand card.
> 
> Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>

I'll try to find some time to review this later - I'm really busy
lately. But please, split this huge patch on smaller pieces - this will
help the reviewers a lot.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
