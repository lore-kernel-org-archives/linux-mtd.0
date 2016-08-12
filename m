Subject: Re: [U-Boot] Older u-boot mangles UBI from ubinize 1.5.2
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <3e1a26f3-5539-01c5-0755-aea07c95d08a@jmomo.net>
 <CAFLxGvyfLdS3cBqoicS02NymT+BAq8B3tKsFzte7Am_4AW0qQA@mail.gmail.com>
Cc: J Mo <jmomo@jmomo.net>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 lede-dev@lists.infradead.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: hs@denx.de
From: Heiko Schocher <hs@denx.de>
Message-ID: <57AD51FC.9090603@denx.de>
Date: Fri, 12 Aug 2016 06:35:08 +0200
MIME-Version: 1.0
In-Reply-To: <CAFLxGvyfLdS3cBqoicS02NymT+BAq8B3tKsFzte7Am_4AW0qQA@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Richard,

Am 11.08.2016 um 11:51 schrieb Richard Weinberger:
> Hi!
>
> On Thu, Aug 11, 2016 at 4:26 AM, J Mo <jmomo@jmomo.net> wrote:
>> I tried re-flashing my UBI and tftpbooting my kernel before u-boot could
>> ever get a chance to mangle it, and now I get much further, though I'm still
>> not able to mount my rootfs for unknown reasons:
>>
>>      [    3.772502] ubi0: attaching mtd11
>>      [    3.826477] UBI: EOF marker found, PEBs from 40 will be erased
>
> WTF is this?
> Reading the corresponding patch makes me very sad.
>
>>      [    3.826638] ubi0: scanning is finished
>>      [    3.872936] ubi0: volume 2 ("rootfs_data") re-sized from 9 to 430
>> LEBs
>>      [    3.873734] ubi0: attached mtd11 (name "rootfs", size 64 MiB)
>>      [    3.878347] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976
>> bytes
>>      [    3.884234] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size
>> 2048
>>      [    3.890936] ubi0: VID header offset: 2048 (aligned 2048), data
>> offset: 4096
>>      [    3.897849] ubi0: good PEBs: 512, bad PEBs: 0, corrupted PEBs: 0
>>      [    3.904627] ubi0: user volume: 3, internal volumes: 1, max. volumes
>> count: 128
>>      [    3.910815] ubi0: max/mean erase counter: 1/0, WL threshold: 4096,
>> image sequence number: 2142265782
>>      [    3.917902] ubi0: available PEBs: 0, total reserved PEBs: 512, PEBs
>> reserved for bad PEB handling: 40
>>      [    3.927275] ubi0: background thread "ubi_bgt0d" started, PID 54
>>      [    3.937007] block ubiblock0_1: created from ubi0:1(rootfs)
>>      [    3.942096] hctosys: unable to open rtc device (rtc0)
>>      [    3.956528] VFS: Cannot open root device "ubi0:rootfs" or
>> unknown-block(31,11): error -2
>>      [    3.956556] Please append a correct "root=" boot option; here are the
>> available partitions:
>>
>>
>>
>> Any advice on this? Any background information that I can read up on? My
>> google searches have not come up with much. Ram knew about this, but I don't
>> know if it's otherwise a known issue.
>>
>> The process works fine on the OEM system, so I assume this is some ubinize
>> format change which is incompatible with the older u-boot. Or, the newer
>> kernel code doesn't know how to deal with the UBI once the older u-boot has
>> mangled/attached it.
>>
>> Seems like a backwards incompatibility issue.
>
> Since OpenWRT/LEDE folks did more or less a hard fork of UBI I'm
> ignoring this issue.

Ufff.... thanks for this info!

> If you encounter something like that using vanilla UBI I'm all ears.
>
> That said, I kind of understand that you, OpenWRT/LEDE, have a pile of
> patches for auto probing rootfs
> and other runtime stuff but touching the UBI on-flash format is beyond funny.
> Doing so opens a can of worms and is painful for all parties. There
> are customers which build their
> products using OpenWrt and when they change the kernel at some point
> it will get nasty.
>
> This situation needs to be improved now. I invite you to discuss this
> changes here on linux-mtd.
> Especially the stuff where you change the on-flash format.
> If UBI, or MTD in general, can do a better job in some areas, please
> tell such that a decent solution can be found.
> But your ad-hoc hacks need to stop.

Full Ack.

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
