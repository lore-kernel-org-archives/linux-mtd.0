Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 449BFC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 03:33:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1544D20830
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 03:33:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="os35T3Sy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1544D20830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D3kpCsHqwfiAwyEkFFgYvoYicGcTiw9J0Yry2bEP0nQ=; b=os35T3SyWXpgSa0ummvdOmtqf
	m1E43pgnxTSs4CZQNq9lrBjrIhyxrHoGFzdTJPiNMxmZj7sz5rP9zaKKKz+0FpVs8EcyUjGL4pDVZ
	mMKoRMf+2BlWHoC96yB8syR1gpWQXCqJS3edREwqUDx24SVUWJC1iT8NEiBFTRwLIZgpZel3t3dtW
	HoSY6Ud73kHAEg3pmoDn9Lt2zENPHXabr6tspCOTUMN/w1zWTWN9jrgNbTe9XMjN+uzkhQeP0uM+v
	3s5DylbJN0/vFKgwGLua4tCM4bKK4NydgrZ5bpleRDBEE2Wfa5uNLUJs3bCXD8UcmEpdOM6JXiN1E
	tCV9z5Ofw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6RyR-0000ia-B8; Wed, 20 Mar 2019 03:33:03 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6RyG-0000Xp-8j; Wed, 20 Mar 2019 03:32:54 +0000
Received: from [10.28.18.125] (10.28.18.125) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 20 Mar
 2019 11:33:53 +0800
Subject: Re: [RFC PATCH nand-next 0/2] meson-nand: support for older SoCs
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20190301182922.8309-1-martin.blumenstingl@googlemail.com>
 <98776767-c4d7-1207-6d42-97105f289bec@amlogic.com>
 <CAFBinCC7P40sqrDGTuM8M=jVOFTgZLDUK6rGdNpigFoepyCASw@mail.gmail.com>
 <20190307140959.10092d45@xps13>
 <ccb95e75-e62f-c510-cabd-853481f77fc8@amlogic.com>
 <CAFBinCBd=dOZjv4KEDY9ODOONDO=WtaBqAMRi_a+gH3_iZEAHQ@mail.gmail.com>
 <CAFBinCA7LLK6K3ZqauJy2N-z5-kTfuTztmoSQ=Bk4A5Xagxddw@mail.gmail.com>
From: Liang Yang <liang.yang@amlogic.com>
Message-ID: <8134890a-457d-7803-01a4-1832f925f65f@amlogic.com>
Date: Wed, 20 Mar 2019 11:33:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101
 Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <CAFBinCA7LLK6K3ZqauJy2N-z5-kTfuTztmoSQ=Bk4A5Xagxddw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.28.18.125]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_203252_312521_57368AA7 
X-CRM114-Status: GOOD (  19.89  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jianxin.pan@amlogic.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Martin,

Thanks for your time.
On 2019/3/20 4:27, Martin Blumenstingl wrote:
> Hello Liang,
> 
> On Sat, Mar 16, 2019 at 11:55 AM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> [...]
>>> Martin, Now i am not sure whether NFC driver leads to kernel panic when
>>> calling kmem_cache_alloc_trace.
>> thank you for confirming that it works for you on GXL
>>
>> I'm not sure that this is a NFC driver problem.
>> after enabling CONFIG_SLAB_FREELIST_HARDENED in my kernel config the
>> crash moves. it's now crashing in slub.c's kfree() at
>> BUG_ON(!PageCompound(page));
> I added some debug prints in meson_nfc_read_buf() to get some details
> about the info buffer before the crash,
> format is: meson_nfc_read_buf <virtual address> <physical address>
> 
> during my first test three different addresses are used:
> - meson_nfc_read_buf e9e6c640 0x29e6c640 (works fine)
> - meson_nfc_read_buf e9e6c680 0x29e6c680 (works fine)
> - meson_nfc_read_buf ee39a34b 0x2e39a34b (crashes during kfree)
> 
> so I tried playing around with the allocation size (see the attached
> patch) and changed it to:
>    kzalloc(PER_INFO_BYTE + 64, GFP_KERNEL)
> this results in the following addresses being used:
> - meson_nfc_read_buf e9ea4280 0x29ea4280 (works fine)
> - meson_nfc_read_buf e9ea4300 0x29ea4300 (works fine)
> (there is no crash anymore)
> 
> Liang, are there any special requirements on the "info address" like
> the alignment?
It must be 4 bytes alignment. i have met it previously when debugging 
NFC driver on AXG platform, but it is not specified on spec. Now i am 
confused that how to get the no aligned address "xe39a34b" when using 
kmalloc; i think it should return the aligned address. doesn't it?

> also do you know why the PER_INFO_BYTE buffer is allocated dynamically
> in meson_nfc_read_buf() instead of allocating it at initialization?
> I'm not saying that it should be changed! I'm curious because there's
> per-meson_nfc_nand_chip info and data buffers which are allocated at
> initialization time.
> NAND scan or initialization is divided into three stages: 
nand_scan_ident->nand_attach->nand_scan_tail. info and data buffer which 
depend on the result of nand_scan_ident are allocated on nand_attach; so 
nand_scan_ident can not use the info buffer on meson_nfc_nand_chip.
Allocating a fixed size info buffer before nand_scan_ident and attach it 
on the struct meson_nfc; Or considering not use dma for reading data 
less than 8 bytes. Both can reduce kmalloc and kfree calling. Thanks.
> 
> meson_nfc_read_buf debug log with PER_INFO_BYTE allocation:
> [    2.032914] meson_nfc_read_buf e9e6c640 0x29e6c640
> [    2.033005] meson_nfc_dma_buffer_setup 0x29e6c640
> [    2.037717] meson_nfc_read_buf: about to kfree info
> [    2.042535] meson_nfc_read_buf: kfree'd info
> [    2.046794] meson_nfc_read_buf e9e6c640 0x29e6c640
> [    2.051552] meson_nfc_dma_buffer_setup 0x29e6c640
> [    2.056261] meson_nfc_read_buf: about to kfree info
> [    2.061086] meson_nfc_read_buf: kfree'd info
> [    2.065356] meson_nfc_read_buf e9e6c680 0x29e6c680
> [    2.070102] meson_nfc_dma_buffer_setup 0x29e6c680
> [    2.074810] meson_nfc_read_buf: about to kfree info
> [    2.079635] meson_nfc_read_buf: kfree'd info
> [    2.083978] meson_nfc_read_buf e9e6c640 0x29e6c640
> [    2.088684] meson_nfc_dma_buffer_setup 0x29e6c640
> [    2.093334] meson_nfc_read_buf: about to kfree info
> [    2.098199] meson_nfc_read_buf: kfree'd info
> [    2.102446] meson_nfc_read_buf e9e6c640 0x29e6c640
> [    2.107208] meson_nfc_dma_buffer_setup 0x29e6c640
> [    2.111883] meson_nfc_read_buf: about to kfree info
> [    2.116765] meson_nfc_read_buf: kfree'd info
> [    2.120996] meson_nfc_read_buf e9e6c640 0x29e6c640
> [    2.125762] meson_nfc_dma_buffer_setup 0x29e6c640
> [    2.130433] meson_nfc_read_buf: about to kfree info
> [    2.135294] meson_nfc_read_buf: kfree'd info
> [    2.139545] Could not find a valid ONFI parameter page, trying
> bit-wise majority to recover it
> [    2.148173] ONFI parameter recovery failed, aborting
> [    2.153058] meson_nfc_read_buf e9e6c680 0x29e6c680
> [    2.157831] meson_nfc_dma_buffer_setup 0x29e6c680
> [    2.162527] meson_nfc_read_buf: about to kfree info
> [    2.167369] meson_nfc_read_buf: kfree'd info
> [    2.171611] meson_nfc_read_buf ee39a34b 0x2e39a34b
> [    2.176383] meson_nfc_dma_buffer_setup 0x2e39a34b
> [    2.181076] meson_nfc_read_buf: about to kfree info
> [    2.185932] ------------[ cut here ]------------
> [    2.190503] kernel BUG at mm/slub.c:3950!
> [    2.194491] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
> ...
> 
> meson_nfc_read_buf debug log with PER_INFO_BYTE+64 allocation:
> [    2.033019] meson_nfc_read_buf e9ea4280 0x29ea4280
> [    2.033112] meson_nfc_dma_buffer_setup 0x29ea4280
> [    2.037847] meson_nfc_read_buf: about to kfree info
> [    2.042642] meson_nfc_read_buf: kfree'd info
> [    2.046909] meson_nfc_read_buf e9ea4280 0x29ea4280
> [    2.051659] meson_nfc_dma_buffer_setup 0x29ea4280
> [    2.056374] meson_nfc_read_buf: about to kfree info
> [    2.061192] meson_nfc_read_buf: kfree'd info
> [    2.065461] meson_nfc_read_buf e9ea4280 0x29ea4280
> [    2.070208] meson_nfc_dma_buffer_setup 0x29ea4280
> [    2.074922] meson_nfc_read_buf: about to kfree info
> [    2.079742] meson_nfc_read_buf: kfree'd info
> [    2.084087] meson_nfc_read_buf e9ea4280 0x29ea4280
> [    2.088789] meson_nfc_dma_buffer_setup 0x29ea4280
> [    2.093440] meson_nfc_read_buf: about to kfree info
> [    2.098303] meson_nfc_read_buf: kfree'd info
> [    2.102553] meson_nfc_read_buf e9ea4280 0x29ea4280
> [    2.107316] meson_nfc_dma_buffer_setup 0x29ea4280
> [    2.111990] meson_nfc_read_buf: about to kfree info
> [    2.116870] meson_nfc_read_buf: kfree'd info
> [    2.121103] meson_nfc_read_buf e9ea4280 0x29ea4280
> [    2.125868] meson_nfc_dma_buffer_setup 0x29ea4280
> [    2.130540] meson_nfc_read_buf: about to kfree info
> [    2.135400] meson_nfc_read_buf: kfree'd info
> [    2.139652] Could not find a valid ONFI parameter page, trying
> bit-wise majority to recover it
> [    2.148276] ONFI parameter recovery failed, aborting
> [    2.153165] meson_nfc_read_buf e9ea4280 0x29ea4280
> [    2.157938] meson_nfc_dma_buffer_setup 0x29ea4280
> [    2.162634] meson_nfc_read_buf: about to kfree info
> [    2.167475] meson_nfc_read_buf: kfree'd info
> [    2.171717] meson_nfc_read_buf e9ea4280 0x29ea4280
> [    2.176489] meson_nfc_dma_buffer_setup 0x29ea4280
> [    2.181183] meson_nfc_read_buf: about to kfree info
> [    2.186025] meson_nfc_read_buf: kfree'd info
> [    2.190265] nand: device found, Manufacturer ID: 0xad, Chip ID: 0xde
> [    2.196598] nand: Hynix NAND 8GiB 3,3V 8-bit
> [    2.200840] nand: 8192 MiB, MLC, erase size: 4096 KiB, page size:
> 16384, OOB size: 1280
> [    2.208829] meson_nfc_read_buf e9ea4300 0x29ea4300
> [    2.213581] meson_nfc_dma_buffer_setup 0x29ea4300
> [    2.218291] meson_nfc_read_buf: about to kfree info
> [    2.223115] meson_nfc_read_buf: kfree'd info
> [    2.227374] ------------[ cut here ]------------
> [    2.231968] WARNING: CPU: 1 PID: 1 at
> drivers/mtd/nand/raw/nand_base.c:5503 nand_scan_with_ids+0x1718/0x171c
> [    2.241760] No oob scheme defined for oobsize 1280
> ...
> (the "No oob scheme defined for oobsize 1280" message is expected)
> 
miss mtd_set_ooblayout(mtd, &meson_ooblayout_ops) on function 
meson_nand_attach_chip.
> 
> Regards
> Martin
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
