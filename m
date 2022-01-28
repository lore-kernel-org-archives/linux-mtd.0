Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8412C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jan 2022 17:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c6tqwHmELZaZBtvzo+SgJ/wKnxFIRyc+gY4blcmTPBQ=; b=23+wakErPUmOBhMfjzdlEfwRWf
	irEOMmizVc98tThfQLR7TliDbbUW60NUSZ6OEuTiKf5vIWsPAOLEvhG6LnRXQeva8tMznM4XwGggw
	46HEV7ey1kGD2PzSQzsVKU3kytnKA1sw3Qlc9J9CVOG8/WjDnXxmg8ULKy7RP8P+e+9VdACjMNDmW
	gEfQZpjdhWMwfVrV6OSm6Xt9flwuuSj6f25R2rV1iHaor08SLBrUW146Q5N/1RrxuFqdhDJ50VMzB
	+u+uphSfN6NjUVpH7dToZSK/O1YoBB/Gu+TBdKePry6rqSec/foqXy8YCa5yMUSihyepTpdNUgGmw
	syCYrgww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDVO4-003FZ7-Td; Fri, 28 Jan 2022 17:50:16 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDVO2-003FYf-IS
 for linux-mtd@lists.infradead.org; Fri, 28 Jan 2022 17:50:16 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1643392213; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To: From:
 Subject: Sender; bh=QwXJRec32Sfdr000R0mnPj2fV22XnG1mt0t4eMsdDmw=;
 b=tTSv5Xq24NHOZxzPsaFeuH/XNt0S2YDaIUu1SZa9sFILuc9NtqPZKIZvYH+kErWukJTUHW/9
 bgDLoElcho/XBuducauyuLmGOHXKL38lx8ZYWY4mQ2VC6z73RnMsHYv4lFlp1Vm2Pm+oCZ5A
 ILrr5SjX8HtgZ9S6hDycQEH8D54=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 61f42cd403f2a95dc2390cc3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 28 Jan 2022 17:50:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8CC68C4360C; Fri, 28 Jan 2022 17:50:12 +0000 (UTC)
Received: from [192.168.0.104] (unknown [183.82.28.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: sricharan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7CC9BC4338F;
 Fri, 28 Jan 2022 17:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7CC9BC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH] mtd: nand: raw: qcom_nandc: Don't clear_bam_transaction
 on READID
From: Sricharan Ramabadhran <sricharan@codeaurora.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 jamipkettunen@somainline.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 mdalam@codeaurora.org
References: <20220113184427.2259509-1-konrad.dybcio@somainline.org>
 <20220114082718.32a2fc83@xps13> <20220126111613.3ab0021e@xps13>
 <20220126103316.GA212068@thinkpad> <20220126114200.4cc3c21b@xps13>
 <fc80a6e7-bd44-3b3e-fca2-1316a76d65f5@codeaurora.org>
Message-ID: <a6fcc533-e7cd-7b55-4db0-cec80c07b46a@codeaurora.org>
Date: Fri, 28 Jan 2022 23:20:04 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fc80a6e7-bd44-3b3e-fca2-1316a76d65f5@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_095014_707948_911C2562 
X-CRM114-Status: GOOD (  20.50  )
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

SGkgS29ucmFkLAoKT24gMS8yOC8yMDIyIDk6NTUgQU0sIFNyaWNoYXJhbiBSYW1hYmFkaHJhbiB3
cm90ZToKPiBIaSBNaXF1ZWwsCj4KPiBPbiAxLzI2LzIwMjIgNDoxMiBQTSwgTWlxdWVsIFJheW5h
bCB3cm90ZToKPj4gSGkgTWFuaSwKPj4KPj4gbWFuaUBrZXJuZWwub3JnIHdyb3RlIG9uIFdlZCwg
MjYgSmFuIDIwMjIgMTY6MDM6MTYgKzA1MzA6Cj4+Cj4+PiBPbiBXZWQsIEphbiAyNiwgMjAyMiBh
dCAxMToxNjoxM0FNICswMTAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+Pj4+IEhlbGxvLAo+Pj4+
Cj4+Pj4gbWlxdWVsLnJheW5hbEBib290bGluLmNvbSB3cm90ZSBvbiBGcmksIDE0IEphbiAyMDIy
IDA4OjI3OjE4ICswMTAwOgo+Pj4+PiBIaSBLb25yYWQsCj4+Pj4+Cj4+Pj4+IGtvbnJhZC5keWJj
aW9Ac29tYWlubGluZS5vcmcgd3JvdGUgb24gVGh1LCAxMyBKYW4gMjAyMiAxOTo0NDoyNiAKPj4+
Pj4gKzAxMDA6Cj4+Pj4+PiBXaGlsZSBJIGhhdmUgYWJzb2x1dGVseSAwIGlkZWEgd2h5IGFuZCBo
b3csIHJ1bm5pbmcgCj4+Pj4+PiBjbGVhcl9iYW1fdHJhbnNhY3Rpb24KPj4+Pj4+IHdoZW4gUkVB
RElEIGlzIGlzc3VlZCBtYWtlcyB0aGUgRE1BIHRvdGFsbHkgY2xvZyB1cCBhbmQgcmVmdXNlIHRv
IAo+Pj4+Pj4gZnVuY3Rpb24KPj4+Pj4+IGF0IGFsbCBvbiBtZG05NjA3LiBJbiBmYWN0LCBpdCBp
cyBzbyBiYWQgdGhhdCBhbGwgdGhlIGRhdGEgZ2V0cyAKPj4+Pj4+IGdhcmJsZWQKPj4+Pj4+IGFu
ZCBhZnRlciBhIHNob3J0IHdoaWxlIGluIHRoZSBuYW5kIHByb2JlIGZsb3csIHRoZSBDUFUgZGVj
aWRlcyB0aGF0Cj4+Pj4+PiBzZXB1a3UgaXMgdGhlIG9ubHkgb3B0aW9uLgo+Pj4+Pj4KPj4+Pj4+
IFJlbW92aW5nIF9SRUFESUQgZnJvbSB0aGUgaWYgY29uZGl0aW9uIG1ha2VzIGl0IHdvcmsgbGlr
ZSBhIAo+Pj4+Pj4gY2hhcm0sIEkgY2FuCj4+Pj4+PiByZWFkIGRhdGEgYW5kIG1vdW50IHBhcnRp
dGlvbnMgd2l0aG91dCBhIHByb2JsZW0uCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogS29u
cmFkIER5YmNpbyA8a29ucmFkLmR5YmNpb0Bzb21haW5saW5lLm9yZz4KPj4+Pj4+IC0tLQo+Pj4+
Pj4gVGhpcyBpcyB0b3RhbGx5IGp1c3QgYW4gb2JzZXJ2YXRpb24gd2hpY2ggdG9vayBtZSBhbiBp
bmh1bWFuZSAKPj4+Pj4+IGFtb3VudCBvZgo+Pj4+Pj4gZGVidWcgcHJpbnRzIHRvIGZpbmQuLiBw
ZXJoYXBzIHRoZXJlJ3MgYSBiZXR0ZXIgcmVhc29uIGJlaGluZCAKPj4+Pj4+IHRoaXMsIGJ1dAo+
Pj4+Pj4gSSBjYW4ndCBzZWVtIHRvIGZpbmQgYW55IGFuc3dlcnMuLiBUaGVyZWZvcmUsIHRoaXMg
aXMgYSBCSUcgUkZDIQo+Pj4+PiBJJ20gYWRkaW5nIHR3byBwZW9wbGUgZnJvbSBjb2RlYXVyb3Jh
IHdobyB3b3JrZWQgYSBsb3Qgb24gdGhpcyAKPj4+Pj4gZHJpdmVyLgo+Pj4+PiBIb3BlZnVsbHkg
dGhleSB3aWxsIGhhdmUgYW4gaWRlYSA6KQo+Pj4+IFNhZHJlLCBJJ3ZlIHNwZW50IGEgc2lnbmlm
aWNhbnQgYW1vdW50IG9mIHRpbWUgcmV2aWV3aW5nIHlvdXIgcGF0Y2hlcywKPj4+PiBub3cgaXQn
cyB5b3VyIHR1cm4gdG8gbm90IHRha2UgYSBtb250aCB0byBhbnN3ZXIgdG8geW91ciBwZWVycwo+
Pj4+IHByb3Bvc2Fscy4KPj4+Pgo+Pj4+IFBsZWFzZSBoZWxwIHJldmlld2luZyB0aGlzIHBhdGNo
Lgo+Pj4gU29ycnkuIEkgd2FzIGhvcGluZyB0aGF0IFFjb20gZm9sa3Mgd291bGQgY2hpbWUgaW4g
YXMgSSBkb24ndCBoYXZlIAo+Pj4gYW55IGlkZWEKPj4+IGFib3V0IHRoZSBtZG05NjA3IHBsYXRm
b3JtLiBJdCBjb3VsZCBiZSB0aGF0IHRoZSBtYWlsIHNlcnZlciAKPj4+IG1pZ3JhdGlvbiBmcm9t
Cj4+PiBjb2RlYXVyb3JhIHRvIHF1aWNpbmMgcHV0IGEgYmFycmllciBoZXJlLgo+Pj4KPj4+IExl
dCBtZSBwaW5nIHRoZW0gaW50ZXJuYWxseS4KPj4gT2gsIG9rLCBJIGRpZG4ndCBrbm93LiBUaGFu
a3MhCj4KPiDCoMKgIFNvcnJ5IE1pcXVlbCwgc29tZWhvdyB3ZSBkaWQgbm90IGdldCB0aGlzIGVt
YWlsIGluIG91ciBpbmJveC4KPiDCoMKgIFRoYW5rcyB0byBNYW5pIGZvciBwaW5naW5nIHVzLCB3
ZSB3aWxsIHRlc3QgdGhpcyB1cCB0b2RheSBhbmQgZ2V0IAo+IGJhY2suCj4KIMKgIMKgIMKgIFdo
aWxlIHdlIGNvdWxkIG5vdCByZXByb2R1Y2UgdGhpcyBpc3N1ZSBvbiBvdXIgaXBxIGJvYXJkcyAo
ZG8gbm90IApoYXZlIGEgbWRtOTYwNyByaWdodCBub3cpIGFuZAogwqDCoMKgwqDCoMKgIGlzc3Vl
IGRvZXMgbm90IGxvb2sgYW55IG9idmlvdXMuCiDCoCDCoCDCoCBjYW4geW91IHBsZWFzZSBnaXZl
IHRoZSBkZWJ1ZyBsb2dzIHRoYXQgeW91IGRpZCBmb3IgdGhlIGFib3ZlIApzdGFnZSBieSBzdGFn
ZSA/CgogwqAgUmVnYXJkcywKIMKgwqDCoMKgwqAgU3JpY2hhcmFuCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
