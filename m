Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4DAC433EF
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Jan 2022 21:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5HuqD6vy6ykPArD/5i+hAR6FIHSxXV7/AN2mSoO7VT0=; b=U7l2zYkTSMWmUTPxfQ/jLkDGHB
	a4v/+LKhJEGPCViwScysR8huCB7bCKyziFEzuyOLrmJ+QpfISZtmjtmpAtOD+qBkt8xACWE4hYxbN
	SI4avUpN+A71r1yFmN/iWnw6qPt/NqXqyRneHb8JlDqkWZgBnjB/T8F34JgZkxfcHHldjWOAzaYCF
	u3JO/tMIJZB7/zx8DR0X8y4bYzSjtAUFsP6Ml0em9XE3xtz/324TS6248z9Tb1UtaebfLkrWyHX6a
	CmkWOqbkYAYvLGIcYzk8EvspTqu1SlVdzdTcGxTx69DX22ki80SVW2Rjnohaj4n89lBfyHVt1scDq
	sIaYdd2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6fWN-008PcL-6q; Sun, 09 Jan 2022 21:14:35 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6fWJ-008Pa3-Vy
 for linux-mtd@lists.infradead.org; Sun, 09 Jan 2022 21:14:33 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 9F91E62DA608;
 Sun,  9 Jan 2022 22:14:20 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id bSx-a38A2nzo; Sun,  9 Jan 2022 22:14:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A532F60A3582;
 Sun,  9 Jan 2022 22:14:19 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id SFKkIQnS078n; Sun,  9 Jan 2022 22:14:19 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 7997462DA608;
 Sun,  9 Jan 2022 22:14:19 +0100 (CET)
Date: Sun, 9 Jan 2022 22:14:19 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 mcoquelin stm32 <mcoquelin.stm32@gmail.com>, 
 kirill shutemov <kirill.shutemov@linux.intel.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1985807262.244880.1641762859448.JavaMail.zimbra@nod.at>
In-Reply-To: <20211227032246.2886878-6-chengzhihao1@huawei.com>
References: <20211227032246.2886878-1-chengzhihao1@huawei.com>
 <20211227032246.2886878-6-chengzhihao1@huawei.com>
Subject: Re: [PATCH v6 05/15] ubifs: Rename whiteout atomically
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF95 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Rename whiteout atomically
Thread-Index: znpCv2h6Hs/0pJ+9Ww4OAQ97kBgRdg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220109_131432_376269_DECBC4F2 
X-CRM114-Status: UNSURE (   7.68  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0Piwg
Ik1pcXVlbCBSYXluYWwiIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiwgIlZpZ25lc2ggUmFn
aGF2ZW5kcmEiIDx2aWduZXNockB0aS5jb20+LAo+ICJtY29xdWVsaW4gc3RtMzIiIDxtY29xdWVs
aW4uc3RtMzJAZ21haWwuY29tPiwgImtpcmlsbCBzaHV0ZW1vdiIgPGtpcmlsbC5zaHV0ZW1vdkBs
aW51eC5pbnRlbC5jb20+LCAiU2FzY2hhIEhhdWVyIgo+IDxzLmhhdWVyQHBlbmd1dHJvbml4LmRl
Pgo+IENDOiAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAibGlu
dXgta2VybmVsIiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4KPiBHZXNlbmRldDogTW9u
dGFnLCAyNy4gRGV6ZW1iZXIgMjAyMSAwNDoyMjozNgo+IEJldHJlZmY6IFtQQVRDSCB2NiAwNS8x
NV0gdWJpZnM6IFJlbmFtZSB3aGl0ZW91dCBhdG9taWNhbGx5Cgo+IEN1cnJlbnRseSwgcmVuYW1l
IHdoaXRlb3V0IGhhcyAzIHN0ZXBzOgo+ICAxLiBjcmVhdGUgdG1wZmlsZSh3aGljaCBhc3NvY2lh
dGVzIG9sZCBkZW50cnkgdG8gdG1wZmlsZSBpbm9kZSkgZm9yCj4gICAgIHdoaXRlb3V0LCBhbmQg
c3RvcmUgdG1wZmlsZSB0byBkaXNrCj4gIDIuIGxpbmsgd2hpdGVvdXQsIGFzc29jaWF0ZSB3aGl0
ZW91dCBpbm9kZSB0byBvbGQgZGVudHJ5IGFnYWdpbiBhbmQKPiAgICAgc3RvcmUgb2xkIGRlbnRy
eSwgb2xkIGlub2RlLCBuZXcgZGVudHJ5IG9uIGRpc2sKPiAgMy4gd3JpdGViYWNrIGRpcnR5IHdo
aXRlb3V0IGlub2RlIHRvIGRpc2sKPiAKPiBTdWRkZW5seSBwb3dlci1jdXQgb3IgZXJyb3Igb2Nj
dXJyaW5nKGVnLiBFTk9TUEMgcmV0dXJuZWQgYnkgYnVkZ2V0LAo+IG1lbW9yeSBhbGxvY2F0aW9u
IGZhaWx1cmUpIGR1cmluZyBhYm92ZSBzdGVwcyBtYXkgY2F1c2Uga2luZHMgb2YgcHJvYmxlbXM6
Cj4gIFByb2JsZW0gMTogRU5PU1BDIHJldHVybmVkIGJ5IHdoaXRlb3V0IHNwYWNlIGJ1ZGdldCAo
YmVmb3JlIHN0ZXAgMiksCj4JICAgICBvbGQgZGVudHJ5IHdpbGwgZGlzYXBwZWFyIGFmdGVyIHJl
bmFtZSBzeXNjYWxsLCB3aGl0ZW91dCBmaWxlCj4JICAgICBjYW5ub3QgYmUgZm91bmQgZWl0aGVy
Lgo+IAo+CSAgICAgbHMgZGlyICAvLyB3ZSBnZXQgZmlsZSwgd2hpdGVvdXQKPgkgICAgIHJlbmFt
ZShkaXIvZmlsZSwgZGlyL3doaXRlb3V0LCBSRUFOTUVfV0hJVEVPVVQpCj4JICAgICBFTk9TUEMg
PSB1Ymlmc19idWRnZXRfc3BhY2UoJndodF9yZXEpIC8vIHJldHVybgo+CSAgICAgbHMgZGlyICAv
LyBlbXB0eSAobm8gZmlsZSwgbm8gd2hpdGVvdXQpCj4gIFByb2JsZW0gMjogUG93ZXItY3V0IGhh
cHBlbnMgYmVmb3JlIHN0ZXAgMywgd2hpdGVvdXQgaW5vZGUgd2l0aCAnbmxpbms9MScKPgkgICAg
IGlzIG5vdCBzdG9yZWQgb24gZGlzaywgd2hpdGVvdXQgZGVudHJ5KG9sZCBkZW50cnkpIGlzIHdy
aXR0ZW4KPgkgICAgIG9uIGRpc2ssIHdoaXRlb3V0IGZpbGUgaXMgbG9zdCBvbiBuZXh0IG1vdW50
IChXZSBnZXQgImRlYWQKPgkgICAgIGRpcmVjdG9yeSBlbnRyeSIgYWZ0ZXIgZXhlY3V0aW5nICds
cyAtbCcgb24gd2hpdGVvdXQgZmlsZSkuCj4gCj4gTm93LCB3ZSB1c2UgZm9sbG93aW5nIDMgc3Rl
cHMgdG8gZmluaXNoIHJlbmFtZSB3aGl0ZW91dDoKPiAgMS4gY3JlYXRlIGFuIGluLW1lbSBpbm9k
ZSB3aXRoICdubGluayA9IDEnIGFzIHdoaXRlb3V0Cj4gIDIuIHViaWZzX2pubF9yZW5hbWUgKFdy
aXRlIG9uIGRpc2sgdG8gZmluaXNoIGFzc29jaWF0aW5nIG9sZCBkZW50cnkgdG8KPiAgICAgd2hp
dGVvdXQgaW5vZGUsIGFzc29jaWF0aW5nIG5ldyBkZW50cnkgd2l0aCBvbGQgaW5vZGUpCj4gIDMu
IGlwdXQod2hpdGVvdXQpCj4gCj4gUmVseSB3cml0aW5nIGluLW1lbSBpbm9kZSBvbiBkaXNrIGJ5
IHViaWZzX2pubF9yZW5hbWUoKSB0byBmaW5pc2ggcmVuYW1lCj4gd2hpdGVvdXQsIHdoaWNoIGF2
b2lkcyBtaWRkbGUgZGlzayBzdGF0ZSBjYXVzZWQgYnkgc3VkZGVubHkgcG93ZXItY3V0Cj4gYW5k
IGVycm9yIG9jY3VycmluZy4KCkhvdyBkbyB5b3UgbWFrZSBzdXJlIHRoZSB0aGUgd2hpdGVvdXQg
aXMgbmV2ZXIgd3JpdHRlbiB0byBkaXNrIChieSB3cml0ZWJhY2spIGJlZm9yZSB1Ymlmc19qbmxf
cmVuYW1lKCkgbGlua2VkCml0PyBUaGF0J3MgdGhlIHJlYXNvbiB3aHkgb3RoZXIgZmlsZXN5c3Rl
bXMgdXNlIHRoZSB0bXBmaWxlIG1lY2hhbmlzbSBmb3Igd2hpdGVvdXRzIHRvby4KClRoYW5rcywK
Ly9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
