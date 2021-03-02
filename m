Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B91C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 19:20:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BE2E64ED7
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 19:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BE2E64ED7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zdqml+/yWRjENqz65MSn12Q6SIFhdili2SDvvlMd0uU=; b=MiE1GdSrn2qeSBviH37sRvix3
	m/ptvFsFBJy2NchGqrR3jBnD79ce1SkB9A4AOOuUULfiSeaMiZO0hbFWUVYgHSHcb5mH2rIq6D7sl
	aQ1qtmo/u+IN4Zy7b+iqQKoWs/8oe/or9c7TbFLwy7l+MZr8pzEMDdj0Fe66nJxTHDHlPywX6VNfQ
	xTbj14UMTtdqaXeySOcICFns4r+HIJ4/J4g8l9I69NFr0vmGE+Nt+vRanMsUFvtZMDs79pPcQ4GPt
	EEBfiaV/hW31SNbu1n/ptRolCnt3CbYf5JgtLg3wDmwpKM3llCPoimLYfJ3dLc2JEwPd2grmqeHzJ
	PJd0q8knQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHX1T-006BKo-6o; Wed, 03 Mar 2021 19:19:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT32-005HvF-S9
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=wld4sEYrbNAw/+pwRpknTrx7MkJjuJSJK47ViMmK7ec=; b=h5Iv4zoBS+Zb/oQGv3tQTcuJJq
 bBJTSxtep6RK1JVVic6KoV+134hEzagudgez885Oj/bNTGVYhvcyMsee0muAonCdiXnEXSLL+Y0oP
 lD1lhEuFjKuvNGcznp5RElgstDx6REtOWvByqZliz7YSE7GcrKmzSC2Ank+7JLUK1jFS1tFtaY5Mj
 FMcX8nXlQZdIlU+S4Jp7l/ejoKj8z7TUGl/bqDH7CxN/hu+RFQNMmnmzQvl+ZeQ6wenRLzj8CZu2H
 s6Y1Q32qEGz8FwV63QLDT9kIK++v7iYeuoDXcuxZGVzK0A0fh8gLOhWCiR5d5QbzKwlpFWDJtnqmq
 tiarfmrg==;
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH7y6-00HSIA-DX
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 16:33:56 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 122GXYPc015348;
 Tue, 2 Mar 2021 10:33:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1614702814;
 bh=wld4sEYrbNAw/+pwRpknTrx7MkJjuJSJK47ViMmK7ec=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=p1I5gOxsyqynKIhqVCAAtZE5rD7PoA/eM/u8igWMLLq1wePr4FRPFu5vTnKgIeXol
 WPIQNYIh7JDWV3sAwwXQjJBij0OBxvX0yeyfG3i+FjSEe6NFqhstSF0XzG3SBq7ao1
 qiCq9Ret1Y+wfUpPGxqBr5ViONP7/avZV0alqooI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 122GXYS7064947
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 2 Mar 2021 10:33:34 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 2 Mar
 2021 10:33:33 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 2 Mar 2021 10:33:33 -0600
Received: from [10.250.234.120] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 122GXUiH117369;
 Tue, 2 Mar 2021 10:33:31 -0600
Subject: Re: [RFC PATCH] mtd: add OTP (one-time-programmable) erase ioctl
To: Michael Walle <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-api@vger.kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, <Tudor.Ambarus@microchip.com>
References: <20210302110927.6520-1-michael@walle.cc>
 <b106264e-987f-cecc-28cb-0724d4af1f4c@ti.com>
 <74df918148be8c9820acc877e39adf3f@walle.cc>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <a4464459-dc49-d5de-d969-b9ea96b025d6@ti.com>
Date: Tue, 2 Mar 2021 22:03:29 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <74df918148be8c9820acc877e39adf3f@walle.cc>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_163356_795980_8F9CF7CD 
X-CRM114-Status: GOOD (  17.95  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAzLzIvMjEgOTo0OSBQTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPiBBbSAyMDIxLTAzLTAy
IDE2OjMwLCBzY2hyaWViIFZpZ25lc2ggUmFnaGF2ZW5kcmE6Cj4+IEhpLAo+Pgo+PiBPbiAzLzIv
MjEgNDozOSBQTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4+IFRoaXMgbWF5IHNvdW5kIGxpa2Ug
YSBjb250cmFkaWN0aW9uIGJ1dCBzb21lIFNQSS1OT1IgZmxhc2hlcyByZWFsbHkKPj4+IHN1cHBv
cnQgZXJhc2luZyB0aGVpciBPVFAgcmVnaW9uIHVudGlsIGl0IGlzIGZpbmFsbHkgbG9ja2VkLiBI
YXZpbmcgdGhlCj4+PiBwb3NzaWJpbGl0eSB0byBlcmFzZSBhbiBPVFAgcmVnaW9uIG1pZ2h0IGNv
bWUgaW4gaGFuZHkgZHVyaW5nCj4+PiBkZXZlbG9wbWVudC4KPj4+Cj4+PiBUaGUgaW9jdGwgYXJn
dW1lbnQgZm9sbG93cyB0aGUgT1RQTE9DSyBzdHlsZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBN
aWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPgo+Pj4gLS0tCj4+PiBPVFAgc3VwcG9ydCBm
b3IgU1BJLU5PUiBmbGFzaGVzIG1heSBiZSBtZXJnZWQgc29vbjoKPj4+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LW10ZC8yMDIxMDIxNjE2MjgwNy4xMzUwOS0xLW1pY2hhZWxAd2FsbGUu
Y2MvCj4+Pgo+Pj4KPj4+IFR1ZG9yIHN1Z2dlc3RlZCB0byBhZGQgc3VwcG9ydCBmb3IgdGhlIE9U
UCBlcmFzZSBvcGVyYXRpb24gbW9zdCBTUEktTk9SCj4+PiBmbGFzaGVzIGhhdmU6Cj4+PiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvZDRmNzRiMWItZmExYi05N2VjLTg1OGMtZDgw
N2ZlMWY5ZTU3QG1pY3JvY2hpcC5jb20vCj4+Pgo+Pj4KPj4+IFRoZXJlZm9yZSwgdGhpcyBpcyBh
biBSRkMgdG8gZ2V0IHNvbWUgZmVlZGJhY2sgb24gdGhlIE1URCBzaWRlLCBvbmNlCj4+PiB0aGlz
Cj4+PiBpcyBmaW5pc2hlZCwgSSBjYW4gcG9zdCBhIHBhdGNoIGZvciBtdGQtdXRpbHMuIFRoZW4g
d2UnbGwgaGF2ZSBhCj4+PiBmb3VuZGF0aW9uCj4+PiB0byBhZGQgdGhlIHN1cHBvcnQgdG8gU1BJ
LU5PUi4KPj4+Cj4+PiDCoGRyaXZlcnMvbXRkL210ZGNoYXIuY8KgwqDCoMKgwqAgfMKgIDcgKysr
KysrLQo+Pj4gwqBkcml2ZXJzL210ZC9tdGRjb3JlLmPCoMKgwqDCoMKgIHwgMTIgKysrKysrKysr
KysrCj4+PiDCoGluY2x1ZGUvbGludXgvbXRkL210ZC5owqDCoMKgIHzCoCAzICsrKwo+Pj4gwqBp
bmNsdWRlL3VhcGkvbXRkL210ZC1hYmkuaCB8wqAgMiArKwo+Pj4gwqA0IGZpbGVzIGNoYW5nZWQs
IDIzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbXRkY2hhci5jIGIvZHJpdmVycy9tdGQvbXRkY2hhci5jCj4+PiBpbmRleCAzMjMw
MzVkNGYyZDAuLmRhNDIzZGQwMzFhZSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvbXRkL210ZGNo
YXIuYwo+Pj4gKysrIGIvZHJpdmVycy9tdGQvbXRkY2hhci5jCj4+PiBAQCAtNjYxLDYgKzY2MSw3
IEBAIHN0YXRpYyBpbnQgbXRkY2hhcl9pb2N0bChzdHJ1Y3QgZmlsZSAqZmlsZSwgdV9pbnQKPj4+
IGNtZCwgdV9sb25nIGFyZykKPj4+IMKgwqDCoMKgIGNhc2UgT1RQR0VUUkVHSU9OQ09VTlQ6Cj4+
PiDCoMKgwqDCoCBjYXNlIE9UUEdFVFJFR0lPTklORk86Cj4+PiDCoMKgwqDCoCBjYXNlIE9UUExP
Q0s6Cj4+PiArwqDCoMKgIGNhc2UgT1RQRVJBU0U6Cj4+Cj4+IFRoaXMgaXMgbm90IGEgU2FmZSBJ
T0NUTC4gV2UgYXJlIGRlc3Ryb3lpbmcgT1RQIGRhdGEuIE5lZWQgdG8gY2hlY2sgZm9yCj4+IHdy
aXRlIHBlcm1pc3Npb24gYmVmb3JlIGFsbG93aW5nIHRoZSBpb2N0bCByaWdodD8KPiAKPiBBaCB5
ZXMsIG9mIGNvdXJzZS4gQnV0IHRoaXMgbWFrZXMgbWUgd29uZGVyIHdoeSBPVFBMT0NLCj4gaXMg
Y29uc2lkZXJlZCBhIHNhZmUgY29tbWFuZC4gQXMgd2VsbCBhcyBNRU1MT0NLIGFuZAo+IE1FTVVO
TE9DSy4gQW5kIE1FTVNFVEJBREJMT0NLLiBTaG91bGRuJ3QgdGhlc2UgYWxzbwo+IHJlcXVpcmUg
d3JpdGUgcGVybWlzc2lvbnM/Cj4gCgpXZWxsLCBvbmUgYXJndW1lbnQgd291bGQgYmUgdGhhdCBM
T0NLL1VOTE9DSyBpbiBpdHNlbGYgd29uJ3QgbW9kaWZ5IGRhdGEKYW5kIHRodXMgZG9lcyBub3Qg
bmVlZCB3cml0ZSBwZXJtaXNzaW9uLi4gQWx0aG91Z2ggY2FuIGJyaWNrIGEgZmxhc2gKZnJvbSBl
dmVyIGJlaW5nIHdyaXRhYmxlIGFnYWluIGFuZCBjaGFuZ2UgY29udGVudCBvZiBmbGFzaCByZWdp
c3RlcnMuCgpJIGFtIGZpbmUgd2l0aCBtb3ZpbmcgdGhlc2UgdG8gcmVxdWlyZSB3cml0ZSBwZXJt
aXNzaW9ucyBhcyB3ZWxsCihwcm9iYWJseSBPVFBMT0NLIGFzIHdlbGwpLgoKWy4uLl0KPj4+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbXRkL210ZC1hYmkuaCBiL2luY2x1ZGUvdWFwaS9tdGQv
bXRkLWFiaS5oCj4+PiBpbmRleCA2NWI5ZGI5MzY1NTcuLjI0MjAxNWY2MGQxMCAxMDA2NDQKPj4+
IC0tLSBhL2luY2x1ZGUvdWFwaS9tdGQvbXRkLWFiaS5oCj4+PiArKysgYi9pbmNsdWRlL3VhcGkv
bXRkL210ZC1hYmkuaAo+Pj4gQEAgLTIwNSw2ICsyMDUsOCBAQCBzdHJ1Y3Qgb3RwX2luZm8gewo+
Pj4gwqAgKiB3aXRob3V0IE9PQiwgZS5nLiwgTk9SIGZsYXNoLgo+Pj4gwqAgKi8KPj4+IMKgI2Rl
ZmluZSBNRU1XUklURcKgwqDCoMKgwqDCoMKgIF9JT1dSKCdNJywgMjQsIHN0cnVjdCBtdGRfd3Jp
dGVfcmVxKQo+Pj4gKy8qIEVyYXNlIGEgZ2l2ZW4gcmFuZ2Ugb2YgdXNlciBkYXRhIChtdXN0IGJl
IGluIG1vZGUKPj4+ICVNVERfRklMRV9NT0RFX09UUF9VU0VSKSAqLwo+Pj4gKyNkZWZpbmUgT1RQ
RVJBU0XCoMKgwqDCoMKgwqDCoCBfSU9SKCdNJywgMjUsIHN0cnVjdCBvdHBfaW5mbykKPj4+Cj4+
Cj4+IEhtbSwgc2hvdWxkbid0IHRoaXMgYmU6Cj4+Cj4+ICNkZWZpbmUgT1RQRVJBU0XCoMKgwqDC
oMKgwqDCoCBfSU9XKCdNJywgMjUsIHN0cnVjdCBvdHBfaW5mbykKPj4KPj4gVXNlcnNwYWNlIGlz
IHdyaXRpbmcgc3RydWN0IG90cF9pbmZvIHRvIHRoZSBkcml2ZXIuIE9UUExPQ0sgc2hvdWxkCj4+
IHByb2JhYmx5IGJlIF9JT1coKSBhcyB3ZWxsLgo+IAo+IFlvdSdyZSByaWdodC4KPiAKPiBOQi4g
bW9zdCBPVFAgY29tbWFuZHMgaGF2ZSBhIHdyb25nIGRpcmVjdGlvbiBmbGFnLgo+IAoKVW5mb3J0
dW5hdGVseSwgeWVzIDooCgoKUmVnYXJkcwpWaWduZXNoCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
