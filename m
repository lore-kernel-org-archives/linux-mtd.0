Return-Path: <SRS0=pM9p=R4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BB8C43381
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 10:03:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B672D206DF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 10:03:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HlM9KHax"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B672D206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rYaEJMPdqC8kvNiACSzN3KEl32ol36rLqPtBoAML438=; b=HlM9KHaxJdGQVzLnfET3lL/sf
	gpJRVGuHucgN0nEgtGnHxQZ63CR2O2n5/1PH3+zzBmj+eUZiuEHxUEIF+z74X4NcOzTXnJhD6eE9i
	2BpOnNEH8sau3OZ3Y10fRoBmSPiAA6BxF9U5jkoT4SMGOtc6J+3R4WkAtHNBoP2/md5O6n8GQFqf/
	iEghKCfqfYCdv2SZh5r8EJXHGrr61hMrvm2JRRgHjg0JOuc+kNu27SDD+aFC4hp2GTtUeJu9PBbnn
	T2OOI1uIhZKnqPAxtguXNjsQ9485OklQcElm5a0WHw6wax8fQWTSGPfA90qOxhhG5GJLletGnk8O4
	p2MmZDXjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8MRk-0007um-Cg; Mon, 25 Mar 2019 10:03:12 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8MRh-0007tj-1V; Mon, 25 Mar 2019 10:03:11 +0000
Received: from [10.28.18.125] (10.28.18.125) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 25 Mar
 2019 18:04:17 +0800
Subject: Re: 32-bit Amlogic (ARM) SoC: kernel BUG in kfree()
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthew Wilcox
 <willy@infradead.org>
References: <CAFBinCBOX8HyY-UocsVQvsnTr4XWXyE9oU+f2xhO1=JU0i_9ow@mail.gmail.com>
 <20190321214401.GC19508@bombadil.infradead.org>
 <CAFBinCA6oK5UhDAt9kva5qRisxr2gxMF26AMK8vC4b1DN5RXrw@mail.gmail.com>
From: Liang Yang <liang.yang@amlogic.com>
Message-ID: <5cad2529-8776-687e-58d0-4fb9e2ec59b1@amlogic.com>
Date: Mon, 25 Mar 2019 18:04:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101
 Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <CAFBinCA6oK5UhDAt9kva5qRisxr2gxMF26AMK8vC4b1DN5RXrw@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------65F66B8BEFB8B57F8555B6FE"
Content-Language: en-US
X-Originating-IP: [10.28.18.125]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_030309_083889_68994C50 
X-CRM114-Status: GOOD (  21.17  )
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
Cc: mhocko@suse.com, linux@armlinux.org.uk, linux-kernel@vger.kernel.org,
 rppt@linux.ibm.com, linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 linux-amlogic@lists.infradead.org, akpm@linux-foundation.org,
 linux-arm-kernel@lists.infradead.org
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--------------65F66B8BEFB8B57F8555B6FE
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

On 2019/3/23 5:07, Martin Blumenstingl wrote:
> Hi Matthew,
> 
> On Thu, Mar 21, 2019 at 10:44 PM Matthew Wilcox <willy@infradead.org> wrote:
>>
>> On Thu, Mar 21, 2019 at 09:17:34PM +0100, Martin Blumenstingl wrote:
>>> Hello,
>>>
>>> I am experiencing the following crash:
>>>    ------------[ cut here ]------------
>>>    kernel BUG at mm/slub.c:3950!
>>
>>          if (unlikely(!PageSlab(page))) {
>>                  BUG_ON(!PageCompound(page));
>>
>> You called kfree() on the address of a page which wasn't allocated by slab.
>>
>>> I have traced this crash to the kfree() in meson_nfc_read_buf().
>>> my observation is as follows:
>>> - meson_nfc_read_buf() is called 7 times without any crash, the
>>> kzalloc() call returns 0xe9e6c600 (virtual address) / 0x29e6c600
>>> (physical address)
>>> - the eight time meson_nfc_read_buf() is called kzalloc() call returns
>>> 0xee39a38b (virtual address) / 0x2e39a38b (physical address) and the
>>> final kfree() crashes
>>> - changing the size in the kzalloc() call from PER_INFO_BYTE (= 8) to
>>> PAGE_SIZE works around that crash
>>
>> I suspect you're doing something which corrupts memory.  Overrunning
>> the end of your allocation or something similar.  Have you tried KASAN
>> or even the various slab debugging (eg redzones)?
> KASAN is not available on 32-bit ARM. there was some progress last
> year [0] but it didn't make it into mainline. I tried to make the
> patches apply again and got it to compile (and my kernel is still
> booting) but I have no idea if it's still working. for anyone
> interested, my patches are here: [1] (I consider this a HACK because I
> don't know anything about the code which is being touched in the
> patches, I only made it compile)
> 
> SLAB debugging (redzones) were a great hint, thank you very much for
> that Matthew! I enabled:
>    CONFIG_SLUB_DEBUG=y
>    CONFIG_SLUB_DEBUG_ON=y
> and with that I now get "BUG kmalloc-64 (Not tainted): Redzone
> overwritten" (a larger kernel log extract is attached).
> 
> I'm starting to wonder if the NAND controller (hardware) writes more
> than 8 bytes.
> some context: the "info" buffer allocated in meson_nfc_read_buf is
> then passed to the NAND controller IP (after using dma_map_single).
> 
> Liang, how does the NAND controller know that it only has to send
> PER_INFO_BYTE (= 8) bytes when called from meson_nfc_read_buf? all
> other callers of meson_nfc_dma_buffer_setup (which passes the info
> buffer to the hardware) are using (nand->ecc.steps * PER_INFO_BYTE)
> bytes?
> 
NFC_CMD_N2M and CMDRWGEN are different commands. CMDRWGEN needs to set 
the ecc page size (1KB or 512B) and Pages(2, 4, 8, ...), so 
PER_INFO_BYTE(= 8) bytes for each ecc page.
I have never used NFC_CMD_N2M to transfer data before, because it is 
very low efficient. And I do a experiment with the attachment and find 
on overwritten on my meson axg platform.

Martin, I would appreciate it very much if you would try the attachment 
on your meson m8b platform.

> 
> Regards
> Martin
> 
> 
> [0] https://lore.kernel.org/patchwork/cover/913212/
> [1] https://github.com/xdarklight/linux/tree/arm-kasan-hack-v5.1-rc1
> 

--------------65F66B8BEFB8B57F8555B6FE
Content-Type: text/plain; charset="UTF-8"; name="nand_debug.diff"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="nand_debug.diff"

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwpvbGQgbW9kZSAxMDA2NDQKbmV3IG1vZGUg
MTAwNzU1CmluZGV4IGU4NThkNTguLjkwNWVmMzkKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvbWVzb25fbmFuZC5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQu
YwpAQCAtNTI3LDExICs1MjcsMTIgQEAgc3RhdGljIHZvaWQgbWVzb25fbmZjX2RtYV9idWZm
ZXJfcmVsZWFzZShzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kLAogc3RhdGljIGludCBtZXNvbl9u
ZmNfcmVhZF9idWYoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwgdTggKmJ1ZiwgaW50IGxlbikK
IHsKIAlzdHJ1Y3QgbWVzb25fbmZjICpuZmMgPSBuYW5kX2dldF9jb250cm9sbGVyX2RhdGEo
bmFuZCk7Ci0JaW50IHJldCA9IDA7CisJaW50IHJldCA9IDAsIGk7CiAJdTMyIGNtZDsKIAl1
OCAqaW5mbzsKIAotCWluZm8gPSBremFsbG9jKFBFUl9JTkZPX0JZVEUsIEdGUF9LRVJORUwp
OworCWluZm8gPSBremFsbG9jKDIgKiBQRVJfSU5GT19CWVRFLCBHRlBfS0VSTkVMKTsKKwlt
ZW1zZXQoaW5mbywgMHhGRCwgMiAqIFBFUl9JTkZPX0JZVEUpOwogCXJldCA9IG1lc29uX25m
Y19kbWFfYnVmZmVyX3NldHVwKG5hbmQsIGJ1ZiwgbGVuLCBpbmZvLAogCQkJCQkgUEVSX0lO
Rk9fQllURSwgRE1BX0ZST01fREVWSUNFKTsKIAlpZiAocmV0KQpAQCAtNTQzLDYgKzU0NCwx
MiBAQCBzdGF0aWMgaW50IG1lc29uX25mY19yZWFkX2J1ZihzdHJ1Y3QgbmFuZF9jaGlwICpu
YW5kLCB1OCAqYnVmLCBpbnQgbGVuKQogCW1lc29uX25mY19kcmFpbl9jbWQobmZjKTsKIAlt
ZXNvbl9uZmNfd2FpdF9jbWRfZmluaXNoKG5mYywgMTAwMCk7CiAJbWVzb25fbmZjX2RtYV9i
dWZmZXJfcmVsZWFzZShuYW5kLCBsZW4sIFBFUl9JTkZPX0JZVEUsIERNQV9GUk9NX0RFVklD
RSk7CisKKwlmb3IgKGkgPSAwOyBpIDwgMiAqIFBFUl9JTkZPX0JZVEU7IGkrKyl7CisJCXBy
aW50aygiMHgleCAiLCBpbmZvW2ldKTsNCisJfQorCXByaW50aygiXG4iKTsKKwogCWtmcmVl
KGluZm8pOwogCiAJcmV0dXJuIHJldDsK
--------------65F66B8BEFB8B57F8555B6FE
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--------------65F66B8BEFB8B57F8555B6FE--

