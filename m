Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED25C77B75
	for <linux-mtd@archiver.kernel.org>; Wed, 17 May 2023 05:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJj4WasVF/W39mBeGmuBaIBPTkg9ClnmHKQQPz7CfYw=; b=lPOZogauKnyY3c0Sb7dzraRPvb
	r9WsGUuX15Y2Bha/cNF5ndvk4XnSp/jet4n85rTvGb3ElyJX6leuWmavOrzLZqoDYddl3UqZ/VARr
	goRkcQVJkCVXpEArfIdpDq02bk2xYicgKjL9xmW8PMLAsoZFBABX/whXy+NSS/ygOYa05PyqZKSiF
	8u2qfOlSLlw9FQmwiBiFlFDfnWAbXjMpA3YdCxzbpM/oD8UYiZLuzGT46LV9pn6V77qypBB54UbmI
	RQbVOZ9kCl9xtG+214s+ChsqNZydX4omIYYbdOEpbggwPQW6SJbo5w4l342UEwoHLZTlAlBbWvtl1
	Vyzrgi3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pz9jz-008GOZ-20;
	Wed, 17 May 2023 05:30:23 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pz9ju-008GMG-0T
	for linux-mtd@lists.infradead.org;
	Wed, 17 May 2023 05:30:21 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1ae51b07338so1612785ad.0
        for <linux-mtd@lists.infradead.org>; Tue, 16 May 2023 22:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1684301416; x=1686893416;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2XxiyYhS9TYQPgR5pmr1667XbGcD//FcXNmdQaFFpI=;
        b=J0DxvahArH6UVJbnfo77Qh6p16dDxLy730jQRCSJu9MoFVwaonRnxK7Uiz2zmSXKwP
         C7n0R77gm0LGUtpC6GLFfolqJYwOOvmZNUnaqUQj2HhDCEfFTPn9xmpVfgKc/BbCRAvO
         Nfb5i8P8UeeNdRPxMqju1DqqpMV9mhRV2lXy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684301416; x=1686893416;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z2XxiyYhS9TYQPgR5pmr1667XbGcD//FcXNmdQaFFpI=;
        b=YVpBetfTXTHZlATnQihDVvc8FtveGoAg5bRv6xey78G3DoA4Cmhr7B/TydjaKwlWiT
         oB8/EMgUCM7KBP75peBU6ad4Jb/bDuM53el6JTlA4haX+FT5Y4W2zbQCcDaira67RL0o
         OtT+IFBDcux7rNuJF6cjr4kQ8eRB8GyJ8kPkWuQBX0/RMm/EnpcMRM1pDgekATXvdu8E
         zNaphzhFfXTLeI1BFgO81kmOS60NzJAW5pcKidsqPoXSggDqM4YQWLsEZ9GWZ0JRg8eH
         NENt/aFN1+nIoUOlpHeOYYR1Ql/DlTqvOdUXHRaFPxc809r6XIIFa1wHggZ48OdIdZ9U
         K49Q==
X-Gm-Message-State: AC+VfDzkJEuKcK57YoGdoNcnrL1/pwwVO3guiiqgX0BQiIWD0Bz6GKNY
	Rm08568ViaE5ZZ/e1dJSv5Vsuw==
X-Google-Smtp-Source: ACHHUZ7+6shxPFZsHYqhWdbAAsDevX6s5gvbDjFQbkqWCWuubv7VozGarrZ1Sz5USJhahzRwjLUqEQ==
X-Received: by 2002:a17:902:efd4:b0:1a9:20d6:3c3f with SMTP id ja20-20020a170902efd400b001a920d63c3fmr37164837plb.55.1684301415791;
        Tue, 16 May 2023 22:30:15 -0700 (PDT)
Received: from bcacpedev-irv-3.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id jj4-20020a170903048400b001ae42480c82sm1987674plb.226.2023.05.16.22.30.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 May 2023 22:30:14 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: mtd: nand: Macronix: document new
 binding
To: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>
Cc: liao jaime <jaimeliao.tw@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <CAAQoYRm3766SG7+VuwVzu_xH8aWihoKWMEp8xQGNgJ6oOtC9+g@mail.gmail.com>
 <CAAQoYRmXdMp7b2r+yCRUtGrbfQH-Cb8gMAVo7YscuQEM5kgajw@mail.gmail.com>
 <CAKR-sGdiLzZ7iVbLmz1uPwYoUXQZ2qGwmCBAq_-OKXfVT=Pj-A@mail.gmail.com>
 <d0543f48-6f0b-58e0-cc18-695a28c493fc@gmail.com>
 <CAKR-sGer0r0FxyOQQu7TxT0d2D981_1fQWxa_XghfyWKWSJVfQ@mail.gmail.com>
From: William Zhang <william.zhang@broadcom.com>
Message-ID: <e16ae30a-f3ac-fbd9-b070-185997bcb89d@broadcom.com>
Date: Tue, 16 May 2023 22:30:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAKR-sGer0r0FxyOQQu7TxT0d2D981_1fQWxa_XghfyWKWSJVfQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_223019_144240_9CD68F92 
X-CRM114-Status: GOOD (  36.69  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2483241044427815594=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============2483241044427815594==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000009f682c05fbdcfb8c"

--0000000000009f682c05fbdcfb8c
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 05/16/2023 12:02 PM, Álvaro Fernández Rojas wrote:
> Sure,
> 
> Here you go:
> [    0.000000] Linux version 5.15.111 (noltari@atlantis)
> (mips-openwrt-linux-musl-gcc (OpenWrt GCC 12.3.0 r0+22899-466be0612a)
> 12.3.0, GNU ld (GNU Binutils) 2.40.0) #0 SMP Tue May 16 14:33:20 2023
> [    0.000000] CPU0 revision is: 0002a080 (Broadcom BMIPS4350)
> [    0.000000] MIPS: machine is Sercomm H500-s vfes
> [    0.000000] 128MB of RAM installed
> [    0.000000] earlycon: bcm63xx_uart0 at MMIO 0x10000180 (options '115200n8')
> [    0.000000] printk: bootconsole [bcm63xx_uart0] enabled
> [    0.000000] Initrd not found or empty - disabling initrd
> [    0.000000] Reserving 0KB of memory at 4194303KB for kdump
> [    0.000000] Primary instruction cache 64kB, VIPT, 4-way, linesize 16 bytes.
> [    0.000000] Primary data cache 32kB, 2-way, VIPT, cache aliases,
> linesize 16 bytes
> [    0.000000] Zone ranges:
> [    0.000000]   Normal   [mem 0x0000000000000000-0x0000000007ffffff]
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000000000000-0x0000000007ffffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x0000000007ffffff]
> [    0.000000] percpu: Embedded 11 pages/cpu s13328 r8192 d23536 u45056
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 32480
> [    0.000000] Kernel command line: earlycon
> [    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536
> bytes, linear)
> [    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768
> bytes, linear)
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.000000] Memory: 108656K/131072K available (6902K kernel code,
> 613K rwdata, 1404K rodata, 11872K init, 215K bss, 22416K reserved, 0K
> cma-reserved)
> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
> [    0.000000] rcu: Hierarchical RCU implementation.
> [    0.000000]  Tracing variant of Tasks RCU enabled.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay
> is 10 jiffies.
> [    0.000000] NR_IRQS: 256
> [    0.000000] irq_bcm6345_l1: registered BCM6345 L1 intc (IRQs: 128)
> [    0.000000] irq_bcm6345_l1:   CPU0 (irq = 2)
> [    0.000000] irq_bcm6345_l1:   CPU1 (irq = 3)
> [    0.000000] brcm,bcm63268 detected @ 400 MHz
> [    0.000000] clocksource: MIPS: mask: 0xffffffff max_cycles:
> 0xffffffff, max_idle_ns: 9556302233 ns
> [    0.000002] sched_clock: 32 bits at 200MHz, resolution 5ns, wraps
> every 10737418237ns
> [    0.008292] Calibrating delay loop... 398.13 BogoMIPS (lpj=1990656)
> [    0.074683] pid_max: default: 32768 minimum: 301
> [    0.081788] Mount-cache hash table entries: 1024 (order: 0, 4096
> bytes, linear)
> [    0.089319] Mountpoint-cache hash table entries: 1024 (order: 0,
> 4096 bytes, linear)
> [    0.106094] rcu: Hierarchical SRCU implementation.
> [    0.112665] smp: Bringing up secondary CPUs ...
> [    0.119348] SMP: Booting CPU1...
> [    8.330979] Primary instruction cache 64kB, VIPT, 4-way, linesize 16 bytes.
> [    8.331017] Primary data cache 32kB, 2-way, VIPT, cache aliases,
> linesize 16 bytes
> [    8.331294] CPU1 revision is: 0002a080 (Broadcom BMIPS4350)
> [    0.182819] Synchronize counters for CPU 1:
> [    0.203500] SMP: CPU1 is running
> [    0.203512] done.
> [    0.213401] smp: Brought up 1 node, 2 CPUs
> [    0.228870] clocksource: jiffies: mask: 0xffffffff max_cycles:
> 0xffffffff, max_idle_ns: 19112604462750000 ns
> [    0.239058] futex hash table entries: 512 (order: 3, 32768 bytes, linear)
> [    0.246439] pinctrl core: initialized pinctrl subsystem
> [    0.254917] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [    0.312700] clocksource: Switched to clocksource MIPS
> [    0.321061] NET: Registered PF_INET protocol family
> [    0.326879] IP idents hash table entries: 2048 (order: 2, 16384
> bytes, linear)
> [    0.335972] tcp_listen_portaddr_hash hash table entries: 512
> (order: 0, 6144 bytes, linear)
> [    0.344721] Table-perturb hash table entries: 65536 (order: 6,
> 262144 bytes, linear)
> [    0.352721] TCP established hash table entries: 1024 (order: 0,
> 4096 bytes, linear)
> [    0.360622] TCP bind hash table entries: 1024 (order: 1, 8192 bytes, linear)
> [    0.368005] TCP: Hash tables configured (established 1024 bind 1024)
> [    0.375074] UDP hash table entries: 256 (order: 1, 8192 bytes, linear)
> [    0.381862] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes, linear)
> [    0.389762] NET: Registered PF_UNIX/PF_LOCAL protocol family
> [    0.395748] PCI: CLS 0 bytes, default 16
> [    0.403410] workingset: timestamp_bits=14 max_order=15 bucket_order=1
> [    0.426490] squashfs: version 4.0 (2009/01/31) Phillip Lougher
> [    0.432492] jffs2: version 2.2 (NAND) (SUMMARY) (LZMA) (RTIME)
> (CMODE_PRIORITY) (c) 2001-2006 Red Hat, Inc.
> [    0.459472] bcm63xx-power-controller 1000184c.power-controller:
> registered 14 power domains
> [    0.470267] 10000180.serial: ttyS0 at MMIO 0x10000180 (irq = 8,
> base_baud = 1562500) is a bcm63xx_uart
> [    0.479996] printk: console [ttyS0] enabled
> [    0.479996] printk: console [ttyS0] enabled
> [    0.488651] printk: bootconsole [bcm63xx_uart0] disabled
> [    0.488651] printk: bootconsole [bcm63xx_uart0] disabled
> [    0.533435] bcm2835-rng 10002880.rng: hwrng registered
> [    0.606025] bcm6368_nand 10000200.nand: there is not valid maps for
> state default
> [    0.633977] nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xf1
> [    0.640506] nand: Macronix MX30LF1G18AC
> [    0.644551] nand: 128 MiB, SLC, erase size: 128 KiB, page size:
> 2048, OOB size: 64
> [    0.652359] bcm6368_nand 10000200.nand: detected 128MiB total,
> 128KiB blocks, 2KiB pages, 16B OOB, 8-bit, BCH-4
> [    0.703373] Bad block table not found for chip 0
> [    0.732040] Bad block table not found for chip 0
> [    0.736842] Scanning device for bad blocks
> [    0.832678] CPU 0 Unable to handle kernel paging request at virtual
> address 00000014, epc == 8009b300, ra == 806cc650
> [    0.843628] Oops[#1]:
> [    0.845958] CPU: 0 PID: 88 Comm: hwrng Not tainted 5.15.111 #0
> [    0.851959] $ 0   : 00000000 00000001 00000008 00000000
> [    0.857358] $ 4   : 81808464 00000064 00000000 00000001
> [    0.862753] $ 8   : 81810000 00001ff0 00001c00 815b8880
> [    0.868146] $12   : 0000b79d 00000000 00000000 00009bb
> 
> Please, tell me if you want me to add any debugging to the log.
> 
> Best regards,
> Álvaro.
> 
> El mar, 16 may 2023 a las 20:58, Florian Fainelli
> (<f.fainelli@gmail.com>) escribió:
>>
>> +William,
>>
>> On 5/16/23 11:55, Álvaro Fernández Rojas wrote:
>>> Hi Jaime,
>>>
>>> I've reproduced the issue on a Comtrend VR-3032u (MX30LF1G08AA). After
>>> forcing it to check block protection (it's not supported on that
>>> device), the NAND controller stops reading/writing anything.
>>>
>>> @Florian is it possible that low level ops (GET_FEATURES/SET_FEATURES)
>>> aren't supported on BCM63268 NAND controllers and this is causing the
>>> issue?
>>
>> Yes, this looks like what we have seen as well even with newer NAND
>> controllers actually. Would it be possible to obtain a full log from
>> either of you?
>>
>> William, is this something you have seen before as well?
>>
No, I haven't seen such issue before.  It is possible I didn't have this 
  Macronix parts in my board. If I can find a board with Macronix part, 
I will try it. But we don't use this feature and don't connect the PT 
pin in our reference board which means the PT feature is disabled in the 
nand part.

Alvaro, Do you know if your 63268 board has PT pin connected or not? Can 
you check if the macronix's lock and unlock function being calling 
before the hang?   Or is it just get/set feature function getting called 
to determine PT is supported?   The get/set feature function should work 
as they are used by other pathes


>>>
>>> Best regards,
>>> Álvaro.
>>>
>>> El mié, 26 abr 2023 a las 9:24, liao jaime (<jaimeliao.tw@gmail.com>) escribió:
>>>>
>>>> Hi Álvaro
>>>>
>>>> In nand_scan_tail(), each manufacturer init function call will be execute.
>>>> In macronix_nand_init(), block protect will be execute after flash detect.
>>>> I have validate MX30LF1G18AC in Linux kernel v5.15.
>>>> I didn't got situation "device hangs"  on my side.
>>>> BP is to prevent incorrect operations.
>>>> Please check the controller settings for tracing this issue.
>>>>
>>>> Thanks
>>>> Jaime
>>>>
>>>>>
>>>>> Hello YouChing and Jaime,
>>>>>
>>>>> I still didn't get any feedback from you (or Macronix) on this issue.
>>>>> Did you have time to look into it?
>>>>>
>>>>> Thanks,
>>>>> Álvaro.
>>>>>
>>>>> El vie, 24 mar 2023 a las 18:04, Álvaro Fernández Rojas
>>>>> (<noltari@gmail.com>) escribió:
>>>>>>
>>>>>> Hi Miquèl,
>>>>>>
>>>>>> 2023-03-24 15:36 GMT+01:00, Miquel Raynal <miquel.raynal@bootlin.com>:
>>>>>>> Hi Álvaro,
>>>>>>>
>>>>>>> + YouChing and Jaime from Macronix
>>>>>>> TLDR for them: there is a misbehavior since Mason added block
>>>>>>> protection support. Just checking if the blocks are protected seems to
>>>>>>> misconfigure the chip entirely, see below. Any hints?
>>>>>>
>>>>>> Could it be that the NAND is stuck expecting a read 0x00 command which
>>>>>> isn’t sent after getting the features?
>>>>>>
>>>>>>>
>>>>>>> noltari@gmail.com wrote on Fri, 24 Mar 2023 15:15:47 +0100:
>>>>>>>
>>>>>>>> Hi Miquèl,
>>>>>>>>
>>>>>>>> 2023-03-24 14:45 GMT+01:00, Miquel Raynal <miquel.raynal@bootlin.com>:
>>>>>>>>> Hi Álvaro,
>>>>>>>>>
>>>>>>>>> noltari@gmail.com wrote on Fri, 24 Mar 2023 12:21:11 +0100:
>>>>>>>>>
>>>>>>>>>> El vie, 24 mar 2023 a las 11:49, Miquel Raynal
>>>>>>>>>> (<miquel.raynal@bootlin.com>) escribió:
>>>>>>>>>>>
>>>>>>>>>>> Hi Álvaro,
>>>>>>>>>>>
>>>>>>>>>>> noltari@gmail.com wrote on Fri, 24 Mar 2023 11:31:17 +0100:
>>>>>>>>>>>
>>>>>>>>>>>> Hi Miquèl,
>>>>>>>>>>>>
>>>>>>>>>>>> El vie, 24 mar 2023 a las 10:40, Miquel Raynal
>>>>>>>>>>>> (<miquel.raynal@bootlin.com>) escribió:
>>>>>>>>>>>>>
>>>>>>>>>>>>> Hi Álvaro,
>>>>>>>>>>>>>
>>>>>>>>>>>>> noltari@gmail.com wrote on Thu, 23 Mar 2023 13:45:09 +0100:
>>>>>>>>>>>>>
>>>>>>>>>>>>>> Add new "mxic,disable-block-protection" binding documentation.
>>>>>>>>>>>>>> This binding allows disabling block protection support for
>>>>>>>>>>>>>> those
>>>>>>>>>>>>>> devices not
>>>>>>>>>>>>>> supporting it.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>    Documentation/devicetree/bindings/mtd/nand-macronix.txt | 3
>>>>>>>>>>>>>> +++
>>>>>>>>>>>>>>    1 file changed, 3 insertions(+)
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> diff --git
>>>>>>>>>>>>>> a/Documentation/devicetree/bindings/mtd/nand-macronix.txt
>>>>>>>>>>>>>> b/Documentation/devicetree/bindings/mtd/nand-macronix.txt
>>>>>>>>>>>>>> index ffab28a2c4d1..03f65ca32cd3 100644
>>>>>>>>>>>>>> --- a/Documentation/devicetree/bindings/mtd/nand-macronix.txt
>>>>>>>>>>>>>> +++ b/Documentation/devicetree/bindings/mtd/nand-macronix.txt
>>>>>>>>>>>>>> @@ -16,6 +16,9 @@ in children nodes.
>>>>>>>>>>>>>>    Required NAND chip properties in children mode:
>>>>>>>>>>>>>>    - randomizer enable: should be "mxic,enable-randomizer-otp"
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> +Optional NAND chip properties in children mode:
>>>>>>>>>>>>>> +- block protection disable: should be
>>>>>>>>>>>>>> "mxic,disable-block-protection"
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>
>>>>>>>>>>>>> Besides the fact that nowadays we prefer to see binding
>>>>>>>>>>>>> conversions
>>>>>>>>>>>>> to
>>>>>>>>>>>>> yaml before adding anything, I don't think this will fly.
>>>>>>>>>>>>>
>>>>>>>>>>>>> I'm not sure exactly what "disable block protection" means, we
>>>>>>>>>>>>> already have similar properties like "lock" and
>>>>>>>>>>>>> "secure-regions",
>>>>>>>>>>>>> not
>>>>>>>>>>>>> sure they will fit but I think it's worth checking.
>>>>>>>>>>>>
>>>>>>>>>>>> As explained in 2/2, commit 03a539c7a118 introduced a regression
>>>>>>>>>>>> on
>>>>>>>>>>>> Sercomm H500-s (BCM63268) OpenWrt devices with Macronix
>>>>>>>>>>>> MX30LF1G18AC
>>>>>>>>>>>> which hangs the device.
>>>>>>>>>>>>
>>>>>>>>>>>> This is the log with block protection disabled:
>>>>>>>>>>>> [    0.495831] bcm6368_nand 10000200.nand: there is not valid maps
>>>>>>>>>>>> for
>>>>>>>>>>>> state default
>>>>>>>>>>>> [    0.504995] nand: device found, Manufacturer ID: 0xc2, Chip ID:
>>>>>>>>>>>> 0xf1
>>>>>>>>>>>> [    0.511526] nand: Macronix MX30LF1G18AC
>>>>>>>>>>>> [    0.515586] nand: 128 MiB, SLC, erase size: 128 KiB, page size:
>>>>>>>>>>>> 2048, OOB size: 64
>>>>>>>>>>>> [    0.523516] bcm6368_nand 10000200.nand: detected 128MiB total,
>>>>>>>>>>>> 128KiB blocks, 2KiB pages, 16B OOB, 8-bit, BCH-4
>>>>>>>>>>>> [    0.535912] Bad block table found at page 65472, version 0x01
>>>>>>>>>>>> [    0.544268] Bad block table found at page 65408, version 0x01
>>>>>>>>>>>> [    0.954329] 9 fixed-partitions partitions found on MTD device
>>>>>>>>>>>> brcmnand.0
>>>>>>>>>>>> ...
>>>>>>>>>>>>
>>>>>>>>>>>> This is the log with block protection enabled:
>>>>>>>>>>>> [    0.495095] bcm6368_nand 10000200.nand: there is not valid maps
>>>>>>>>>>>> for
>>>>>>>>>>>> state default
>>>>>>>>>>>> [    0.504249] nand: device found, Manufacturer ID: 0xc2, Chip ID:
>>>>>>>>>>>> 0xf1
>>>>>>>>>>>> [    0.510772] nand: Macronix MX30LF1G18AC
>>>>>>>>>>>> [    0.514874] nand: 128 MiB, SLC, erase size: 128 KiB, page size:
>>>>>>>>>>>> 2048, OOB size: 64
>>>>>>>>>>>> [    0.522780] bcm6368_nand 10000200.nand: detected 128MiB total,
>>>>>>>>>>>> 128KiB blocks, 2KiB pages, 16B OOB, 8-bit, BCH-4
>>>>>>>>>>>> [    0.539687] Bad block table not found for chip 0
>>>>>>>>>>>> [    0.550153] Bad block table not found for chip 0
>>>>>>>>>>>> [    0.555069] Scanning device for bad blocks
>>>>>>>>>>>> [    0.601213] CPU 1 Unable to handle kernel paging request at
>>>>>>>>>>>> virtual
>>>>>>>>>>>> address 10277f00, epc == 8039ce70, ra == 8016ad50
>>>>>>>>>>>> *** Device hangs ***
>>>>>>>>>>>>
>>>>>>>>>>>> Enabling macronix_nand_block_protection_support() makes the device
>>>>>>>>>>>> unable to detect the bad block table and hangs it when trying to
>>>>>>>>>>>> scan
>>>>>>>>>>>> for bad blocks.
>>>>>>>>>>>
>>>>>>>>>>> Please trace nand_macronix.c and look:
>>>>>>>>>>> - are the get_features and set_features really supported by the
>>>>>>>>>>>     controller driver?
>>>>>>>>>>
>>>>>>>>>> This is what I could find by debugging:
>>>>>>>>>> [    0.494993] bcm6368_nand 10000200.nand: there is not valid maps for
>>>>>>>>>> state default
>>>>>>>>>> [    0.505375] nand: device found, Manufacturer ID: 0xc2, Chip ID:
>>>>>>>>>> 0xf1
>>>>>>>>>> [    0.512077] nand: Macronix MX30LF1G18AC
>>>>>>>>>> [    0.515994] nand: 128 MiB, SLC, erase size: 128 KiB, page size:
>>>>>>>>>> 2048, OOB size: 64
>>>>>>>>>> [    0.523928] bcm6368_nand 10000200.nand: detected 128MiB total,
>>>>>>>>>> 128KiB blocks, 2KiB pages, 16B OOB, 8-bit, BCH-4
>>>>>>>>>> [    0.534415] bcm6368_nand 10000200.nand: ll_op cmd 0xa00ee
>>>>>>>>>> [    0.539988] bcm6368_nand 10000200.nand: ll_op cmd 0x600a0
>>>>>>>>>> [    0.545659] bcm6368_nand 10000200.nand: ll_op cmd 0x10000
>>>>>>>>>> [    0.551214] bcm6368_nand 10000200.nand: NAND_CMD_GET_FEATURES =
>>>>>>>>>> 0x00
>>>>>>>>>> [    0.557843] bcm6368_nand 10000200.nand: ll_op cmd 0x10000
>>>>>>>>>> [    0.563475] bcm6368_nand 10000200.nand: NAND_CMD_GET_FEATURES =
>>>>>>>>>> 0x00
>>>>>>>>>> [    0.569998] bcm6368_nand 10000200.nand: ll_op cmd 0x10000
>>>>>>>>>> [    0.575653] bcm6368_nand 10000200.nand: NAND_CMD_GET_FEATURES =
>>>>>>>>>> 0x00
>>>>>>>>>> [    0.582246] bcm6368_nand 10000200.nand: ll_op cmd 0x80010000
>>>>>>>>>> [    0.588067] bcm6368_nand 10000200.nand: NAND_CMD_GET_FEATURES =
>>>>>>>>>> 0x00
>>>>>>>>>> [    0.594657] nand: nand_get_features: addr=a0 subfeature_param=[00
>>>>>>>>>> 00 00 00] -> 0
>>>>>>>>>> [    0.602341] macronix_nand_block_protection_support:
>>>>>>>>>> ONFI_FEATURE_ADDR_MXIC_PROTECTION=0
>>>>>>>>>> [    0.610548] macronix_nand_block_protection_support: !=
>>>>>>>>>> MXIC_BLOCK_PROTECTION_ALL_LOCK
>>>>>>>>>> [    0.624760] Bad block table not found for chip 0
>>>>>>>>>> [    0.635542] Bad block table not found for chip 0
>>>>>>>>>> [    0.640270] Scanning device for bad blocks
>>>>>>>>>>
>>>>>>>>>> I don't know how to tell if get_features / set_features is really
>>>>>>>>>> supported...
>>>>>>>>>
>>>>>>>>> Looks like your driver does not support exec_op but the core provides a
>>>>>>>>> get/set_feature implementation.
>>>>>>>>
>>>>>>>> According to Florian, low level should be supported on brcmnand
>>>>>>>> controllers >= 4.0
>>>>>>>> Also:
>>>>>>>> https://github.com/nomis/bcm963xx_4.12L.06B_consumer/blob/e2f23ddbb20bf75689372b6e6a5a0dc613f6e313/shared/opensource/include/bcm963xx/63268_map_part.h#L1597
>>>>>>>
>>>>>>> Just to be sure, you're using a mainline controller driver, not this
>>>>>>> one?
>>>>>>
>>>>>> Yes, this was just to prove that the HW I’m using has get/set features support.
>>>>>> I’m using OpenWrt, so it’s linux v5.15 driver.
>>>>>>
>>>>>>>
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>> - what is the state of the locking configuration in the chip when
>>>>>>>>>>> you
>>>>>>>>>>>     boot?
>>>>>>>>>>
>>>>>>>>>> Unlocked, I guess...
>>>>>>>>>> How can I check that?
>>>>>>>>>
>>>>>>>>> It's in your dump, the chip returns 0, meaning it's all unlocked,
>>>>>>>>> apparently.
>>>>>>>>
>>>>>>>> Well, I can read/write the device if block protection isn’t disabled,
>>>>>>>> so I guess we can confirm it’s unlocked…
>>>>>>>>
>>>>>>>>>
>>>>>>>>>>> - is there anything that locks the device by calling mxic_nand_lock()
>>>>>>>>>>> ?
>>>>>>>>>
>>>>>>>>> So nobody locks the device I guess? Did you add traces there?
>>>>>>>>
>>>>>>>> It doesn’t get to the point that it enabled the lock/unlock functions
>>>>>>>> since it fails when checking if feature is 0x38, so there’s no point
>>>>>>>> in adding those traces…
>>>>>>>
>>>>>>> Right, it returns before setting these I guess.
>>>>>>>
>>>>>>>>
>>>>>>>>>
>>>>>>>>>>> - finding no bbt is one thing, hanging is another, where is it
>>>>>>>>>>> hanging
>>>>>>>>>>>     exactly? (offset in nand/ and line in the code)
>>>>>>>>>>
>>>>>>>>>> I've got no idea...
>>>>>>>>>
>>>>>>>>> You can use ftrace or just add printks a bit everywhere and try to get
>>>>>>>>> closer and closer.
>>>>>>>>
>>>>>>>> I think that after trying to get the feature it just start reading
>>>>>>>> nonsense from the NAND and at some point it hangs due to that garbage…
>>>>>>>
>>>>>>> It should refuse to mount the device somehow, but in no case the kernel
>>>>>>> should hang.
>>>>>>
>>>>>> Yes, I think that this is a side effect (maybe a different bug somewhere else).
>>>>>>
>>>>>>>
>>>>>>>> Is it posible that the NAND starts behaving like this after getting
>>>>>>>> the feature due to some specific config of my device?
>>>>>>>>
>>>>>>>>>
>>>>>>>>> I looked at the patch, I don't see anything strange. Besides, I have a
>>>>>>>>> close enough datasheet and I don't see what could confuse the device.
>>>>>>>>>
>>>>>>>>> Are you really sure this patch is the problem? Is the WP pin wired on
>>>>>>>>> your design?
>>>>>>>>
>>>>>>>> There’s no WP pin in brcmnand controllers < 7.0
>>>>>>>
>>>>>>> What about the chip?
>>>>>>
>>>>>> Maybe it has a GPIO controlling that, but I don’t have that info…
>>>>>>
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Miquèl
>>>>>>>
>>
>> --
>> Florian
>>

--0000000000009f682c05fbdcfb8c
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
YDZuuBJwnyCzevMoPtVYPharioL5H3BRnQi8YoTXH7/uRo33dewYFm474yFjwwnt82TFtveVZkVq
6h4WIQ4wTcwFfET8zMkELnGzS5SHCl8sPD+lNxxJ1JDZYwIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRp3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUq65GzwZxydFHjjYEU/9h
xHhPWlwwDQYJKoZIhvcNAQELBQADggEBAA2hGG3JPAdGPH0ZdohGUCIVjKz+U+EFuIDbS6A/5jqX
VhYAxZlzj7tSjUIM7G7IhyfqPC46GKJ/4x+Amz1Z6YxNGy71L68kYD6hIbBcA5AM42QBUufly6Oa
/ppSz3WoflVyFFQ5YXniZ+eU+2/cdnYZg4aVUnFjimOF5o3NfMLzOkhQNxbaDjFUfUYD8hKmU6v4
0vUBj8KZ9Gi1LIagLKUREn8jku0lcLsRbnJ5Ey5ScajC/FESPyYWasOW8j8/1EoJksmhbYGKNS6C
urb/KlmDGfVrIRYDbL0ckhGQIP5c6L+kSQZ2sHnQK0e0WgIaZYxaPYeY5u0GLCOze+3vyRMxggJt
MIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwxuh2XG3FXRL1W
JOEwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEICFOE6H8IIy5CdRmeaC9BWt5Jx1q
RNivNjyVygCeDswIMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIz
MDUxNzA1MzAxNlowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQC5icoURN3fdSIm7x3j+cHUVH+TJH+K9TWR8+WLwXMlifvc
v2Ni0UO26D15eIuL75IIHVnjeYhFpGDEIRz7YAtVUszXFJOfYXyERfIOwm8X0WSqcCBFKwBy++X7
dzqp4mfqk93FAVcl6SleoNJ7r2BZ/Fdr02F0wSUZol7y/idP9r97y9isWK2QsFeKtwO9ya/Dxppp
7mInjnpNlVyZadIDeFfMwVJ4W/GPLo7cvEa3gvIRYTG8XpdOJv2Pl8jEiCjo20gxzFhUQz/swiMs
qW95gOnVsvRG9wujP11xchVY17RL5jEtyOPyKpan6WoAqwu7pmPZpXd7gd92iEYvvnP/
--0000000000009f682c05fbdcfb8c--


--===============2483241044427815594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2483241044427815594==--

