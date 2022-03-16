Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C3CC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Mar 2022 22:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UPICcubVNfMPvnbwHSGrPPjGxOsGx6PNIU6HD7MoGCU=; b=MjTNUzgMgS457IPOhY5FwfNSlf
	u0PG3llq5G8ns5jyla1lAEL7DwMAwWtqvYngIxdb6/Algs87OJmZ1wtz3r/ikbR1zDDyspvQYc0ME
	ywgcsv7pcMJuRCwSpeBuzg7xFlhZcahZPxpxTgGY8OB5Aij7oEiZmF/YLN9/ZqWMQIGBwiJWrJl5L
	vxjDEHshLlc9chp6wHYLCDVYyPnnxPa3/ZQ/QW2t8SLmhjEZdneqstG2i3Oxf0qLxu8iVUT4oWZ8s
	2Wj2Hk2fSf80TReEmE5pOIIUX9d9jcpyJx4r+T9xVgZy2cnDWmpRyAwmvW+SjghyWAd825WEp4y/r
	KUgcXIug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUbhN-00EOM5-7k; Wed, 16 Mar 2022 22:00:53 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUbhK-00EOLZ-HQ
 for linux-mtd@lists.infradead.org; Wed, 16 Mar 2022 22:00:51 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8A4596081104;
 Wed, 16 Mar 2022 23:00:48 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id oErL0m0ft9MT; Wed, 16 Mar 2022 23:00:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 27A666081107;
 Wed, 16 Mar 2022 23:00:48 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id bASUU7w2xFjh; Wed, 16 Mar 2022 23:00:48 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id EC3476081104;
 Wed, 16 Mar 2022 23:00:47 +0100 (CET)
Date: Wed, 16 Mar 2022 23:00:47 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: libaokun <libaokun1@huawei.com>
Cc: David Woodhouse <dwmw2@infradead.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, yukuai3 <yukuai3@huawei.com>
Message-ID: <936195660.152787.1647468047915.JavaMail.zimbra@nod.at>
In-Reply-To: <c0d05cca-2827-481c-f534-d4fb30b91533@huawei.com>
References: <20220114102854.3399585-1-libaokun1@huawei.com>
 <c0d05cca-2827-481c-f534-d4fb30b91533@huawei.com>
Subject: Re: [PATCH -next v3 0/2] jffs2: fix two memory leak when mount jffs2
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: jffs2: fix two memory leak when mount jffs2
Thread-Index: a1UdSK/5tz20GyVR92v+jYiFFKkqVQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_150050_743803_301151FE 
X-CRM114-Status: UNSURE (   2.94  )
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
a3VuIiA8bGliYW9rdW4xQGh1YXdlaS5jb20+Cj4gR2VzZW5kZXQ6IERvbm5lcnN0YWcsIDEwLiBN
w6RyeiAyMDIyIDA5OjM0OjM1Cj4gQmV0cmVmZjogUmU6IFtQQVRDSCAtbmV4dCB2MyAwLzJdIGpm
ZnMyOiBmaXggdHdvIG1lbW9yeSBsZWFrIHdoZW4gbW91bnQgamZmczIKCj4gQSBnZW50bGUgcGlu
Zywgc29ycnkgZm9yIHRoZSBub2lzZS4KClBhdGNoZXMgYXBwbGllZC4KVGhhbmtzIGZvciBmaXhp
bmchCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
