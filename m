Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1fTk-0000bH-O4
 for linux-mtd@lists.infradead.org; Mon, 30 Jun 2014 17:35:01 +0000
Message-ID: <53B19FA5.1030801@nod.at>
Date: Mon, 30 Jun 2014 19:34:29 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Akshay Bhat <abhat@lutron.com>
Subject: Re: UBIFS Panic
References: <53AC825F.7040602@lutron.com> <53ACD890.4030805@huawei.com>
 <53B15F8E.3030309@lutron.com>
 <CAFLxGvzQpaLvLda8dXdVzvc00EYc9TpsLjJhsCjEBy28RsL=_w@mail.gmail.com>
 <53B19D09.2000007@lutron.com>
In-Reply-To: <53B19D09.2000007@lutron.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 hujianyang <hujianyang@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 30.06.2014 19:23, schrieb Akshay Bhat:
> 
> 
> On Mon 30 Jun 2014 10:48:01 AM EDT, Richard Weinberger wrote:
>> On Mon, Jun 30, 2014 at 3:01 PM, Akshay Bhat <abhat@lutron.com> wrote:
>>> Thanks for your response. Answers in-line.
>>>
>>>
>>> On Thu 26 Jun 2014 10:36:00 PM EDT, hujianyang wrote:
>>>>
>>>> How did you release data on the flash? What's the partitions on your
>>>> system?
>>>> Did you use MTD_UBI_FASTMAP?
>>>
>>>
>>> Image was flashed using the below command:
>>> ubiformat /dev/mtd11 -f rootfs.ubi -s 512 -O 2048
>>>
>>> UBI fastmap is enabled.
>>> CONFIG_MTD_UBI_FASTMAP=y
>>
>> Do you also use it or is it just enabled?
> 
> We do not need/use the fastmap feature. (fm_autoconvert set to 0).
> 
> Is enabling UBI_FASTMAP the cause for the panic? If so I can disabled the
> feature and re-test. Do you see any compatibility issue going from:
> Current config -> New config -> Failsafe config

I hope not. :)
Please retry with CONFIG_MTD_UBI_FASTMAP=n.

> Current config: CONFIG_MTD_UBI_FASTMAP = y; fm_autoconvert = 0
> New config:  CONFIG_MTD_UBI_FASTMAP = n; fm_autoconvert = 0
> Failsafe kernel config (if the above kernel does not boot):
> CONFIG_MTD_UBI_FASTMAP = y; fm_autoconvert = 0
> 
> Snippet of dmesg boot log:
> [    0.000000] Kernel command line: console=ttyO0,115200n8 noinitrd mem=256M
> root=ubi0:rootfs rw ubi.mtd=11,2048 rootfstype=ubifs rootwait=1 ip=none quiet
> loglevel=3 panic=3
> ............
> [    0.483696] UBI: default fastmap pool size: 95
> [    0.483712] UBI: default fastmap WL pool size: 25

This indicates CONFIG_MTD_UBI_FASTMAP=y.

Thanks,
//richard
