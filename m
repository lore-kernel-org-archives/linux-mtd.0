Return-Path: <SRS0=4hvs=RW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB05C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 20:28:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AD152146E
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 20:28:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jH/6VjNL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="tbN+RIjM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AD152146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nec98vRpGLbvd3YUChFPNuUfEPmspHrZEzyDydnfcis=; b=jH/6VjNLE4IvkluOAMtaMGtY9
	c9dafoJ2912RPsFEAvn7xODU/t73ivwe+ZmkL/gVxtXn6UaBThNMeEAwEJ35FgBs02wDLy0DyBnIO
	gp4c4scY8Z29v8MYFkohWxkYO6idA+P3taQOyDJXz/BQ1pTuiufcpKRm59oo4ZSDueGkHN5eNXppH
	NkVzGfqqmacubQrC5LoORhHEAa0NrWR5KBAjyMK1Aw0AsKv4yLdW3UGce2PZg7HSKnj5pJTrV6nmp
	5RaniSYfiXtYjDBro/a0B7rTpafVuAF31aM5Sgom1kbSaTFnP8/wl505+knG8OU4sh3eI5Hh5a12J
	ZVeKgQ4fg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6LLF-00035C-Qt; Tue, 19 Mar 2019 20:28:09 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6LLD-00034c-0x; Tue, 19 Mar 2019 20:28:08 +0000
Received: by mail-oi1-x244.google.com with SMTP id j132so5509oib.2;
 Tue, 19 Mar 2019 13:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SjqSbwN3WCbrXUkCAiwGKUCDVIotOmf3+czbqgtuT1E=;
 b=tbN+RIjMSwyIWasK+Tr4VV/cr5+inkDDpl4GqznTG9ZzQQzNE9c1kKyxHXUWk7jMSh
 kW3Hksq14qfjB1WbNQlvo5LvSFyxo41jZZdE0sDCAc37hIsA2fWQdex8C+KBlJDVDI5J
 9+sQitfKhhOo+/jhwsxF31ddh0l2tpgJ7R1njCLIe0+THx4ppC8E0ym0nLOkI9l31qko
 wHCaimpES1wLvRjzk9fLdBhusEFpAQ6Cp9BtHinjKH1BaY38DeRcBKjQAsDByv1kRInW
 Ge4WjNWfKlvO9lMP/ptPnh/FTSlKzl2CShfShmsPYpsb/NHOVb6bNxiPk/D/f3r2QX7D
 kCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SjqSbwN3WCbrXUkCAiwGKUCDVIotOmf3+czbqgtuT1E=;
 b=LAYMaZL7/y1EPvAFBHFQthzEXwSGh6ohvNLz42D39dO3EHgZNIukRZ10MEN1v7HDLC
 B+KWN35eNnRs5Xb1Y5LiexTWwKIA3BzmduUTPhgAKs7iajMr5suXss44ft6yOg4klptr
 PMHha8+3994Xc+2dFAM0Cm+M3py2wAOKHkEzEhXf4QgB+9s7h4bZJ/hXPRYzpq8vKMiV
 T08FzgvpB411dNEDpK2l+MBq7kpr+vQK8htMkpjVzloWJIGnRhMGITLxfzUgh/keB2+i
 Vdn7pxfb6YsrtsKA4Cm2yhY4zaxXUvyMgkByTiiIpWXU+B8spzk3uBbTBwibYUpsRlTo
 jwPw==
X-Gm-Message-State: APjAAAWHzR0aaEhT8vDja9hM5LTVGDL+vEg85FeRbMUUnYYErL+8nTHK
 UDOfHL8zCqkal6+PCGrrFGErEVKWxkR/vgtBaEQ=
X-Google-Smtp-Source: APXvYqxzZKOEQbaYE2ZhCsWJJr0F70V+8dKoZ8zrhtNrLFCwKjIqR5ZvqW5k9UtXZBSFKzar7xsPQBM3xJIcbIfRPvw=
X-Received: by 2002:aca:6209:: with SMTP id w9mr2813097oib.47.1553027285832;
 Tue, 19 Mar 2019 13:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190301182922.8309-1-martin.blumenstingl@googlemail.com>
 <98776767-c4d7-1207-6d42-97105f289bec@amlogic.com>
 <CAFBinCC7P40sqrDGTuM8M=jVOFTgZLDUK6rGdNpigFoepyCASw@mail.gmail.com>
 <20190307140959.10092d45@xps13>
 <ccb95e75-e62f-c510-cabd-853481f77fc8@amlogic.com>
 <CAFBinCBd=dOZjv4KEDY9ODOONDO=WtaBqAMRi_a+gH3_iZEAHQ@mail.gmail.com>
In-Reply-To: <CAFBinCBd=dOZjv4KEDY9ODOONDO=WtaBqAMRi_a+gH3_iZEAHQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 19 Mar 2019 21:27:54 +0100
Message-ID: <CAFBinCA7LLK6K3ZqauJy2N-z5-kTfuTztmoSQ=Bk4A5Xagxddw@mail.gmail.com>
Subject: Re: [RFC PATCH nand-next 0/2] meson-nand: support for older SoCs
To: Liang Yang <liang.yang@amlogic.com>
Content-Type: multipart/mixed; boundary="000000000000b308a20584785793"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_132807_076547_EE026918 
X-CRM114-Status: GOOD (  17.02  )
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
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--000000000000b308a20584785793
Content-Type: text/plain; charset="UTF-8"

Hello Liang,

On Sat, Mar 16, 2019 at 11:55 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
[...]
> > Martin, Now i am not sure whether NFC driver leads to kernel panic when
> > calling kmem_cache_alloc_trace.
> thank you for confirming that it works for you on GXL
>
> I'm not sure that this is a NFC driver problem.
> after enabling CONFIG_SLAB_FREELIST_HARDENED in my kernel config the
> crash moves. it's now crashing in slub.c's kfree() at
> BUG_ON(!PageCompound(page));
I added some debug prints in meson_nfc_read_buf() to get some details
about the info buffer before the crash,
format is: meson_nfc_read_buf <virtual address> <physical address>

during my first test three different addresses are used:
- meson_nfc_read_buf e9e6c640 0x29e6c640 (works fine)
- meson_nfc_read_buf e9e6c680 0x29e6c680 (works fine)
- meson_nfc_read_buf ee39a34b 0x2e39a34b (crashes during kfree)

so I tried playing around with the allocation size (see the attached
patch) and changed it to:
  kzalloc(PER_INFO_BYTE + 64, GFP_KERNEL)
this results in the following addresses being used:
- meson_nfc_read_buf e9ea4280 0x29ea4280 (works fine)
- meson_nfc_read_buf e9ea4300 0x29ea4300 (works fine)
(there is no crash anymore)

Liang, are there any special requirements on the "info address" like
the alignment?
also do you know why the PER_INFO_BYTE buffer is allocated dynamically
in meson_nfc_read_buf() instead of allocating it at initialization?
I'm not saying that it should be changed! I'm curious because there's
per-meson_nfc_nand_chip info and data buffers which are allocated at
initialization time.


meson_nfc_read_buf debug log with PER_INFO_BYTE allocation:
[    2.032914] meson_nfc_read_buf e9e6c640 0x29e6c640
[    2.033005] meson_nfc_dma_buffer_setup 0x29e6c640
[    2.037717] meson_nfc_read_buf: about to kfree info
[    2.042535] meson_nfc_read_buf: kfree'd info
[    2.046794] meson_nfc_read_buf e9e6c640 0x29e6c640
[    2.051552] meson_nfc_dma_buffer_setup 0x29e6c640
[    2.056261] meson_nfc_read_buf: about to kfree info
[    2.061086] meson_nfc_read_buf: kfree'd info
[    2.065356] meson_nfc_read_buf e9e6c680 0x29e6c680
[    2.070102] meson_nfc_dma_buffer_setup 0x29e6c680
[    2.074810] meson_nfc_read_buf: about to kfree info
[    2.079635] meson_nfc_read_buf: kfree'd info
[    2.083978] meson_nfc_read_buf e9e6c640 0x29e6c640
[    2.088684] meson_nfc_dma_buffer_setup 0x29e6c640
[    2.093334] meson_nfc_read_buf: about to kfree info
[    2.098199] meson_nfc_read_buf: kfree'd info
[    2.102446] meson_nfc_read_buf e9e6c640 0x29e6c640
[    2.107208] meson_nfc_dma_buffer_setup 0x29e6c640
[    2.111883] meson_nfc_read_buf: about to kfree info
[    2.116765] meson_nfc_read_buf: kfree'd info
[    2.120996] meson_nfc_read_buf e9e6c640 0x29e6c640
[    2.125762] meson_nfc_dma_buffer_setup 0x29e6c640
[    2.130433] meson_nfc_read_buf: about to kfree info
[    2.135294] meson_nfc_read_buf: kfree'd info
[    2.139545] Could not find a valid ONFI parameter page, trying
bit-wise majority to recover it
[    2.148173] ONFI parameter recovery failed, aborting
[    2.153058] meson_nfc_read_buf e9e6c680 0x29e6c680
[    2.157831] meson_nfc_dma_buffer_setup 0x29e6c680
[    2.162527] meson_nfc_read_buf: about to kfree info
[    2.167369] meson_nfc_read_buf: kfree'd info
[    2.171611] meson_nfc_read_buf ee39a34b 0x2e39a34b
[    2.176383] meson_nfc_dma_buffer_setup 0x2e39a34b
[    2.181076] meson_nfc_read_buf: about to kfree info
[    2.185932] ------------[ cut here ]------------
[    2.190503] kernel BUG at mm/slub.c:3950!
[    2.194491] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
...

meson_nfc_read_buf debug log with PER_INFO_BYTE+64 allocation:
[    2.033019] meson_nfc_read_buf e9ea4280 0x29ea4280
[    2.033112] meson_nfc_dma_buffer_setup 0x29ea4280
[    2.037847] meson_nfc_read_buf: about to kfree info
[    2.042642] meson_nfc_read_buf: kfree'd info
[    2.046909] meson_nfc_read_buf e9ea4280 0x29ea4280
[    2.051659] meson_nfc_dma_buffer_setup 0x29ea4280
[    2.056374] meson_nfc_read_buf: about to kfree info
[    2.061192] meson_nfc_read_buf: kfree'd info
[    2.065461] meson_nfc_read_buf e9ea4280 0x29ea4280
[    2.070208] meson_nfc_dma_buffer_setup 0x29ea4280
[    2.074922] meson_nfc_read_buf: about to kfree info
[    2.079742] meson_nfc_read_buf: kfree'd info
[    2.084087] meson_nfc_read_buf e9ea4280 0x29ea4280
[    2.088789] meson_nfc_dma_buffer_setup 0x29ea4280
[    2.093440] meson_nfc_read_buf: about to kfree info
[    2.098303] meson_nfc_read_buf: kfree'd info
[    2.102553] meson_nfc_read_buf e9ea4280 0x29ea4280
[    2.107316] meson_nfc_dma_buffer_setup 0x29ea4280
[    2.111990] meson_nfc_read_buf: about to kfree info
[    2.116870] meson_nfc_read_buf: kfree'd info
[    2.121103] meson_nfc_read_buf e9ea4280 0x29ea4280
[    2.125868] meson_nfc_dma_buffer_setup 0x29ea4280
[    2.130540] meson_nfc_read_buf: about to kfree info
[    2.135400] meson_nfc_read_buf: kfree'd info
[    2.139652] Could not find a valid ONFI parameter page, trying
bit-wise majority to recover it
[    2.148276] ONFI parameter recovery failed, aborting
[    2.153165] meson_nfc_read_buf e9ea4280 0x29ea4280
[    2.157938] meson_nfc_dma_buffer_setup 0x29ea4280
[    2.162634] meson_nfc_read_buf: about to kfree info
[    2.167475] meson_nfc_read_buf: kfree'd info
[    2.171717] meson_nfc_read_buf e9ea4280 0x29ea4280
[    2.176489] meson_nfc_dma_buffer_setup 0x29ea4280
[    2.181183] meson_nfc_read_buf: about to kfree info
[    2.186025] meson_nfc_read_buf: kfree'd info
[    2.190265] nand: device found, Manufacturer ID: 0xad, Chip ID: 0xde
[    2.196598] nand: Hynix NAND 8GiB 3,3V 8-bit
[    2.200840] nand: 8192 MiB, MLC, erase size: 4096 KiB, page size:
16384, OOB size: 1280
[    2.208829] meson_nfc_read_buf e9ea4300 0x29ea4300
[    2.213581] meson_nfc_dma_buffer_setup 0x29ea4300
[    2.218291] meson_nfc_read_buf: about to kfree info
[    2.223115] meson_nfc_read_buf: kfree'd info
[    2.227374] ------------[ cut here ]------------
[    2.231968] WARNING: CPU: 1 PID: 1 at
drivers/mtd/nand/raw/nand_base.c:5503 nand_scan_with_ids+0x1718/0x171c
[    2.241760] No oob scheme defined for oobsize 1280
...
(the "No oob scheme defined for oobsize 1280" message is expected)


Regards
Martin

--000000000000b308a20584785793
Content-Type: text/x-patch; charset="US-ASCII"; name="meson-nfc-debug-prints.patch"
Content-Disposition: attachment; filename="meson-nfc-debug-prints.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jtg81v7a0>
X-Attachment-Id: f_jtg81v7a0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYyBiL2RyaXZlcnMv
bXRkL25hbmQvcmF3L21lc29uX25hbmQuYwppbmRleCBiNDlhNDVmMjU1ZjguLmNkYzQyNmNkMGE0
MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCisrKyBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwpAQCAtNDkzLDYgKzQ5Myw3IEBAIHN0YXRp
YyBpbnQgbWVzb25fbmZjX2RtYV9idWZmZXJfc2V0dXAoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwg
dTggKmRhdGFidWYsCiAKIAlpZiAoaW5mb2J1ZikgewogCQluZmMtPmlhZGRyID0gZG1hX21hcF9z
aW5nbGUobmZjLT5kZXYsIGluZm9idWYsIGluZm9sZW4sIGRpcik7CisJCXByaW50aygiJXMgMHgl
MDh4XG4iLCBfX2Z1bmNfXywgbmZjLT5pYWRkcik7CiAJCXJldCA9IGRtYV9tYXBwaW5nX2Vycm9y
KG5mYy0+ZGV2LCBuZmMtPmlhZGRyKTsKIAkJaWYgKHJldCkgewogCQkJZGV2X2VycihuZmMtPmRl
diwgIkRNQSBtYXBwaW5nIGVycm9yXG4iKTsKQEAgLTUyOCwxMCArNTI5LDEwIEBAIHN0YXRpYyBp
bnQgbWVzb25fbmZjX3JlYWRfYnVmKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsIHU4ICpidWYsIGlu
dCBsZW4pCiAJdTMyIGNtZDsKIAl1OCAqaW5mbzsKIAotCWluZm8gPSBremFsbG9jKFBFUl9JTkZP
X0JZVEUsIEdGUF9LRVJORUwpOworCWluZm8gPSBremFsbG9jKFBFUl9JTkZPX0JZVEUgKyA2NCwg
R0ZQX0tFUk5FTCk7CiAJaWYgKCFpbmZvKQogCQlyZXR1cm4gLUVOT01FTTsKLQorcHJpbnRrKCIl
cyAlcHggMHglMDh4XG4iLCBfX2Z1bmNfXywgaW5mbywgdmlydF90b19waHlzKGluZm8pKTsKIAly
ZXQgPSBtZXNvbl9uZmNfZG1hX2J1ZmZlcl9zZXR1cChuYW5kLCBidWYsIGxlbiwgaW5mbywKIAkJ
CQkJIFBFUl9JTkZPX0JZVEUsIERNQV9GUk9NX0RFVklDRSk7CiAJaWYgKHJldCkKQEAgLTU0NSw3
ICs1NDYsOSBAQCBzdGF0aWMgaW50IG1lc29uX25mY19yZWFkX2J1ZihzdHJ1Y3QgbmFuZF9jaGlw
ICpuYW5kLCB1OCAqYnVmLCBpbnQgbGVuKQogCW1lc29uX25mY19kbWFfYnVmZmVyX3JlbGVhc2Uo
bmFuZCwgbGVuLCBQRVJfSU5GT19CWVRFLCBETUFfRlJPTV9ERVZJQ0UpOwogCiBvdXQ6Citwcmlu
dGsoIiVzOiBhYm91dCB0byBrZnJlZSBpbmZvXG4iLCBfX2Z1bmNfXyk7CiAJa2ZyZWUoaW5mbyk7
CitwcmludGsoIiVzOiBrZnJlZSdkIGluZm9cbiIsIF9fZnVuY19fKTsKIAogCXJldHVybiByZXQ7
CiB9Cg==
--000000000000b308a20584785793
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--000000000000b308a20584785793--

