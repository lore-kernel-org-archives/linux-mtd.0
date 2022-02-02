Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06EAC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Feb 2022 07:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42GuF43FgeVnwtNTI7C//pFRTFfauCWCLa78ltpHgjk=; b=STd9Emx4tjC++N1z4yVYAmaG06
	Aji3RVi52RfzlTRQ2RN4fLgV+7XfVM5l2y9UXxNdJzkpPHoKwg77+vAOXCEMAdG9fD3T36ggfhsUp
	mozp4ayvW3yCYhsNQ3kUuVv3Rdo0AprveoI7vQ+RDo0642zMDFpeadf9u7MMX2xtpevmDoeM8tqn7
	J3BNb9zfI2UVj4I4el9sF+1061o1BjX6vYMRYoz5aQ7cY+DqLllPfmIEtwbhCFxKslsM+P0Seu8eT
	zSJBE/fWpFWiaLVBIuCqZjDgbZ2RxWh3DHA90dL0UqOE68a6nYBOGQBeUPBcESI6S6xP+8NluvgXK
	Pphq8RTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFA0f-00EPm8-G4; Wed, 02 Feb 2022 07:24:57 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFA0b-00EPlQ-Vs
 for linux-mtd@lists.infradead.org; Wed, 02 Feb 2022 07:24:56 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1643786693; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Le/t5Scxc7BaBZuub3JG4KIMkCg08hl4Pp9cMhmC3+o=;
 b=iRLnMXqWpFxWUhoBLLgA3Vu6KWKBbRr1hoY3P+3Synsq1LxhvxeHllg9dLJkQFHEUfebzaDk
 UKbu2dBYAz0tlijnY/tOVrikn6XlkILqbc2itJNrDPfd2yVXQVCLIL1tH/MBReqmHZIJbXcU
 debYmSpMNJcBfjx0dckhJpen7vw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 61fa31c3e46e09ccb6f8cd42 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Feb 2022 07:24:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id ECF61C4360C; Wed,  2 Feb 2022 07:24:50 +0000 (UTC)
Received: from [192.168.0.104] (unknown [183.82.28.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: sricharan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BE470C4338F;
 Wed,  2 Feb 2022 07:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org BE470C4338F
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
From: Sricharan Ramabadhran <sricharan@codeaurora.org>
Message-ID: <c63d5410-7f08-80fe-28ac-f4867038ff30@codeaurora.org>
Date: Wed, 2 Feb 2022 12:54:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d79bf21d-5a90-0074-cef6-896f66e80d28@somainline.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_232454_129684_BFBD2DB9 
X-CRM114-Status: GOOD (  42.81  )
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

SGkgS29ucmFkL01pcXVlbCwKCk9uIDIvMS8yMDIyIDk6MjEgUE0sIEtvbnJhZCBEeWJjaW8gd3Jv
dGU6Cj4KPiBPbiAwMS8wMi8yMDIyIDE0OjUyLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBIaSBL
b25yYWQsCj4+Cj4+IGtvbnJhZC5keWJjaW9Ac29tYWlubGluZS5vcmcgd3JvdGUgb24gTW9uLCAz
MSBKYW4gMjAyMiAyMDo1NDoxMiArMDEwMDoKPj4KPj4+IE9uIDMxLzAxLzIwMjIgMTU6MTMsIFNy
aWNoYXJhbiBSYW1hYmFkaHJhbiB3cm90ZToKPj4+PiBIaSBLb25yYWQsCj4+Pj4KPj4+PiBPbiAx
LzMxLzIwMjIgMzozOSBQTSwgS29ucmFkIER5YmNpbyB3cm90ZToKPj4+Pj4gT24gMjgvMDEvMjAy
MiAxODo1MCwgU3JpY2hhcmFuIFJhbWFiYWRocmFuIHdyb3RlOgo+Pj4+Pj4gSGkgS29ucmFkLAo+
Pj4+Pj4KPj4+Pj4+IE9uIDEvMjgvMjAyMiA5OjU1IEFNLCBTcmljaGFyYW4gUmFtYWJhZGhyYW4g
d3JvdGU6Cj4+Pj4+Pj4gSGkgTWlxdWVsLAo+Pj4+Pj4+Cj4+Pj4+Pj4gT24gMS8yNi8yMDIyIDQ6
MTIgUE0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+Pj4+Pj4+IEhpIE1hbmksCj4+Pj4+Pj4+Cj4+
Pj4+Pj4+IG1hbmlAa2VybmVsLm9yZyB3cm90ZSBvbiBXZWQsIDI2IEphbiAyMDIyIDE2OjAzOjE2
ICswNTMwOgo+Pj4+Pj4+Pj4gT24gV2VkLCBKYW4gMjYsIDIwMjIgYXQgMTE6MTY6MTNBTSArMDEw
MCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+Pj4+Pj4+PiBIZWxsbywKPj4+Pj4+Pj4+Pgo+Pj4+
Pj4+Pj4+IG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20gd3JvdGUgb24gRnJpLCAxNCBKYW4gMjAy
MiAwODoyNzoxOCAKPj4+Pj4+Pj4+PiArMDEwMDoKPj4+Pj4+Pj4+Pj4gSGkgS29ucmFkLAo+Pj4+
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBrb25yYWQuZHliY2lvQHNvbWFpbmxpbmUub3JnIHdyb3RlIG9u
IFRodSwgMTMgSmFuIDIwMjIgCj4+Pj4+Pj4+Pj4+IDE5OjQ0OjI2ID4+Pj4+Pj4+ICswMTAwOgo+
Pj4+Pj4+Pj4+Pj4gV2hpbGUgSSBoYXZlIGFic29sdXRlbHkgMCBpZGVhIHdoeSBhbmQgaG93LCBy
dW5uaW5nIAo+Pj4+Pj4+Pj4+Pj4gPj4+Pj4+Pj4+IGNsZWFyX2JhbV90cmFuc2FjdGlvbgo+Pj4+
Pj4+Pj4+Pj4gd2hlbiBSRUFESUQgaXMgaXNzdWVkIG1ha2VzIHRoZSBETUEgdG90YWxseSBjbG9n
IHVwIGFuZCAKPj4+Pj4+Pj4+Pj4+IHJlZnVzZSA+Pj4+Pj4+Pj4gdG8gZnVuY3Rpb24KPj4+Pj4+
Pj4+Pj4+IGF0IGFsbCBvbiBtZG05NjA3LiBJbiBmYWN0LCBpdCBpcyBzbyBiYWQgdGhhdCBhbGwg
dGhlIGRhdGEgCj4+Pj4+Pj4+Pj4+PiA+Pj4+Pj4+Pj4gZ2V0cyBnYXJibGVkCj4+Pj4+Pj4+Pj4+
PiBhbmQgYWZ0ZXIgYSBzaG9ydCB3aGlsZSBpbiB0aGUgbmFuZCBwcm9iZSBmbG93LCB0aGUgQ1BV
IAo+Pj4+Pj4+Pj4+Pj4gPj4+Pj4+Pj4+IGRlY2lkZXMgdGhhdAo+Pj4+Pj4+Pj4+Pj4gc2VwdWt1
IGlzIHRoZSBvbmx5IG9wdGlvbi4KPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiBSZW1vdmluZyBf
UkVBRElEIGZyb20gdGhlIGlmIGNvbmRpdGlvbiBtYWtlcyBpdCB3b3JrIGxpa2UgYSAKPj4+Pj4+
Pj4+Pj4+ID4+Pj4+Pj4+PiBjaGFybSwgSSBjYW4KPj4+Pj4+Pj4+Pj4+IHJlYWQgZGF0YSBhbmQg
bW91bnQgcGFydGl0aW9ucyB3aXRob3V0IGEgcHJvYmxlbS4KPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBLb25yYWQgRHliY2lvIDxrb25yYWQuZHliY2lvQHNvbWFpbmxp
bmUub3JnPgo+Pj4+Pj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4+Pj4+PiBUaGlzIGlzIHRvdGFsbHkganVz
dCBhbiBvYnNlcnZhdGlvbiB3aGljaCB0b29rIG1lIGFuIAo+Pj4+Pj4+Pj4+Pj4gaW5odW1hbmUg
Pj4+Pj4+Pj4+IGFtb3VudCBvZgo+Pj4+Pj4+Pj4+Pj4gZGVidWcgcHJpbnRzIHRvIGZpbmQuLiBw
ZXJoYXBzIHRoZXJlJ3MgYSBiZXR0ZXIgcmVhc29uIAo+Pj4+Pj4+Pj4+Pj4gYmVoaW5kID4+Pj4+
Pj4+PiB0aGlzLCBidXQKPj4+Pj4+Pj4+Pj4+IEkgY2FuJ3Qgc2VlbSB0byBmaW5kIGFueSBhbnN3
ZXJzLi4gVGhlcmVmb3JlLCB0aGlzIGlzIGEgQklHIAo+Pj4+Pj4+Pj4+Pj4gUkZDIQo+Pj4+Pj4+
Pj4+PiBJJ20gYWRkaW5nIHR3byBwZW9wbGUgZnJvbSBjb2RlYXVyb3JhIHdobyB3b3JrZWQgYSBs
b3Qgb24gCj4+Pj4+Pj4+Pj4+IHRoaXMgPj4+Pj4+Pj4gZHJpdmVyLgo+Pj4+Pj4+Pj4+PiBIb3Bl
ZnVsbHkgdGhleSB3aWxsIGhhdmUgYW4gaWRlYSA6KQo+Pj4+Pj4+Pj4+IFNhZHJlLCBJJ3ZlIHNw
ZW50IGEgc2lnbmlmaWNhbnQgYW1vdW50IG9mIHRpbWUgcmV2aWV3aW5nIHlvdXIgCj4+Pj4+Pj4+
Pj4gPj4+Pj4+PiBwYXRjaGVzLAo+Pj4+Pj4+Pj4+IG5vdyBpdCdzIHlvdXIgdHVybiB0byBub3Qg
dGFrZSBhIG1vbnRoIHRvIGFuc3dlciB0byB5b3VyIHBlZXJzCj4+Pj4+Pj4+Pj4gcHJvcG9zYWxz
Lgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gUGxlYXNlIGhlbHAgcmV2aWV3aW5nIHRoaXMgcGF0Y2gu
Cj4+Pj4+Pj4+PiBTb3JyeS4gSSB3YXMgaG9waW5nIHRoYXQgUWNvbSBmb2xrcyB3b3VsZCBjaGlt
ZSBpbiBhcyBJIGRvbid0IAo+Pj4+Pj4+Pj4gPj4+Pj4+IGhhdmUgYW55IGlkZWEKPj4+Pj4+Pj4+
IGFib3V0IHRoZSBtZG05NjA3IHBsYXRmb3JtLiBJdCBjb3VsZCBiZSB0aGF0IHRoZSBtYWlsIHNl
cnZlciAKPj4+Pj4+Pj4+ID4+Pj4+PiBtaWdyYXRpb24gZnJvbQo+Pj4+Pj4+Pj4gY29kZWF1cm9y
YSB0byBxdWljaW5jIHB1dCBhIGJhcnJpZXIgaGVyZS4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBMZXQg
bWUgcGluZyB0aGVtIGludGVybmFsbHkuCj4+Pj4+Pj4+IE9oLCBvaywgSSBkaWRuJ3Qga25vdy4g
VGhhbmtzIQo+Pj4+Pj4+IMKgwqDCoCBTb3JyeSBNaXF1ZWwsIHNvbWVob3cgd2UgZGlkIG5vdCBn
ZXQgdGhpcyBlbWFpbCBpbiBvdXIgaW5ib3guCj4+Pj4+Pj4gwqDCoMKgIFRoYW5rcyB0byBNYW5p
IGZvciBwaW5naW5nIHVzLCB3ZSB3aWxsIHRlc3QgdGhpcyB1cCB0b2RheSAKPj4+Pj4+PiBhbmQg
Pj4+PiBnZXQgYmFjay4KPj4+Pj4+IMKgwqAgwqAgwqAgV2hpbGUgd2UgY291bGQgbm90IHJlcHJv
ZHVjZSB0aGlzIGlzc3VlIG9uIG91ciBpcHEgYm9hcmRzIAo+Pj4+Pj4gKGRvID4+PiBub3QgaGF2
ZSBhIG1kbTk2MDcgcmlnaHQgbm93KSBhbmQKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgIGlzc3VlIGRv
ZXMgbm90IGxvb2sgYW55IG9idmlvdXMuCj4+Pj4+PiDCoMKgIMKgIMKgIGNhbiB5b3UgcGxlYXNl
IGdpdmUgdGhlIGRlYnVnIGxvZ3MgdGhhdCB5b3UgZGlkIGZvciB0aGUgCj4+Pj4+PiBhYm92ZSA+
Pj4gc3RhZ2UgYnkgc3RhZ2UgPwo+Pj4+PiBJIHdvbid0IGhhdmUgYWNjZXNzIHRvIHRoZSBib2Fy
ZCBmb3IgYWJvdXQgdHdvIHdlZWtzLCBzb3JyeS4KPj4+Pj4KPj4+Pj4gV2hlbiBJIGdldCB0byBp
dCwgSSdsbCBzdXJlbHkgdHJ5IHRvIHNlbmQgeW91IHRoZSBsb2dzLCB0aG91Z2ggdGhlcmUKPj4+
Pj4KPj4+Pj4gd2Fzbid0IG11Y2ggbW9yZSB0aGFuIGp1c3Qgc29tZXRoaW5nIGp1bXBpbmcgdG8g
d2hvLWtub3dzLXdoZXJlCj4+Pj4+Cj4+Pj4+IGFmdGVyIGNsZWFyX2JhbV90cmFuc2FjdGlvbiB3
YXMgY2FsbGVkLCByZXN1bHRpbmcgaW4gdmFsdWVzID4+IAo+Pj4+PiBhc3NvY2lhdGVkIHdpdGgK
Pj4+Pj4KPj4+Pj4gdGhlIE5BTkQgYmVpbmcgYWxsIHplcm9lZCBvdXQgaW4gcHJfZXJyL19kZWJ1
Zy9ldGMuCj4+Pj4+Cj4+Pj4gwqDCoMKgwqAgT2sgc3VyZS4gU28gd2FzIHRoZSBSRUFESUQgY29t
bWFuZCBpdHNlbGYgZmFpbGluZyAob3IpIHRoZSA+IAo+Pj4+IHN1YnNlcXVlbnQgb25lID8KPj4+
PiDCoMKgwqAgV2UgY2FuIGNoZWNrIHdoaWNoIHBhcmFtZXRlciByZXNldCBieSB0aGUgY2xlYXJf
YmFtX3RyYW5zYWN0aW9uIAo+Pj4+IGlzID4gY2F1c2luZyB0aGUKPj4+PiDCoMKgwqAgZmFpbHVy
ZS7CoCBNZWFud2hpbGUsIGxvb3BpbmcgaW4gUHJhZGVlcCB3aG8gaGFzIGFjY2VzcyB0byB0aGUg
PiAKPj4+PiBib2FyZCwgc28gaW4gYSBiZXR0ZXIKPj4+PiDCoMKgwqAgcG9zaXRpb24gdG8gZGVi
dWcuCj4+PiBJJ20gc29ycnkgSSBoYXZlIHNvIGZldyBkZXRhaWxzIG9uIGhhbmQsIGFuZCBubyBr
ZXJuZWwgdHJlZSAobm8gCj4+PiBhY2Nlc3MgdG8gdGhhdCBtYWNoaW5lIGVpdGhlciwgZm9yIG5v
dykuCj4+Pgo+Pj4KPj4+IEkgd2lsbCB0cnkgdG8gZGVzY3JpYmUgdG8gdGhlIGJlc3Qgb2YgbXkg
YWJpbGl0aWVzIHdoYXQgSSByZWNhbGwuCj4+Pgo+Pj4KPj4+IE15IG1ldGhvZG9sb2d5IG9mIG1h
a2luZyBzdXJlIHRoaW5ncyBkb24ndCBnbyBoYXl3aXJlIHdhcyB0byBwcmludCAKPj4+IHRoZSBv
b2Igc2l6ZQo+Pj4KPj4+IG9mIG91ciBOQU5EIGJhc2ljYWxseSBldmVyeSB0d28gbGluZXMgb2Yg
Y29kZSAoeWVzLCBpIHdhcyB2ZXJ5IAo+Pj4gZGVzcGVyYXRlIGF0IG9uZSBwb2ludCksCj4+Pgo+
Pj4gYXMgdGhhdCB3YXMgemVyb2VkIG91dCB3aGVuICp0aGUgYnVnKiBoYXBwZW5lZCwKPj4gVGhp
cyBkb2VzIGxvb2sgbGlrZSBhIHBvaW50ZXIgZXJyb3IgYXQgc29tZSBwb2ludCBhbmQgc29tZSBr
ZXJuZWwgZGF0YQo+PiBoYXMgYmVlbiBjb3JydXB0ZWQgdmVyeSBiYWRseSBieSB0aGUgZHJpdmVy
Lgo+Pgo+Pj4gbGVhZGluZyB0byBhIGtlcm5lbCBidWcvcGFuaWMvc3RhbGwKPj4+Cj4+PiAoY2Fu
J3QgcmVjYWxsIHdoYXQgZXhhY3RseSBpdCB3YXMsIGJ1dCBpdCBzYWlkIHNvbWV0aGluZyBhbG9u
ZyB0aGUgCj4+PiBsaW5lcyBvZiAibm8gc3VwcG9ydCBmb3IKPj4+Cj4+PiBvb2Igc2l6ZSAwIiBh
bmQgdGhlbiBpdCBkaWRuJ3QgZmFpbCBncmFjZXVsbHksIGxlYWRpbmcgdG8gc29tZSBiYWQgCj4+
PiBqdW1wcyBhbmQgdWx0aW1hdGVseQo+Pj4KPj4+IGEgZGVhZCBwbGF0Zm9ybS4uKQo+Pj4KPj4+
Cj4+PiBhZnRlciBob3VycyBvZiBkaWdnaW5nLCBJIGZvdW5kIG91dCB0aGF0IGV2ZXJ5dGhpbmcg
Z29lcyBmaW5lIHVudGlsIAo+Pj4gY2xlYXJfYmFtX3RyYW5zYWN0aW9uIGlzIGNhbGxlZCwKPj4g
RG8geW91IHJlbWVtYmVyIGlmIHRoaXMgZnVuY3Rpb24gd2FzIGNhbGxlZCBmb3IgdGhlIGZpcnN0
IHRpbWUgd2hlbgo+PiB0aGlzIGhhcHBlbmVkPwo+Cj4gSSB0aGluayBzbywgaWYgSSByZWNhbGwg
Y29ycmVjdGx5IHRoZXJlIGFyZSBubyBtb3JlIGNhbGxlcnMgaW4gdGhpcyAKPiBwYXRoLCBhcyBy
ZWFkaWQgaXMgdGhlIGZpcnN0IG5hbmQgY29tbWFuZCBleGVjdXRlZCBpbiBmbGFzaCBwcm9iZSBm
bG93Lgo+Cj4KPgo+Pgo+Pj4gYWZ0ZXIgdGhhdCBnZXRzIGV4ZWN1dGVkIGV2ZXJ5IG5hbmQgb3Ag
c3RhcnRzIHJlYWRpbmcgYWxsIHplcm9lcyAKPj4+IChmb3IgZXhhbXBsZSBpbiBKRURFQyBJRCBj
aGVjaykKPj4+Cj4+PiBzbyBJIGFkZGVkIHRoZSBjaGFuZ2VzIGZyb20gdGhpcyBwYXRjaCwgYW5k
IHRoaW5ncyBtYWdpY2FsbHkgc3RhcnRlZCAKPj4+IHdvcmtpbmcuLi4gTXkgc3VzcGljaW9uIGlz
Cj4+Pgo+Pj4gdGhhdCB0aGUgdW5kZXJseWluZyBGSUZPIGlzbid0IGZ1bGx5IGRyYWluZWQgKGlz
IGl0IGEgRklGTyBvbiA5NjA3PyAKPj4+IGJhaCwgaSB3b3JrIG9uIHRvbyBtYW55IHNvY3MgYXQg
b25jZSkKPj4gSSBkb24ndCBzZWUgaXQgaW4gdGhlIGxpc3Qgb2Ygc3VwcG9ydGVkIGRldmljZXMs
IHdoYXQncyB0aGUgZXhhY3QKPj4gY29tcGF0aWJsZSB1c2VkPwo+Cj4gcWNvbSxpcHE0MDE5LW5h
bmQKPgo+Cj4KPj4KPj4+IGFuZCB0aGlzIGZ1bmN0aW9uIG9ubHkgbWFrZXMgTGludXggdGhpbmsg
aXQgaXMsIHdpdGhvdXQgYWN0dWFsbHkgCj4+PiBkcmFpbmluZyBpdCwgYW5kIHRoZSBsZWZ0b3Zl
cgo+Pj4KPj4+IGNvbW1hbmRzIGdldCBleGVjdXRlZCB3aXRoIHNvbWUgcGFydHMgb2YgdGhlbSBn
ZXR0aW5nIG92ZXJ3cml0dGVuLCAKPj4+IHJlc3VsdGluZyBpbiB0aGUKPj4+Cj4+PiBmYW1vdXMg
Z2FyYmFnZSBpbiAtIGdhcmJhZ2Ugb3V0IHNpdHVhdGlvbiwgYnV0IHRoYXQncyBvbmx5IGEgCj4+
PiBndWVzc3RpbWF0ZS4uCj4+IEkgd291bGQgYmV0IGZvciBhIG5vbiBhbGxvY2F0ZWQgYmFtLWlz
aCBwb2ludGVyIHRoYXQgaXMgcmVzZXQgdG8gemVybwo+PiBpbiB0aGUgY2xlYXJfYmFtX3RyYW5z
YWN0aW9uKCkgaGVscGVyLgo+Pgo+PiBDYW4geW91IGdldCB5b3VyIGhhbmRzIG9uIHRoZSBib2Fy
ZCBhZ2Fpbj8KPgo+IFN1cmUsIGJ1dCBhcyBJIG1lbnRpb25lZCBwcmV2aW91c2x5LCBvbmx5IGlu
IGFib3V0IDIgd2Vla3MsIEkgY2FuJ3QgCj4gcmVhbGx5IGRvIGFueSBkZXYgYmVmb3JlIHRoZW4u
LiA6KAo+Cj4KPgo+PiBJdCB3b3VsZCBiZSBuaWNlIHRvIGNoZWNrIGlmIHRoZSBhbGxvY2F0aW9u
IGFsd2F5cyBvY2N1cnMgYmVmb3JlIHVzZSwKPj4gYW5kIGlmIHllcyBvbiBob3cgbXVjaCBieXRl
cy4KPj4KPj4gSWYgdGhlIHBvaW50ZXIgaXMgbm90IGRhbmdsaW5nLCB0aGVuIHBlcmhhcHMgc29t
ZXRoaW5nIGVsc2Ugc21hc2hlcwo+PiB0aGF0IHBvaW50ZXIuCj4KPgo+IEtvbnJhZAo+Cj4+Cj4+
PiBEbyBub3RlIHRoaXMgc29tZWhvdyB3b3JrZWQgZmluZSBvbiA1LjExIGFuZCB0aGVuIGJyb2tl
IG9uIDUuMTIvMTMuIAo+Pj4gSSB3ZW50IGFzIGZhciBhcyByZXBsYWNpbmcgbW9zdAo+Pj4KPj4+
IG9mIHRoZSBrZXJuZWwgd2l0aCB0aGUgdXBkYXRlZC9kb3duZ3JhZGVkIHBhcnRzIHZpYSBnaXQg
Y2hlY2tvdXQgKGkgCj4+PiB0cmllZCBtYW55IGNvbWJpbmF0aW9ucyksCj4+Pgo+Pj4gdG8gbm8g
YXZhaWwuLiBJIGV2ZW4gdHJpZWQgZGlmZmVyZW50IGNvbXBpbGVycyBhbmQgb3B0aW1pemF0aW9u
IAo+Pj4gbGV2ZWxzLCB0aGlua2luZyBpdCBjb3VsZCBoYXZlIGJlZW4KPj4+Cj4+PiBhIGNvZGVn
ZW4gaXNzdWUsIGJ1dCBubyBsdWNrIGVpdGhlci4KPj4+Cj4+Pgo+Pj4gSS4uIGRvIHVuZGVyc3Rh
bmQgdGhpcyBlbWFpbCBpcyBhIHRvdGFsIG1lc3MgdG8gcmVhZCwgYXMgbXVjaCBhcyBpdCAKPj4+
IHdhcyB0byB3cml0ZSwgYnV0Cj4+Pgo+Pj4gd2l0aG91dCBhY2Nlc3MgdG8gbXkgY29kZSBhbmQg
dGhlIG1hY2hpbmUgaXRzZWxmIEkgY2FuJ3QgZ2l2ZSB5b3UgCj4+PiBzb2xpZCBkZXRhaWxzLCBh
bmQKPj4+Cj4+PiB0aGUgZmFjdCB0aGlzIHNpdHVhdGlvbiBpcyBmYXIgZnJvbSBvcmRpbmFyeSBk
b2Vzbid0IGhlbHAgZWl0aGVyLi4KPj4+Cj4+Pgo+Pj4gVGhlIGxhdGVzdCAoYW5jaWVudCwgbm90
IHF1aXRlIHByZXR0eSwgYnV0IHByb2JhYmx5IHdvcmtpbmcgaWYgbXkgCj4+PiBtZW1vcnkgaXMg
Y29ycmVjdCkgdmVyc2lvbiBvZiBteSBwYXRjaGVzCj4+Pgo+Pj4gZm9yIHRoZSBtZG05NjA3IGlz
IGF2YWlsYWJsZSBhdCBbMV0sIEkgd2lsbCBwdXNoIHRoZSBuZXcgcmV2aXNpb24gCj4+PiBhZnRl
ciBJIGdldCBhY2Nlc3MgdG8gdGhlIHdvcmtzdGF0aW9uLgo+Pj4KIMKgICsgZmV3IG1vcmUgd2hv
IGhhdmUgYWNjZXNzIHRvIHRoZSBib2FyZC4KCiDCoMKgIEdvaW5nIGJ5IHRoZSBkZXNjcmlwdGlv
biwgZm9yIGtlcm5lbCBjb3JydXB0aW9uLCB3ZSBjYW4gdHJ5IG91dCBhIApLQVNBTiBidWlsZC4K
IMKgwqAgU2luY2UgeW91IGhhdmUgbWVudGlvbmVkIGl0IHdvcmtlZCB0aWxsIDUuMTEsIHlvdSBi
aXNlY3RlZCB0aGUgCmRyaXZlciB0aWxsIDUuMTEgaGVhZCBhbmQgaXQgd29ya2VkID8KClJlZ2Fy
ZHMsCiDCoMKgIFNyaWNoYXJhbgoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
