Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DA5C4345F
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2024 19:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jECvGOyNhV6981YMtH0esoZI/9Qs6nxqovPYva3rGmM=; b=WbRpYBT6Tc0IPjpE/YJ9+STr/t
	+beXJhpfTU1xYCVNAEhCQKQAojx2iB0KvC8uNvdRJ53Dj2B/N2J95J745Ew4NYj8P/irG/HQAqyvY
	+w81CfcTVKBJXGBJ8/pAdrKwopcyLh+tWslUYxzI6Bs5GdB82IxQJpeYV5Gz+P/1Ku1vlfaYYHFaH
	Zt+FiqwU976JaU4o4MpRRS4TAztc6y5uY29jylkCcg+ZIhmeV+DREzCvK3WMzgpkch9KwaSdyW44r
	3s1Iew+NO239lp7A5gxxkP6vL/CQUU92N6mO+MMizQR0BxK5o/axOvMLMOpvE+tg3uwwV35X2KISX
	o1zzHo7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwRfR-00000009XVj-0MJ1;
	Mon, 15 Apr 2024 19:07:01 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwRfO-00000009XTY-1AHG
	for linux-mtd@lists.infradead.org;
	Mon, 15 Apr 2024 19:07:00 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E0DD3626FAE8;
	Mon, 15 Apr 2024 21:06:52 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id gbs007jPyHVA; Mon, 15 Apr 2024 21:06:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 985C3626FAE9;
	Mon, 15 Apr 2024 21:06:52 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jMAoj2FrZ5aE; Mon, 15 Apr 2024 21:06:52 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 739F3626FAE8;
	Mon, 15 Apr 2024 21:06:52 +0200 (CEST)
Date: Mon, 15 Apr 2024 21:06:52 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Tomas Alvarez Vanoli <tomas.alvarez-vanoli@hitachienergy.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <1423540685.195759.1713208012331.JavaMail.zimbra@nod.at>
In-Reply-To: <DB9PR06MB7849A67820F6FBA17FF20584C2092@DB9PR06MB7849.eurprd06.prod.outlook.com>
References: <DB9PR06MB7849A67820F6FBA17FF20584C2092@DB9PR06MB7849.eurprd06.prod.outlook.com>
Subject: Re: specify root squashfs ubiblock by volume name
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: specify root squashfs ubiblock by volume name
Thread-Index: AdqPOy0tiXj/4x17TYmZqaxZED52xW1d1nnK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_120658_596563_C322E4C1 
X-CRM114-Status: GOOD (  11.89  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IEkgaGF2ZSBhbiBlbWJlZGRlZCBzeXN0
ZW0gaW4gd2hpY2ggbXVsdGlwbGUgcm9vdGZzIGFyZSBzdG9yZWQgaW4gYW4gdWJpIGRldmljZQo+
IGFzIHNxdWFzaGZzIHViaSB2b2x1bWVzLgo+IFRoaXMgaXMgdG8gYmUgYWJsZSB0byBoYXZlIGZh
bGxiYWNrIHN5c3RlbXMgb3IgdG8gYmUgYWJsZSB0byBzdG9yZSBhbmQgcnVuCj4gZGlmZmVyZW50
IHZlcnNpb25zIG9mIHRoZSBzb2Z0d2FyZSBlYXNpbHkuCj4gQmVjYXVzZSB0aGUgbnVtYmVyIGFu
ZCBvcmRlciBvZiB2b2x1bWVzIGluIHRoZSB1YmkgZGV2aWNlIGNhbiBjaGFuZ2UgKGRpZmZlcmVu
dAo+IGNvbmZpZ3VyYXRpb25zLCBvcHRpb25hbCBsb2cgdm9sdW1lLCBldGMpLAo+IEkgaGF2ZSBh
IHNtYWxsIHBhdGNoIHRoYXQgYWxsb3dzIG1lIHRvIHNwZWNpZnkgdGhlIHZvbHVtZSB1c2luZyDi
gJx1YmlibG9jazpuYW1l4oCdLAo+IHdoaWNoIG1pcnJvcnMgdGhlIGFscmVhZHkgcG9zc2libGUg
4oCcdWJpOm5hbWXigJ0sCj4gSW5zdGVhZCBvZiBzcGVjaWZ5aW5nIHRoZSBkZXZpY2UgbmFtZSBm
b3IgdGhlICJyb290IiBib290IGFyZ3VtZW50Lgo+IAo+IElzIHRoZXJlIGFscmVhZHkgYSB3YXkg
dG8gZG8gdGhpcyB0aGF0IEkgbWF5IGhhdmUgb3Zlcmxvb2tlZD8KClRyYWRpdGlvbmFsbHksIEkg
YWx3YXlzIHN1Z2dlc3QgdXNpbmcgYSBtaW5pbWFsIGluaXRyYW1mcyBhcyBzb29uIHRoZSByb290
ZnMgc2V0dXAKaXMgbm9uLXRyaXZpYWwuIEJ1dCB0aGVyZSBhcmUgZXhjZXB0aW9ucy4KCj4gSWYg
bm90LCBkbyB5b3UgdGhpbmsgdGhpcyBpcyBhIGZlYXR1cmUgdGhhdCB3b3VsZCBiZSBhY2NlcHRl
ZCBpbnRvIG1haW5saW5lPwoKRGVwZW5kcyBvbiB0aGUgY2hhbmdlcy4KSW4gYW55IGNhc2UsIHBs
ZWFzZSBzaGFyZSB5b3VyIHBhdGNoLiBJdCBkb2VzIG5vdCBoYXZlIHRvIGJlIHBlcmZlY3QsCmp1
c3QgbWFyayBpdCBhcyBSRkMuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
