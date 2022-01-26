Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B076C28CF5
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 10:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=e8l5sELvhP+i2nBQVFxYxmy8dh0veaMUydjX7aYE/ww=; b=uPkRVwNJw6z0t5wFXStsDP0a5+
	Qk0xnSFuYDfgbW+yJ153/F1UNlQITm1U2HfJ87okK4tsi8LleN8cVgyyxMRlX4LVCdmNk4U9aw4Tk
	gQjJpAbfLoxZV7/wtGZFPA3skUdklFhEjKAQFBJjXGQuYGmRPwMFPZcSpkizoceaeOPfI669xs3sM
	7RkZKhfP3E4EiLXpTwW9PvTk3ltg2GyXIO0JIUy727K1nkJCcTdJ/lMb0ZgkNSuW1Udofe4g3kz7Q
	Y/3Ax+wZ5XT9fdOn9J2uLTTgQ4Va6IEcEqvLuXtgjS2gM08mbRcqa/aTaGJzZW6J9hJenSOjaVbh6
	5YweLchQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCfMC-00BBDG-Ka; Wed, 26 Jan 2022 10:16:52 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCfM9-00BBAs-54
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 10:16:51 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 794E062DA5E8;
 Wed, 26 Jan 2022 11:16:45 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Iodvaia3o8OL; Wed, 26 Jan 2022 11:16:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 97CE462DA600;
 Wed, 26 Jan 2022 11:16:44 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id gV0eCLkHSCw4; Wed, 26 Jan 2022 11:16:44 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 7B57F62DA5E8;
 Wed, 26 Jan 2022 11:16:44 +0100 (CET)
Date: Wed, 26 Jan 2022 11:16:44 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: David Decotigny <decot+git@google.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 David Decotigny <ddecotig@google.com>
Message-ID: <1731069218.295954.1643192204437.JavaMail.zimbra@nod.at>
In-Reply-To: <20220126101120.676021-1-decot+git@google.com>
References: <20220126101120.676021-1-decot+git@google.com>
Subject: Re: [PATCH RFC v3 1/1] mtd_blkdevs: avoid soft lockups with some
 mtd/spi devices
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF96 (Linux)/8.8.12_GA_3809)
Thread-Topic: mtd_blkdevs: avoid soft lockups with some mtd/spi devices
Thread-Index: Km7RZfifyzt40j+pYC4LhQrM53KEeg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_021649_523282_1F4FAF69 
X-CRM114-Status: UNSURE (   6.46  )
X-CRM114-Notice: Please train this message.
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkRhdmlkIERlY290aWdueSIg
PGRlY290K2dpdEBnb29nbGUuY29tPgo+IEFuOiAibGludXgta2VybmVsIiA8bGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZz4KPiBDQzogIk1pcXVlbCBSYXluYWwiIDxtaXF1ZWwucmF5bmFsQGJv
b3RsaW4uY29tPiwgInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJWaWduZXNoIFJhZ2hhdmVu
ZHJhIiA8dmlnbmVzaHJAdGkuY29tPiwKPiAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmlu
ZnJhZGVhZC5vcmc+LCAiRGF2aWQgRGVjb3RpZ255IiA8ZGRlY290aWdAZ29vZ2xlLmNvbT4KPiBH
ZXNlbmRldDogTWl0dHdvY2gsIDI2LiBKYW51YXIgMjAyMiAxMToxMToyMAo+IEJldHJlZmY6IFtQ
QVRDSCBSRkMgdjMgMS8xXSBtdGRfYmxrZGV2czogYXZvaWQgc29mdCBsb2NrdXBzIHdpdGggc29t
ZSBtdGQvc3BpIGRldmljZXMKCj4gRnJvbTogRGF2aWQgRGVjb3RpZ255IDxkZGVjb3RpZ0Bnb29n
bGUuY29tPgo+IAo+IFdpdGggc29tZSBzcGkgZGV2aWNlcywgdGhlIGhlYXZ5IGNwdSB1c2FnZSBk
dWUgdG8gcG9sbGluZyB0aGUgc3BpCj4gcmVnaXN0ZXJzIG1heSBsZWFkIHRvIG5ldGRldiB0aW1l
b3V0cywgUkNVIGNvbXBsYWludHMsIGV0Yy4gVGhpcyBjYW4KPiBiZSBhY3V0ZSBpbiB0aGUgYWJz
ZW5jZSBvZiBDT05GSUdfUFJFRU1QVC4gVGhpcyBwYXRjaCBhbGxvd3MgdG8gZ2l2ZQo+IGVub3Vn
aCBicmVhdGhpbmcgcm9vbSB0byBhdm9pZCB0aG9zZSBpbmNvcnJlY3RseSBkZXRlY3RlZCBuZXRk
ZXYKPiB0aW1lb3V0cyBmb3IgZXhhbXBsZS4KPiAKPiBFeGFtcGxlIHNwbGF0IG9uIDUuMTAuOTI6
Cj4gWyAgODI4LjM5OTMwNl0gcmN1OiBJTkZPOiByY3Vfc2NoZWQgc2VsZi1kZXRlY3RlZCBzdGFs
bCBvbiBDUFUKPiAuLi4KPiBbICA4MjguNDE5MjQ1XSBUYXNrIGR1bXAgZm9yIENQVSAxOgo+IFsg
IDgyOC40MjI0NjVdIHRhc2s6a3dvcmtlci8xOjFIICAgIHN0YXRlOlIgIHJ1bm5pbmcgdGFzayBv
biBjcHUgICAxICAgc3RhY2s6Cj4gMCBwaWQ6ICAgNzYgcHBpZDogICAgIDIgZmxhZ3M6MHgwMDAw
MDAyYQo+IFsgIDgyOC40MzMxMzJdIFdvcmtxdWV1ZToga2Jsb2NrZCBibGtfbXFfcnVuX3dvcmtf
Zm4KPiBbICA4MjguNDM3ODIwXSBDYWxsIHRyYWNlOgo+IC4uLgo+IFsgIDgyOC41MTIyNjddICBz
cGlfbWVtX2V4ZWNfb3ArMHg0ZDAvMHhkZTAKPiBbICA4MjguNTE2MTg0XSAgc3BpX21lbV9kaXJt
YXBfcmVhZCsweDE4MC8weDM5Ywo+IFsgIDgyOC41MjA0NDNdICBzcGlfbm9yX3JlYWRfZGF0YSsw
eDQyOC8weDdlOAo+IFsgIDgyOC41MjQ1MjNdICBzcGlfbm9yX3JlYWQrMHgxNTQvMHgyMTQKPiBb
ICA4MjguNTI4MTcyXSAgbXRkX3JlYWRfb29iKzB4NDQwLzB4NzE0Cj4gWyAgODI4LjUzMTgxNV0g
IG10ZF9yZWFkKzB4YWMvMHgxMjAKPiBbICA4MjguNTM1MDMwXSAgbXRkYmxvY2tfcmVhZHNlY3Qr
MHgxNzgvMHgyMzAKPiBbICA4MjguNTM5MTAyXSAgbXRkX2Jsa3RyYW5zX3dvcmsrMHg5ZmMvMHhm
MjgKPiBbICA4MjguNTQzMTc3XSAgbXRkX3F1ZXVlX3JxKzB4MWFjLzB4MmU0Cj4gWyAgODI4LjU0
NjgyN10gIGJsa19tcV9kaXNwYXRjaF9ycV9saXN0KzB4MmNjLzB4YTQ0Cj4gWyAgODI4LjU1MTQx
OV0gIGJsa19tcV9kb19kaXNwYXRjaF9zY2hlZCsweGIwLzB4N2NjCj4gWyAgODI4LjU1NjAxMF0g
IF9fYmxrX21xX3NjaGVkX2Rpc3BhdGNoX3JlcXVlc3RzKzB4MzUwLzB4NDk0Cj4gWyAgODI4LjU2
MTM3Ml0gIGJsa19tcV9zY2hlZF9kaXNwYXRjaF9yZXF1ZXN0cysweGFjLzB4ZTQKPiBbICA4Mjgu
NTY2Mzg3XSAgX19ibGtfbXFfcnVuX2h3X3F1ZXVlKzB4MTMwLzB4MjU0Cj4gWyAgODI4LjU3MDgw
Nl0gIGJsa19tcV9ydW5fd29ya19mbisweDUwLzB4NjAKPiBbICA4MjguNTc0ODE0XSAgcHJvY2Vz
c19vbmVfd29yaysweDU3OC8weGYxYwo+IFsgIDgyOC41Nzg4MTRdICB3b3JrZXJfdGhyZWFkKzB4
NWRjLzB4ZWEwCj4gWyAgODI4LjU4MjU0N10gIGt0aHJlYWQrMHgyNzAvMHgyZDQKPiBbICA4Mjgu
NTg1NzY1XSAgcmV0X2Zyb21fZm9yaysweDEwLzB4MzAKPiAKPiAKPiBTaWduZWQtb2ZmLWJ5OiBE
YXZpZCBEZWNvdGlnbnkgPGRkZWNvdGlnQGdvb2dsZS5jb20+CgpSZXZpZXdlZC1ieTogUmljaGFy
ZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
