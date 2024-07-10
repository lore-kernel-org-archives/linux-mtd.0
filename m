Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB0FC3DA42
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jul 2024 09:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JLIkLuvHWs74DuIsf1w+FWrk6Unxpi1ZNNBnonDZ5z8=; b=VLF9dYapI+0vSO
	tU9Dwc0BD4yl3YqaYcfN4FcMW6qJ/mNFMW/qtJfIf/LsTF1JKE9k5M8owAeL2JyOMtYlMlxMxRoYe
	eME4BuiGj03neq7ReBmMLbHtI6xE3i9W44hqAjnriyYlyUf7VZtQNO3+K0i9bqgj/9z5xqvYypV2Q
	I1S/Yi/AlZFkhTTcKBfmfI/TAFZ91JfLYVUqrf6mzbYKPmoJd1KHortq51G/OAbL+1dyJo0nR2m5P
	dRcdALjbEKwt7R6xcR3OJ9KTL2NHsy5O8jXtOlS4maQFfmKnPcAMwAjxxpxjcfCF15OtCRkRlMD3q
	UCkKedfQLFR9xtukMnZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRTPt-0000000A2LW-2uhK;
	Wed, 10 Jul 2024 09:15:13 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRTPp-0000000A2KU-1ADA
	for linux-mtd@lists.infradead.org;
	Wed, 10 Jul 2024 09:15:11 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id A98E2A05EC;
	Wed, 10 Jul 2024 11:14:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=8i40Vuw+IuYEzl6a9Xr69NauHgXUINvZ77epVTOrtQo=; b=
	Z50GdAvExkv3NnypvITdQM2xmrzqWeMaOm5QMq3OBtRvAAOEifvmwPoXs2UVXu2Q
	oOHxpjo+o0qh1c97Pb+C3szrvmWJ998CE6ysvbQCqSSt8R+yQ8h7hGZAOwfyaPOX
	a/cdZ95LUDQmSabiyUdkciWo49x9vCSqeFn0dBKouMHm1rwqF1Ph31jlj7tLeswy
	NsMj05ng3hv+aNTT4jrE//wqANKKzaVQte/QMhhxzeSHdqvJGA51FKRLOmRlZpq5
	870eCCW6OIMOHk7lbUqpeXMNkIApu+dQ3F+ExLt98g7rDjOwfQCncTZ8kSXkXQl9
	5n/LB2MxqKJHJ+nhYnpmyjCSBFbHxo71KTnUVMQ3fNvjxOyAmP8q8RV3XceCoLuD
	vjfP0y3OU9ZKi6+0qqJ8pQTF8ieDKJ6QA9vw5zO22HvE8IHR+zvec9jD+puNGF8R
	N4snsRXeLjIoLO61wRQsrwWddJocxZQIIf7DrA7IuoWy2y1GTwtqfp7H6TtBfu8U
	cyEsFyNXtamzd1MBgnwPsNUGscF7jQ/+E/NcCmRAXlhz44Q4pEbshGFq4MNwIs6L
	6eI5UB871+ekkT7GfpZ6ilQ6PhVHOL+9Z2ZuaESYmpYIYpAilQ1LY5syRJVgPpN1
	9e2096CcQA9OhUw35rs7Vcf0/AjhnJWkPfiZa1j9DyM=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] mtd: spi-nor: sst: Factor out common write operation to `sst_nor_write_data()`
Date: Wed, 10 Jul 2024 11:14:01 +0200
Message-ID: <20240710091401.1282824-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1720602896;VERSION=7975;MC=3621083219;ID=61954;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D9485464756B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_021509_805476_8350C81D 
X-CRM114-Status: GOOD (  14.49  )
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

V3JpdGluZyB0byB0aGUgRmxhc2ggaW4gYHNzdF9ub3Jfd3JpdGUoKWAgaXMgYSAzLXN0ZXAgcHJv
Y2VzczoKZmlyc3QgYW4gb3B0aW9uYWwgb25lLWJ5dGUgd3JpdGUgdG8gZ2V0IDItYnl0ZS1hbGln
bmVkLCB0aGVuIHRoZQpidWxrIG9mIHRoZSBkYXRhIGlzIHdyaXR0ZW4gb3V0IGluIHZlbmRvci1z
cGVjaWZpYyAyLWJ5dGUgd3JpdGVzLgpGaW5hbGx5LCBpZiB0aGVyZSdzIGEgYnl0ZSBsZWZ0IG92
ZXIsIGFub3RoZXIgb25lLWJ5dGUgd3JpdGUuClRoaXMgd2FzIGltcGxlbWVudGVkIDMgdGltZXMg
aW4gdGhlIGJvZHkgb2YgYHNzdF9ub3Jfd3JpdGUoKWAuClRvIHJlZHVjZSBjb2RlIGR1cGxpY2F0
aW9uLCBmYWN0b3Igb3V0IHRoZXNlIHN1Yi1zdGVwcyB0byB0aGVpcgpvd24gZnVuY3Rpb24uCgpT
aWduZWQtb2ZmLWJ5OiBDc8Oza8OhcywgQmVuY2UgPGNzb2thcy5iZW5jZUBwcm9sYW4uaHU+Ci0t
LQoKTm90ZXM6CiAgICBSRkM6IEknbSB0aGlua2luZyBvZiByZW1vdmluZyBTUElOT1JfT1BfQlAg
aW4gZmF2b3Igb2YKICAgIFNQSU5PUl9PUF9QUCAodGhleSBoYXZlIHRoZSBzYW1lIHZhbHVlKS4g
U1BJTk9SX09QX1BQCiAgICBpcyB0aGUgInN0YW5kYXJkIiBuYW1lIGZvciB0aGUgZWxlbWVudGFy
eSB1bml0LXNpemVkCiAgICAoMSBieXRlLCBpbiB0aGUgY2FzZSBvZiBOT1IpIHdyaXRlIG9wZXJh
dGlvbi4gSSBmaW5kIGl0CiAgICBjb25mdXNpbmcgdG8gaGF2ZSB0d28gbmFtZXMgZm9yIHRoZSBz
YW1lIG9wZXJhdGlvbiwKICAgIHNvIGluIGEgZm9sbG93dXAgSSBwbGFuIHRvIHJlbW92ZSB0aGUg
dmVuZG9yLXNwZWNpZmljCiAgICBuYW1lIGluIGZhdm9yIG9mIHRoZSBzdGFuZGFyZCBvbmUuCgog
ZHJpdmVycy9tdGQvc3BpLW5vci9zc3QuYyB8IDM5ICsrKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDIwIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3N0LmMgYi9kcml2ZXJz
L210ZC9zcGktbm9yL3NzdC5jCmluZGV4IDE4MGI3MzkwNjkwYy4uZmVjNzE2ODllNjQ0IDEwMDY0
NAotLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL3NzdC5jCisrKyBiL2RyaXZlcnMvbXRkL3NwaS1u
b3Ivc3N0LmMKQEAgLTE2Nyw2ICsxNjcsMjEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9p
bmZvIHNzdF9ub3JfcGFydHNbXSA9IHsKIAl9CiB9OwogCitzdGF0aWMgaW50IHNzdF9ub3Jfd3Jp
dGVfZGF0YShzdHJ1Y3Qgc3BpX25vciAqbm9yLCBsb2ZmX3QgdG8sIHNpemVfdCBsZW4sCisJCQlj
b25zdCB1X2NoYXIgKmJ1ZikKK3sKKwl1OCBvcCA9IChsZW4gPT0gMSkgPyBTUElOT1JfT1BfQlAg
OiBTUElOT1JfT1BfQUFJX1dQOworCWludCByZXQ7CisKKwlub3ItPnByb2dyYW1fb3Bjb2RlID0g
b3A7CisJcmV0ID0gc3BpX25vcl93cml0ZV9kYXRhKG5vciwgdG8sIDEsIGJ1Zik7CisJaWYgKHJl
dCA8IDApCisJCXJldHVybiByZXQ7CisJV0FSTihyZXQgIT0gbGVuLCAiV2hpbGUgd3JpdGluZyAl
aSBieXRlIHdyaXR0ZW4gJWkgYnl0ZXNcbiIsIGxlbiwgcmV0KTsKKworCXJldHVybiBzcGlfbm9y
X3dhaXRfdGlsbF9yZWFkeShub3IpOworfQorCiBzdGF0aWMgaW50IHNzdF9ub3Jfd3JpdGUoc3Ry
dWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCB0bywgc2l6ZV90IGxlbiwKIAkJCSBzaXplX3QgKnJl
dGxlbiwgY29uc3QgdV9jaGFyICpidWYpCiB7CkBAIC0xODgsMTYgKzIwMywxMCBAQCBzdGF0aWMg
aW50IHNzdF9ub3Jfd3JpdGUoc3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCB0bywgc2l6ZV90
IGxlbiwKIAogCS8qIFN0YXJ0IHdyaXRlIGZyb20gb2RkIGFkZHJlc3MuICovCiAJaWYgKHRvICUg
MikgewotCQlub3ItPnByb2dyYW1fb3Bjb2RlID0gU1BJTk9SX09QX0JQOwotCiAJCS8qIHdyaXRl
IG9uZSBieXRlLiAqLwotCQlyZXQgPSBzcGlfbm9yX3dyaXRlX2RhdGEobm9yLCB0bywgMSwgYnVm
KTsKKwkJcmV0ID0gc3N0X25vcl93cml0ZV9kYXRhKG5vciwgdG8sIDEsIGJ1Zik7CiAJCWlmIChy
ZXQgPCAwKQogCQkJZ290byBvdXQ7Ci0JCVdBUk4ocmV0ICE9IDEsICJXaGlsZSB3cml0aW5nIDEg
Ynl0ZSB3cml0dGVuICVpIGJ5dGVzXG4iLCByZXQpOwotCQlyZXQgPSBzcGlfbm9yX3dhaXRfdGls
bF9yZWFkeShub3IpOwotCQlpZiAocmV0KQotCQkJZ290byBvdXQ7CiAKIAkJdG8rKzsKIAkJYWN0
dWFsKys7CkBAIC0yMDUsMTYgKzIxNCwxMSBAQCBzdGF0aWMgaW50IHNzdF9ub3Jfd3JpdGUoc3Ry
dWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCB0bywgc2l6ZV90IGxlbiwKIAogCS8qIFdyaXRlIG91
dCBtb3N0IG9mIHRoZSBkYXRhIGhlcmUuICovCiAJZm9yICg7IGFjdHVhbCA8IGxlbiAtIDE7IGFj
dHVhbCArPSAyKSB7Ci0JCW5vci0+cHJvZ3JhbV9vcGNvZGUgPSBTUElOT1JfT1BfQUFJX1dQOwot
CiAJCS8qIHdyaXRlIHR3byBieXRlcy4gKi8KLQkJcmV0ID0gc3BpX25vcl93cml0ZV9kYXRhKG5v
ciwgdG8sIDIsIGJ1ZiArIGFjdHVhbCk7CisJCXJldCA9IHNzdF9ub3Jfd3JpdGVfZGF0YShub3Is
IHRvLCAyLCBidWYgKyBhY3R1YWwpOwogCQlpZiAocmV0IDwgMCkKIAkJCWdvdG8gb3V0OwotCQlX
QVJOKHJldCAhPSAyLCAiV2hpbGUgd3JpdGluZyAyIGJ5dGVzIHdyaXR0ZW4gJWkgYnl0ZXNcbiIs
IHJldCk7Ci0JCXJldCA9IHNwaV9ub3Jfd2FpdF90aWxsX3JlYWR5KG5vcik7Ci0JCWlmIChyZXQp
Ci0JCQlnb3RvIG91dDsKKwogCQl0byArPSAyOwogCQlub3ItPnNzdF93cml0ZV9zZWNvbmQgPSB0
cnVlOwogCX0KQEAgLTIzNCwxNCArMjM4LDkgQEAgc3RhdGljIGludCBzc3Rfbm9yX3dyaXRlKHN0
cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3QgdG8sIHNpemVfdCBsZW4sCiAJCWlmIChyZXQpCiAJ
CQlnb3RvIG91dDsKIAotCQlub3ItPnByb2dyYW1fb3Bjb2RlID0gU1BJTk9SX09QX0JQOwotCQly
ZXQgPSBzcGlfbm9yX3dyaXRlX2RhdGEobm9yLCB0bywgMSwgYnVmICsgYWN0dWFsKTsKKwkJcmV0
ID0gc3N0X25vcl93cml0ZV9kYXRhKG5vciwgdG8sIDEsIGJ1ZiArIGFjdHVhbCk7CiAJCWlmIChy
ZXQgPCAwKQogCQkJZ290byBvdXQ7Ci0JCVdBUk4ocmV0ICE9IDEsICJXaGlsZSB3cml0aW5nIDEg
Ynl0ZSB3cml0dGVuICVpIGJ5dGVzXG4iLCByZXQpOwotCQlyZXQgPSBzcGlfbm9yX3dhaXRfdGls
bF9yZWFkeShub3IpOwotCQlpZiAocmV0KQotCQkJZ290byBvdXQ7CiAKIAkJYWN0dWFsICs9IDE7
CiAKLS0gCjIuMzQuMQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
