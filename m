Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B22C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Mar 2022 10:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=djQyS/81xTyvq9hl8qy7Ek6xuq0J3XouF6vGZ75XM3A=; b=s9Uk3hWRHzEXmchO2VjRwZolM3
	3icbXgKmcvJDcseGhKNszfiJEDc7YID/fE8i+HjjLF08syqV0BUkxHO+YS2VHNmxub/SJgp+Pc6Eq
	Cq3F+sYuyhzfSLhwIG6mPV+BiKu1xJ7rjvmnZWGIJvce4fbh9O7FU5Zuz6OGPqW7BWsEmjFlZlLoc
	T+EyEuUr7a1aszTgbl2eXBG6YJDnwM7ZsJBuuqZyNWdDhWoGIH1nivPaMWTuMykUGTymPMYIc3IdM
	u8ogpvkFXf7NRhW3j+ZUqJkD74Ntgk/qHem48KMydfJewSCUoTdqEpU6ZSuHA6T19Wsrrtj1LnG6B
	K/xchIpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nURE8-00CWmF-Ki; Wed, 16 Mar 2022 10:50:00 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nURE3-00CWld-8I
 for linux-mtd@lists.infradead.org; Wed, 16 Mar 2022 10:49:59 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 489676081104;
 Wed, 16 Mar 2022 11:49:43 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id QA1yn8GyxFz1; Wed, 16 Mar 2022 11:49:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B74B26081134;
 Wed, 16 Mar 2022 11:49:42 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Akdi6xKl8Q25; Wed, 16 Mar 2022 11:49:42 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 91BB36081104;
 Wed, 16 Mar 2022 11:49:42 +0100 (CET)
Date: Wed, 16 Mar 2022 11:49:42 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Sean Young <sean@mess.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
 david oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <1719637483.151290.1647427782487.JavaMail.zimbra@nod.at>
In-Reply-To: <YjGwhCuH6dPHQ5iX@gofer.mess.org>
References: <20211127153550.GA23039@gofer.mess.org>
 <YjGwhCuH6dPHQ5iX@gofer.mess.org>
Subject: Re: [PATCH] Allow rfddump and rfdformat to work on a test mtdram
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Allow rfddump and rfdformat to work on a test mtdram
Thread-Index: 2sVCFrXWenXiqSFjgnldQ1PWeQXFSA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_034957_747048_2F9A279D 
X-CRM114-Status: UNSURE (   7.59  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlNlYW4gWW91bmciIDxzZWFu
QG1lc3Mub3JnPgo+IEFuOiAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5v
cmc+Cj4gQ0M6ICJkYXZpZCBvYmVyaG9sbGVuemVyIiA8ZGF2aWQub2JlcmhvbGxlbnplckBzaWdt
YS1zdGFyLmF0PiwgInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4KPiBHZXNlbmRldDogTWl0dHdv
Y2gsIDE2LiBNw6RyeiAyMDIyIDEwOjQwOjIwCj4gQmV0cmVmZjogUmU6IFtQQVRDSF0gQWxsb3cg
cmZkZHVtcCBhbmQgcmZkZm9ybWF0IHRvIHdvcmsgb24gYSB0ZXN0IG10ZHJhbQoKPiBPbiBTYXQs
IE5vdiAyNywgMjAyMSBhdCAwMzozNTo1MFBNICswMDAwLCBTZWFuIFlvdW5nIHdyb3RlOgo+PiBy
ZmQgY2FuIGJlIHVzZWQgd2l0aCBtdGRyYW0gc2luY2UgY29tbWl0IGUwM2E4MTIxM2E5YyAoIm10
ZDogcmZkX2Z0bDogYWxsb3cKPj4gdXNlIG9mIE1URF9SQU0gZm9yIHRlc3RpbmcgcHVycG9zZXMi
KSwgd2hpY2ggaXMgaW4ga2VybmVsIHY1LjE1Lgo+IAo+IFdoeSBoYXMgdGhpcyBwYXRjaCBiZWVu
IG1hcmtlZCAibm90IGFwcGxpY2FibGUiLCBhbHNvIHdpdGhvdXQgYW55IGRpc2N1c3Npb24/Cj4g
Cj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4LW10ZC9wYXRjaC8y
MDIxMTEyNzE1MzU1MC5HQTIzMDM5QGdvZmVyLm1lc3Mub3JnLwo+IAo+IFNvIHRoZSBrZXJuZWwg
c2lkZSBjaGFuZ2VzIGFyZSBhY2NlcHRlZCBhbmQgbWVyZ2VkIHVwc3RyZWFtLCBidXQgdGhlCj4g
bmVjZXNzYXJ5IHVzZXIgc3BhY2UgY2hhbmdlcyBhcmUgIm5vdCBhcHBsaWNhYmxlIi4gSXMgdGhl
cmUgYSBwbGFuIHRvIHJldmVydAo+IHRoZSBrZXJuZWwgc2lkZSBjb21taXRzPwoKSSBkb24ndCB0
aGluayAibm90IGFwcGxpY2FibGUiIHdhcyBzZXQgb24gcHVycG9zZS4KRGF2aWQ/CgpUaGFua3Ms
Ci8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
