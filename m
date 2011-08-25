Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QwTzk-0005FT-NL
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2011 07:04:58 +0000
Received: by gyh20 with SMTP id 20so1799064gyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Aug 2011 00:04:53 -0700 (PDT)
Subject: Re: [PATCHv3] UBI: new module ubiblk: block layer on top of UBI
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 25 Aug 2011 10:06:44 +0300
In-Reply-To: <201108241823.20904.arnd@arndb.de>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	<1313587042-30846-1-git-send-email-david.wagner@free-electrons.com>
	<1313998939.2644.52.camel@sauron> <201108241823.20904.arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1314256010.18988.18.camel@sauron>
Mime-Version: 1.0
Cc: linux-embedded <linux-embedded@vger.kernel.org>,
	david.wagner@free-electrons.com, lkml <linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>, Tim Bird <tim.bird@am.sony.com>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Arnd,

On Wed, 2011-08-24 at 18:23 +0200, Arnd Bergmann wrote:
> That should  be fine, yes. I would probably put them into the same
> header file though if they are in the same number space even
> when you use them on distinct devices.
> 
> It does feel a little clumsy to have yet another character device
> to manage the block devices though. What do you think about one
> of these alternative approaches:
> 
> * When the ubi block device driver gets loaded, create one block
>   device per volume and let the user deal with permissions for
>   the devices instead of having to first create them as well.

I think this wasteful. Why should I have block devices which I do not
need? If I have 4 UBI volumes, and need only one ubiblk, why should I
waste my resources for 3 more of them (e.g., I do not want to waste
memory for struct inode for each sysfs entry which these useless block
devices will add). Also, will this mean 3 more block devices registered?

I think it is much uglier to have 3 "dummy" block devices and confuse
users than have one nice control character device. For the sake of not
having a separate control chardev?

> * Use the existing UBI control device for the block devices as
>   well and just add two more ioctls to create the devices.
>   You can add a logical bus_type for this so that the ubi block
>   driver gets automatically loaded matched with the device when
>   one is created using the control device.

This sounds  better IMHO, but I am still not sure that adding another
dummy bus and exposing it in sysfs and more complexity in the ubiblk
code is more elegant and less wasteful than just creating a separate
chardev...

-- 
Best Regards,
Artem Bityutskiy
