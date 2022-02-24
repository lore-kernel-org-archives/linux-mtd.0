Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1833BC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Feb 2022 07:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w53cxeffxmZUy1A00tmLGjSRG0EZUnUGAMgFnl+VPyc=; b=ZQGu1CCvZqBEx8fU2dDCr9TQxN
	uC306Pmbc4myhIsAIKHEluGP6f1Osm+cH13rToodPaZbvHU6oagLMm5IJ0wSHpcmzhgoCayZUFKuU
	JxKwsz3MRumNhK5D3tmxFbWwn/gIe2Mtvf3JpLFymSgG2+Bk3mv+1Gy/g8QRsPpdf/3Pl1AokIhhL
	8VS39b3X+E9DVmPCd9iXxLiCo8MwsaBC/Lu++C2H+9ZNJ8CgDZzUOPzIXbJE3Kok4ptTIq9jcpF+9
	Ez4bFrdnGnVvkSNbXS8lyFFVfbpM5eI/+OI+8XgL059RpLwVn7AHDfMLD3abos7UgCO5D5ynTe9vl
	utAnjl5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nN8d4-00H8Ut-Np; Thu, 24 Feb 2022 07:33:34 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nN8d1-00H8UD-FJ
 for linux-mtd@lists.infradead.org; Thu, 24 Feb 2022 07:33:33 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1645688009; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=oFK2R0oCH7AhIg/zGtTiYf6v6AqrPbUgoWGnqg4HWaI=;
 b=FRuPppCkR+dKZ4oICyvNwO6t1n15zuj0LL2+7elwdLvmuzFktLjsvlL7hcXT0DFI0twMe/75
 pNfFJKixJHO+oRXAfZ0XQoEY+N4yWFtvYwxxoNkMRgDSv6hnJunRZmteRGJskqjuPK4YaNhb
 mmYgdRujd7TBIoS5klOt23dpT8E=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 621734c6f59adaaa8e5ce468 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 24 Feb 2022 07:33:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1B1F4C43617; Thu, 24 Feb 2022 07:33:26 +0000 (UTC)
Received: from [192.168.0.104] (unknown [183.82.176.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: sricharan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 75381C4338F;
 Thu, 24 Feb 2022 07:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 75381C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH] mtd: nand: raw: qcom_nandc: Don't clear_bam_transaction
 on READID
To: Konrad Dybcio <konrad.dybcio@somainline.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, pragalla@codeaurora.org,
 ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 jamipkettunen@somainline.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 mdalam@codeaurora.org, bbhatt@codeaurora.org, hemantk@codeaurora.org
References: <20220113184427.2259509-1-konrad.dybcio@somainline.org>
 <20220114082718.32a2fc83@xps13> <20220126111613.3ab0021e@xps13>
 <20220126103316.GA212068@thinkpad> <20220126114200.4cc3c21b@xps13>
 <fc80a6e7-bd44-3b3e-fca2-1316a76d65f5@codeaurora.org>
 <a6fcc533-e7cd-7b55-4db0-cec80c07b46a@codeaurora.org>
 <0a8d6550-aa19-0af1-abae-66bf34c91ea8@somainline.org>
 <be779ed9-bd80-8f01-fe7f-d3c07d3d85aa@codeaurora.org>
 <12cad24a-fa2f-9a82-cf43-241a0a6fe4f6@somainline.org>
 <20220201145204.54646475@xps13>
 <d79bf21d-5a90-0074-cef6-896f66e80d28@somainline.org>
 <c63d5410-7f08-80fe-28ac-f4867038ff30@codeaurora.org>
 <cc1302f4-9150-0145-421c-bf2b7a7bf258@codeaurora.org>
 <6b839237-74f0-7270-2f33-f5c17e6b59de@somainline.org>
From: Sricharan Ramabadhran <sricharan@codeaurora.org>
Message-ID: <2fb9d943-d6c8-06b1-08cc-b0c3a8256082@codeaurora.org>
Date: Thu, 24 Feb 2022 13:03:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6b839237-74f0-7270-2f33-f5c17e6b59de@somainline.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_233331_774704_9D5DFB69 
X-CRM114-Status: GOOD (  39.71  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgS29ucmFkLAoKT24gMi84LzIwMjIgMTA6MTUgUE0sIEtvbnJhZCBEeWJjaW8gd3JvdGU6Cj4K
PiBPbiA0LjAyLjIwMjIgMTg6MTcsIFNyaWNoYXJhbiBSYW1hYmFkaHJhbiB3cm90ZToKPj4gT24g
Mi8yLzIwMjIgMTI6NTQgUE0sIFNyaWNoYXJhbiBSYW1hYmFkaHJhbiB3cm90ZToKPj4+IEhpIEtv
bnJhZC9NaXF1ZWwsCj4+Pgo+Pj4gT24gMi8xLzIwMjIgOToyMSBQTSwgS29ucmFkIER5YmNpbyB3
cm90ZToKPj4+PiBPbiAwMS8wMi8yMDIyIDE0OjUyLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+Pj4+
PiBIaSBLb25yYWQsCj4+Pj4+Cj4+Pj4+IGtvbnJhZC5keWJjaW9Ac29tYWlubGluZS5vcmcgd3Jv
dGUgb24gTW9uLCAzMSBKYW4gMjAyMiAyMDo1NDoxMiArMDEwMDoKPj4+Pj4KPj4+Pj4+IE9uIDMx
LzAxLzIwMjIgMTU6MTMsIFNyaWNoYXJhbiBSYW1hYmFkaHJhbiB3cm90ZToKPj4+Pj4+PiBIaSBL
b25yYWQsCj4+Pj4+Pj4KPj4+Pj4+PiBPbiAxLzMxLzIwMjIgMzozOSBQTSwgS29ucmFkIER5YmNp
byB3cm90ZToKPj4+Pj4+Pj4gT24gMjgvMDEvMjAyMiAxODo1MCwgU3JpY2hhcmFuIFJhbWFiYWRo
cmFuIHdyb3RlOgo+Pj4+Pj4+Pj4gSGkgS29ucmFkLAo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IE9uIDEv
MjgvMjAyMiA5OjU1IEFNLCBTcmljaGFyYW4gUmFtYWJhZGhyYW4gd3JvdGU6Cj4+Pj4+Pj4+Pj4g
SGkgTWlxdWVsLAo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gT24gMS8yNi8yMDIyIDQ6MTIgUE0sIE1p
cXVlbCBSYXluYWwgd3JvdGU6Cj4+Pj4+Pj4+Pj4+IEhpIE1hbmksCj4+Pj4+Pj4+Pj4+Cj4+Pj4+
Pj4+Pj4+IG1hbmlAa2VybmVsLm9yZyB3cm90ZSBvbiBXZWQsIDI2IEphbiAyMDIyIDE2OjAzOjE2
ICswNTMwOgo+Pj4+Pj4+Pj4+Pj4gT24gV2VkLCBKYW4gMjYsIDIwMjIgYXQgMTE6MTY6MTNBTSAr
MDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+Pj4+Pj4+Pj4+PiBIZWxsbywKPj4+Pj4+Pj4+
Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+IG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20gd3JvdGUgb24gRnJp
LCAxNCBKYW4gMjAyMiAwODoyNzoxOCArMDEwMDoKPj4+Pj4+Pj4+Pj4+Pj4gSGkgS29ucmFkLAo+
Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+PiBrb25yYWQuZHliY2lvQHNvbWFpbmxpbmUub3Jn
IHdyb3RlIG9uIFRodSwgMTMgSmFuIDIwMjIgMTk6NDQ6MjYgPj4+Pj4+Pj4gKzAxMDA6Cj4+Pj4+
Pj4+Pj4+Pj4+PiBXaGlsZSBJIGhhdmUgYWJzb2x1dGVseSAwIGlkZWEgd2h5IGFuZCBob3csIHJ1
bm5pbmcgPj4+Pj4+Pj4+IGNsZWFyX2JhbV90cmFuc2FjdGlvbgo+Pj4+Pj4+Pj4+Pj4+Pj4gd2hl
biBSRUFESUQgaXMgaXNzdWVkIG1ha2VzIHRoZSBETUEgdG90YWxseSBjbG9nIHVwIGFuZCByZWZ1
c2UgPj4+Pj4+Pj4+IHRvIGZ1bmN0aW9uCj4+Pj4+Pj4+Pj4+Pj4+PiBhdCBhbGwgb24gbWRtOTYw
Ny4gSW4gZmFjdCwgaXQgaXMgc28gYmFkIHRoYXQgYWxsIHRoZSBkYXRhID4+Pj4+Pj4+PiBnZXRz
IGdhcmJsZWQKPj4+Pj4+Pj4+Pj4+Pj4+IGFuZCBhZnRlciBhIHNob3J0IHdoaWxlIGluIHRoZSBu
YW5kIHByb2JlIGZsb3csIHRoZSBDUFUgPj4+Pj4+Pj4+IGRlY2lkZXMgdGhhdAo+Pj4+Pj4+Pj4+
Pj4+Pj4gc2VwdWt1IGlzIHRoZSBvbmx5IG9wdGlvbi4KPj4+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+
Pj4+Pj4+PiBSZW1vdmluZyBfUkVBRElEIGZyb20gdGhlIGlmIGNvbmRpdGlvbiBtYWtlcyBpdCB3
b3JrIGxpa2UgYSA+Pj4+Pj4+Pj4gY2hhcm0sIEkgY2FuCj4+Pj4+Pj4+Pj4+Pj4+PiByZWFkIGRh
dGEgYW5kIG1vdW50IHBhcnRpdGlvbnMgd2l0aG91dCBhIHByb2JsZW0uCj4+Pj4+Pj4+Pj4+Pj4+
Pgo+Pj4+Pj4+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogS29ucmFkIER5YmNpbyA8a29ucmFkLmR5
YmNpb0Bzb21haW5saW5lLm9yZz4KPj4+Pj4+Pj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+Pj4+Pj4+Pj4g
VGhpcyBpcyB0b3RhbGx5IGp1c3QgYW4gb2JzZXJ2YXRpb24gd2hpY2ggdG9vayBtZSBhbiBpbmh1
bWFuZSA+Pj4+Pj4+Pj4gYW1vdW50IG9mCj4+Pj4+Pj4+Pj4+Pj4+PiBkZWJ1ZyBwcmludHMgdG8g
ZmluZC4uIHBlcmhhcHMgdGhlcmUncyBhIGJldHRlciByZWFzb24gYmVoaW5kID4+Pj4+Pj4+PiB0
aGlzLCBidXQKPj4+Pj4+Pj4+Pj4+Pj4+IEkgY2FuJ3Qgc2VlbSB0byBmaW5kIGFueSBhbnN3ZXJz
Li4gVGhlcmVmb3JlLCB0aGlzIGlzIGEgQklHIFJGQyEKPj4+Pj4+Pj4+Pj4+Pj4gSSdtIGFkZGlu
ZyB0d28gcGVvcGxlIGZyb20gY29kZWF1cm9yYSB3aG8gd29ya2VkIGEgbG90IG9uIHRoaXMgPj4+
Pj4+Pj4gZHJpdmVyLgo+Pj4+Pj4+Pj4+Pj4+PiBIb3BlZnVsbHkgdGhleSB3aWxsIGhhdmUgYW4g
aWRlYSA6KQo+Pj4+Pj4+Pj4+Pj4+IFNhZHJlLCBJJ3ZlIHNwZW50IGEgc2lnbmlmaWNhbnQgYW1v
dW50IG9mIHRpbWUgcmV2aWV3aW5nIHlvdXIgPj4+Pj4+PiBwYXRjaGVzLAo+Pj4+Pj4+Pj4+Pj4+
IG5vdyBpdCdzIHlvdXIgdHVybiB0byBub3QgdGFrZSBhIG1vbnRoIHRvIGFuc3dlciB0byB5b3Vy
IHBlZXJzCj4+Pj4+Pj4+Pj4+Pj4gcHJvcG9zYWxzLgo+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+
Pj4gUGxlYXNlIGhlbHAgcmV2aWV3aW5nIHRoaXMgcGF0Y2guCj4+Pj4+Pj4+Pj4+PiBTb3JyeS4g
SSB3YXMgaG9waW5nIHRoYXQgUWNvbSBmb2xrcyB3b3VsZCBjaGltZSBpbiBhcyBJIGRvbid0ID4+
Pj4+PiBoYXZlIGFueSBpZGVhCj4+Pj4+Pj4+Pj4+PiBhYm91dCB0aGUgbWRtOTYwNyBwbGF0Zm9y
bS4gSXQgY291bGQgYmUgdGhhdCB0aGUgbWFpbCBzZXJ2ZXIgPj4+Pj4+IG1pZ3JhdGlvbiBmcm9t
Cj4+Pj4+Pj4+Pj4+PiBjb2RlYXVyb3JhIHRvIHF1aWNpbmMgcHV0IGEgYmFycmllciBoZXJlLgo+
Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IExldCBtZSBwaW5nIHRoZW0gaW50ZXJuYWxseS4KPj4+
Pj4+Pj4+Pj4gT2gsIG9rLCBJIGRpZG4ndCBrbm93LiBUaGFua3MhCj4+Pj4+Pj4+Pj4gIMKgwqDC
oCBTb3JyeSBNaXF1ZWwsIHNvbWVob3cgd2UgZGlkIG5vdCBnZXQgdGhpcyBlbWFpbCBpbiBvdXIg
aW5ib3guCj4+Pj4+Pj4+Pj4gIMKgwqDCoCBUaGFua3MgdG8gTWFuaSBmb3IgcGluZ2luZyB1cywg
d2Ugd2lsbCB0ZXN0IHRoaXMgdXAgdG9kYXkgYW5kID4+Pj4gZ2V0IGJhY2suCj4+Pj4+Pj4+PiAg
wqDCoCDCoCDCoCBXaGlsZSB3ZSBjb3VsZCBub3QgcmVwcm9kdWNlIHRoaXMgaXNzdWUgb24gb3Vy
IGlwcSBib2FyZHMgKGRvID4+PiBub3QgaGF2ZSBhIG1kbTk2MDcgcmlnaHQgbm93KSBhbmQKPj4+
Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoCBpc3N1ZSBkb2VzIG5vdCBsb29rIGFueSBvYnZpb3VzLgo+
Pj4+Pj4+Pj4gIMKgwqAgwqAgwqAgY2FuIHlvdSBwbGVhc2UgZ2l2ZSB0aGUgZGVidWcgbG9ncyB0
aGF0IHlvdSBkaWQgZm9yIHRoZSBhYm92ZSA+Pj4gc3RhZ2UgYnkgc3RhZ2UgPwo+Pj4+Pj4+PiBJ
IHdvbid0IGhhdmUgYWNjZXNzIHRvIHRoZSBib2FyZCBmb3IgYWJvdXQgdHdvIHdlZWtzLCBzb3Jy
eS4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gV2hlbiBJIGdldCB0byBpdCwgSSdsbCBzdXJlbHkgdHJ5IHRv
IHNlbmQgeW91IHRoZSBsb2dzLCB0aG91Z2ggdGhlcmUKPj4+Pj4+Pj4KPj4+Pj4+Pj4gd2Fzbid0
IG11Y2ggbW9yZSB0aGFuIGp1c3Qgc29tZXRoaW5nIGp1bXBpbmcgdG8gd2hvLWtub3dzLXdoZXJl
Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IGFmdGVyIGNsZWFyX2JhbV90cmFuc2FjdGlvbiB3YXMgY2FsbGVk
LCByZXN1bHRpbmcgaW4gdmFsdWVzID4+IGFzc29jaWF0ZWQgd2l0aAo+Pj4+Pj4+Pgo+Pj4+Pj4+
PiB0aGUgTkFORCBiZWluZyBhbGwgemVyb2VkIG91dCBpbiBwcl9lcnIvX2RlYnVnL2V0Yy4KPj4+
Pj4+Pj4KPj4+Pj4+PiAgwqDCoMKgwqAgT2sgc3VyZS4gU28gd2FzIHRoZSBSRUFESUQgY29tbWFu
ZCBpdHNlbGYgZmFpbGluZyAob3IpIHRoZSA+IHN1YnNlcXVlbnQgb25lID8KPj4+Pj4+PiAgwqDC
oMKgIFdlIGNhbiBjaGVjayB3aGljaCBwYXJhbWV0ZXIgcmVzZXQgYnkgdGhlIGNsZWFyX2JhbV90
cmFuc2FjdGlvbiBpcyA+IGNhdXNpbmcgdGhlCj4+Pj4+Pj4gIMKgwqDCoCBmYWlsdXJlLsKgIE1l
YW53aGlsZSwgbG9vcGluZyBpbiBQcmFkZWVwIHdobyBoYXMgYWNjZXNzIHRvIHRoZSA+IGJvYXJk
LCBzbyBpbiBhIGJldHRlcgo+Pj4+Pj4+ICDCoMKgwqAgcG9zaXRpb24gdG8gZGVidWcuCj4+Pj4+
PiBJJ20gc29ycnkgSSBoYXZlIHNvIGZldyBkZXRhaWxzIG9uIGhhbmQsIGFuZCBubyBrZXJuZWwg
dHJlZSAobm8gYWNjZXNzIHRvIHRoYXQgbWFjaGluZSBlaXRoZXIsIGZvciBub3cpLgo+Pj4+Pj4K
Pj4+Pj4+Cj4+Pj4+PiBJIHdpbGwgdHJ5IHRvIGRlc2NyaWJlIHRvIHRoZSBiZXN0IG9mIG15IGFi
aWxpdGllcyB3aGF0IEkgcmVjYWxsLgo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBNeSBtZXRob2RvbG9n
eSBvZiBtYWtpbmcgc3VyZSB0aGluZ3MgZG9uJ3QgZ28gaGF5d2lyZSB3YXMgdG8gcHJpbnQgdGhl
IG9vYiBzaXplCj4+Pj4+Pgo+Pj4+Pj4gb2Ygb3VyIE5BTkQgYmFzaWNhbGx5IGV2ZXJ5IHR3byBs
aW5lcyBvZiBjb2RlICh5ZXMsIGkgd2FzIHZlcnkgZGVzcGVyYXRlIGF0IG9uZSBwb2ludCksCj4+
Pj4+Pgo+Pj4+Pj4gYXMgdGhhdCB3YXMgemVyb2VkIG91dCB3aGVuICp0aGUgYnVnKiBoYXBwZW5l
ZCwKPj4+Pj4gVGhpcyBkb2VzIGxvb2sgbGlrZSBhIHBvaW50ZXIgZXJyb3IgYXQgc29tZSBwb2lu
dCBhbmQgc29tZSBrZXJuZWwgZGF0YQo+Pj4+PiBoYXMgYmVlbiBjb3JydXB0ZWQgdmVyeSBiYWRs
eSBieSB0aGUgZHJpdmVyLgo+Pj4+Pgo+Pj4+Pj4gbGVhZGluZyB0byBhIGtlcm5lbCBidWcvcGFu
aWMvc3RhbGwKPj4+Pj4+Cj4+Pj4+PiAoY2FuJ3QgcmVjYWxsIHdoYXQgZXhhY3RseSBpdCB3YXMs
IGJ1dCBpdCBzYWlkIHNvbWV0aGluZyBhbG9uZyB0aGUgbGluZXMgb2YgIm5vIHN1cHBvcnQgZm9y
Cj4+Pj4+Pgo+Pj4+Pj4gb29iIHNpemUgMCIgYW5kIHRoZW4gaXQgZGlkbid0IGZhaWwgZ3JhY2V1
bGx5LCBsZWFkaW5nIHRvIHNvbWUgYmFkIGp1bXBzIGFuZCB1bHRpbWF0ZWx5Cj4+Pj4+Pgo+Pj4+
Pj4gYSBkZWFkIHBsYXRmb3JtLi4pCj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IGFmdGVyIGhvdXJzIG9m
IGRpZ2dpbmcsIEkgZm91bmQgb3V0IHRoYXQgZXZlcnl0aGluZyBnb2VzIGZpbmUgdW50aWwgY2xl
YXJfYmFtX3RyYW5zYWN0aW9uIGlzIGNhbGxlZCwKPj4+Pj4gRG8geW91IHJlbWVtYmVyIGlmIHRo
aXMgZnVuY3Rpb24gd2FzIGNhbGxlZCBmb3IgdGhlIGZpcnN0IHRpbWUgd2hlbgo+Pj4+PiB0aGlz
IGhhcHBlbmVkPwo+Pj4+IEkgdGhpbmsgc28sIGlmIEkgcmVjYWxsIGNvcnJlY3RseSB0aGVyZSBh
cmUgbm8gbW9yZSBjYWxsZXJzIGluIHRoaXMgcGF0aCwgYXMgcmVhZGlkIGlzIHRoZSBmaXJzdCBu
YW5kIGNvbW1hbmQgZXhlY3V0ZWQgaW4gZmxhc2ggcHJvYmUgZmxvdy4KPj4+Pgo+Pj4+Cj4+Pj4K
Pj4+Pj4+IGFmdGVyIHRoYXQgZ2V0cyBleGVjdXRlZCBldmVyeSBuYW5kIG9wIHN0YXJ0cyByZWFk
aW5nIGFsbCB6ZXJvZXMgKGZvciBleGFtcGxlIGluIEpFREVDIElEIGNoZWNrKQo+Pj4+Pj4KPj4+
Pj4+IHNvIEkgYWRkZWQgdGhlIGNoYW5nZXMgZnJvbSB0aGlzIHBhdGNoLCBhbmQgdGhpbmdzIG1h
Z2ljYWxseSBzdGFydGVkIHdvcmtpbmcuLi4gTXkgc3VzcGljaW9uIGlzCj4+Pj4+Pgo+Pj4+Pj4g
dGhhdCB0aGUgdW5kZXJseWluZyBGSUZPIGlzbid0IGZ1bGx5IGRyYWluZWQgKGlzIGl0IGEgRklG
TyBvbiA5NjA3PyBiYWgsIGkgd29yayBvbiB0b28gbWFueSBzb2NzIGF0IG9uY2UpCj4+Pj4+IEkg
ZG9uJ3Qgc2VlIGl0IGluIHRoZSBsaXN0IG9mIHN1cHBvcnRlZCBkZXZpY2VzLCB3aGF0J3MgdGhl
IGV4YWN0Cj4+Pj4+IGNvbXBhdGlibGUgdXNlZD8KPj4+PiBxY29tLGlwcTQwMTktbmFuZAo+Pj4+
Cj4+Pj4KPj4+Pgo+Pj4+Pj4gYW5kIHRoaXMgZnVuY3Rpb24gb25seSBtYWtlcyBMaW51eCB0aGlu
ayBpdCBpcywgd2l0aG91dCBhY3R1YWxseSBkcmFpbmluZyBpdCwgYW5kIHRoZSBsZWZ0b3Zlcgo+
Pj4+Pj4KPj4+Pj4+IGNvbW1hbmRzIGdldCBleGVjdXRlZCB3aXRoIHNvbWUgcGFydHMgb2YgdGhl
bSBnZXR0aW5nIG92ZXJ3cml0dGVuLCByZXN1bHRpbmcgaW4gdGhlCj4+Pj4+Pgo+Pj4+Pj4gZmFt
b3VzIGdhcmJhZ2UgaW4gLSBnYXJiYWdlIG91dCBzaXR1YXRpb24sIGJ1dCB0aGF0J3Mgb25seSBh
IGd1ZXNzdGltYXRlLi4KPj4+Pj4gSSB3b3VsZCBiZXQgZm9yIGEgbm9uIGFsbG9jYXRlZCBiYW0t
aXNoIHBvaW50ZXIgdGhhdCBpcyByZXNldCB0byB6ZXJvCj4+Pj4+IGluIHRoZSBjbGVhcl9iYW1f
dHJhbnNhY3Rpb24oKSBoZWxwZXIuCj4+Pj4+Cj4+Pj4+IENhbiB5b3UgZ2V0IHlvdXIgaGFuZHMg
b24gdGhlIGJvYXJkIGFnYWluPwo+Pj4+IFN1cmUsIGJ1dCBhcyBJIG1lbnRpb25lZCBwcmV2aW91
c2x5LCBvbmx5IGluIGFib3V0IDIgd2Vla3MsIEkgY2FuJ3QgcmVhbGx5IGRvIGFueSBkZXYgYmVm
b3JlIHRoZW4uLiA6KAo+Pj4+Cj4+Pj4KPj4+Pgo+Pj4+PiBJdCB3b3VsZCBiZSBuaWNlIHRvIGNo
ZWNrIGlmIHRoZSBhbGxvY2F0aW9uIGFsd2F5cyBvY2N1cnMgYmVmb3JlIHVzZSwKPj4+Pj4gYW5k
IGlmIHllcyBvbiBob3cgbXVjaCBieXRlcy4KPj4+Pj4KPj4+Pj4gSWYgdGhlIHBvaW50ZXIgaXMg
bm90IGRhbmdsaW5nLCB0aGVuIHBlcmhhcHMgc29tZXRoaW5nIGVsc2Ugc21hc2hlcwo+Pj4+PiB0
aGF0IHBvaW50ZXIuCj4+Pj4KPj4+PiBLb25yYWQKPj4+Pgo+Pj4+Pj4gRG8gbm90ZSB0aGlzIHNv
bWVob3cgd29ya2VkIGZpbmUgb24gNS4xMSBhbmQgdGhlbiBicm9rZSBvbiA1LjEyLzEzLiBJIHdl
bnQgYXMgZmFyIGFzIHJlcGxhY2luZyBtb3N0Cj4+Pj4+Pgo+Pj4+Pj4gb2YgdGhlIGtlcm5lbCB3
aXRoIHRoZSB1cGRhdGVkL2Rvd25ncmFkZWQgcGFydHMgdmlhIGdpdCBjaGVja291dCAoaSB0cmll
ZCBtYW55IGNvbWJpbmF0aW9ucyksCj4+Pj4+Pgo+Pj4+Pj4gdG8gbm8gYXZhaWwuLiBJIGV2ZW4g
dHJpZWQgZGlmZmVyZW50IGNvbXBpbGVycyBhbmQgb3B0aW1pemF0aW9uIGxldmVscywgdGhpbmtp
bmcgaXQgY291bGQgaGF2ZSBiZWVuCj4+Pj4+Pgo+Pj4+Pj4gYSBjb2RlZ2VuIGlzc3VlLCBidXQg
bm8gbHVjayBlaXRoZXIuCj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IEkuLiBkbyB1bmRlcnN0YW5kIHRo
aXMgZW1haWwgaXMgYSB0b3RhbCBtZXNzIHRvIHJlYWQsIGFzIG11Y2ggYXMgaXQgd2FzIHRvIHdy
aXRlLCBidXQKPj4+Pj4+Cj4+Pj4+PiB3aXRob3V0IGFjY2VzcyB0byBteSBjb2RlIGFuZCB0aGUg
bWFjaGluZSBpdHNlbGYgSSBjYW4ndCBnaXZlIHlvdSBzb2xpZCBkZXRhaWxzLCBhbmQKPj4+Pj4+
Cj4+Pj4+PiB0aGUgZmFjdCB0aGlzIHNpdHVhdGlvbiBpcyBmYXIgZnJvbSBvcmRpbmFyeSBkb2Vz
bid0IGhlbHAgZWl0aGVyLi4KPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gVGhlIGxhdGVzdCAoYW5jaWVu
dCwgbm90IHF1aXRlIHByZXR0eSwgYnV0IHByb2JhYmx5IHdvcmtpbmcgaWYgbXkgbWVtb3J5IGlz
IGNvcnJlY3QpIHZlcnNpb24gb2YgbXkgcGF0Y2hlcwo+Pj4+Pj4KPj4+Pj4+IGZvciB0aGUgbWRt
OTYwNyBpcyBhdmFpbGFibGUgYXQgWzFdLCBJIHdpbGwgcHVzaCB0aGUgbmV3IHJldmlzaW9uIGFm
dGVyIEkgZ2V0IGFjY2VzcyB0byB0aGUgd29ya3N0YXRpb24uCj4+Pj4+Pgo+Pj4gIMKgICsgZmV3
IG1vcmUgd2hvIGhhdmUgYWNjZXNzIHRvIHRoZSBib2FyZC4KPj4+Cj4+PiAgwqDCoCBHb2luZyBi
eSB0aGUgZGVzY3JpcHRpb24sIGZvciBrZXJuZWwgY29ycnVwdGlvbiwgd2UgY2FuIHRyeSBvdXQg
YSBLQVNBTiBidWlsZC4KPj4+ICDCoMKgIFNpbmNlIHlvdSBoYXZlIG1lbnRpb25lZCBpdCB3b3Jr
ZWQgdGlsbCA1LjExLCB5b3UgYmlzZWN0ZWQgdGhlIGRyaXZlciB0aWxsIDUuMTEgaGVhZCBhbmQg
aXQgd29ya2VkID8KPj4+Cj4+ICDCoMKgIFRyaWVkIHJ1bm5pbmcgYSBLQVNBTiBlbmFibGVkIGlt
YWdlIG9uIElQUSBib2FyZCwgYnV0IG5vIGx1Y2suIE5vdGhpbmcgY2FtZSBvdXQuCj4+ICDCoMKg
IE9ubHkgaWYgc29tZW9uZSB3aXRoIHRoZSBib2FyZCBjYW4gaGVscCBoZXJlLCB3ZSBjYW4gcHJv
Y2VlZAo+Pgo+Pgo+PiBSZWdhcmRzLAo+PiAgwqAgU3JpY2hhcmFuCj4+Cj4gSSBoYXZlIHRoZSBi
b2FyZCB3aXRoIG1lIGFnYWluLiBQbGVhc2UgdGVsbCBtZSB3aGVyZSBkbyB3ZSBzdGFydCA6KQoK
IMKgU29ycnkgZm9yIHRoZSBkZWxheWVkIHJlc3BvbnNlLgoKIMKgwqDCoMKgIEFzIGEgZmlyc3Qg
c3RlcCwgQ2FuIHlvdSBlbmFibGUgS0FTQU4gYW5kIGNoZWNrIGlmIHlvdSBnZXQgYW55IAp3YXJu
aW5ncyA/CgogwqDCoMKgwqAgVGhlbiwgY2FuIHlvdSBjaGVjayBpbnNpZGUgY2xlYXJfYmFtX3Ry
YW5zYWN0aW9uLCB3aGljaCBwYXJhbWV0ZXIgCnJlc2V0dGluZyBzcGVjaWZpY2FsbHkgaXMgY2F1
c2luZyB0aGUgaXNzdWUgPwoKClJlZ2FyZHMsCiDCoCBTcmljaGFyYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
