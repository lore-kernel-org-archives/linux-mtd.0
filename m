Return-Path: <SRS0=KyYR=PJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAAE5C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 12:21:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 904516124D
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 12:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 904516124D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QGWS/MlwNhfuDZYZM0m9ef0DxmGVO9El32TXn/+nDC4=; b=g66hv8EmOwxIZT
	qDWvVp9shwh/RhIUOj95CVtEIadORATpBwKyDv0raBeW2u47jVZUpT112KYDoqLpjBtnbekOLwkQY
	sS46eUnlZpfxbTcYBgscjsIunWlGV1yWYoC5MuPmlazxny40dXsrDU9Hx3E2EtXhDJaQgexV6gwxZ
	bTNWKxVoqKxqzmYpiIJ0Ne1WzSRakg7Oq9I4IdP3oOmnJAZq9JTK4LRuDUYTDfz5X0RfXosBS15pW
	KjmVSOZDFkAUt9zCWoph45KClTHbzlQTvRNsVQ1dspnF6n0bKL7EbUHRPrM+f/SEksI1XEuR5cHgu
	5cZBXb4mPYs4tWhtCddg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdX4A-007SC5-FU; Thu, 21 Oct 2021 12:21:02 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdX47-007SAu-JW
 for linux-mtd@lists.infradead.org; Thu, 21 Oct 2021 12:21:01 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N7hrw-1miZBa3gYc-014j3a for <linux-mtd@lists.infradead.org>; Thu, 21 Oct
 2021 14:20:56 +0200
Received: by mail-wr1-f46.google.com with SMTP id y3so849159wrl.1
 for <linux-mtd@lists.infradead.org>; Thu, 21 Oct 2021 05:20:56 -0700 (PDT)
X-Gm-Message-State: AOAM532Po7ViKX0RCS5E+4m5iXZ1+Bxrs+SkOvy5N8i+p32xbbFcL60e
 S+dEaG/kREubSNW1IavoBQdAPtON7YHnemisHeg=
X-Google-Smtp-Source: ABdhPJwJOYZEntHVSFnBcY3kJm3ICu3lH/OpB0pul2wHC3aZtyh/WLsgKixyQ1gvT07T8Fw6b7nCs2vLRylHfqhAxF8=
X-Received: by 2002:adf:ab46:: with SMTP id r6mr6927135wrc.71.1634818856286;
 Thu, 21 Oct 2021 05:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvv6YsRM2Qf7AGMo3nwqkuAt_D1i+6H_ApHk3kmScyDyg@mail.gmail.com>
In-Reply-To: <CA+G9fYvv6YsRM2Qf7AGMo3nwqkuAt_D1i+6H_ApHk3kmScyDyg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Oct 2021 14:20:40 +0200
X-Gmail-Original-Message-ID: <CAK8P3a21U0jzMOUWp1rhrNrD3szxxrwo59SBYG89xpYJGXteRA@mail.gmail.com>
Message-ID: <CAK8P3a21U0jzMOUWp1rhrNrD3szxxrwo59SBYG89xpYJGXteRA@mail.gmail.com>
Subject: Re: BUG: KASAN: use-after-free in blk_mq_sched_tags_teardown
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: linux-block <linux-block@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, 
 linux-scsi <linux-scsi@vger.kernel.org>,
 Kashyap Desai <kashyap.desai@broadcom.com>, 
 Hannes Reinecke <hare@suse.de>, Ming Lei <ming.lei@redhat.com>,
 John Garry <john.garry@huawei.com>, 
 Arnd Bergmann <arnd@arndb.de>, lkft-triage@lists.linaro.org, 
 Anders Roxell <anders.roxell@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh R <vigneshr@ti.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>
X-Provags-ID: V03:K1:imX743fKHTbreba1Y4PvGkJN1DZLDFq4x69R1cJ8WCzsodztSKA
 ZS6FB0dCLDJSKfyM4nGTT4C+imq8wtN3s/dIA6fPqz5qxZrVYZG50xsfmL0q9/ZkVuK3NJ8
 BRZyma2tTaE/7DrW0+uPLx+JZfmzdjFqIIZTMhDO1uL8di5OoqRDeHLwN8dTpi+YLQe8Hbn
 HK5+hQKgha3/K58EQqkbg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gs+W61vorPI=:7njgHTqDw4PUEGg3j3fnAk
 pssJ5nk7mL2BFKaMfWRHwcs6DD24/sze58/4R/Wy6KLMng5/6MHbVeqiQQUwyX1PA8TVtyt+p
 yu1AfRZASBKBwq45HI3KYB2kw//wtqMp6S0iDeJZ06gZpx9sizf8nXcOTTLtjlRo0XU6ymNXJ
 qNfaLkjdFzU6ZLqjawMkjXTh+AaeRaitX5CtV6LxXs+X+ZHKoUumTm8lSffOT3yi5bSbH3sXn
 wTkpOLV5SKtoBGAvhtY9AAU/aZvcZLWicUqU09SmJPvmdQqo1AoLB1GEI4Kq5qGl7xALzHfJj
 bDwrqT+V+UfklwSlcI8O3gpqd/SJTNgbr9a+sy11HxInX2JiswesB0z582b/cw/q8UDQVSV8w
 oZNj9QCsabTrtPo3Cl0v7vuGx0tS0xs/kesFg1RKuYUpfwiwlW1Tu90nWBq1qgsIhAHVOAtvn
 X0JasswN2zbL+5SYnhUrYMNjlHJ7gs9yMm/7v+CnzS2Kjapi5KRXUi7zGrfpd0A3rzfPhUQHu
 RsGvf9muAHDZVXt/9vQvzQBzGzPWm03hmONkFJi1RYJVd79+KSh2bZawfmA9HCZ3vxJnp4vIP
 3J8q6TH4wgr/Va0nEsTTKA2iLAayKjo/jzK2E7FmF0rdO5TYxHq4OeRZTgRyVhcJ+DN/rfJDX
 e1nNO+u/AhZiR1hPFxqTezAbpDp1cQUNBl56sCjNYHUy7z96mHBHGx8P+t/2XL0KVw+w/6pL4
 kZvrIXUBiE1StuzhRkLratgb+vGQhlOLjcmU5FwEfvpb5jIn9+U1ttyL+QfeYVk5P0wB1S4cB
 XQ+Wzl4O5UYOCdcBvufChe7wXtH2PX9+sHH/OhH0wtRMD+6lGo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_052059_966603_32077B4E 
X-CRM114-Status: GOOD (  13.13  )
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

On Thu, Oct 21, 2021 at 2:01 PM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> Following KASAN BUG noticed on linux next 20211021 while booting qemu-arm64
> with allmodconfig.

> [   77.730367][    T5] Freed by task 1:
> [   77.732009][    T5]  kasan_save_stack+0x30/0x80
> [   77.734083][    T5]  kasan_set_track+0x30/0x80
> [   77.736085][    T5]  kasan_set_free_info+0x34/0x80
> [   77.738261][    T5]  ____kasan_slab_free+0xfc/0x1c0
> [   77.740433][    T5]  __kasan_slab_free+0x3c/0x80
> [   77.742518][    T5]  slab_free_freelist_hook+0x1d4/0x2c0
> [   77.744892][    T5]  kfree+0x160/0x300
> [   77.746618][    T5]  blktrans_dev_release+0x64/0x100
> [   77.748821][    T5]  del_mtd_blktrans_dev+0x1c0/0x240
> [   77.751079][    T5]  mtdblock_remove_dev+0x28/0x80
> [   77.753246][    T5]  blktrans_notify_remove+0xa4/0x140
> [   77.755507][    T5]  del_mtd_device+0x84/0x1c0
> [   77.757541][    T5]  mtd_device_unregister+0x90/0xc0
> [   77.759764][    T5]  physmap_flash_remove+0x58/0x180
> [   77.762012][    T5]  platform_remove+0x48/0xc0
> [   77.764032][    T5]  __device_release_driver+0x1dc/0x340
> [   77.766393][    T5]  driver_detach+0x138/0x200
> [   77.768396][    T5]  bus_remove_driver+0x100/0x180
> [   77.770554][    T5]  driver_unregister+0x64/0xc0
> [   77.772633][    T5]  platform_driver_unregister+0x28/0x80
> [   77.775042][    T5]  physmap_init+0xc4/0xfc
> [   77.776994][    T5]  do_one_initcall+0xb0/0x2c0
> [   77.779028][    T5]  do_initcalls+0x17c/0x244
> [   77.781023][    T5]  kernel_init_freeable+0x2d4/0x378
> [   77.783269][    T5]  kernel_init+0x34/0x180
> [   77.785196][    T5]  ret_from_fork+0x10/0x20
> [   77.787135][    T5]
> ...
> full boot log link,
> https://pastebin.com/xL5MYSD6

I think this is related to an earlier bug that Anders reported a while ago,
see [1]. I had looked at it originally, and found that this probably a
device that gets probed from CONFIG_MTD_PHYSMAP_COMPAT
and then freed again immediately after we find the device does not
exist, starting with commit dcb3e137ce9b ("[MTD] physmap: make
physmap compat explicit").

It's not really the fault of CONFIG_MTD_PHYSMAP_COMPAT
describing a nonexisting device, but instead it's something in the
cleanup path.

        Arnd

[1] https://lore.kernel.org/linux-mtd/CADYN=9Kjw_3cDGAvh9=+nNwdYof1kUPKG-SUOP5FsQhZ+gz62Q@mail.gmail.com/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
