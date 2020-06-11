Return-Path: <SRS0=dwdD=7Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C2CC433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2020 04:28:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3029207C3
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2020 04:28:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qog+K3AF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="lKXhM06Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3029207C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zxaQZ0xBlRHLo1A/jU979NY4pew5tF/+GsPRtobdNMc=; b=Qog+K3AFjn49NTRQtqdt+pDbb
	029zlg2bAURi31wwdAUKsFPAb8FThkJasAxvGRmcXC2Duz2z6ckRotRclN1DPBxmpXpG/f916GkmX
	kIcMNbzoje3BmyKtQcQa2iNbs2kqqJRjeck0ZGjbORx1zh51XDwiZgrEINniJBxIjiwNYHTCuNksk
	2tb4Zi5aRfQ0+FlHRPRsrZwJ4TG1f5b8gab0R86mT9LgpptklyN8RYix4XwVYWq3BQjQM0I4cA0Qd
	FT5N/qA96SUULAnRkmrH0C993k86ux11uQGjcMsFstze1H5NqXsImKcpbwhl4ZgsUCj1LhjUX7dDR
	WGIaGWiew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjEpH-0000UT-S1; Thu, 11 Jun 2020 04:28:27 +0000
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjEpD-0000Oq-5E
 for linux-mtd@lists.infradead.org; Thu, 11 Jun 2020 04:28:26 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1591849705; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=gVV31ZvrsQs/Uco3J5gyDfKMY3IQRdWuUqs0bs1YP7o=;
 b=lKXhM06ZYTfEC0OUkSpzfts+B4bm5+kleABl4AChbMa4KlXnkKgMY/iKy12Yk3knBlzf3TFx
 izcP69GbygMD0HXCk00E3o/zyBaNJU3zu7Bg61nxCk43i27Y8U1gajHSnqqoLt85gbQ9uP61
 AsWG4030wrFssJo/OsgyRi04KEE=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5ee1b2d5c4bb4f886d20b840 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Jun 2020 04:28:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 36FF7C433CB; Thu, 11 Jun 2020 04:28:05 +0000 (UTC)
Received: from [192.168.0.105] (unknown [183.83.153.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: sivaprak)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AF7D7C433CA;
 Thu, 11 Jun 2020 04:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AF7D7C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=sivaprak@codeaurora.org
Subject: Re: [PATCH V2 2/2] mtd: rawnand: qcom: set BAM mode only if not set
 already
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <1591701056-3944-1-git-send-email-sivaprak@codeaurora.org>
 <1591701056-3944-3-git-send-email-sivaprak@codeaurora.org>
 <20200609160352.60cbad80@xps13>
From: Sivaprakash Murugesan <sivaprak@codeaurora.org>
Message-ID: <2abac8fb-28ac-5137-70cc-47cbd20613b7@codeaurora.org>
Date: Thu, 11 Jun 2020 09:57:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200609160352.60cbad80@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200610_212825_267106_000CA141 
X-CRM114-Status: GOOD (  19.57  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: peter.ujfalusi@ti.com, richard@nod.at, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKT24gNi85LzIwMjAgNzozMyBQTSwg
TWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBTaXZhcHJha2FzaCwKPgo+IFNpdmFwcmFrYXNoIE11
cnVnZXNhbiA8c2l2YXByYWtAY29kZWF1cm9yYS5vcmc+IHdyb3RlIG9uIFR1ZSwgIDkgSnVuCj4g
MjAyMCAxNjo0MDo1NiArMDUzMDoKPgo+PiBCQU0gbW9kZSBpcyBzZXQgYnkgd3JpdGluZyBCQU1f
TU9ERV9FTiBiaXQgb24gTkFORF9DVFJMIHJlZ2lzdGVyLgo+PiBOQU5EX0NUUkwgaXMgYW4gb3Bl
cmF0aW9uYWwgcmVnaXN0ZXIgYW5kIGluIEJBTSBtb2RlIG9wZXJhdGlvbmFsCj4+IHJlZ2lzdGVy
cyBhcmUgcmVhZCBvbmx5Lgo+Pgo+PiBTbywgYmVmb3JlIHdyaXRpbmcgaW50byBOQU5EX0NUUkwg
cmVnaXN0ZXIgY2hlY2sgaWYgQkFNIG1vZGUgaXMgYWxyZWFkeQo+PiBlbmFibGVkIGJ5IGJvb3Rs
b2FkZXIsIGFuZCBzZXQgQkFNIG1vZGUgb25seSBpZiBpdCBpcyBub3Qgc2V0IGFscmVhZHkuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IFNpdmFwcmFrYXNoIE11cnVnZXNhbiA8c2l2YXByYWtAY29kZWF1
cm9yYS5vcmc+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyB8
IDkgKysrKysrKystCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5k
Yy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4+IGluZGV4IGUwYWZhMmMu
Ljc3NDAwNTkgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMu
Ywo+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPj4gQEAgLTI3Nzks
NyArMjc3OSwxNCBAQCBzdGF0aWMgaW50IHFjb21fbmFuZGNfc2V0dXAoc3RydWN0IHFjb21fbmFu
ZF9jb250cm9sbGVyICpuYW5kYykKPj4gICAJLyogZW5hYmxlIEFETSBvciBCQU0gRE1BICovCj4+
ICAgCWlmIChuYW5kYy0+cHJvcHMtPmlzX2JhbSkgewo+PiAgIAkJbmFuZF9jdHJsID0gbmFuZGNf
cmVhZChuYW5kYywgTkFORF9DVFJMKTsKPj4gLQkJbmFuZGNfd3JpdGUobmFuZGMsIE5BTkRfQ1RS
TCwgbmFuZF9jdHJsIHwgQkFNX01PREVfRU4pOwo+PiArCQkvKiBOQU5EX0NUUkwgaXMgYW4gb3Bl
cmF0aW9uYWwgcmVnaXN0ZXJzLCBhbmQgQ1BVCj4+ICsJCSAqIGFjY2VzcyB0byBvcGVyYXRpb25h
bCByZWdpc3RlcnMgYXJlIHJlYWQgb25seQo+PiArCQkgKiBpbiBCQU0gbW9kZS4gU28gdXBkYXRl
IHRoZSBOQU5EX0NUUkwgcmVnaXN0ZXIKPj4gKwkJICogb25seSBpZiBpdCBpcyBub3QgaW4gQkFN
IG1vZGUuIEluIG1vc3QgY2FzZXMgQkFNCj4+ICsJCSAqIG1vZGUgd2lsbCBiZSBlbmFibGVkIGlu
IGJvb3Rsb2FkZXIKPj4gKwkJICovCj4+ICsJCWlmICghKG5hbmRfY3RybCB8IEJBTV9NT0RFX0VO
KSkKPj4gKwkJCW5hbmRjX3dyaXRlKG5hbmRjLCBOQU5EX0NUUkwsIG5hbmRfY3RybCB8IEJBTV9N
T0RFX0VOKTsKPj4gICAJfSBlbHNlIHsKPj4gICAJCW5hbmRjX3dyaXRlKG5hbmRjLCBOQU5EX0ZM
QVNIX0NISVBfU0VMRUNULCBETV9FTik7Cj4+ICAgCX0KPiBEb2VzIHRoaXMgY3VycmVudGx5IHBy
b2R1Y2VzIGFuIGlzc3VlIGF0IHJ1bnRpbWU/Cj4KPiBJZiB5ZXMsIHlvdSBzaG91bGQgaGF2ZSBh
IEZpeGVzL0NDOiBzdGFibGUgcGFpciBvZiB0YWdzLgo+Cj4gQWxzbywgd2hhdCBpcyBCQU0gbW9k
ZT8gUGxlYXNlIHRlbGwgdXMgaW4gdGhlIGNvbW1pdCBsb2cuCgpDdXJyZW50bHkgdGhpcyBpcyBu
b3QgY2F1c2luZyBhbnkgaXNzdWUgb24gcnVuIHRpbWUuCgpUaGUgd3JpdGVzIHRvIHRoaXMgcmVn
aXN0ZXIgaXMgc2lsZW50bHkgaWdub3JlZC4KCkhvd2V2ZXIsIHRoaXMgY291bGQgYmUgYW4gaXNz
dWUgaW4gZnV0dXJlIEhhcmR3YXJlIGRlc2lnbnMuCgpCQU0gaXMgdGhlIERNQSBlbmdpbmUgb24g
UUNPTSBJUFEgcGxhdGZvcm1zLCBzdXJlIHdpbGwgZXhwbGFpbiB0aGlzCgptb2RlIGluIG5leHQg
cGF0Y2hzZXQuCgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
