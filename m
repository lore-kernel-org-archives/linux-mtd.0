Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eSmBQ-0007uw-7Z
 for linux-mtd@lists.infradead.org; Sat, 23 Dec 2017 15:57:58 +0000
Received: by mail-pl0-x242.google.com with SMTP id b96so14536898pli.2
 for <linux-mtd@lists.infradead.org>; Sat, 23 Dec 2017 07:57:45 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3 00/27] kill devm_ioremap_nocache
To: Greg KH <gregkh@linuxfoundation.org>, Yisheng Xie <xieyisheng1@huawei.com>
Cc: linux-kernel@vger.kernel.org, ysxie@foxmail.com, ulf.hansson@linaro.org,
 linux-mmc@vger.kernel.org, boris.brezillon@free-electrons.com,
 richard@nod.at, marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 linux-mtd@lists.infradead.org, alsa-devel@alsa-project.org, wim@iguana.be,
 linux-watchdog@vger.kernel.org, b.zolnierkie@samsung.com,
 linux-fbdev@vger.kernel.org, linus.walleij@linaro.org,
 linux-gpio@vger.kernel.org, ralf@linux-mips.org, linux-mips@linux-mips.org,
 lgirdwood@gmail.com, broonie@kernel.org, tglx@linutronix.de,
 jason@lakedaemon.net, marc.zyngier@arm.com, arnd@arndb.de,
 andriy.shevchenko@linux.intel.com, industrypack-devel@lists.sourceforge.net,
 wg@grandegger.com, mkl@pengutronix.de, linux-can@vger.kernel.org,
 mchehab@kernel.org, linux-media@vger.kernel.org, a.zummo@towertech.it,
 alexandre.belloni@free-electrons.com, linux-rtc@vger.kernel.org,
 daniel.vetter@intel.com, jani.nikula@linux.intel.com, seanpaul@chromium.org,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, kvalo@codeaurora.org,
 linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, tj@kernel.org,
 linux-ide@vger.kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org,
 devel@driverdev.osuosl.org, dvhart@infradead.org, andy@infradead.org,
 platform-driver-x86@vger.kernel.org, jakub.kicinski@netronome.com,
 davem@davemloft.net, nios2-dev@lists.rocketboards.org,
 netdev@vger.kernel.org, vinod.koul@intel.com, dan.j.williams@intel.com,
 dmaengine@vger.kernel.org, jslaby@suse.com
References: <1514026525-32538-1-git-send-email-xieyisheng1@huawei.com>
 <20171223134831.GB10103@kroah.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <f7632cf5-2bcc-4d74-b912-3999937a1269@roeck-us.net>
Date: Sat, 23 Dec 2017 07:57:40 -0800
MIME-Version: 1.0
In-Reply-To: <20171223134831.GB10103@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/23/2017 05:48 AM, Greg KH wrote:
> On Sat, Dec 23, 2017 at 06:55:25PM +0800, Yisheng Xie wrote:
>> Hi all,
>>
>> When I tried to use devm_ioremap function and review related code, I found
>> devm_ioremap and devm_ioremap_nocache is almost the same with each other,
>> except one use ioremap while the other use ioremap_nocache.
> 
> For all arches?  Really?  Look at MIPS, and x86, they have different
> functions.
> 

Both mips and x86 end up mapping the same function, but other arches don't.
mn10300 is one where ioremap and ioremap_nocache are definitely different.

Guenter

>> While ioremap's
>> default function is ioremap_nocache, so devm_ioremap_nocache also have the
>> same function with devm_ioremap, which can just be killed to reduce the size
>> of devres.o(from 20304 bytes to 18992 bytes in my compile environment).
>>
>> I have posted two versions, which use macro instead of function for
>> devm_ioremap_nocache[1] or devm_ioremap[2]. And Greg suggest me to kill
>> devm_ioremap_nocache for no need to keep a macro around for the duplicate
>> thing. So here comes v3 and please help to review.
> 
> I don't think this can be done, what am I missing?  These functions are
> not identical, sorry for missing that before.
> 
> thanks,
> 
> greg k-h
> 
