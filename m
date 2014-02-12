Received: from smtp.codeaurora.org ([198.145.11.231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDWUJ-0003Mx-TM
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2014 09:52:19 +0000
Message-ID: <52FB4435.7020407@codeaurora.org>
Date: Wed, 12 Feb 2014 11:51:49 +0200
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [mtd] possible bug in nandsim
References: <527B7CD1.1020105@codeaurora.org>
 <CAFLxGvx=8vcDzUcA6vG_84X8snYkDLBkyboQZmDTUdDgi3xccQ@mail.gmail.com>
 <20131107145848.GA32004@localhost>
In-Reply-To: <20131107145848.GA32004@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dedekind@infradead.org, dedekind@oktetlabs.ru, pratibha@codeaurora.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 fastcat@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard

Sorry for taking so long but I got to testing your patch just now.
Unfortunately the device crashes as soon as soon as I try to load nandsim:

modprobe nandsim first_id_byte=0x20 second_id_byte=0xaa 
third_id_byte=0x00 fourth_id_byte=0x15 cache_file=cashe_file.txt 
cache_file_written=1

dmesg:
[  202.110263] BUG: unable to handle kernel paging request at d88fb000
[  202.111018] IP: [<d88f3a4c>] ns_init_module+0xa4c/0xcdc [nandsim]
[  202.111018] *pde = 1780f067 *pte = 00000000
[  202.111018] Oops: 0002 [#1] SMP
[  202.111018] Modules linked in: nandsim(+)
[  202.111018] CPU: 0 PID: 1531 Comm: modprobe Not tainted 
3.14.0-rc2-next-20140212+ #183
[  202.111018] Hardware name: Bochs Bochs, BIOS Bochs 01/01/2007
[  202.111018] task: d79e2e80 ti: d6c68000 task.ti: d6c68000
[  202.111018] EIP: 0060:[<d88f3a4c>] EFLAGS: 00010202 CPU: 0
[  202.111018] EIP is at ns_init_module+0xa4c/0xcdc [nandsim]
[  202.111018] EAX: d781f4ff EBX: d781f1d8 ECX: 0001c000 EDX: d88f7000
[  202.111018] ESI: d781f414 EDI: d88fb000 EBP: d6c69e24 ESP: d6c69dcc
[  202.111018]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[  202.111018] CR0: 8005003b CR2: d88fb000 CR3: 16e6a000 CR4: 00000690
[  202.111018] Stack:
[  202.111018]  d88eefb8 00000008 00000000 00000000 00000000 d781f1d8 
194bce9c 0000002f
[  202.111018]  194b37e7 00000040 d781f1d8 00000000 d781f414 d6c69e08 
10000000 00000000
[  202.111018]  d6c443c0 00000000 d6c69e24 d6c69f60 00000000 00000000 
d6c69e94 c1000360
[  202.111018] Call Trace:
[  202.111018]  [<c1000360>] do_one_initcall+0x30/0x140
[  202.111018]  [<c10bff71>] ? tracepoint_module_notify+0x121/0x180
[  202.111018]  [<d88f3000>] ? 0xd88f2fff
[  202.111018]  [<c1764003>] ? notifier_call_chain+0x43/0x60
[  202.111018]  [<c1061c84>] ? __blocking_notifier_call_chain+0x54/0x70
[  202.111018]  [<c10a5def>] load_module+0x14bf/0x1920
[  202.111018]  [<c10a3130>] ? mod_kobject_put+0x40/0x40
[  202.111018]  [<c10a6383>] SyS_init_module+0xa3/0xc0
[  202.111018]  [<c1767c5a>] sysenter_do_call+0x12/0x22
[  202.111018] Code: 04 24 10 0b 8f d8 bf f4 ff ff ff e8 d8 91 e6 e8 e9 
04 01 00 00 83 3d 40 13 8f d8 00 74 0f 8b 45 d8 89 d7 8b 88 d4 03 00 00 
b0 ff <f3> aa 8b 55 d8 8b 82 cc 03 00 00 ba d0 00 00 00 e8 cf 73 83 e8
[  202.111018] EIP: [<d88f3a4c>] ns_init_module+0xa4c/0xcdc [nandsim] 
SS:ESP 0068:d6c69dcc
[  202.111018] CR2: 00000000d88fb000
[  202.111018] ---[ end trace cdb11d3383abc7cc ]---

Thanks
Tanya



On 11/7/2013 4:58 PM, Ezequiel Garcia wrote:
> Hello Richard, Tanya:
>
> On Thu, Nov 07, 2013 at 03:35:30PM +0100, Richard Weinberger wrote:
>> On Thu, Nov 7, 2013 at 12:43 PM, Tanya Brokhman <tlinder@codeaurora.org> wrote:
>>> Hi
>>>
>>> I've recently started working with the nand simulator. For my testing
>>> purposes I have to use it with a cache file. Bellow are the commands I run:
>>>
>>> modprobe nandsim first_id_byte=0x20 second_id_byte=0xaa third_id_byte=0x00
>>> fourth_id_byte=0x15 cache_file=cache_file.txt
>>> modprobe ubi mtd=0 fm_autoconvert=1
>>>
>>> Unfortunately, when trying the above I noticed that the next time i load
>>> nandsim and ubi on top of it the fastmap data is not saved at cache_file.txt
>>> and the device comes up as clean. Meaning, the cache file feature of the
>>> nandsim isn't working properly.
>>
>> IIRC this feature is really meant as a cache and not persistent storage.
>>
>
> AFAIK Richard is right, the feature is just a non-persistent cache.
>
> However a patch was submitted (and never reviewed) recently to
> apparently add persistent behavior:
>
>    http://patchwork.ozlabs.org/patch/277974/
>
> Tanya: Can you test or review the patch and provide a formal
> Tested/Reviewed-by? I'd be interested in seeing that move forward :)
>
> Thanks!
>


-- 
QUALCOMM ISRAEL, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
