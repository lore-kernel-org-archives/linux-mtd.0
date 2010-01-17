Received: from fg-out-1718.google.com ([72.14.220.156])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NWSYI-0007aW-60
	for linux-mtd@lists.infradead.org; Sun, 17 Jan 2010 10:40:18 +0000
Received: by fg-out-1718.google.com with SMTP id 22so176304fge.0
	for <linux-mtd@lists.infradead.org>;
	Sun, 17 Jan 2010 02:40:12 -0800 (PST)
Subject: Re: shrinking ubifs?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jon Ringle <jon@ringle.org>
In-Reply-To: <152584231001141415x2086fed9rd8566b6609a87b7e@mail.gmail.com>
References: <152584231001141415x2086fed9rd8566b6609a87b7e@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 17 Jan 2010 12:40:03 +0200
Message-Id: <1263724803.8276.138.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Thu, 2010-01-14 at 17:15 -0500, Jon Ringle wrote:
> On ubi0, I have 3 volumes:
> ubi0_0 kernel (static volume)
> ubi0_1 squashfs (static volume)
> ubi0_2 ubifs (dynamic volume)
> 
> When I create the volumes, the static volumes are created first and
> then the ubifs volume is created with whatever LEBs are left over. I
> am using the squashfs and ubifs in a aufs2 union fs. When I need to
> reflash either of the static volumes for an upgrade, and the new
> images don't fit the space available in the LEBs reserved in the
> corresponding static volume, I remove the ubifs volume to create space
> and then recreate the ubifs volume again with what is remaining. This
> is sub-optimal as this means that and data on the ubifs is now lost.

Yes, this is not optimal. However, ubifs shrinking is not implemented.
One could UBIFS ioctl to shring the FS, though, it should not be
extremely difficult. It is about garbage-collecting the last LEBs to
somewhere else, and amending the master block.

> Is there a way to shrink a UBIFS if there are unused LEBs in the UBIFS?

Not at the moment, this would need some development.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
