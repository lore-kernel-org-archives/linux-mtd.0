Return-Path: <SRS0=ioUS=UC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02501C04AB5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 11:31:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C787928146
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 11:31:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LJnU1HnK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C787928146
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=buZdR4A9mmLRwv9TAsJIYoRRt08vE4zuwY3P3Syvj+E=; b=LJnU1HnK08++sY
	iP//9UJRL3D1A06dUBNum+Qep5ryGy9gi+GvpdwPm/zUbTxNbQej3zhSR8SkdTHOIRdjtlNzW+N5y
	ZalF2+Y2/As7zk1+TLrANmMvLpvCAHib2pkzwNlRvXxuvgmp01Vzuc5MctA9Ib48n5am14HuRP0Hm
	+sU5eiRstXxiIkxWzpuWtosY+COL0YS0xInDnA+GV9iqYeiIB+e80dWrskoc5DNWR+4ZTZkBSR4AR
	nTqHwPVkzwjO0zigx0el4xUsAsZOLZsmVv07qUEEZZBpD2G+7jFiOjg8wN5k+AoaJbycUR2TOpXJq
	9kY0w9mmz8/PWjQbYEiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXlBh-000238-4F; Mon, 03 Jun 2019 11:31:37 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXlBe-00022O-Dz
 for linux-mtd@lists.infradead.org; Mon, 03 Jun 2019 11:31:36 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id DAC8F608313E;
 Mon,  3 Jun 2019 13:31:24 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id BBBu8WrQ-GkI; Mon,  3 Jun 2019 13:31:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 909D1608313F;
 Mon,  3 Jun 2019 13:31:24 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id tkrjw8y4-Zq6; Mon,  3 Jun 2019 13:31:24 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 73073608313E;
 Mon,  3 Jun 2019 13:31:24 +0200 (CEST)
Date: Mon, 3 Jun 2019 13:31:24 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Leon Pollak <leon.pollak@gmail.com>
Message-ID: <1836750693.78725.1559561484414.JavaMail.zimbra@nod.at>
In-Reply-To: <CAM===sQ3bn34HCajra=Fh6X-u_fTt19UTsKz_EntAcndSd++gw@mail.gmail.com>
References: <CAM===sSAP-qRv7jxBs9KZDFyuL+Dx3wSkQfSOiSQtp8Z8FQcMw@mail.gmail.com>
 <CAFLxGvymOZbBM=wtK-fcgYOv7OOucpcZ1eZJ9GQmUH8h9Jcc+Q@mail.gmail.com>
 <CAM===sSzy4=joOnzLxbSDoC=4HgmXj7QF14vzFCKTWt8z-JLoA@mail.gmail.com>
 <CAM===sQ3bn34HCajra=Fh6X-u_fTt19UTsKz_EntAcndSd++gw@mail.gmail.com>
Subject: Re: UBIFS on write-protected NAND
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.8_GA_3025 (ZimbraWebClient - FF60 (Linux)/8.8.8_GA_1703)
Thread-Topic: UBIFS on write-protected NAND
Thread-Index: sSbUrzaO3W+VBBOoZ9tFjAOVc3LwGw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_043134_617045_19987866 
X-CRM114-Status: UNSURE (   5.94  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkxlb24gUG9sbGFrIiA8bGVv
bi5wb2xsYWtAZ21haWwuY29tPgo+IEFuOiAiUmljaGFyZCBXZWluYmVyZ2VyIiA8cmljaGFyZC53
ZWluYmVyZ2VyQGdtYWlsLmNvbT4KPiBDQzogImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5p
bmZyYWRlYWQub3JnPgo+IEdlc2VuZGV0OiBNb250YWcsIDMuIEp1bmkgMjAxOSAxMzoxMTo1Mgo+
IEJldHJlZmY6IFJlOiBVQklGUyBvbiB3cml0ZS1wcm90ZWN0ZWQgTkFORAoKPiBTb3JyeSwgSSB0
aGluayB0aGUgZnVsbCBVQkkgbG9nIG1heSBiZSBhbHNvIHVzZWZ1bDoKPiBVQkk6IGF0dGFjaGlu
ZyBtdGQ0IHRvIHViaTAKPiBVQkk6IHBoeXNpY2FsIGVyYXNlYmxvY2sgc2l6ZTogICAxMzEwNzIg
Ynl0ZXMgKDEyOCBLaUIpCj4gVUJJOiBsb2dpY2FsIGVyYXNlYmxvY2sgc2l6ZTogICAgMTI2OTc2
IGJ5dGVzCj4gVUJJOiBzbWFsbGVzdCBmbGFzaCBJL08gdW5pdDogICAgMjA0OAo+IFVCSTogc3Vi
LXBhZ2Ugc2l6ZTogICAgICAgICAgICAgIDUxMgo+IFVCSTogVklEIGhlYWRlciBvZmZzZXQ6ICAg
ICAgICAgIDIwNDggKGFsaWduZWQgMjA0OCkKPiBVQkk6IGRhdGEgb2Zmc2V0OiAgICAgICAgICAg
ICAgICA0MDk2Cj4gVUJJOiBtYXguIHNlcXVlbmNlIG51bWJlcjogICAgICAgODUKPiBVQkk6IGF0
dGFjaGVkIG10ZDQgdG8gdWJpMAo+IFVCSTogTVREIGRldmljZSBuYW1lOiAgICAgICAgICAgICJG
aWxlIFN5c3RlbSIKPiBVQkk6IE1URCBkZXZpY2Ugc2l6ZTogICAgICAgICAgICAyMDAgTWlCCj4g
VUJJOiBudW1iZXIgb2YgZ29vZCBQRUJzOiAgICAgICAgMTYwMQo+IFVCSTogbnVtYmVyIG9mIGJh
ZCBQRUJzOiAgICAgICAgIDAKPiBVQkk6IG51bWJlciBvZiBjb3JydXB0ZWQgUEVCczogICAwCj4g
VUJJOiBtYXguIGFsbG93ZWQgdm9sdW1lczogICAgICAgMTI4Cj4gVUJJOiB3ZWFyLWxldmVsaW5n
IHRocmVzaG9sZDogICAgNDA5Ngo+IFVCSTogbnVtYmVyIG9mIGludGVybmFsIHZvbHVtZXM6IDEK
PiBVQkk6IG51bWJlciBvZiB1c2VyIHZvbHVtZXM6ICAgICAxCj4gVUJJOiBhdmFpbGFibGUgUEVC
czogICAgICAgICAgICAgMAo+IFVCSTogdG90YWwgbnVtYmVyIG9mIHJlc2VydmVkIFBFQnM6IDE2
MDEKPiBVQkk6IG51bWJlciBvZiBQRUJzIHJlc2VydmVkIGZvciBiYWQgUEVCIGhhbmRsaW5nOiAx
Ngo+IFVCSTogbWF4L21lYW4gZXJhc2UgY291bnRlcjogMi8wCj4gVUJJOiBpbWFnZSBzZXF1ZW5j
ZSBudW1iZXI6ICAxMjYxMzM4NDQKPiBVQkk6IGJhY2tncm91bmQgdGhyZWFkICJ1YmlfYmd0MGQi
IHN0YXJ0ZWQsIFBJRCA0Mgo+IFVCSUZTOiBtb3VudGVkIFVCSSBkZXZpY2UgMCwgdm9sdW1lIDAs
IG5hbWUgInViaV9yb290ZnMiCj4gVUJJRlM6IG1vdW50ZWQgcmVhZC1vbmx5Cj4gVUJJRlM6IGZp
bGUgc3lzdGVtIHNpemU6ICAgMTk5MjI1MzQ0IGJ5dGVzICgxOTQ1NTYgS2lCLCAxODkgTWlCLCAx
NTY5IExFQnMpCj4gVUJJRlM6IGpvdXJuYWwgc2l6ZTogICAgICAgOTAyMzQ4OCBieXRlcyAoODgx
MiBLaUIsIDggTWlCLCA3MiBMRUJzKQo+IFVCSUZTOiBtZWRpYSBmb3JtYXQ6ICAgICAgIHc0L3Iw
IChsYXRlc3QgaXMgdzQvcjApCj4gVUJJRlM6IGRlZmF1bHQgY29tcHJlc3NvcjogbHpvCj4gVUJJ
RlM6IHJlc2VydmVkIGZvciByb290OiAgMCBieXRlcyAoMCBLaUIpCj4gVkZTOiBNb3VudGVkIHJv
b3QgKHViaWZzIGZpbGVzeXN0ZW0pIHJlYWRvbmx5IG9uIGRldmljZSAwOjEzLgo+IFVCSSBlcnJv
cjogdWJpX2lvX3dyaXRlOiBlcnJvciAtNSB3aGlsZSB3cml0aW5nIDUxMiBieXRlcyB0byBQRUIK
CkNhbiB5b3UgcGxlYXNlIHBsYWNlIGEgZHVtcF9zdGFjaygpIGluIHViaV9pb193cml0ZSgpIGVy
cm9yIHBhdGg/Ckkgd29uZGVyIHdoZXJlIHRoZSB3cml0ZSBjb21lcyBmcm9tLgoKVGhhbmtzLAov
L3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
