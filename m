Return-Path: <SRS0=R+0z=OL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C3AC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Sep 2021 12:43:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBBBD61166
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Sep 2021 12:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EBBBD61166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GjxzCSULBNWYxu4xg3Bie/GPweT1R38oGGukA3CC4II=; b=op9XhY6mbLn85j
	4/tWj/X3RGe/YTkCQPWVEDWxcaUbLjtONSebCa5nXQma6wEUSbU/oCoeHVh6Z/1G+7Mv4gFJqz3aO
	hAD6/s+heQRRH4l3uFlX0NstJ9kpMio+mdZTGKvwE/8wQhldrgHR9zBUiYhe0jp9B4DrOqzsWIBio
	YLOiRwO9sPypg82zN4oe6bjbRlaLMeua6PCebMhrT3z9YAFwGCdmdPPlyT+NuKehUDsKnvpTr4JkN
	UYSJcFQL4qo2xify9OTDbYWLpIS6SiGXTHpXOMlHKTV2+4mrsvOEruubsWoqb9iNUU/vSn7S2le0O
	ShM3UG9puRyZyKT6+HFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSf6w-004Tev-CE; Tue, 21 Sep 2021 12:42:58 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSf6t-004Tdk-6E
 for linux-mtd@lists.infradead.org; Tue, 21 Sep 2021 12:42:56 +0000
Received: by mail-ed1-x52f.google.com with SMTP id dj4so18075615edb.5
 for <linux-mtd@lists.infradead.org>; Tue, 21 Sep 2021 05:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=qg9juCtwPdm8hNr/ziO5Q6G8qEx/N2FkjSeG7N07HEE=;
 b=OrVK4+FHOVfeJQ/G8Q7intKFsnkTfznZyPIaW+NGSBrGTd6RzEYwjegV3QTM0G8uc1
 5B/tkUZCb/aXARfhBSKp+4soXlkwWgPvEIkBbtXT02iX0wED2nojVgtu7+tdvwtKKoLx
 2AfEy/O/OeooGP4HSI/tiJgUSscznslgteQgeG7nLdNa0wtaXA/eLO4kwFt1WoH/n5Gh
 y5vnO5FlyXRuoK8frHLT4V8GolTwS9CKF2DIgLEP8viNSweSlPXXZR/tWQw+tahzP5SP
 RwgN8D3YPBt3F/O8m9byH3DjWUeZps8QjziF0ER18eN0hEGmWLYl37eVd2A3jppIMihP
 hNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=qg9juCtwPdm8hNr/ziO5Q6G8qEx/N2FkjSeG7N07HEE=;
 b=Y7sx2lJ3gKzQjbV6Fqc045D7bEMKcYkNwjl5Lhi+ydzlmDd4di2/Vk1faWApFPi4H2
 SD/nl/TgAn2FzfxFiAGPA1pLcHH8lqptbQa1H9Y74Q1iEhJGVNuTFkPFvUk5bHHU0lk+
 KXxP0UHqz7UPXQtaOxfiQm27DyCc6u0ceuz2ptGZXsHlmJ+ad/LEtYUHwOosO7x8Kgas
 EMhTVjXn6NrQWi0OWHQoNiLnsXox8HfQ/4/zoRuDAGUlE7WGmP6a1VbmDaDdylnD6Lhz
 fop8KIp9yKh6PIOpyz35Noxcndngj8LTYC8Vj99XHmshUZs38jreKM9MHLu/wWaFcSTR
 7mdw==
X-Gm-Message-State: AOAM530z2KiohbVyIPx5cPTwyxCoFl3H5wiBisjiTK7qErx+pj+HeFGK
 Ilj+GnPKpb7YnMoq9Eq29XsJIjyTgyXaT7yB4n0z2w==
X-Google-Smtp-Source: ABdhPJzGrrXELTIS6x9roDZ3vgfIBDbirrXLG8+eb/FqBwMWWN9oX3DRt0UM/l6ywrLc6d43CbIsIqOqZtf9OfnkeZo=
X-Received: by 2002:a17:906:8286:: with SMTP id
 h6mr28764430ejx.383.1632228160391; 
 Tue, 21 Sep 2021 05:42:40 -0700 (PDT)
MIME-Version: 1.0
From: Anders Roxell <anders.roxell@linaro.org>
Date: Tue, 21 Sep 2021 14:42:29 +0200
Message-ID: <CADYN=9Kjw_3cDGAvh9=+nNwdYof1kUPKG-SUOP5FsQhZ+gz62Q@mail.gmail.com>
Subject: physmap warning on next-20210921
To: Miquel Raynal <miquel.raynal@bootlin.com>, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_054255_285471_9ACFDE0B 
X-CRM114-Status: GOOD (  10.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

When I'm building an allmodconfig kernel (arm64) with
KCONFIG_ALLCONFIG=arch/arm64/configs/defconfig all the bootselftests
turned off also.
I see the following warning.

[   51.296773][    T1] physmap-flash 0.flash: physmap platform flash
device: [mem 0x00000000-0x03ffffff]
[   51.312682][    T1] 0.flash: Found 2 x16 devices at 0x0 in 32-bit
bank. Manufacturer ID 0x000000 Chip ID 0x000000
[   51.319200][    T1] Intel/Sharp Extended Query Table at 0x0031
[   51.325766][    T1] Using buffer write method
[   51.669918][    T1] physmap-flash 0.flash: physmap platform flash
device: [mem 0x04000000-0x07ffffff]
[   51.685287][    T1] 0.flash: Found 2 x16 devices at 0x0 in 32-bit
bank. Manufacturer ID 0x000000 Chip ID 0x000000
[   51.691522][    T1] Intel/Sharp Extended Query Table at 0x0031
[   51.697787][    T1] Using buffer write method
[   51.700958][    T1] Concatenating MTD devices:
[   51.703307][    T1] (0): "0.flash"
[   51.704752][    T1] (1): "0.flash"
[   51.706205][    T1] into device "0.flash"
[   51.946281][    T9] _warn_unseeded_randomness: 3 callbacks suppressed
[   51.946331][    T9] random: get_random_u64 called from
dup_task_struct+0x184/0x340 with crng_init=0
[   51.980825][  T114] kworker/u2:1 (114) used greatest stack depth:
26576 bytes left
[   52.087262][    T1] platform physmap-flash.0: failed to claim
resource 0: [mem 0x08000000-0x07ffffff]
[   52.092697][    T1] Deleting MTD partitions on "0.flash":
[   52.111033][    T1] random: get_random_u32 called from
kobject_release+0x44/0x180 with crng_init=0
[   52.111193][    T1] kobject: 'integrity' (ffff00001019f198):
kobject_release, parent 0000000000000000 (delayed 500)
[   52.151410][    T1] kobject: '31:0' (ffff00000f14b800):
kobject_release, parent 0000000000000000 (delayed 250)
[   52.197408][    T1] kobject: 'holders' (ffff00000f0fc500):
kobject_release, parent ffff00000be10f90 (delayed 750)
[   52.202305][    T1] kobject: 'slaves' (ffff00000f0fd900):
kobject_release, parent ffff00000be10f90 (delayed 750)
[   52.240140][    T1] random: get_random_u32 called from
shuffle_freelist+0x44/0x1c0 with crng_init=0
[   52.476276][    T1] kobject: 'mtd0' (ffff00000f14d008):
kobject_release, parent 0000000000000000 (delayed 1000)
[   52.510094][    T1] kobject: 'mtd0' (ffff00000f1411a0):
kobject_release, parent 0000000000000000 (delayed 500)
[   52.515268][    T1] ------------[ cut here ]------------
[   52.517264][    T1] ODEBUG: free active (active state 0) object
type: timer_list hint: delayed_work_timer_fn+0x0/0x80
[   52.522813][    T1] WARNING: CPU: 0 PID: 1 at
lib/debugobjects.c:505 debug_print_object+0xe8/0x140
[   52.526642][    T1] Modules linked in:
[   52.528416][    T1] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G
        T 5.15.0-rc2-next-20210921 #1
c5f525bba77d859d4ce569d244b0730e944cd9ea
[   52.533761][    T1] Hardware name: linux,dummy-virt (DT)
[   52.536052][    T1] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT
-SSBS BTYPE=--)
[   52.539277][    T1] pc : debug_print_object+0xe8/0x140
[   52.541579][    T1] lr : debug_print_object+0xe8/0x140
[   52.543830][    T1] sp : ffff800016327930
[   52.545641][    T1] x29: ffff800016327930 x28: ffff80001620dc48
x27: 0000000000000000
[   52.549114][    T1] x26: ffff8000102748c0 x25: ffff80001013f780
x24: ffff800011fdc200
[   52.552577][    T1] x23: ffff80001223e740 x22: ffff80001223e1c0
x21: ffff80001223d960
[   52.556073][    T1] x20: ffff80001397ee60 x19: 0000000000000000
x18: 0000000000000000
[   52.559538][    T1] x17: 0000000000000000 x16: 0000000000000000
x15: 6570797420746365
[   52.563021][    T1] x14: 6a626f2029302065 x13: 0000000000041c40
x12: 0000000000041bd8
[   52.566491][    T1] x11: 0000000000000000 x10: 0000000000000000 x9
: 0000000000000000
[   52.569961][    T1] x8 : 0000000000000000 x7 : 0000000000000000 x6
: 0000000000000000
[   52.573445][    T1] x5 : 0000000000000000 x4 : 0000000000000000 x3
: 0000000000000000
[   52.576912][    T1] x2 : 0000000000000000 x1 : 0000000000000000 x0
: 0000000000000000
[   52.580369][    T1] Call trace:
[   52.581845][    T1]  debug_print_object+0xe8/0x140
[   52.583979][    T1]  __debug_check_no_obj_freed+0x11c/0x2c0
[   52.586437][    T1]  debug_check_no_obj_freed+0x30/0xc0
[   52.588729][    T1]  slab_free_freelist_hook+0x154/0x2c0
[   52.591078][    T1]  kfree+0x14c/0x2c0
[   52.592819][    T1]  mtd_concat_destroy+0x3c/0x80
[   52.594918][    T1]  physmap_flash_remove+0x88/0x180
[   52.597134][    T1]  platform_remove+0x3c/0x80
[   52.599129][    T1]  __device_release_driver+0x1d4/0x340
[   52.601471][    T1]  driver_detach+0x130/0x200
[   52.603457][    T1]  bus_remove_driver+0xf4/0x180
[   52.605550][    T1]  driver_unregister+0x58/0x80
[   52.607599][    T1]  platform_driver_unregister+0x1c/0x40
[   52.609969][    T1]  physmap_init+0xb8/0xf0
[   52.611863][    T1]  do_one_initcall+0xa4/0x2c0
[   52.613893][    T1]  do_initcalls+0x174/0x23c
[   52.615854][    T1]  kernel_init_freeable+0x2cc/0x370
[   52.618094][    T1]  kernel_init+0x24/0x180
[   52.620005][    T1]  ret_from_fork+0x10/0x20
[   52.621948][    T1] irq event stamp: 687638
[   52.623797][    T1] hardirqs last  enabled at (687637):
[<ffff800010208d60>] __up_console_sem+0x60/0xc0
[   52.627698][    T1] hardirqs last disabled at (687638):
[<ffff800011ef5b28>] el1_dbg+0x28/0x80
[   52.631304][    T1] softirqs last  enabled at (687634):
[<ffff800010010518>] __do_softirq+0x418/0x4f8
[   52.635126][    T1] softirqs last disabled at (687627):
[<ffff8000101079f8>] __irq_exit_rcu+0x1b8/0x280
[   52.639116][    T1] ---[ end trace 5aee148b589c1673 ]---
[   53.261155][   T13] _warn_unseeded_randomness: 2 callbacks suppressed
[   53.261201][   T13] random: get_random_u32 called from
shuffle_freelist+0x44/0x1c0 with crng_init=0
[   54.367115][    T1] random: get_random_u32 called from
kobject_release+0x44/0x180 with crng_init=0
[   54.367240][    T1] kobject: 'physmap-flash' (ffff00000efe3200):
kobject_release, parent ffff000008171a00 (delayed 750)
[   54.377889][    T1] random: get_random_u32 called from
shuffle_freelist+0x44/0x1c0 with crng_init=0


This is my qemu cmd line:
qemu-system-aarch64 --enable-kvm -cpu cortex-a53 -kernel
Image-20210921-3.gz -serial stdio -monitor none -nographic -m 2G -M
virt -fsdev local,id=root,path=/srv/kvm/tmp/stretch/arm64,security_model=none,writeout=immediate
-device virtio-rng-pci -device
virtio-9p-pci,fsdev=root,mount_tag=/dev/root -append "root=/dev/root
rootfstype=9p rootflags=trans=virtio console=ttyAMA0,38400n8
earlycon=pl011,0x9000000 initcall_debug softlockup_panic=0
security=none kpti=no"

I did not expect the physmp-flash device to be used at all.
Does anyone see what might be wrong here ?

Cheers,
Anders

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
