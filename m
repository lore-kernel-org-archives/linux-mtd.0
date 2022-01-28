Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887EAC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jan 2022 04:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3HWp88UywW5zkWtG+pOFNuLKEyFaD5FDMefq5TOOW8=; b=rKCi+nVMtyttNZzyhdz1QD/uyQ
	5KoRDXuG7jVGfID4k0fNXWhZbWt1u5MLbuWRHxe0iSFqYJPiaIvdfKlWwla3AQlIbfxCFeMCeNq1/
	5cf9ahUTuDteeMKUS0yu+T6t2RWZRJ3xEH5DJxH5zwH6sVgZNx96sH2NGVZEq/43YWsvfN0xCYQyv
	8U4VidsVuCnNK5Z2QyXgRP+jJ+ujT/dgOXqlhOtQNUPM7WOXEilLXLn9mFjsxPntpb78YRV266Vkb
	0/3DU4rv0/MZ/IQZNjKvvxn24cLBvb9msVV4DgxhuEjo1ZI7f6VEFkEzkyq+ktuui0c0qUKNLPhcG
	iQtJua3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDIpx-000LNV-LL; Fri, 28 Jan 2022 04:26:13 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDIpv-000LMV-19
 for linux-mtd@lists.infradead.org; Fri, 28 Jan 2022 04:26:12 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1643343969; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=sGRYfm9zjSs8NIE4YgHz6D1qO6Z0hrHxKVC1Yjok+H8=;
 b=SAoqml9H4rtjanC5a4REKcR1ZgjqbcxG91GEQRzwAEOjlohEWxKnDQF4PSKudLp8CyFdQZsy
 NTBKyazSrp1/KVcLX2YMi51sH2vBBN3ySZfvZdNJBnTgyvGXTfb9WwY+0sl+HHee2oQHVJge
 T96kFEF78yBGdYqA2d0ALTMsBMo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 61f37024f805f86cfe5c12a7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 28 Jan 2022 04:25:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DC79CC43617; Fri, 28 Jan 2022 04:25:07 +0000 (UTC)
Received: from [192.168.0.104] (unknown [183.82.28.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: sricharan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E64C8C4338F;
 Fri, 28 Jan 2022 04:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E64C8C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH] mtd: nand: raw: qcom_nandc: Don't clear_bam_transaction
 on READID
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
From: Sricharan Ramabadhran <sricharan@codeaurora.org>
Message-ID: <fc80a6e7-bd44-3b3e-fca2-1316a76d65f5@codeaurora.org>
Date: Fri, 28 Jan 2022 09:55:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20220126114200.4cc3c21b@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_202611_170365_A5EE1E51 
X-CRM114-Status: GOOD (  16.82  )
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

SGkgTWlxdWVsLAoKT24gMS8yNi8yMDIyIDQ6MTIgUE0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4g
SGkgTWFuaSwKPgo+IG1hbmlAa2VybmVsLm9yZyB3cm90ZSBvbiBXZWQsIDI2IEphbiAyMDIyIDE2
OjAzOjE2ICswNTMwOgo+Cj4+IE9uIFdlZCwgSmFuIDI2LCAyMDIyIGF0IDExOjE2OjEzQU0gKzAx
MDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+PiBIZWxsbywKPj4+Cj4+PiBtaXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tIHdyb3RlIG9uIEZyaSwgMTQgSmFuIDIwMjIgMDg6Mjc6MTggKzAxMDA6Cj4+
PiAgICAKPj4+PiBIaSBLb25yYWQsCj4+Pj4KPj4+PiBrb25yYWQuZHliY2lvQHNvbWFpbmxpbmUu
b3JnIHdyb3RlIG9uIFRodSwgMTMgSmFuIDIwMjIgMTk6NDQ6MjYgKzAxMDA6Cj4+Pj4gICAgCj4+
Pj4+IFdoaWxlIEkgaGF2ZSBhYnNvbHV0ZWx5IDAgaWRlYSB3aHkgYW5kIGhvdywgcnVubmluZyBj
bGVhcl9iYW1fdHJhbnNhY3Rpb24KPj4+Pj4gd2hlbiBSRUFESUQgaXMgaXNzdWVkIG1ha2VzIHRo
ZSBETUEgdG90YWxseSBjbG9nIHVwIGFuZCByZWZ1c2UgdG8gZnVuY3Rpb24KPj4+Pj4gYXQgYWxs
IG9uIG1kbTk2MDcuIEluIGZhY3QsIGl0IGlzIHNvIGJhZCB0aGF0IGFsbCB0aGUgZGF0YSBnZXRz
IGdhcmJsZWQKPj4+Pj4gYW5kIGFmdGVyIGEgc2hvcnQgd2hpbGUgaW4gdGhlIG5hbmQgcHJvYmUg
ZmxvdywgdGhlIENQVSBkZWNpZGVzIHRoYXQKPj4+Pj4gc2VwdWt1IGlzIHRoZSBvbmx5IG9wdGlv
bi4KPj4+Pj4KPj4+Pj4gUmVtb3ZpbmcgX1JFQURJRCBmcm9tIHRoZSBpZiBjb25kaXRpb24gbWFr
ZXMgaXQgd29yayBsaWtlIGEgY2hhcm0sIEkgY2FuCj4+Pj4+IHJlYWQgZGF0YSBhbmQgbW91bnQg
cGFydGl0aW9ucyB3aXRob3V0IGEgcHJvYmxlbS4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTog
S29ucmFkIER5YmNpbyA8a29ucmFkLmR5YmNpb0Bzb21haW5saW5lLm9yZz4KPj4+Pj4gLS0tCj4+
Pj4+IFRoaXMgaXMgdG90YWxseSBqdXN0IGFuIG9ic2VydmF0aW9uIHdoaWNoIHRvb2sgbWUgYW4g
aW5odW1hbmUgYW1vdW50IG9mCj4+Pj4+IGRlYnVnIHByaW50cyB0byBmaW5kLi4gcGVyaGFwcyB0
aGVyZSdzIGEgYmV0dGVyIHJlYXNvbiBiZWhpbmQgdGhpcywgYnV0Cj4+Pj4+IEkgY2FuJ3Qgc2Vl
bSB0byBmaW5kIGFueSBhbnN3ZXJzLi4gVGhlcmVmb3JlLCB0aGlzIGlzIGEgQklHIFJGQyEKPj4+
PiBJJ20gYWRkaW5nIHR3byBwZW9wbGUgZnJvbSBjb2RlYXVyb3JhIHdobyB3b3JrZWQgYSBsb3Qg
b24gdGhpcyBkcml2ZXIuCj4+Pj4gSG9wZWZ1bGx5IHRoZXkgd2lsbCBoYXZlIGFuIGlkZWEgOikK
Pj4+IFNhZHJlLCBJJ3ZlIHNwZW50IGEgc2lnbmlmaWNhbnQgYW1vdW50IG9mIHRpbWUgcmV2aWV3
aW5nIHlvdXIgcGF0Y2hlcywKPj4+IG5vdyBpdCdzIHlvdXIgdHVybiB0byBub3QgdGFrZSBhIG1v
bnRoIHRvIGFuc3dlciB0byB5b3VyIHBlZXJzCj4+PiBwcm9wb3NhbHMuCj4+Pgo+Pj4gUGxlYXNl
IGhlbHAgcmV2aWV3aW5nIHRoaXMgcGF0Y2guCj4+PiAgICAKPj4gU29ycnkuIEkgd2FzIGhvcGlu
ZyB0aGF0IFFjb20gZm9sa3Mgd291bGQgY2hpbWUgaW4gYXMgSSBkb24ndCBoYXZlIGFueSBpZGVh
Cj4+IGFib3V0IHRoZSBtZG05NjA3IHBsYXRmb3JtLiBJdCBjb3VsZCBiZSB0aGF0IHRoZSBtYWls
IHNlcnZlciBtaWdyYXRpb24gZnJvbQo+PiBjb2RlYXVyb3JhIHRvIHF1aWNpbmMgcHV0IGEgYmFy
cmllciBoZXJlLgo+Pgo+PiBMZXQgbWUgcGluZyB0aGVtIGludGVybmFsbHkuCj4gT2gsIG9rLCBJ
IGRpZG4ndCBrbm93LiBUaGFua3MhCgogwqDCoCBTb3JyeSBNaXF1ZWwsIHNvbWVob3cgd2UgZGlk
IG5vdCBnZXQgdGhpcyBlbWFpbCBpbiBvdXIgaW5ib3guCiDCoMKgIFRoYW5rcyB0byBNYW5pIGZv
ciBwaW5naW5nIHVzLCB3ZSB3aWxsIHRlc3QgdGhpcyB1cCB0b2RheSBhbmQgZ2V0IGJhY2suCgpS
ZWdhcmRzLAogwqDCoCBTcmljaGFyYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
