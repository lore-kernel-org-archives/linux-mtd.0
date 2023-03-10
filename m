Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C64C64EC4
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Mar 2023 08:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u/uQGKdTjePlebDs13hOOqDJOzlkXf85UfCARTjFdSI=; b=K/yzTLbvIVL3So
	WSuX0fB2+USmackCcEXeN3qWBffFYo71ZCmz1upc8rS1Bd6+mepsIX44UWTbn2GVylWXkwQwwieU9
	ldVzxoxdz9Yz4XuIPhXrcLwjDOcX6DUutPAaXK/KAsplnK0X4Bt2a0s9Zd99DwCDhFJDJouHem8r7
	QjIX2nJYsCbecAi8yFWItAYNpRmi7UG/BzWxlSzz8aOQtd2xPNkjfD5DdPy3GXGhTxcLiHm0ZVY33
	Ai7ddzMlsI7idcBW4Bg7ZS18fT3SSCkB2U1eeDoKx6gGxu9RRCJyNCInxKuq0323FC3oBS/Mxzg6k
	RPdVVdhONx7iZSf+lFSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paXqP-00DZHP-Ll; Fri, 10 Mar 2023 08:11:18 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paXqG-00DZ4z-5W
	for linux-mtd@lists.infradead.org; Fri, 10 Mar 2023 08:11:12 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CE285E0007;
	Fri, 10 Mar 2023 08:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678435857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mp/fZMsgmkG95ai1a8CfPCZWzt2zuo8S3kOh813erqA=;
	b=laBWa42xLQi2XqFQWZl+Z6lvT712miko+NjAkOtomJlpliRGh7tpfR96xxmf9fbwjmG6CM
	N0NdMic7SzuR60f+SRQeVm9rSxLiSNyufG0YK0U1zR6iJE377na72mk5JvuSfbKB7/2hmz
	gB1HU9ZBRD3uQcgzDSv7wgrTsbYVNiqOfa4moGoowTSuqBogKPSuaGtl3vggDi2d3sPrqe
	V/cO2l5+2sS+FRgt1yHsAbNnTKPlm/4xW3/+CBl484IK1NvTdOl4I+sfrZ0NGMobWteRCK
	VcfPjxdqpcDmAbUzpYU1M2skHbIxGNhafJAOuzqH7LIhfm8edZN+yR2wLgolSg==
Date: Fri, 10 Mar 2023 09:10:55 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hector Palacios <hector.palacios@digi.com>
Cc: herve.codina@bootlin.com, linux-mtd@lists.infradead.org,
 sashal@kernel.org
Subject: Re: [PATCH v5] mtd: rawnand: hynix: fix up bit 0 of sdr_timing_mode
Message-ID: <20230310091055.21296243@xps-13>
In-Reply-To: <20230310080609.1930869-1-hector.palacios@digi.com>
References: <20230310080609.1930869-1-hector.palacios@digi.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_001108_718068_50F88DC7 
X-CRM114-Status: GOOD (  24.28  )
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

SGkgSGVjdG9yLAoKaGVjdG9yLnBhbGFjaW9zQGRpZ2kuY29tIHdyb3RlIG9uIEZyaSwgMTAgTWFy
IDIwMjMgMDk6MDY6MDkgKzAxMDA6Cgo+IEFjY29yZGluZyB0byB0aGUgT05GSSBzcGVjaWZpY2F0
aW9uLCBiaXQgMCBvZiAnU0RSIHRpbWluZyBtb2RlIHN1cHBvcnQnCj4gKGJ5dGVzIDEyOS0xMzAp
ICJzaGFsbCBiZSAxIi4gVGhhdCBtZWFucyB0aGUgTkFORCBzdXBwb3J0cyBhdCBsZWFzdAo+IHRp
bWluZyBtb2RlIDAuCj4gCj4gTkFORCBjaGlwIEh5bml4IEgyN1U0RzhGMkdEQS1CSSAoYXQgbGVh
c3QpIGlzIHJlYWRpbmcgYSAwIG9uIHRoaXMgZmllbGQKPiB3aGljaCBtYWtlcyBuYW5kX2Nob29z
ZV9iZXN0X3Nkcl90aW1pbmdzKCkgcmV0dXJuIHdpdGggZXJyb3IgYW5kIHRoZQo+IHByb2JlIGZ1
bmN0aW9uIHRvIGV2ZW50dWFsbHkgZmFpbC4KPiAKPiBHaXZlbiB0aGF0IHNkcl90aW1pbmdfbW9k
ZXMgYml0IDAgbXVzdCBiZSAxIGJ5IHNwZWNpZmljYXRpb24sIGZvcmNlCj4gaXQgaW4gY2FzZSB0
aGUgTkFORCByZXBvcnRzIGl0IGlzIG5vdCBzZXQuIFRoaXMgaXMgYSBzYWZlIGFzc3VtcHRpb24K
PiBiZWNhdXNlIHRoZSBtb2RlIDAgaXMgdGhlIG1pbmltdW0gKHNhZmVyKSBzZXQgb2YgdGltaW5n
cyB0aGF0IHRoZQo+IE5BTkQgY2FuIHdvcmsgd2l0aC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBIZWN0
b3IgUGFsYWNpb3MgPGhlY3Rvci5wYWxhY2lvc0BkaWdpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKQWN0dWFsbHkgeW91IHNo
b3VsZCBub3QgYWRkIG15IFNpZ25lZC1vZmYtYnkgbGlrZSB0aGF0LiBJIHdpbGwgYWRkIGl0Cndo
ZW4gSSB0YWtlIHlvdXIgcGF0Y2guCgpJbiBvcmRlciB0byBjcmVkaXQgbWUgKGFuZCB0aGF0IGlz
IHZlcnkga2luZCB0byB5b3UpIHlvdSBjb3VsZCBoYXZlCmluc3RlYWQgdXNlZCBTdWdnZXN0ZWQt
YnkuIElmIEkgaGFkIGRvbmUgbW9yZSB0aGFuIGp1c3Qgc3VnZ2VzdGluZwpzb21ldGhpbmcsIGFu
b3RoZXIgc29sdXRpb24gY291bGQgaGF2ZSBiZWVuIHRvIGFkZCBhIENvLWRldmVsb3BlZC1ieQp0
YWcgKGFuZCB0aGlzIHRpbWUsIG15IFNpZ25lZC1vZmYtYnkgd291bGQgaGF2ZSBiZWVuIHJlcXVp
cmVkKS4KCkFueXdheSwgbm8gbmVlZCB0byByZXNlbmQsIEknbGwgZml4IGl0IHVwIHdoZW4gYXBw
bHlpbmcuCgo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDIzMDIy
MzE2NTEwNC41MjU4NTItMS1oZWN0b3IucGFsYWNpb3NAZGlnaS5jb20KPiAtLS0KPiB2NToKPiAg
IFNpbXBsaWZ5IGJpdHdpc2Ugb3BlcmF0aW9uLgo+IHY0Ogo+ICAgRml4IGJpdHdpc2Ugb3BlcmF0
aW9uIG9uIF9fbGUxNiB0eXBlLCBwZXIgc3BhcnNlIHdhcm5pbmcuCj4gdjM6Cj4gICBGb3JjaWJs
eSBzZXQgYml0IDAuCj4gdjI6Cj4gICBNb3ZlIHBhdGNoIHRvIEh5bml4IHNwZWNpZmljIGZpeHVw
IGhvb2suCj4gICBVc2UgQklUKDApIG1hY3JvLgo+IHYxOgo+ICAgSW1wbGVtZW50IGdlbmVyaWMg
cGF0Y2ggaW4gbmFuZF9iYXNlLmMuCj4gCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfaHlu
aXguYyB8IDEzICsrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMo
KykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9oeW5peC5jIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9oeW5peC5jCj4gaW5kZXggMGQ0ZDRiYmZkZWNlLi4z
OTA3NjczNWEzZmIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9oeW5p
eC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9oeW5peC5jCj4gQEAgLTcyOCw4
ICs3MjgsMjEgQEAgc3RhdGljIGludCBoeW5peF9uYW5kX2luaXQoc3RydWN0IG5hbmRfY2hpcCAq
Y2hpcCkKPiAgCXJldHVybiByZXQ7Cj4gIH0KPiAgCj4gK3N0YXRpYyB2b2lkIGh5bml4X2ZpeHVw
X29uZmlfcGFyYW1fcGFnZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAo+ICsJCQkJCXN0cnVjdCBu
YW5kX29uZmlfcGFyYW1zICpwKQo+ICt7Cj4gKwkvKgo+ICsJICogQ2VydGFpbiBjaGlwcyBtaWdo
dCByZXBvcnQgYSAwIG9uIHNkcl90aW1pbmdfbW9kZSBmaWVsZAo+ICsJICogKGJ5dGVzIDEyOS0x
MzApLiBUaGlzIGhhcyBiZWVuIHNlZW4gb24gSDI3VTRHOEYyR0RBLUJJLgo+ICsJICogQWNjb3Jk
aW5nIHRvIE9ORkkgc3BlY2lmaWNhdGlvbiwgYml0IDAgb2YgdGhpcyBmaWVsZCAic2hhbGwgYmUg
MSIuCj4gKwkgKiBGb3JjaWJseSBzZXQgdGhpcyBiaXQuCj4gKwkgKi8KPiArCXAtPnNkcl90aW1p
bmdfbW9kZXMgfD0gY3B1X3RvX2xlMTYoQklUKDApKTsKPiArfQo+ICsKPiAgY29uc3Qgc3RydWN0
IG5hbmRfbWFudWZhY3R1cmVyX29wcyBoeW5peF9uYW5kX21hbnVmX29wcyA9IHsKPiAgCS5kZXRl
Y3QgPSBoeW5peF9uYW5kX2RlY29kZV9pZCwKPiAgCS5pbml0ID0gaHluaXhfbmFuZF9pbml0LAo+
ICAJLmNsZWFudXAgPSBoeW5peF9uYW5kX2NsZWFudXAsCj4gKwkuZml4dXBfb25maV9wYXJhbV9w
YWdlID0gaHluaXhfZml4dXBfb25maV9wYXJhbV9wYWdlLAo+ICB9OwoKClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
