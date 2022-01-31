Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FE7C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 14:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVxStZ6NCibQ3iEVvEincrwgK52Ibzy5VHi86yr6Ddo=; b=hz1+28tG5aX6I6xODo4T9tKYOE
	yPBoaeTMU+TUBjHr4nQArbmbX1JSS/+Zp6LcTWwg6Htn4G7R/b+uZJJSmKLXTiijbFqOA/oX2THX1
	7rZ/Opg2Ty95NZUyJwrnEIqFLotY/X/LjofqarI3Lce90JK5zRcaAwzukxvAE0fCijtgVW9ZCo0uB
	Q+/IA3oL+S3Cj1N/8EuXZu/ORwxkjRNZxB7tWhFWSEUZg1j1FcCDKztv8+7H8mjUgbovkWmVeNLNy
	0CBMf/G+UfLmlIaXa/2qDdHf44mlzbUJnYnhheUE3UGQ38pOj1+yfEZ3Y/2CvhQ6h6HXqXsMvLtYh
	iA6vGiPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEXQk-009Za6-VD; Mon, 31 Jan 2022 14:13:19 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEXQh-009ZZM-QB
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 14:13:17 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1643638393; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=HHc7r3nTW7LvI6JuHzsTAZhfU68I0uEaz59BkQU4fJI=;
 b=oufe06DKJBoyW7VEIm1D0Kt6RYkTe8pEx5TkGSvYEvpytLegoxKf6mUkW0apmyvKNHLhASUd
 gwCPyuYjrB/YrjfamidKkZqhMCdnu2WyZI1xZBv/82PsxgTFv5q4vjK+fsL2mHDtEldGUvrp
 wvVIqr0Xpr5nrDWi2j0VZFP9Y2E=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 61f7ee78e42a102d96f9e295 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 31 Jan 2022 14:13:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D63F8C43635; Mon, 31 Jan 2022 14:13:11 +0000 (UTC)
Received: from [192.168.0.104] (unknown [183.82.28.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: sricharan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3760AC4338F;
 Mon, 31 Jan 2022 14:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 3760AC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH] mtd: nand: raw: qcom_nandc: Don't clear_bam_transaction
 on READID
To: Konrad Dybcio <konrad.dybcio@somainline.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Manivannan Sadhasivam <mani@kernel.org>, pragalla@codeaurora.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 jamipkettunen@somainline.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 mdalam@codeaurora.org
References: <20220113184427.2259509-1-konrad.dybcio@somainline.org>
 <20220114082718.32a2fc83@xps13> <20220126111613.3ab0021e@xps13>
 <20220126103316.GA212068@thinkpad> <20220126114200.4cc3c21b@xps13>
 <fc80a6e7-bd44-3b3e-fca2-1316a76d65f5@codeaurora.org>
 <a6fcc533-e7cd-7b55-4db0-cec80c07b46a@codeaurora.org>
 <0a8d6550-aa19-0af1-abae-66bf34c91ea8@somainline.org>
From: Sricharan Ramabadhran <sricharan@codeaurora.org>
Message-ID: <be779ed9-bd80-8f01-fe7f-d3c07d3d85aa@codeaurora.org>
Date: Mon, 31 Jan 2022 19:43:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <0a8d6550-aa19-0af1-abae-66bf34c91ea8@somainline.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_061315_948861_3E4D2671 
X-CRM114-Status: GOOD (  22.90  )
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

SGkgS29ucmFkLAoKT24gMS8zMS8yMDIyIDM6MzkgUE0sIEtvbnJhZCBEeWJjaW8gd3JvdGU6Cj4K
PiBPbiAyOC8wMS8yMDIyIDE4OjUwLCBTcmljaGFyYW4gUmFtYWJhZGhyYW4gd3JvdGU6Cj4+IEhp
IEtvbnJhZCwKPj4KPj4gT24gMS8yOC8yMDIyIDk6NTUgQU0sIFNyaWNoYXJhbiBSYW1hYmFkaHJh
biB3cm90ZToKPj4+IEhpIE1pcXVlbCwKPj4+Cj4+PiBPbiAxLzI2LzIwMjIgNDoxMiBQTSwgTWlx
dWVsIFJheW5hbCB3cm90ZToKPj4+PiBIaSBNYW5pLAo+Pj4+Cj4+Pj4gbWFuaUBrZXJuZWwub3Jn
IHdyb3RlIG9uIFdlZCwgMjYgSmFuIDIwMjIgMTY6MDM6MTYgKzA1MzA6Cj4+Pj4KPj4+Pj4gT24g
V2VkLCBKYW4gMjYsIDIwMjIgYXQgMTE6MTY6MTNBTSArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90
ZToKPj4+Pj4+IEhlbGxvLAo+Pj4+Pj4KPj4+Pj4+IG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20g
d3JvdGUgb24gRnJpLCAxNCBKYW4gMjAyMiAwODoyNzoxOCArMDEwMDoKPj4+Pj4+PiBIaSBLb25y
YWQsCj4+Pj4+Pj4KPj4+Pj4+PiBrb25yYWQuZHliY2lvQHNvbWFpbmxpbmUub3JnIHdyb3RlIG9u
IFRodSwgMTMgSmFuIDIwMjIgMTk6NDQ6MjYgCj4+Pj4+Pj4gKzAxMDA6Cj4+Pj4+Pj4+IFdoaWxl
IEkgaGF2ZSBhYnNvbHV0ZWx5IDAgaWRlYSB3aHkgYW5kIGhvdywgcnVubmluZyAKPj4+Pj4+Pj4g
Y2xlYXJfYmFtX3RyYW5zYWN0aW9uCj4+Pj4+Pj4+IHdoZW4gUkVBRElEIGlzIGlzc3VlZCBtYWtl
cyB0aGUgRE1BIHRvdGFsbHkgY2xvZyB1cCBhbmQgcmVmdXNlIAo+Pj4+Pj4+PiB0byBmdW5jdGlv
bgo+Pj4+Pj4+PiBhdCBhbGwgb24gbWRtOTYwNy4gSW4gZmFjdCwgaXQgaXMgc28gYmFkIHRoYXQg
YWxsIHRoZSBkYXRhIGdldHMgCj4+Pj4+Pj4+IGdhcmJsZWQKPj4+Pj4+Pj4gYW5kIGFmdGVyIGEg
c2hvcnQgd2hpbGUgaW4gdGhlIG5hbmQgcHJvYmUgZmxvdywgdGhlIENQVSBkZWNpZGVzIAo+Pj4+
Pj4+PiB0aGF0Cj4+Pj4+Pj4+IHNlcHVrdSBpcyB0aGUgb25seSBvcHRpb24uCj4+Pj4+Pj4+Cj4+
Pj4+Pj4+IFJlbW92aW5nIF9SRUFESUQgZnJvbSB0aGUgaWYgY29uZGl0aW9uIG1ha2VzIGl0IHdv
cmsgbGlrZSBhIAo+Pj4+Pj4+PiBjaGFybSwgSSBjYW4KPj4+Pj4+Pj4gcmVhZCBkYXRhIGFuZCBt
b3VudCBwYXJ0aXRpb25zIHdpdGhvdXQgYSBwcm9ibGVtLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBLb25yYWQgRHliY2lvIDxrb25yYWQuZHliY2lvQHNvbWFpbmxpbmUub3JnPgo+
Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4gVGhpcyBpcyB0b3RhbGx5IGp1c3QgYW4gb2JzZXJ2YXRpb24g
d2hpY2ggdG9vayBtZSBhbiBpbmh1bWFuZSAKPj4+Pj4+Pj4gYW1vdW50IG9mCj4+Pj4+Pj4+IGRl
YnVnIHByaW50cyB0byBmaW5kLi4gcGVyaGFwcyB0aGVyZSdzIGEgYmV0dGVyIHJlYXNvbiBiZWhp
bmQgCj4+Pj4+Pj4+IHRoaXMsIGJ1dAo+Pj4+Pj4+PiBJIGNhbid0IHNlZW0gdG8gZmluZCBhbnkg
YW5zd2Vycy4uIFRoZXJlZm9yZSwgdGhpcyBpcyBhIEJJRyBSRkMhCj4+Pj4+Pj4gSSdtIGFkZGlu
ZyB0d28gcGVvcGxlIGZyb20gY29kZWF1cm9yYSB3aG8gd29ya2VkIGEgbG90IG9uIHRoaXMgCj4+
Pj4+Pj4gZHJpdmVyLgo+Pj4+Pj4+IEhvcGVmdWxseSB0aGV5IHdpbGwgaGF2ZSBhbiBpZGVhIDop
Cj4+Pj4+PiBTYWRyZSwgSSd2ZSBzcGVudCBhIHNpZ25pZmljYW50IGFtb3VudCBvZiB0aW1lIHJl
dmlld2luZyB5b3VyIAo+Pj4+Pj4gcGF0Y2hlcywKPj4+Pj4+IG5vdyBpdCdzIHlvdXIgdHVybiB0
byBub3QgdGFrZSBhIG1vbnRoIHRvIGFuc3dlciB0byB5b3VyIHBlZXJzCj4+Pj4+PiBwcm9wb3Nh
bHMuCj4+Pj4+Pgo+Pj4+Pj4gUGxlYXNlIGhlbHAgcmV2aWV3aW5nIHRoaXMgcGF0Y2guCj4+Pj4+
IFNvcnJ5LiBJIHdhcyBob3BpbmcgdGhhdCBRY29tIGZvbGtzIHdvdWxkIGNoaW1lIGluIGFzIEkg
ZG9uJ3QgaGF2ZSAKPj4+Pj4gYW55IGlkZWEKPj4+Pj4gYWJvdXQgdGhlIG1kbTk2MDcgcGxhdGZv
cm0uIEl0IGNvdWxkIGJlIHRoYXQgdGhlIG1haWwgc2VydmVyIAo+Pj4+PiBtaWdyYXRpb24gZnJv
bQo+Pj4+PiBjb2RlYXVyb3JhIHRvIHF1aWNpbmMgcHV0IGEgYmFycmllciBoZXJlLgo+Pj4+Pgo+
Pj4+PiBMZXQgbWUgcGluZyB0aGVtIGludGVybmFsbHkuCj4+Pj4gT2gsIG9rLCBJIGRpZG4ndCBr
bm93LiBUaGFua3MhCj4+Pgo+Pj4gwqDCoCBTb3JyeSBNaXF1ZWwsIHNvbWVob3cgd2UgZGlkIG5v
dCBnZXQgdGhpcyBlbWFpbCBpbiBvdXIgaW5ib3guCj4+PiDCoMKgIFRoYW5rcyB0byBNYW5pIGZv
ciBwaW5naW5nIHVzLCB3ZSB3aWxsIHRlc3QgdGhpcyB1cCB0b2RheSBhbmQgZ2V0IAo+Pj4gYmFj
ay4KPj4+Cj4+IMKgIMKgIMKgIFdoaWxlIHdlIGNvdWxkIG5vdCByZXByb2R1Y2UgdGhpcyBpc3N1
ZSBvbiBvdXIgaXBxIGJvYXJkcyAoZG8gCj4+IG5vdCBoYXZlIGEgbWRtOTYwNyByaWdodCBub3cp
IGFuZAo+PiDCoMKgwqDCoMKgwqAgaXNzdWUgZG9lcyBub3QgbG9vayBhbnkgb2J2aW91cy4KPj4g
wqAgwqAgwqAgY2FuIHlvdSBwbGVhc2UgZ2l2ZSB0aGUgZGVidWcgbG9ncyB0aGF0IHlvdSBkaWQg
Zm9yIHRoZSBhYm92ZSAKPj4gc3RhZ2UgYnkgc3RhZ2UgPwo+Cj4gSSB3b24ndCBoYXZlIGFjY2Vz
cyB0byB0aGUgYm9hcmQgZm9yIGFib3V0IHR3byB3ZWVrcywgc29ycnkuCj4KPiBXaGVuIEkgZ2V0
IHRvIGl0LCBJJ2xsIHN1cmVseSB0cnkgdG8gc2VuZCB5b3UgdGhlIGxvZ3MsIHRob3VnaCB0aGVy
ZQo+Cj4gd2Fzbid0IG11Y2ggbW9yZSB0aGFuIGp1c3Qgc29tZXRoaW5nIGp1bXBpbmcgdG8gd2hv
LWtub3dzLXdoZXJlCj4KPiBhZnRlciBjbGVhcl9iYW1fdHJhbnNhY3Rpb24gd2FzIGNhbGxlZCwg
cmVzdWx0aW5nIGluIHZhbHVlcyBhc3NvY2lhdGVkIAo+IHdpdGgKPgo+IHRoZSBOQU5EIGJlaW5n
IGFsbCB6ZXJvZWQgb3V0IGluIHByX2Vyci9fZGVidWcvZXRjLgo+Cj4KIMKgwqDCoCBPayBzdXJl
LiBTbyB3YXMgdGhlIFJFQURJRCBjb21tYW5kIGl0c2VsZiBmYWlsaW5nIChvcikgdGhlIApzdWJz
ZXF1ZW50IG9uZSA/CiDCoMKgIFdlIGNhbiBjaGVjayB3aGljaCBwYXJhbWV0ZXIgcmVzZXQgYnkg
dGhlIGNsZWFyX2JhbV90cmFuc2FjdGlvbiBpcyAKY2F1c2luZyB0aGUKIMKgwqAgZmFpbHVyZS7C
oCBNZWFud2hpbGUsIGxvb3BpbmcgaW4gUHJhZGVlcCB3aG8gaGFzIGFjY2VzcyB0byB0aGUgYm9h
cmQsIApzbyBpbiBhIGJldHRlcgogwqDCoCBwb3NpdGlvbiB0byBkZWJ1Zy4KClJlZ2FyZHMsCiDC
oMKgIFNyaWNoYXJhbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
