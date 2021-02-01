Return-Path: <SRS0=Ud6c=HD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F11C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Feb 2021 14:50:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D68D64DAD
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Feb 2021 14:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D68D64DAD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XLTn42OAQEiRQ3ey70AwHphxSncvrS2+FxArEnpsqDQ=; b=O2qiZ6Ak+5vrWbYkYH+21vf3L
	BAWDDCi/LazOPF4HA397MNO9GDysDDryg5Pp1wes07+QpW0pzwFoSrLWqFI1Nk/VFlCUqTh8Eo39/
	Y0HryQIdesICTi0lm946/orYht42eRmAS67dnioELDPYelJItcnlSDcXU0jayYYeRIGIPT3GTXYWy
	k6fFFhFZioY6PXHfo8ucg6GNBwUZ/I/8sTuCy9JV3lhv/7AtU5NCHcCbpVmvjG1coTJXnioWrvuxE
	+Oowr3qJuhUOOfU+QSqdd5bYzdhkm1JQvOMeHowCjaMPklUvhgNSWQvRcYGwWgOytGwUyCk1qGLb8
	aJvK06nWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6aW4-0000C3-Q7; Mon, 01 Feb 2021 14:49:24 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6aW0-0000B6-4M
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2021 14:49:23 +0000
X-Originating-IP: 86.210.203.150
Received: from xps13 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr
 [86.210.203.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id AD9D760004;
 Mon,  1 Feb 2021 14:49:15 +0000 (UTC)
Date: Mon, 1 Feb 2021 15:49:14 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: zhengxunli <zhengxunli@mxic.com.tw>
Subject: Re: [PATCH 2/3] spi: mxic: patch for octal DTR mode support
Message-ID: <20210201154914.3ba94c9d@xps13>
In-Reply-To: <1611908018-29937-3-git-send-email-zhengxunli@mxic.com.tw>
References: <1611908018-29937-1-git-send-email-zhengxunli@mxic.com.tw>
 <1611908018-29937-3-git-send-email-zhengxunli@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_094920_366894_B31AE707 
X-CRM114-Status: GOOD (  18.08  )
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
Cc: juliensu@mxic.com.tw, ycllin@mxic.com.tw, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgp6aGVuZ3h1bmxpIDx6aGVuZ3h1bmxpQG14aWMuY29tLnR3PiB3cm90ZSBvbiBGcmks
IDI5IEphbiAyMDIxIDE2OjEzOjM3CiswODAwOgoKPiBEcml2ZXIgcGF0Y2ggZm9yIG9jdGFsIDhE
LThELThEIG1vZGUgc3VwcG9ydC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiB6aGVuZ3h1bmxpIDx6aGVu
Z3h1bmxpQG14aWMuY29tLnR3Pgo+IC0tLQo+ICBkcml2ZXJzL3NwaS9zcGktbXhpYy5jIHwgMzMg
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMiBp
bnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9z
cGkvc3BpLW14aWMuYyBiL2RyaXZlcnMvc3BpL3NwaS1teGljLmMKPiBpbmRleCA5NmI0MTgyLi44
MjEzMjhhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1teGljLmMKPiArKysgYi9kcml2
ZXJzL3NwaS9zcGktbXhpYy5jCj4gQEAgLTMzNSw4ICszMzUsOCBAQCBzdGF0aWMgaW50IG14aWNf
c3BpX2RhdGFfeGZlcihzdHJ1Y3QgbXhpY19zcGkgKm14aWMsIGNvbnN0IHZvaWQgKnR4YnVmLAo+
ICBzdGF0aWMgYm9vbCBteGljX3NwaV9tZW1fc3VwcG9ydHNfb3Aoc3RydWN0IHNwaV9tZW0gKm1l
bSwKPiAgCQkJCSAgICAgY29uc3Qgc3RydWN0IHNwaV9tZW1fb3AgKm9wKQo+ICB7Cj4gLQlpZiAo
b3AtPmRhdGEuYnVzd2lkdGggPiA0IHx8IG9wLT5hZGRyLmJ1c3dpZHRoID4gNCB8fAo+IC0JICAg
IG9wLT5kdW1teS5idXN3aWR0aCA+IDQgfHwgb3AtPmNtZC5idXN3aWR0aCA+IDQpCj4gKwlpZiAo
b3AtPmRhdGEuYnVzd2lkdGggPiA4IHx8IG9wLT5hZGRyLmJ1c3dpZHRoID4gOCB8fAo+ICsJICAg
IG9wLT5kdW1teS5idXN3aWR0aCA+IDggfHwgb3AtPmNtZC5idXN3aWR0aCA+IDgpCj4gIAkJcmV0
dXJuIGZhbHNlOwo+ICAKPiAgCWlmIChvcC0+ZGF0YS5uYnl0ZXMgJiYgb3AtPmR1bW15Lm5ieXRl
cyAmJgo+IEBAIC0zNDYsNyArMzQ2LDcgQEAgc3RhdGljIGJvb2wgbXhpY19zcGlfbWVtX3N1cHBv
cnRzX29wKHN0cnVjdCBzcGlfbWVtICptZW0sCj4gIAlpZiAob3AtPmFkZHIubmJ5dGVzID4gNykK
PiAgCQlyZXR1cm4gZmFsc2U7Cj4gIAo+IC0JcmV0dXJuIHNwaV9tZW1fZGVmYXVsdF9zdXBwb3J0
c19vcChtZW0sIG9wKTsKPiArCXJldHVybiB0cnVlOwoKRG9lcyBub3Qgc2VlbSBjb3JyZWN0LiBX
aHkgd291bGQgeW91IGRyb3AgdGhpcyBjaGVjaz8KCj4gIH0KPiAgCj4gIHN0YXRpYyBpbnQgbXhp
Y19zcGlfbWVtX2V4ZWNfb3Aoc3RydWN0IHNwaV9tZW0gKm1lbSwKPiBAQCAtMzU1LDE0ICszNTUs
MTUgQEAgc3RhdGljIGludCBteGljX3NwaV9tZW1fZXhlY19vcChzdHJ1Y3Qgc3BpX21lbSAqbWVt
LAo+ICAJc3RydWN0IG14aWNfc3BpICpteGljID0gc3BpX21hc3Rlcl9nZXRfZGV2ZGF0YShtZW0t
PnNwaS0+bWFzdGVyKTsKPiAgCWludCBuaW8gPSAxLCBpLCByZXQ7Cj4gIAl1MzIgc3NfY3RybDsK
PiAtCXU4IGFkZHJbOF07Cj4gLQl1OCBvcGNvZGUgPSBvcC0+Y21kLm9wY29kZTsKPiArCXU4IGFk
ZHJbOF0sIGNtZFsyXTsKPiAgCj4gIAlyZXQgPSBteGljX3NwaV9zZXRfZnJlcShteGljLCBtZW0t
PnNwaS0+bWF4X3NwZWVkX2h6KTsKPiAgCWlmIChyZXQpCj4gIAkJcmV0dXJuIHJldDsKPiAgCj4g
LQlpZiAobWVtLT5zcGktPm1vZGUgJiAoU1BJX1RYX1FVQUQgfCBTUElfUlhfUVVBRCkpCj4gKwlp
ZiAobWVtLT5zcGktPm1vZGUgJiAoU1BJX1RYX09DVEFMIHwgU1BJX1JYX09DVEFMKSkKPiArCQlu
aW8gPSA4Owo+ICsJZWxzZSBpZiAobWVtLT5zcGktPm1vZGUgJiAoU1BJX1RYX1FVQUQgfCBTUElf
UlhfUVVBRCkpCj4gIAkJbmlvID0gNDsKPiAgCWVsc2UgaWYgKG1lbS0+c3BpLT5tb2RlICYgKFNQ
SV9UWF9EVUFMIHwgU1BJX1JYX0RVQUwpKQo+ICAJCW5pbyA9IDI7Cj4gQEAgLTM3NCwxOSArMzc1
LDI1IEBAIHN0YXRpYyBpbnQgbXhpY19zcGlfbWVtX2V4ZWNfb3Aoc3RydWN0IHNwaV9tZW0gKm1l
bSwKPiAgCSAgICAgICBteGljLT5yZWdzICsgSENfQ0ZHKTsKPiAgCXdyaXRlbChIQ19FTl9CSVQs
IG14aWMtPnJlZ3MgKyBIQ19FTik7Cj4gIAo+IC0Jc3NfY3RybCA9IE9QX0NNRF9CWVRFUygxKSB8
IE9QX0NNRF9CVVNXKGZscyhvcC0+Y21kLmJ1c3dpZHRoKSAtIDEpOwo+ICsJc3NfY3RybCA9IE9Q
X0NNRF9CWVRFUyhvcC0+Y21kLm5ieXRlcykgfAo+ICsJCSAgT1BfQ01EX0JVU1coZmxzKG9wLT5j
bWQuYnVzd2lkdGgpIC0gMSkgfAo+ICsJCSAgKG9wLT5jbWQuZHRyID8gT1BfQ01EX0REUiA6IDAp
Owo+ICAKPiAgCWlmIChvcC0+YWRkci5uYnl0ZXMpCj4gIAkJc3NfY3RybCB8PSBPUF9BRERSX0JZ
VEVTKG9wLT5hZGRyLm5ieXRlcykgfAo+IC0JCQkgICBPUF9BRERSX0JVU1coZmxzKG9wLT5hZGRy
LmJ1c3dpZHRoKSAtIDEpOwo+ICsJCQkgICBPUF9BRERSX0JVU1coZmxzKG9wLT5hZGRyLmJ1c3dp
ZHRoKSAtIDEpIHwKPiArCQkJICAgKG9wLT5hZGRyLmR0ciA/IE9QX0FERFJfRERSIDogMCk7Cj4g
IAo+ICAJaWYgKG9wLT5kdW1teS5uYnl0ZXMpCj4gIAkJc3NfY3RybCB8PSBPUF9EVU1NWV9DWUMo
b3AtPmR1bW15Lm5ieXRlcyk7Cj4gIAo+ICAJaWYgKG9wLT5kYXRhLm5ieXRlcykgewo+IC0JCXNz
X2N0cmwgfD0gT1BfREFUQV9CVVNXKGZscyhvcC0+ZGF0YS5idXN3aWR0aCkgLSAxKTsKPiArCQlz
c19jdHJsIHw9IE9QX0RBVEFfQlVTVyhmbHMob3AtPmRhdGEuYnVzd2lkdGgpIC0gMSkgfAo+ICsJ
CQkgICAob3AtPmRhdGEuZHRyID8gT1BfREFUQV9ERFIgOiAwKTsKPiAgCQlpZiAob3AtPmRhdGEu
ZGlyID09IFNQSV9NRU1fREFUQV9JTikKPiAgCQkJc3NfY3RybCB8PSBPUF9SRUFEOwo+ICsJCQlp
ZiAob3AtPmRhdGEuZHRyKQo+ICsJCQkJc3NfY3RybCB8PSBPUF9EUVNfRU47Cj4gIAl9Cj4gIAo+
ICAJd3JpdGVsKHNzX2N0cmwsIG14aWMtPnJlZ3MgKyBTU19DVFJMKG1lbS0+c3BpLT5jaGlwX3Nl
bGVjdCkpOwo+IEBAIC0zOTQsNyArNDAxLDEwIEBAIHN0YXRpYyBpbnQgbXhpY19zcGlfbWVtX2V4
ZWNfb3Aoc3RydWN0IHNwaV9tZW0gKm1lbSwKPiAgCXdyaXRlbChyZWFkbChteGljLT5yZWdzICsg
SENfQ0ZHKSB8IEhDX0NGR19NQU5fQ1NfQVNTRVJULAo+ICAJICAgICAgIG14aWMtPnJlZ3MgKyBI
Q19DRkcpOwo+ICAKPiAtCXJldCA9IG14aWNfc3BpX2RhdGFfeGZlcihteGljLCAmb3Bjb2RlLCBO
VUxMLCAxKTsKPiArCWZvciAoaSA9IDA7IGkgPCBvcC0+Y21kLm5ieXRlczsgaSsrKQoKQ2FuIHdl
IGFkZCBhIGNoZWNrIGluIG14aWNfc3BpX21lbV9jaGVja19vcCB0byBlbnN1cmUgbmJ5dGVzIGlz
IG5ldmVyID4KMiA/Cgo+ICsJCWNtZFtpXSA9IG9wLT5jbWQub3Bjb2RlID4+ICg4ICogKG9wLT5j
bWQubmJ5dGVzIC0gaSAtIDEpKTsKPiArCj4gKwlyZXQgPSBteGljX3NwaV9kYXRhX3hmZXIobXhp
YywgY21kLCBOVUxMLCBvcC0+Y21kLm5ieXRlcyk7Cj4gIAlpZiAocmV0KQo+ICAJCWdvdG8gb3V0
Owo+ICAKPiBAQCAtNTY3LDcgKzU3Nyw4IEBAIHN0YXRpYyBpbnQgbXhpY19zcGlfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCW1hc3Rlci0+Yml0c19wZXJfd29yZF9tYXNr
ID0gU1BJX0JQV19NQVNLKDgpOwo+ICAJbWFzdGVyLT5tb2RlX2JpdHMgPSBTUElfQ1BPTCB8IFNQ
SV9DUEhBIHwKPiAgCQkJU1BJX1JYX0RVQUwgfCBTUElfVFhfRFVBTCB8Cj4gLQkJCVNQSV9SWF9R
VUFEIHwgU1BJX1RYX1FVQUQ7Cj4gKwkJCVNQSV9SWF9RVUFEIHwgU1BJX1RYX1FVQUQgfAo+ICsJ
CQlTUElfUlhfT0NUQUwgfCBTUElfVFhfT0NUQUw7Cj4gIAo+ICAJbXhpY19zcGlfaHdfaW5pdCht
eGljKTsKPiAgCgpPdGhlcndpc2UgbG9va3MgZmluZS4KClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
