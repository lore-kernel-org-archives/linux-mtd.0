Return-Path: <SRS0=vdk9=IR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD90C433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Mar 2021 09:24:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9B8C64F69
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Mar 2021 09:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9B8C64F69
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uGLE+kYgX0s4NbmSgFod/kzBjII+EUq/vTIHxdnkjV4=; b=Zbt8Np+FplxVVfucchuntmmq+
	nL4gbtLOu4JumL8tecEMcsoueNROaSP3q0jt8Atbtwc4iEPIFcymCRYkGIbbQdJk4xYu/X+7uOViX
	+W9qbFF97w26Z+vo+nidndLVp6UoP+OODxULqq1se68NsxM68gJGWG/rdeUw6nbwp4/SkxsLvdKrW
	Oq1rstBccaJmSjZhWzLskrtxrON6TwAE/9B5jgK4HOyzUpbDMzVBSQ/iDN9iz+vsLvKUzklH3BC6m
	1bufzvxh324/xqgg6dSz4vMqeEZ2QIXlYvAxbJNHim28ejkAzSfu7F57Bmp0+42n8Cv3lol7ukKoX
	GKVvs2p4w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNBME-006wlS-KP; Fri, 19 Mar 2021 09:23:50 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNBMA-006wku-R8
 for linux-mtd@lists.infradead.org; Fri, 19 Mar 2021 09:23:48 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 8AD321C0006;
 Fri, 19 Mar 2021 09:23:39 +0000 (UTC)
Date: Fri, 19 Mar 2021 10:23:38 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Patrick Doyle <pdoyle@irobot.com>
Subject: Re: [PATCH v1] mtd: nand: Fix BBT update issue
Message-ID: <20210319102117.47774faf@xps13>
In-Reply-To: <b04b128eaca91961597fa9586c7ccaa3934aaa03.1612501067.git.ytc-mb-yfuruyama7@kioxia.com>
References: <1613435875-6846-1-git-send-email-ytc-mb-yfuruyama7@kioxia.com>
 <b04b128eaca91961597fa9586c7ccaa3934aaa03.1612501067.git.ytc-mb-yfuruyama7@kioxia.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_092347_028283_4330F3F0 
X-CRM114-Status: GOOD (  20.63  )
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

SGkgWW9zaGlvLAoKKyBQYXRyaWNrCgpZb3NoaW8gRnVydXlhbWEgPHl0Yy1tYi15ZnVydXlhbWE3
QGtpb3hpYS5jb20+IHdyb3RlIG9uIFR1ZSwgMTYgRmViCjIwMjEgMDk6Mzc6NTUgKzA5MDA6Cgo+
IEZpeGVkIGlzc3VlIG9mIG1hbmFnZXMgQkJUIChCYWQgQmxvY2sgVGFibGUpLgo+IEl0IGRpZG4n
dCBtYXJrIGNvcnJlY3RseSB3aGVuIGEgc3BlY2lmaWMgYmxvY2sgd2FzIGJhZCBibG9jay4KPiAK
PiBUaGlzIGlzc3VlIG9jY3VycyB3aGVuIHRoZSBiYWQgYmxvY2sgbWFyayAoMy1iaXQgY2h1bmsp
IGlzIAo+IGNyb3NzZXMgb3ZlciAzMiBiaXQgKGUuZy4gQmxvY2sxMCwgQmxvY2syMS4uLikgdW5p
dC4KPiAKClRoYW5rcyBmb3IgdGhlIHBhdGNoIGFuZCBzb3JyeSBmb3IgdGhlIHZlcnkgbG9uZyB3
YWl0IHBlcmlvZCwgSSB3YW50ZWQKdG8gdW5kZXJzdGFuZCBiZXR0ZXIgdGhlIGlzc3VlIGJ1dCBJ
IGRpZG4ndCBoYWQgdGhlIHRpbWUgdG8gZG8gaXQuCgpXb3VsZCB5b3UgbWluZCBoYXZpbmcgYSBs
b29rIGF0IFBhdHJpY2sncyBmaXggbWVyZ2VkIGluIFUtQm9vdCBhIHllYXIKYWdvOgoKY29tbWl0
IDA2ZmM0NTczYjlkMDg3OGRkMWQzYjMwMjg4NDYwMTI2M2ZlNmU4NWYKQXV0aG9yOiBEb3lsZSwg
UGF0cmljayA8cGRveWxlQGlyb2JvdC5jb20+CkRhdGU6ICAgV2VkIEp1bCAxNSAxNDo0NjozNCAy
MDIwICswMDAwCgogICAgRml4IGNvcm5lciBjYXNlIGluIGJhZCBibG9jayB0YWJsZSBoYW5kbGlu
Zy4KICAgIAogICAgSW4gdGhlIHVubGlrZWx5IGV2ZW50IHRoYXQgYm90aCBibG9ja3MgMTAgYW5k
IDExIGFyZSBtYXJrZWQgYXMgYmFkIChvbiBhCiAgICAzMiBiaXQgbWFjaGluZSksIHRoZW4gdGhl
IHByb2Nlc3Mgb2YgbWFya2luZyBibG9jayAxMCBhcyBiYWQgc3RvbXBzIG9uCiAgICBjYWNoZWQg
ZW50cnkgZm9yIGJsb2NrIDExLiAgVGhlcmUgYXJlIChvZiBjb3Vyc2UpIG90aGVyIGV4YW1wbGVz
LgogICAgCiAgICBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNrIERveWxlIDxwZG95bGVAaXJvYm90LmNv
bT4KICAgIFJldmlld2VkLWJ5OiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PgoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvYmJ0LmMgYi9kcml2ZXJzL210ZC9uYW5kL2Ji
dC5jCmluZGV4IDg0ZDYwYjg2NTIxLi4yOTRkYWVlN2IyMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9t
dGQvbmFuZC9iYnQuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL2JidC5jCkBAIC0xMjcsNyArMTI3
LDcgQEAgaW50IG5hbmRkZXZfYmJ0X3NldF9ibG9ja19zdGF0dXMoc3RydWN0IG5hbmRfZGV2aWNl
ICpuYW5kLCB1bnNpZ25lZCBpbnQgZW50cnksCiAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQg
cmJpdHMgPSBiaXRzX3Blcl9ibG9jayArIG9mZnMgLSBCSVRTX1BFUl9MT05HOwogCiAgICAgICAg
ICAgICAgICBwb3NbMV0gJj0gfkdFTk1BU0socmJpdHMgLSAxLCAwKTsKLSAgICAgICAgICAgICAg
IHBvc1sxXSB8PSB2YWwgPj4gcmJpdHM7CisgICAgICAgICAgICAgICBwb3NbMV0gfD0gdmFsID4+
IChiaXRzX3Blcl9ibG9jayAtIHJiaXRzKTsKICAgICAgICB9CiAKICAgICAgICByZXR1cm4gMDsK
Ckl0IGxvb2tzIGJvdGggcGF0Y2hlcyBmaXggZGlmZmVyZW50IGVycm9ycyBidXQgSSB3b25kZXIg
aWYgbWVyZ2luZyBQYXRyaWNrJ3MgcGF0Y2ggZmlyc3Qgd291bGQgbm90IG1ha2UgbW9yZSBzZW5z
ZS4gCgpJZGVhbGx5LCBjb3VsZCB5b3UgcGxlYXNlIHNlbmQgYSBzZXJpZXMgd2l0aCB0aGUgdHdv
IHBhdGNoZXMsIHBlcmhhcHMKUGF0cmljaydzIHBhdGNoIGZpcnN0LCB0aGVuIHlvdXJzLCBhZGRp
bmcgYSBGaXhlcyBhbmQgQ2M6IHN0YWJsZSB0YWdzCnRvIGJvdGg/Cgo+IFNpZ25lZC1vZmYtYnk6
IFlvc2hpbyBGdXJ1eWFtYSA8eXRjLW1iLXlmdXJ1eWFtYTdAa2lveGlhLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9tdGQvbmFuZC9iYnQuYyB8IDYgKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvYmJ0LmMgYi9kcml2ZXJzL210ZC9uYW5kL2JidC5jCj4gaW5kZXggMDQ0YWRmOTEzODU0
Li45NzljNDdlNjEzODEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9iYnQuYwo+ICsr
KyBiL2RyaXZlcnMvbXRkL25hbmQvYmJ0LmMKPiBAQCAtMTEyLDE4ICsxMTIsMjAgQEAgaW50IG5h
bmRkZXZfYmJ0X3NldF9ibG9ja19zdGF0dXMoc3RydWN0IG5hbmRfZGV2aWNlICpuYW5kLCB1bnNp
Z25lZCBpbnQgZW50cnksCj4gIAkJCSAgICAgKChlbnRyeSAqIGJpdHNfcGVyX2Jsb2NrKSAvIEJJ
VFNfUEVSX0xPTkcpOwo+ICAJdW5zaWduZWQgaW50IG9mZnMgPSAoZW50cnkgKiBiaXRzX3Blcl9i
bG9jaykgJSBCSVRTX1BFUl9MT05HOwo+ICAJdW5zaWduZWQgbG9uZyB2YWwgPSBzdGF0dXMgJiBH
RU5NQVNLKGJpdHNfcGVyX2Jsb2NrIC0gMSwgMCk7Cj4gKwl1bnNpZ25lZCBsb25nIHNoaWZ0ID0g
KChiaXRzX3Blcl9ibG9jayArIG9mZnMgPD0gQklUU19QRVJfTE9ORykgPwo+ICsJCQkJCShvZmZz
ICsgYml0c19wZXJfYmxvY2sgLSAxKSA6IChCSVRTX1BFUl9MT05HIC0gMSkpOwo+ICAKPiAgCWlm
IChlbnRyeSA+PSBuYW5kZGV2X25lcmFzZWJsb2NrcyhuYW5kKSkKPiAgCQlyZXR1cm4gLUVSQU5H
RTsKPiAgCj4gLQlwb3NbMF0gJj0gfkdFTk1BU0sob2ZmcyArIGJpdHNfcGVyX2Jsb2NrIC0gMSwg
b2Zmcyk7Cj4gKwlwb3NbMF0gJj0gfkdFTk1BU0soc2hpZnQsIG9mZnMpOwo+ICAJcG9zWzBdIHw9
IHZhbCA8PCBvZmZzOwo+ICAKPiAgCWlmIChiaXRzX3Blcl9ibG9jayArIG9mZnMgPiBCSVRTX1BF
Ul9MT05HKSB7Cj4gIAkJdW5zaWduZWQgaW50IHJiaXRzID0gYml0c19wZXJfYmxvY2sgKyBvZmZz
IC0gQklUU19QRVJfTE9ORzsKPiAgCj4gIAkJcG9zWzFdICY9IH5HRU5NQVNLKHJiaXRzIC0gMSwg
MCk7Cj4gLQkJcG9zWzFdIHw9IHZhbCA+PiByYml0czsKPiArCQlwb3NbMV0gfD0gKHZhbCA+PiAo
QklUU19QRVJfTE9ORyAtIG9mZnMpKTsKPiAgCX0KPiAgCj4gIAlyZXR1cm4gMDsKClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
