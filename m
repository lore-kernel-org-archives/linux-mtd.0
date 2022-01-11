Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F40C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jan 2022 13:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kNvWHqtdf8cKUeSMKZ2/0j5IhQ1K3v6fI9FRcdADrkc=; b=hAivff+TwS1mfyGV9+MxUoHrog
	7AbFB/wPzXjRgn9QaQW+rKxHz+jF3FZ99zIJ50ly3+z/6cdGgSPYoWFzvrYYRzZvUUUk29JkIZzak
	PihYe3nrd/W6Bkjao+qhSUMnQNvFlRxd3hDL3MOo2kQk9Kc/i7KvRaJcxVBAC5RoEj+QnrnRtKvbd
	nY1QOuhYmFirSDkqTR8Ans67oAu46pRZsYdV57VWWOvGxP3EvMqYLNxkg5t9179jRT6vorEydqw1k
	KeC8AgCQsPU73HYvJhYNzKMQnD9pIGLtRC6xp3m1NDrvYkc5ManYBEEFEtDdeDsGk8Zj+UQqYt1Rm
	c6G8HfPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7HdX-00GWQb-6o; Tue, 11 Jan 2022 13:56:31 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7HdU-00GWPU-7J
 for linux-mtd@lists.infradead.org; Tue, 11 Jan 2022 13:56:30 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 74D6962DA5E2;
 Tue, 11 Jan 2022 14:56:24 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id YLrS9tLm1LzN; Tue, 11 Jan 2022 14:56:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2400C62DA609;
 Tue, 11 Jan 2022 14:56:23 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id xPuhK_heLKGY; Tue, 11 Jan 2022 14:56:23 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id EC97562DA5E2;
 Tue, 11 Jan 2022 14:56:22 +0100 (CET)
Date: Tue, 11 Jan 2022 14:56:22 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 mcoquelin stm32 <mcoquelin.stm32@gmail.com>, 
 kirill shutemov <kirill.shutemov@linux.intel.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1492514284.249466.1641909382867.JavaMail.zimbra@nod.at>
In-Reply-To: <0a7a5cce-1ee1-70b6-d368-615dfa0a617a@huawei.com>
References: <20211227032246.2886878-1-chengzhihao1@huawei.com>
 <20211227032246.2886878-13-chengzhihao1@huawei.com>
 <361758697.248157.1641857025490.JavaMail.zimbra@nod.at>
 <6f7df7ba-9557-58a3-7978-e5d14a72f234@huawei.com>
 <244238061.248369.1641886066066.JavaMail.zimbra@nod.at>
 <420c7567-8926-2e8b-4da0-a9bfc8379642@huawei.com>
 <11976804.249069.1641902225370.JavaMail.zimbra@nod.at>
 <0a7a5cce-1ee1-70b6-d368-615dfa0a617a@huawei.com>
Subject: Re: [PATCH v6 12/15] ubi: fastmap: Add all fastmap pebs into
 'ai->fastmap' when fm->used_blocks>=2
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF95 (Linux)/8.8.12_GA_3809)
Thread-Topic: fastmap: Add all fastmap pebs into 'ai->fastmap' when
 fm->used_blocks>=2
Thread-Index: 86Vvr6wU5AK+5c62IIyzK5YFzlh8mg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_055628_594520_E4E7CF4A 
X-CRM114-Status: UNSURE (   4.96  )
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
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0Pgo+
IENDOiAiTWlxdWVsIFJheW5hbCIgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+LCAiVmlnbmVz
aCBSYWdoYXZlbmRyYSIgPHZpZ25lc2hyQHRpLmNvbT4sICJtY29xdWVsaW4gc3RtMzIiCj4gPG1j
b3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+LCAia2lyaWxsIHNodXRlbW92IiA8a2lyaWxsLnNodXRl
bW92QGxpbnV4LmludGVsLmNvbT4sICJTYXNjaGEgSGF1ZXIiCj4gPHMuaGF1ZXJAcGVuZ3V0cm9u
aXguZGU+LCAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAibGlu
dXgta2VybmVsIiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4KPiBHZXNlbmRldDogRGll
bnN0YWcsIDExLiBKYW51YXIgMjAyMiAxNDoyMzo1Mgo+IEJldHJlZmY6IFJlOiBbUEFUQ0ggdjYg
MTIvMTVdIHViaTogZmFzdG1hcDogQWRkIGFsbCBmYXN0bWFwIHBlYnMgaW50byAnYWktPmZhc3Rt
YXAnIHdoZW4gZm0tPnVzZWRfYmxvY2tzPj0yCgo+IOWcqCAyMDIyLzEvMTEgMTk6NTcsIFJpY2hh
cmQgV2VpbmJlcmdlciDlhpnpgZM6Cj4+IHViaV93bF9pbml0KCkgaXMgY2FsbGVkIGluIGJvdGgg
Y2FzZXMsIHdpdGggYW5kIHdpdGhvdXQgZmFzdG1hcC4KPiBJIGFncmVlLgo+IAo+PiBBbmQgYWkt
PmZhc3RtYXAgY29udGFpbnMgYWxsIGFuY2hvciBQRUJzIHRoYXQgc2Nhbl9mYXN0KCkgZm91bmQu
Cj4+IFRoaXMgY2FuIGJlIHRoZSBtb3N0IHJlY2VudCBidXQgYWxzbyBvdXRkYXRlZCBhbmNob3Ig
UEVCcy4KPiBJcyBpdCBleGlzdHMgYSBjYXNlIHRoYXQgb3V0ZGF0ZWQgZmFzdG1hcCBQRUJzIGFy
ZSBuZWl0aGVyIGNvdW50ZWQgaW50bwo+ICdmbWhkci0+ZXJhc2VfcGViX2NvdW50JyBub3Igc2Nh
bm5lZCBpbnRvICdhaS0+ZmFzdG1hcCcgYWZ0ZXIgYXR0YWNoaW5nCj4gYnkgZmFzdG1hcC4KPiAK
ClsuLi5dCiAKPiBJIHRoaW5rIFVCSSBhdHRhY2hlcyBmYWlsZWQgYnkgZmFzdG1hcCBpZiBrZXJu
ZWwgZ29lcyBoZXJlLgo+IDE4NzAgICAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gZXJhc2Vf
YWViKHViaSwgYWViLCBzeW5jKTsKCkhtbSwgSSB0aGluayB0aGUgcGFyYW5vaWEgY2hlY2sgaW4g
ZmFzdG1hcC5jIGlzIHRvbyBzdHJpY3QgdGhlc2UgZGF5cy4KICAgICAgICBpZiAoV0FSTl9PTihj
b3VudF9mYXN0bWFwX3BlYnMoYWkpICE9IHViaS0+cGViX2NvdW50IC0KICAgICAgICAgICAgICAg
ICAgICBhaS0+YmFkX3BlYl9jb3VudCAtIGZtLT51c2VkX2Jsb2NrcykpCiAgICAgICAgICAgICAg
ICBnb3RvIGZhaWxfYmFkOwoKSXQgZG9lcyBub3QgYWNjb3VudCBhaS0+ZmFzdG1hcC4gU28gaWYg
YWktPmZhc3RtYXAgY29udGFpbnMgb2xkIGFuY2hvciBQRUJzCnRoaXMgY2hlY2sgd2lsbCB0cmln
Z2VyIGFuZCBmb3JjZSBmYWxsaW5nIGJhY2sgdG8gc2Nhbm5pbmcgbW9kZS4KV2l0aCB0aGlzIGNo
ZWNrIGZpeGVkLCB1Ymlfd2xfaW5pdCgpIHdpbGwgZXJhc2UgYWxsIG9sZCBQRUJzIGZyb20gYWkt
PmZhc3RtYXAuCgpTbyBJIGFncmVlIHRoYXQgdGhpcyBjb2RlIHBhdGggaXMgd29ua3kgYW5kIGNh
biBiZSBjbGVhbmVkIHVwLiBCdXQgcGxlYXNlIGJlCmV4dHJlbWVseSBjYXJlZnVsIGFuZCBnaXZl
IGFsbCB5b3VyIGNoYW5nZXMgZXhjZXNzaXZlIHRlc3Rpbmcgd2l0aCByZWFsIHdvcmtsb2FkCmFu
ZCBwb3dlci1jdXRzLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
