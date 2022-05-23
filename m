Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2599C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 23 May 2022 20:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+i0mmvsLjcNxMoWdG1WvHkT9dw0wST948Mnyrz9luN8=; b=1cCGIXEWMyUS4+O2WEIcIZgzCK
	OlVVrAR1nkGD8QT8th2t396gsomyyWHqAcW3lHZFM68Z7ICW1pYZzSMfoYnfKDKMP/+4OV+Fx147I
	PrevB8vgXyUVxGnBwSpG3AS5r2Q1r4DX5Qejc+G3x/VaoYZ/lg9HP8O4aydWk7k0AJC4MIyYsqA/f
	peOEAgGEGzKZYx6cGOBz/t4fpqV1dhO2dy1fSUNZlvtNv/rPRqk0xbYh7YrTdIuWRluD1Hzi1lLcx
	bhTsPesi9O/dI4QNGMTuYJe8f6JK4WBXQ87kN0sBs+uooMzyOe/2iuqXl/39kj1yxTUXdEn78uNsP
	vFTouftQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntEnO-005oaS-LP; Mon, 23 May 2022 20:36:54 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntEnK-005oZZ-O0
 for linux-mtd@lists.infradead.org; Mon, 23 May 2022 20:36:53 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id EEAF8608110A;
 Mon, 23 May 2022 22:36:40 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id zyipqiJcGFwc; Mon, 23 May 2022 22:36:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 6CBA26081119;
 Mon, 23 May 2022 22:36:40 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 00yZaR6kcrDe; Mon, 23 May 2022 22:36:40 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4CE06608110A;
 Mon, 23 May 2022 22:36:40 +0200 (CEST)
Date: Mon, 23 May 2022 22:36:40 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: libaokun <libaokun1@huawei.com>
Cc: David Woodhouse <dwmw2@infradead.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, yukuai3 <yukuai3@huawei.com>
Message-ID: <1917663619.89751.1653338200219.JavaMail.zimbra@nod.at>
In-Reply-To: <c2f49973-e5be-475a-1b92-77fc6e86ba37@huawei.com>
References: <20220412093816.2280678-1-libaokun1@huawei.com>
 <c2f49973-e5be-475a-1b92-77fc6e86ba37@huawei.com>
Subject: Re: [PATCH -next] jffs2: fix memory leak in jffs2_do_fill_super
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: jffs2: fix memory leak in jffs2_do_fill_super
Thread-Index: VWz2X8e4SAV95IUGqJG18OwMjo62Kw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_133650_975675_6F264704 
X-CRM114-Status: UNSURE (   5.89  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImxpYmFva3VuIiA8bGliYW9r
dW4xQGh1YXdlaS5jb20+Cj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAiRGF2aWQg
V29vZGhvdXNlIiA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4sICJsaW51eC1tdGQiIDxsaW51eC1tdGRA
bGlzdHMuaW5mcmFkZWFkLm9yZz4sCj4gImxpbnV4LWtlcm5lbCIgPGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc+Cj4gQ0M6ICJ5dWt1YWkzIiA8eXVrdWFpM0BodWF3ZWkuY29tPiwgImxpYmFv
a3VuIiA8bGliYW9rdW4xQGh1YXdlaS5jb20+Cj4gR2VzZW5kZXQ6IE1vbnRhZywgMjMuIE1haSAy
MDIyIDA4OjAwOjIxCj4gQmV0cmVmZjogUmU6IFtQQVRDSCAtbmV4dF0gamZmczI6IGZpeCBtZW1v
cnkgbGVhayBpbiBqZmZzMl9kb19maWxsX3N1cGVyCgo+IHBpbmcKClRoYW5rcyBmb3IgeW91ciB0
aW1lLiBZb3UgcGF0Y2ggd2lsbCBiZSBwYXJ0IG9mIHRoZSB1cGNvbWluZyBtZXJnZSB3aW5kb3cu
CkknbSBwcmVwYXJpbmcgcmlnaHQgbm93IG15IHF1ZXVlLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
