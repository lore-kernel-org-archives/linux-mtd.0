Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQxMu-0001AF-MQ
 for linux-mtd@lists.infradead.org; Mon, 08 Sep 2014 11:44:25 +0000
Message-ID: <1410176639.10764.157.camel@sauron.fi.intel.com>
Subject: Re: Question about ubiformat and how to better use UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: t kevin <kevint324@gmail.com>
Date: Mon, 08 Sep 2014 14:43:59 +0300
In-Reply-To: <CAOx4H9BopH3F5xwmQ-B5AckTS65SUss_mxjWi2N6ibXovnm61g@mail.gmail.com>
References: <CAOx4H9BopH3F5xwmQ-B5AckTS65SUss_mxjWi2N6ibXovnm61g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-09-04 at 20:17 +0800, t kevin wrote:
> So here are my questions.
> 1. (Generally speaking) Which one is better? I know ubiformat is going
> to erase every PEB  so right now I prefer the second approach since I
> don't have to do ubiformat everytime. It sounds like the erase counter
> grows slower.

If the second way works for you, you may stick to it.

Back when I was working in Nokia, where we had to flash newly produced
devices in the factory pipeline, we had to have a flash-able image. So
we used the mkfs.ubifs approach.

So generally, the mkfs.ubifs approach was designed for real production,
and the mount approach was originally supported just to make developers'
life easier.

But use whatever is better for your needs.

> 2. I'm working on an embedded device which has limited CPU power so
> I'd like to use compressed_method=none. It can be done by passing -x
> none to mkfs.ubifs. But I don't see similar option in ubiformat or
> ubimkvol.

Well, there is no compression involved in the UBI level, and both of
these tools work on the UBI level, they do not know anything about
UBIFS. That's why you do not see this option.

>  So when I go to the 2nd approach the mounted rootfs is
> always compressed.

Use 'mount -o compr=none', check Documentation/filesystems/ubifs.txt.

> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_comproff
> This method is not helping much. I want to disable compression on the
> entire fs, just like mkfs.ubifs -x none did.

Yeah, that section misses -o compre=none. I've just fixed it up, thanks!

-- 
Best Regards,
Artem Bityutskiy
