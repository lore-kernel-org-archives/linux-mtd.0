Received: from scopuli.esotechnik.de ([2a02:c205:3001:6788::1]
 helo=mail.esotechnik.net)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fy1uF-0008P6-2H
 for linux-mtd@lists.infradead.org; Thu, 06 Sep 2018 21:33:41 +0000
Subject: Re: [PATCH 0/3] Virtual MTD concat device driver
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: linux-mtd@lists.infradead.org
References: <20180906161413.6335-1-kernel@nospam.obeliks.de>
 <20180906231148.7f707304@bbrezillon>
From: Bernhard Frauendienst <kernel@nospam.obeliks.de>
Message-ID: <187d5ca4-c6fa-b9b0-aff5-467c5bb6e868@nospam.obeliks.de>
Date: Thu, 6 Sep 2018 23:32:40 +0200
MIME-Version: 1.0
In-Reply-To: <20180906231148.7f707304@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/09/18 23:11, Boris Brezillon wrote:
> On Thu,  6 Sep 2018 18:14:10 +0200
> Bernhard Frauendienst <kernel@nospam.obeliks.de> wrote:
>
>> Hi everybody,
>>
>> when porting my router board from a mach-file based OpenWRT target to a
>> device-tree based target, I found that there is no generic way to create
>> a mtd_concat device from within the dts. The following patches attempt
>> to provide that possibility.
> May I ask what kind of devices you're trying to concatenate? Are they
> of the same type? And finally, I'd like to understand the use case.

Absolutely. Specifically, I'm working on specifying the device tree for 
the Buffalo WZR-HP-AG300H ([1], [2]). For persistent memory, it uses two 
Winbond 25Q128BVFG 16MiB chips and concatenates them to a 32MiB device.

I'm pretty sure the original firmware did this as well, but it's 
definitely done like this in the current OpenWRT implementation (using 
mach files).
The manufacturer made some other questionable choices (like attaching 
USB leds to the WiFi controller's gpio port), but apart from further 
Buffalo devices, there are also devices from other vendors that have a 
similar setup (e.g. ALFA Network AP120C, and Qihoo C301).

The current draft of the new dts file is here [3] (where the compatible 
line is still called virtual,mtd-concat, before I renamed it). As you 
can see, one of the partitions is crossing the device boundary, so I 
cannot simply distribute across the chips.

Regards
Bernhard

[1] https://wikidevi.com/wiki/Buffalo_WZR-HP-AG300H
[2] https://openwrt.org/toh/buffalo/wzr-hp-ag300h
[3] 
https://github.com/oxc/openwrt/blob/wzr-hp-ag300h/target/linux/ath79/dts/ar7161_buffalo_wzr-hp-ag300h.dts#L140
