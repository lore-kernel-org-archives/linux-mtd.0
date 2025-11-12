Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF175CCF9F8
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Nov 2025 13:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gAA1I5XCicVVXzsCaU6T85AbRGETuB7fW7RNSmrNCiE=; b=urMbl2O2M8fzwy
	3h/NqNuxDa42SNOsHvTCo0v40g64pyfsujLNHSM+Nsr+z8x6ZNdWh/Qo/apwxDhi+CamJSzk7ifwQ
	mHQV78WtF/BaABkcvxAo16Myv4idWO04IISuCwYi9pf8gGOzo87oYVgf6yr95epJTxC4AkdXR+n7x
	dc0vcXgZrU2LN1/Kte0wVt41/1uPdzAlA+zibY69XX+Su+FADPjC43S8ONay0UA3JnPYRH6DpVUsr
	AGBMsnkqehZxkiDI8vbnPWDHTkpJ8bYcoeRaniVtFAZWHWNLAEYwjikANgyHD24HYdgIzjvN4GZZH
	847srk6B3/1spMSd+WzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAcb-00000008p13-0wd5;
	Wed, 12 Nov 2025 13:10:49 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAcY-00000008p0a-40Bc
	for linux-mtd@lists.infradead.org;
	Wed, 12 Nov 2025 13:10:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4F0D0C0F556;
	Wed, 12 Nov 2025 13:10:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E40A36070B;
	Wed, 12 Nov 2025 13:10:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6D8E1102F16E2;
	Wed, 12 Nov 2025 14:10:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762953044; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8FxSJ1YhSz/uKUxjGqRnSA5I1+h/hTb/Q5Ve6fg5lws=;
	b=kUSxogklGuF/0uxGORVdT5LTnPw+kZ0d587IfLv40DmGK4Z+lBtSNKY2kGsYL7NAZNn9GE
	T7DSGjkge483ANaLMiKbiIuGXV832f/B9VYsBmLgik+84PP9epSZm3NVJ2vsryC6L+Jz5U
	sKIRhlgfBjP78+Xl3RGF0C8dSMoh5eRIqRUGLYLRSlcoO0xXN/9WCvp7g2DlIaTg0UC/GY
	Jxivb3R41K5nCtbxNZWqXdmXFrHbEk1Ua5iH8AUPlrhMzi/xJ7GdS87upeh0vwkpEtmMWP
	dbbVSitm57RO0F6D5eG5Sqj4yHEKf+8a2akWSQ/Sh+EKy0LrYBUj0V4hCOqjLw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,
  linux-mtd@lists.infradead.org,  Richard Weinberger <richard@nod.at>,
  linux-kernel@vger.kernel.org,  Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: Enable locking for n25q00a
In-Reply-To: <92e99a96-5582-48a5-a4f9-e9b33fcff171@linux.dev> (Sean Anderson's
	message of "Tue, 14 Oct 2025 14:25:10 -0400")
References: <20251006223409.3475001-1-sean.anderson@linux.dev>
	<mafs0ecreontu.fsf@kernel.org>
	<4888cefa-e8be-4f0d-9d4a-c82f9ff6cda0@linux.dev>
	<mafs05xcpo9sz.fsf@kernel.org>
	<26a795ac-e6ff-4363-a8b9-38793a9be794@linux.dev>
	<mafs0ikgnn07u.fsf@kernel.org>
	<d00d42ce-4262-4736-8c73-5d2544e86d33@linux.dev>
	<33cbbac1-c247-4644-b555-998eea6e8305@linaro.org>
	<92e99a96-5582-48a5-a4f9-e9b33fcff171@linux.dev>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 12 Nov 2025 14:10:40 +0100
Message-ID: <871pm3iegf.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_051047_150377_73FA1052 
X-CRM114-Status: GOOD (  10.89  )
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

SGVsbG8gU2VhbiwKCj4gIyBmbGFzaF9sb2NrIC11IC9kZXYvbXRkL2J5LW5hbWUvc3BpMC4xCj4g
IyBmbGFzaF9sb2NrIC1pIC9kZXYvbXRkL2J5LW5hbWUvc3BpMC4xCj4gRGV2aWNlOiAvZGV2L210
ZC9ieS1uYW1lL3NwaTAuMQo+IFN0YXJ0OiAwCj4gTGVuOiAweDgwMDAwMDAKPiBMb2NrIHN0YXR1
czogdW5sb2NrZWQKPiBSZXR1cm4gY29kZTogMAo+ICMgdGVzdCgpIHsKPj4gbXRkPS9kZXYvbXRk
L2J5LW5hbWUvJDEKPj4gc3RhcnQ9JCgoJDIgKiA2NCAqIDEwMjQpKQo+PiBzaXplPSQoKCQzICog
NjQgKiAxMDI0KSkKPj4gZGQgaWY9L2Rldi91cmFuZG9tIG9mPSQxIGJzPTY0ayBjb3VudD0kMyBz
dGF0dXM9bm9uZSAmJiBcCj4+IG10ZF9kZWJ1ZyBlcmFzZSAkbXRkICRzdGFydCAkc2l6ZSAmJiBc
Cj4+IG10ZF9kZWJ1ZyB3cml0ZSAkbXRkICRzdGFydCAkc2l6ZSAkMSAmJiBcCj4+IGRkIGlmPSRt
dGQgYnM9NjRrIHNraXA9JDIgY291bnQ9JDMgc3RhdHVzPW5vbmUgfCBzaGEyNTZzdW0gJDEgLSAm
JiBcCj4+IHJtICQxCj4+IH0KCkkgYW0gYWxzbyB3b3JraW5nIG9uIGxvY2tpbmcgdGhlc2UgZGF5
cywgaGF2ZSB5b3UgYWxyZWFkeSBzdGFydGVkCndyaXRpbmcgZXh0cmEgU1BJIE5PUiBEb2N1bWVu
dGF0aW9uL3Byb2Nlc3MgYmFzZWQgb24gdGhpcyB0aHJlYWQ/CgpJIGFtIGFsc28gdHJ5aW5nIHRv
IGNsYXJpZnkgd2hhdCBpcyBleHBlY3RlZCBhbmQgd2hhdCB0aGUgQVBJIHNvbWVob3cKZG9lcywg
YXMgaXQgd2FzIG5vdCBmdWxseSBjbGVhciBmb3IgbWUgYXQgZmlyc3Qgc2lnaHQuCgpbLi4uXQoK
PiAjIGZsYXNoX2xvY2sgLXUgL2Rldi9tdGQvYnktbmFtZS9zcGkwLjEKPiAjIHRlc3Qgc3BpMC4x
IDY0Cj4gODNhOGRjNjEyNWVjOTY3MmQxOGY3ZjE4ZjkyZTE2Zjg2NzM1NGRiZThlMmYzYjBhY2E1
MmI5ZDBhZDdkOGZmZSAgc3BpMC4xCj4gODNhOGRjNjEyNWVjOTY3MmQxOGY3ZjE4ZjkyZTE2Zjg2
NzM1NGRiZThlMmYzYjBhY2E1MmI5ZDBhZDdkOGZmZSAgLQo+ICMgZmxhc2hfbG9jayAtbCAvZGV2
L210ZC9ieS1uYW1lL3NwaTAuMSAkKCgxMDI0ICogNjQgKiAxMDI0KSkgMTAyNAo+ICMgZmxhc2hf
bG9jayAtaSAvZGV2L210ZC9ieS1uYW1lL3NwaTAuMSAKPiBEZXZpY2U6IC9kZXYvbXRkL2J5LW5h
bWUvc3BpMC4xCj4gU3RhcnQ6IDAKPiBMZW46IDB4ODAwMDAwMAo+IExvY2sgc3RhdHVzOiB1bmxv
Y2tlZCA8PDw8IFdyb25nIQoKVGhpcyBpc24ndCB3cm9uZywgZXZlbiB0aG91Z2ggYXQgYSBmaXJz
dCBnbGFuY2UgdGhlIG91dHB1dCBpcwptaXNsZWFkaW5nLiBUaGUgQVBJIGFwcGFyZW50bHkgZG9l
cyBub3QgZ2l2ZXMgeW91IGFsbCB0aGUKbG9ja2VkL3VubG9ja2VkIHNlY3RvcnMsIGl0IGlzIHdh
eSBtb3JlIGJhc2ljIHRoYW4gdGhhdDogaXQgdGVsbHMgeW91CndoZXRoZXIgdGhlIGZ1bGwgcmFu
Z2UgeW91IGFza2VkIGZvciBpcyBpbmRlZWQgbG9ja2VkLgoKV2hlbiB5b3UgcnVuICIjIGZsYXNo
X2xvY2sgLWkgL2Rldi9tdGQvYnktbmFtZS9zcGkwLjEiLCB5b3UgcHJpdmlkZSBubwpzdGFydC9s
ZW5ndGggdmFsdWVzIHRvIHRoZSBjb21tYW5kLiBIZW5jZSwgdGhlIGRlZmF1bHRzIGFyZSBwaWNr
ZWQ6IHRoZQplbnRpcmUgZGV2aWNlIGlzIGNvbnNpZGVyZWQgZm9yIHRoZSBjaGVjay4gVGhlIHRv
b2wgYXNrcyB0aGUga2VybmVsCndoZXRoZXIgdGhlIHJhbmdlIDAtMHg3ZmZmZmZmIGlzICpmdWxs
eSogbG9ja2VkLiBBbnN3ZXIgaXMgbm8sIGl0IGlzIG5vdApmdWxseSBsb2NrZWQuCgpJbiB0aGUg
a2VybmVsIHRoZXJlIGFyZSB0d28gaGVscGVycyBmb3IgdGhhdCwgYW5kIHRoZXkgd29uJ3QgZ2l2
ZSB5b3UKb3Bwb3NpdGUgcmVzdWx0cyBhbGwgdGhlIHRpbWU6Ci0gaXMgbG9ja2VkOgogICAgLSBy
ZXR1cm5zIHRydWUgaWYgdGhlIGdpdmVuIHJhbmdlIGlzIGZ1bGx5IGxvY2tlZAogICAgLSByZXR1
cm5zIGZhbHNlIG90aGVyd2lzZQotIGlzIHVubG9ja2VkOgogICAgLSByZXR1cm5zIHllcyBpZiB0
aGUgZ2l2ZW4gcmFuZ2UgaXMgZnVsbHkgdW5sb2NrZWQKICAgIC0gcmV0dXJucyBmYWxzZSBvdGhl
cndpc2UKClNvIGlmIHlvdSB3YW50IHRoZSB0b29sIHRvIHRlbGwgeW91ICJ5ZXMiLCB5b3Ugc2hv
dWxkIGluc3RlYWQgdXNlIHRoZQpleGFjdCByYW5nZSB5b3UgbG9ja2VkICgxMDI0LTIwNDcpIG9y
IGFueSBzdWJzZXQgb2YgaXQuCgpUaGFua3MsIE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
