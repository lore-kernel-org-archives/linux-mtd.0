Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BDAC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Feb 2022 17:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xaO95vPdxw+TPgIuOvgn99lvrX25BEk/tAU4hsyArZY=; b=Z29TR6XZBVp43Oy5JlXrygFZFc
	4ieI027qfOhW/bdiZ44/4gXpQh+T2RvFWPERVeTBo1YkdZHwDiRwxgGsX5D8kZspjnDUPrPZwiCo5
	TTsmy724oCAexKUIumffbVl93MDOaR7QbxnxQdqcFXXLWHvwvf8uGT6G6HHKJDevvfr4M2CX/uyBt
	IueyhSlrw89N2TO1ZTZWOo6MsfdplGyVQp2AnyjDI38/keCnS1ToFSsRBoVT3veV+RsMqvsKHxepO
	3O24JpTJXwxpkGMDU74Gojf/Rp9FM3dqaf/uhBVP0pLzsn5cwLqEeKNg8g9KaWTQArel+VmIxvwDU
	/ezAD/KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nG2Da-004zPm-HE; Fri, 04 Feb 2022 17:17:54 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nG2DW-004zP6-Mq
 for linux-mtd@lists.infradead.org; Fri, 04 Feb 2022 17:17:52 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1643995069; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To: From:
 Subject: Sender; bh=xeHh+pa7fmmtJaUQiZc4mFN9NjxA7Uxxmuyz53pl2r8=;
 b=kZrQFQZAn4Mq4oJelsrQlKztDAuXQglAvdu8GABj0bkd6zHRCiGeOy0ARbS9XzBzIDbJ4AlY
 UqWEvaOvp2ki1NOgtQfSezgo1T3h550+CE66N5GOvcyT8i1K8n2vEO3qkNF79GfJwe67uGO5
 lROA8hA+FitdN1n+MyL8fyDZl20=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 61fd5fbc2afeb7f9b5600fd1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 04 Feb 2022 17:17:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BFA94C43618; Fri,  4 Feb 2022 17:17:37 +0000 (UTC)
Received: from [192.168.0.104] (unknown [183.82.28.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: sricharan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E2448C4338F;
 Fri,  4 Feb 2022 17:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E2448C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH] mtd: nand: raw: qcom_nandc: Don't clear_bam_transaction
 on READID
From: Sricharan Ramabadhran <sricharan@codeaurora.org>
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
Message-ID: <cc1302f4-9150-0145-421c-bf2b7a7bf258@codeaurora.org>
Date: Fri, 4 Feb 2022 22:47:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c63d5410-7f08-80fe-28ac-f4867038ff30@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_091750_866440_5DE2E5C8 
X-CRM114-Status: GOOD (  40.11  )
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

Ck9uIDIvMi8yMDIyIDEyOjU0IFBNLCBTcmljaGFyYW4gUmFtYWJhZGhyYW4gd3JvdGU6Cj4gSGkg
S29ucmFkL01pcXVlbCwKPgo+IE9uIDIvMS8yMDIyIDk6MjEgUE0sIEtvbnJhZCBEeWJjaW8gd3Jv
dGU6Cj4+Cj4+IE9uIDAxLzAyLzIwMjIgMTQ6NTIsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+PiBI
aSBLb25yYWQsCj4+Pgo+Pj4ga29ucmFkLmR5YmNpb0Bzb21haW5saW5lLm9yZyB3cm90ZSBvbiBN
b24sIDMxIEphbiAyMDIyIDIwOjU0OjEyICswMTAwOgo+Pj4KPj4+PiBPbiAzMS8wMS8yMDIyIDE1
OjEzLCBTcmljaGFyYW4gUmFtYWJhZGhyYW4gd3JvdGU6Cj4+Pj4+IEhpIEtvbnJhZCwKPj4+Pj4K
Pj4+Pj4gT24gMS8zMS8yMDIyIDM6MzkgUE0sIEtvbnJhZCBEeWJjaW8gd3JvdGU6Cj4+Pj4+PiBP
biAyOC8wMS8yMDIyIDE4OjUwLCBTcmljaGFyYW4gUmFtYWJhZGhyYW4gd3JvdGU6Cj4+Pj4+Pj4g
SGkgS29ucmFkLAo+Pj4+Pj4+Cj4+Pj4+Pj4gT24gMS8yOC8yMDIyIDk6NTUgQU0sIFNyaWNoYXJh
biBSYW1hYmFkaHJhbiB3cm90ZToKPj4+Pj4+Pj4gSGkgTWlxdWVsLAo+Pj4+Pj4+Pgo+Pj4+Pj4+
PiBPbiAxLzI2LzIwMjIgNDoxMiBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+Pj4+Pj4+IEhp
IE1hbmksCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gbWFuaUBrZXJuZWwub3JnIHdyb3RlIG9uIFdlZCwg
MjYgSmFuIDIwMjIgMTY6MDM6MTYgKzA1MzA6Cj4+Pj4+Pj4+Pj4gT24gV2VkLCBKYW4gMjYsIDIw
MjIgYXQgMTE6MTY6MTNBTSArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+Pj4+Pj4+Pj4g
SGVsbG8sCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20g
d3JvdGUgb24gRnJpLCAxNCBKYW4gMjAyMiAwODoyNzoxOCAKPj4+Pj4+Pj4+Pj4gKzAxMDA6Cj4+
Pj4+Pj4+Pj4+PiBIaSBLb25yYWQsCj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4ga29ucmFkLmR5
YmNpb0Bzb21haW5saW5lLm9yZyB3cm90ZSBvbiBUaHUsIDEzIEphbiAyMDIyIAo+Pj4+Pj4+Pj4+
Pj4gMTk6NDQ6MjYgPj4+Pj4+Pj4gKzAxMDA6Cj4+Pj4+Pj4+Pj4+Pj4gV2hpbGUgSSBoYXZlIGFi
c29sdXRlbHkgMCBpZGVhIHdoeSBhbmQgaG93LCBydW5uaW5nIAo+Pj4+Pj4+Pj4+Pj4+ID4+Pj4+
Pj4+PiBjbGVhcl9iYW1fdHJhbnNhY3Rpb24KPj4+Pj4+Pj4+Pj4+PiB3aGVuIFJFQURJRCBpcyBp
c3N1ZWQgbWFrZXMgdGhlIERNQSB0b3RhbGx5IGNsb2cgdXAgYW5kIAo+Pj4+Pj4+Pj4+Pj4+IHJl
ZnVzZSA+Pj4+Pj4+Pj4gdG8gZnVuY3Rpb24KPj4+Pj4+Pj4+Pj4+PiBhdCBhbGwgb24gbWRtOTYw
Ny4gSW4gZmFjdCwgaXQgaXMgc28gYmFkIHRoYXQgYWxsIHRoZSBkYXRhIAo+Pj4+Pj4+Pj4+Pj4+
ID4+Pj4+Pj4+PiBnZXRzIGdhcmJsZWQKPj4+Pj4+Pj4+Pj4+PiBhbmQgYWZ0ZXIgYSBzaG9ydCB3
aGlsZSBpbiB0aGUgbmFuZCBwcm9iZSBmbG93LCB0aGUgQ1BVIAo+Pj4+Pj4+Pj4+Pj4+ID4+Pj4+
Pj4+PiBkZWNpZGVzIHRoYXQKPj4+Pj4+Pj4+Pj4+PiBzZXB1a3UgaXMgdGhlIG9ubHkgb3B0aW9u
Lgo+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4gUmVtb3ZpbmcgX1JFQURJRCBmcm9tIHRoZSBp
ZiBjb25kaXRpb24gbWFrZXMgaXQgd29yayBsaWtlIAo+Pj4+Pj4+Pj4+Pj4+IGEgPj4+Pj4+Pj4+
IGNoYXJtLCBJIGNhbgo+Pj4+Pj4+Pj4+Pj4+IHJlYWQgZGF0YSBhbmQgbW91bnQgcGFydGl0aW9u
cyB3aXRob3V0IGEgcHJvYmxlbS4KPj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IEtvbnJhZCBEeWJjaW8gPGtvbnJhZC5keWJjaW9Ac29tYWlubGluZS5vcmc+Cj4+Pj4+
Pj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4+Pj4+Pj4gVGhpcyBpcyB0b3RhbGx5IGp1c3QgYW4gb2JzZXJ2
YXRpb24gd2hpY2ggdG9vayBtZSBhbiAKPj4+Pj4+Pj4+Pj4+PiBpbmh1bWFuZSA+Pj4+Pj4+Pj4g
YW1vdW50IG9mCj4+Pj4+Pj4+Pj4+Pj4gZGVidWcgcHJpbnRzIHRvIGZpbmQuLiBwZXJoYXBzIHRo
ZXJlJ3MgYSBiZXR0ZXIgcmVhc29uIAo+Pj4+Pj4+Pj4+Pj4+IGJlaGluZCA+Pj4+Pj4+Pj4gdGhp
cywgYnV0Cj4+Pj4+Pj4+Pj4+Pj4gSSBjYW4ndCBzZWVtIHRvIGZpbmQgYW55IGFuc3dlcnMuLiBU
aGVyZWZvcmUsIHRoaXMgaXMgYSAKPj4+Pj4+Pj4+Pj4+PiBCSUcgUkZDIQo+Pj4+Pj4+Pj4+Pj4g
SSdtIGFkZGluZyB0d28gcGVvcGxlIGZyb20gY29kZWF1cm9yYSB3aG8gd29ya2VkIGEgbG90IG9u
IAo+Pj4+Pj4+Pj4+Pj4gdGhpcyA+Pj4+Pj4+PiBkcml2ZXIuCj4+Pj4+Pj4+Pj4+PiBIb3BlZnVs
bHkgdGhleSB3aWxsIGhhdmUgYW4gaWRlYSA6KQo+Pj4+Pj4+Pj4+PiBTYWRyZSwgSSd2ZSBzcGVu
dCBhIHNpZ25pZmljYW50IGFtb3VudCBvZiB0aW1lIHJldmlld2luZyAKPj4+Pj4+Pj4+Pj4geW91
ciA+Pj4+Pj4+IHBhdGNoZXMsCj4+Pj4+Pj4+Pj4+IG5vdyBpdCdzIHlvdXIgdHVybiB0byBub3Qg
dGFrZSBhIG1vbnRoIHRvIGFuc3dlciB0byB5b3VyIHBlZXJzCj4+Pj4+Pj4+Pj4+IHByb3Bvc2Fs
cy4KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gUGxlYXNlIGhlbHAgcmV2aWV3aW5nIHRoaXMgcGF0
Y2guCj4+Pj4+Pj4+Pj4gU29ycnkuIEkgd2FzIGhvcGluZyB0aGF0IFFjb20gZm9sa3Mgd291bGQg
Y2hpbWUgaW4gYXMgSSBkb24ndCAKPj4+Pj4+Pj4+PiA+Pj4+Pj4gaGF2ZSBhbnkgaWRlYQo+Pj4+
Pj4+Pj4+IGFib3V0IHRoZSBtZG05NjA3IHBsYXRmb3JtLiBJdCBjb3VsZCBiZSB0aGF0IHRoZSBt
YWlsIHNlcnZlciAKPj4+Pj4+Pj4+PiA+Pj4+Pj4gbWlncmF0aW9uIGZyb20KPj4+Pj4+Pj4+PiBj
b2RlYXVyb3JhIHRvIHF1aWNpbmMgcHV0IGEgYmFycmllciBoZXJlLgo+Pj4+Pj4+Pj4+Cj4+Pj4+
Pj4+Pj4gTGV0IG1lIHBpbmcgdGhlbSBpbnRlcm5hbGx5Lgo+Pj4+Pj4+Pj4gT2gsIG9rLCBJIGRp
ZG4ndCBrbm93LiBUaGFua3MhCj4+Pj4+Pj4+IMKgwqDCoCBTb3JyeSBNaXF1ZWwsIHNvbWVob3cg
d2UgZGlkIG5vdCBnZXQgdGhpcyBlbWFpbCBpbiBvdXIgaW5ib3guCj4+Pj4+Pj4+IMKgwqDCoCBU
aGFua3MgdG8gTWFuaSBmb3IgcGluZ2luZyB1cywgd2Ugd2lsbCB0ZXN0IHRoaXMgdXAgdG9kYXkg
Cj4+Pj4+Pj4+IGFuZCA+Pj4+IGdldCBiYWNrLgo+Pj4+Pj4+IMKgwqAgwqAgwqAgV2hpbGUgd2Ug
Y291bGQgbm90IHJlcHJvZHVjZSB0aGlzIGlzc3VlIG9uIG91ciBpcHEgYm9hcmRzIAo+Pj4+Pj4+
IChkbyA+Pj4gbm90IGhhdmUgYSBtZG05NjA3IHJpZ2h0IG5vdykgYW5kCj4+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqAgaXNzdWUgZG9lcyBub3QgbG9vayBhbnkgb2J2aW91cy4KPj4+Pj4+PiDCoMKgIMKg
IMKgIGNhbiB5b3UgcGxlYXNlIGdpdmUgdGhlIGRlYnVnIGxvZ3MgdGhhdCB5b3UgZGlkIGZvciB0
aGUgCj4+Pj4+Pj4gYWJvdmUgPj4+IHN0YWdlIGJ5IHN0YWdlID8KPj4+Pj4+IEkgd29uJ3QgaGF2
ZSBhY2Nlc3MgdG8gdGhlIGJvYXJkIGZvciBhYm91dCB0d28gd2Vla3MsIHNvcnJ5Lgo+Pj4+Pj4K
Pj4+Pj4+IFdoZW4gSSBnZXQgdG8gaXQsIEknbGwgc3VyZWx5IHRyeSB0byBzZW5kIHlvdSB0aGUg
bG9ncywgdGhvdWdoIHRoZXJlCj4+Pj4+Pgo+Pj4+Pj4gd2Fzbid0IG11Y2ggbW9yZSB0aGFuIGp1
c3Qgc29tZXRoaW5nIGp1bXBpbmcgdG8gd2hvLWtub3dzLXdoZXJlCj4+Pj4+Pgo+Pj4+Pj4gYWZ0
ZXIgY2xlYXJfYmFtX3RyYW5zYWN0aW9uIHdhcyBjYWxsZWQsIHJlc3VsdGluZyBpbiB2YWx1ZXMg
Pj4gCj4+Pj4+PiBhc3NvY2lhdGVkIHdpdGgKPj4+Pj4+Cj4+Pj4+PiB0aGUgTkFORCBiZWluZyBh
bGwgemVyb2VkIG91dCBpbiBwcl9lcnIvX2RlYnVnL2V0Yy4KPj4+Pj4+Cj4+Pj4+IMKgwqDCoMKg
IE9rIHN1cmUuIFNvIHdhcyB0aGUgUkVBRElEIGNvbW1hbmQgaXRzZWxmIGZhaWxpbmcgKG9yKSB0
aGUgPiAKPj4+Pj4gc3Vic2VxdWVudCBvbmUgPwo+Pj4+PiDCoMKgwqAgV2UgY2FuIGNoZWNrIHdo
aWNoIHBhcmFtZXRlciByZXNldCBieSB0aGUgCj4+Pj4+IGNsZWFyX2JhbV90cmFuc2FjdGlvbiBp
cyA+IGNhdXNpbmcgdGhlCj4+Pj4+IMKgwqDCoCBmYWlsdXJlLsKgIE1lYW53aGlsZSwgbG9vcGlu
ZyBpbiBQcmFkZWVwIHdobyBoYXMgYWNjZXNzIHRvIHRoZSAKPj4+Pj4gPiBib2FyZCwgc28gaW4g
YSBiZXR0ZXIKPj4+Pj4gwqDCoMKgIHBvc2l0aW9uIHRvIGRlYnVnLgo+Pj4+IEknbSBzb3JyeSBJ
IGhhdmUgc28gZmV3IGRldGFpbHMgb24gaGFuZCwgYW5kIG5vIGtlcm5lbCB0cmVlIChubyAKPj4+
PiBhY2Nlc3MgdG8gdGhhdCBtYWNoaW5lIGVpdGhlciwgZm9yIG5vdykuCj4+Pj4KPj4+Pgo+Pj4+
IEkgd2lsbCB0cnkgdG8gZGVzY3JpYmUgdG8gdGhlIGJlc3Qgb2YgbXkgYWJpbGl0aWVzIHdoYXQg
SSByZWNhbGwuCj4+Pj4KPj4+Pgo+Pj4+IE15IG1ldGhvZG9sb2d5IG9mIG1ha2luZyBzdXJlIHRo
aW5ncyBkb24ndCBnbyBoYXl3aXJlIHdhcyB0byBwcmludCAKPj4+PiB0aGUgb29iIHNpemUKPj4+
Pgo+Pj4+IG9mIG91ciBOQU5EIGJhc2ljYWxseSBldmVyeSB0d28gbGluZXMgb2YgY29kZSAoeWVz
LCBpIHdhcyB2ZXJ5IAo+Pj4+IGRlc3BlcmF0ZSBhdCBvbmUgcG9pbnQpLAo+Pj4+Cj4+Pj4gYXMg
dGhhdCB3YXMgemVyb2VkIG91dCB3aGVuICp0aGUgYnVnKiBoYXBwZW5lZCwKPj4+IFRoaXMgZG9l
cyBsb29rIGxpa2UgYSBwb2ludGVyIGVycm9yIGF0IHNvbWUgcG9pbnQgYW5kIHNvbWUga2VybmVs
IGRhdGEKPj4+IGhhcyBiZWVuIGNvcnJ1cHRlZCB2ZXJ5IGJhZGx5IGJ5IHRoZSBkcml2ZXIuCj4+
Pgo+Pj4+IGxlYWRpbmcgdG8gYSBrZXJuZWwgYnVnL3BhbmljL3N0YWxsCj4+Pj4KPj4+PiAoY2Fu
J3QgcmVjYWxsIHdoYXQgZXhhY3RseSBpdCB3YXMsIGJ1dCBpdCBzYWlkIHNvbWV0aGluZyBhbG9u
ZyB0aGUgCj4+Pj4gbGluZXMgb2YgIm5vIHN1cHBvcnQgZm9yCj4+Pj4KPj4+PiBvb2Igc2l6ZSAw
IiBhbmQgdGhlbiBpdCBkaWRuJ3QgZmFpbCBncmFjZXVsbHksIGxlYWRpbmcgdG8gc29tZSBiYWQg
Cj4+Pj4ganVtcHMgYW5kIHVsdGltYXRlbHkKPj4+Pgo+Pj4+IGEgZGVhZCBwbGF0Zm9ybS4uKQo+
Pj4+Cj4+Pj4KPj4+PiBhZnRlciBob3VycyBvZiBkaWdnaW5nLCBJIGZvdW5kIG91dCB0aGF0IGV2
ZXJ5dGhpbmcgZ29lcyBmaW5lIHVudGlsIAo+Pj4+IGNsZWFyX2JhbV90cmFuc2FjdGlvbiBpcyBj
YWxsZWQsCj4+PiBEbyB5b3UgcmVtZW1iZXIgaWYgdGhpcyBmdW5jdGlvbiB3YXMgY2FsbGVkIGZv
ciB0aGUgZmlyc3QgdGltZSB3aGVuCj4+PiB0aGlzIGhhcHBlbmVkPwo+Pgo+PiBJIHRoaW5rIHNv
LCBpZiBJIHJlY2FsbCBjb3JyZWN0bHkgdGhlcmUgYXJlIG5vIG1vcmUgY2FsbGVycyBpbiB0aGlz
IAo+PiBwYXRoLCBhcyByZWFkaWQgaXMgdGhlIGZpcnN0IG5hbmQgY29tbWFuZCBleGVjdXRlZCBp
biBmbGFzaCBwcm9iZSBmbG93Lgo+Pgo+Pgo+Pgo+Pj4KPj4+PiBhZnRlciB0aGF0IGdldHMgZXhl
Y3V0ZWQgZXZlcnkgbmFuZCBvcCBzdGFydHMgcmVhZGluZyBhbGwgemVyb2VzIAo+Pj4+IChmb3Ig
ZXhhbXBsZSBpbiBKRURFQyBJRCBjaGVjaykKPj4+Pgo+Pj4+IHNvIEkgYWRkZWQgdGhlIGNoYW5n
ZXMgZnJvbSB0aGlzIHBhdGNoLCBhbmQgdGhpbmdzIG1hZ2ljYWxseSAKPj4+PiBzdGFydGVkIHdv
cmtpbmcuLi4gTXkgc3VzcGljaW9uIGlzCj4+Pj4KPj4+PiB0aGF0IHRoZSB1bmRlcmx5aW5nIEZJ
Rk8gaXNuJ3QgZnVsbHkgZHJhaW5lZCAoaXMgaXQgYSBGSUZPIG9uIDk2MDc/IAo+Pj4+IGJhaCwg
aSB3b3JrIG9uIHRvbyBtYW55IHNvY3MgYXQgb25jZSkKPj4+IEkgZG9uJ3Qgc2VlIGl0IGluIHRo
ZSBsaXN0IG9mIHN1cHBvcnRlZCBkZXZpY2VzLCB3aGF0J3MgdGhlIGV4YWN0Cj4+PiBjb21wYXRp
YmxlIHVzZWQ/Cj4+Cj4+IHFjb20saXBxNDAxOS1uYW5kCj4+Cj4+Cj4+Cj4+Pgo+Pj4+IGFuZCB0
aGlzIGZ1bmN0aW9uIG9ubHkgbWFrZXMgTGludXggdGhpbmsgaXQgaXMsIHdpdGhvdXQgYWN0dWFs
bHkgCj4+Pj4gZHJhaW5pbmcgaXQsIGFuZCB0aGUgbGVmdG92ZXIKPj4+Pgo+Pj4+IGNvbW1hbmRz
IGdldCBleGVjdXRlZCB3aXRoIHNvbWUgcGFydHMgb2YgdGhlbSBnZXR0aW5nIG92ZXJ3cml0dGVu
LCAKPj4+PiByZXN1bHRpbmcgaW4gdGhlCj4+Pj4KPj4+PiBmYW1vdXMgZ2FyYmFnZSBpbiAtIGdh
cmJhZ2Ugb3V0IHNpdHVhdGlvbiwgYnV0IHRoYXQncyBvbmx5IGEgCj4+Pj4gZ3Vlc3N0aW1hdGUu
Lgo+Pj4gSSB3b3VsZCBiZXQgZm9yIGEgbm9uIGFsbG9jYXRlZCBiYW0taXNoIHBvaW50ZXIgdGhh
dCBpcyByZXNldCB0byB6ZXJvCj4+PiBpbiB0aGUgY2xlYXJfYmFtX3RyYW5zYWN0aW9uKCkgaGVs
cGVyLgo+Pj4KPj4+IENhbiB5b3UgZ2V0IHlvdXIgaGFuZHMgb24gdGhlIGJvYXJkIGFnYWluPwo+
Pgo+PiBTdXJlLCBidXQgYXMgSSBtZW50aW9uZWQgcHJldmlvdXNseSwgb25seSBpbiBhYm91dCAy
IHdlZWtzLCBJIGNhbid0IAo+PiByZWFsbHkgZG8gYW55IGRldiBiZWZvcmUgdGhlbi4uIDooCj4+
Cj4+Cj4+Cj4+PiBJdCB3b3VsZCBiZSBuaWNlIHRvIGNoZWNrIGlmIHRoZSBhbGxvY2F0aW9uIGFs
d2F5cyBvY2N1cnMgYmVmb3JlIHVzZSwKPj4+IGFuZCBpZiB5ZXMgb24gaG93IG11Y2ggYnl0ZXMu
Cj4+Pgo+Pj4gSWYgdGhlIHBvaW50ZXIgaXMgbm90IGRhbmdsaW5nLCB0aGVuIHBlcmhhcHMgc29t
ZXRoaW5nIGVsc2Ugc21hc2hlcwo+Pj4gdGhhdCBwb2ludGVyLgo+Pgo+Pgo+PiBLb25yYWQKPj4K
Pj4+Cj4+Pj4gRG8gbm90ZSB0aGlzIHNvbWVob3cgd29ya2VkIGZpbmUgb24gNS4xMSBhbmQgdGhl
biBicm9rZSBvbiA1LjEyLzEzLiAKPj4+PiBJIHdlbnQgYXMgZmFyIGFzIHJlcGxhY2luZyBtb3N0
Cj4+Pj4KPj4+PiBvZiB0aGUga2VybmVsIHdpdGggdGhlIHVwZGF0ZWQvZG93bmdyYWRlZCBwYXJ0
cyB2aWEgZ2l0IGNoZWNrb3V0IChpIAo+Pj4+IHRyaWVkIG1hbnkgY29tYmluYXRpb25zKSwKPj4+
Pgo+Pj4+IHRvIG5vIGF2YWlsLi4gSSBldmVuIHRyaWVkIGRpZmZlcmVudCBjb21waWxlcnMgYW5k
IG9wdGltaXphdGlvbiAKPj4+PiBsZXZlbHMsIHRoaW5raW5nIGl0IGNvdWxkIGhhdmUgYmVlbgo+
Pj4+Cj4+Pj4gYSBjb2RlZ2VuIGlzc3VlLCBidXQgbm8gbHVjayBlaXRoZXIuCj4+Pj4KPj4+Pgo+
Pj4+IEkuLiBkbyB1bmRlcnN0YW5kIHRoaXMgZW1haWwgaXMgYSB0b3RhbCBtZXNzIHRvIHJlYWQs
IGFzIG11Y2ggYXMgaXQgCj4+Pj4gd2FzIHRvIHdyaXRlLCBidXQKPj4+Pgo+Pj4+IHdpdGhvdXQg
YWNjZXNzIHRvIG15IGNvZGUgYW5kIHRoZSBtYWNoaW5lIGl0c2VsZiBJIGNhbid0IGdpdmUgeW91
IAo+Pj4+IHNvbGlkIGRldGFpbHMsIGFuZAo+Pj4+Cj4+Pj4gdGhlIGZhY3QgdGhpcyBzaXR1YXRp
b24gaXMgZmFyIGZyb20gb3JkaW5hcnkgZG9lc24ndCBoZWxwIGVpdGhlci4uCj4+Pj4KPj4+Pgo+
Pj4+IFRoZSBsYXRlc3QgKGFuY2llbnQsIG5vdCBxdWl0ZSBwcmV0dHksIGJ1dCBwcm9iYWJseSB3
b3JraW5nIGlmIG15IAo+Pj4+IG1lbW9yeSBpcyBjb3JyZWN0KSB2ZXJzaW9uIG9mIG15IHBhdGNo
ZXMKPj4+Pgo+Pj4+IGZvciB0aGUgbWRtOTYwNyBpcyBhdmFpbGFibGUgYXQgWzFdLCBJIHdpbGwg
cHVzaCB0aGUgbmV3IHJldmlzaW9uIAo+Pj4+IGFmdGVyIEkgZ2V0IGFjY2VzcyB0byB0aGUgd29y
a3N0YXRpb24uCj4+Pj4KPiDCoCArIGZldyBtb3JlIHdobyBoYXZlIGFjY2VzcyB0byB0aGUgYm9h
cmQuCj4KPiDCoMKgIEdvaW5nIGJ5IHRoZSBkZXNjcmlwdGlvbiwgZm9yIGtlcm5lbCBjb3JydXB0
aW9uLCB3ZSBjYW4gdHJ5IG91dCBhIAo+IEtBU0FOIGJ1aWxkLgo+IMKgwqAgU2luY2UgeW91IGhh
dmUgbWVudGlvbmVkIGl0IHdvcmtlZCB0aWxsIDUuMTEsIHlvdSBiaXNlY3RlZCB0aGUgCj4gZHJp
dmVyIHRpbGwgNS4xMSBoZWFkIGFuZCBpdCB3b3JrZWQgPwo+CiDCoMKgIFRyaWVkIHJ1bm5pbmcg
YSBLQVNBTiBlbmFibGVkIGltYWdlIG9uIElQUSBib2FyZCwgYnV0IG5vIGx1Y2suIApOb3RoaW5n
IGNhbWUgb3V0LgogwqDCoCBPbmx5IGlmIHNvbWVvbmUgd2l0aCB0aGUgYm9hcmQgY2FuIGhlbHAg
aGVyZSwgd2UgY2FuIHByb2NlZWQKCgpSZWdhcmRzLAogwqAgU3JpY2hhcmFuCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
