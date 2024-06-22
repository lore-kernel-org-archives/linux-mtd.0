Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1671C27C53
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jun 2024 21:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=//F2UJnpzlKoV4yWlCLX9xN7xRPCJj1pcsKIb9aU81E=; b=XJrwc/TLgryk+4
	hEInFn/NE6zKk6va+Rwzq4a8DE/4xAqp+YCq/ldf1UaH0WoHtc0EMEa1mWykllzyvpFVHojmDFeAa
	SyHOzFJ6V5RHqUF4vfL/3s9B+ocC2CV8/6bVjVpSf1325r3aY/c4LwbuX6jZyHIfff+O3M8co72IH
	Z+ABRFEtoap99lOexGzrJictfHxVXt8XiGGxXi9hTqWAemJKpYOD28Zzq7AAH9HtyLpI1c7XQEdmk
	vNjuEsXiOlrpHx+u9Nj/OsdEysQBqHZd17Mkt/2RzS0dhRfJb2Ewwaos0TUkGV25GHX6wYbDzcOSG
	QT4G7Tf0DuKnSi3nqgIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL7xH-0000000Cnwr-1Hdf;
	Sat, 22 Jun 2024 21:07:27 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL7xD-0000000Cnvq-1VPF
	for linux-mtd@lists.infradead.org;
	Sat, 22 Jun 2024 21:07:24 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1sL7x3-000000005mW-11XI;
	Sat, 22 Jun 2024 21:07:13 +0000
Date: Sat, 22 Jun 2024 22:07:10 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Gagan Sidhu <broly@mac.com>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>,
	Richard Weinberger <richard@nod.at>,
	ZhaoLong Wang <wangzhaolong1@huawei.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	yangerkun <yangerkun@huawei.com>, yi zhang <yi.zhang@huawei.com>
Subject: Re: [PATCH v2] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
Message-ID: <Znc8_hcjH3_0plN4@makrotopia.org>
References: <251ae039-9f46-081b-a7ee-fe47de268865@huawei.com>
 <EFEC7C06-A3B2-46D6-99F4-ADA7F7199188@mac.com>
 <45d2ef27-95cc-16c4-8b0a-4413421d785b@huawei.com>
 <772249DB-434C-4AB9-AE6B-1CB684E1E11A@mac.com>
 <e562e94b-274d-4a82-3dad-d3e1109a2607@huawei.com>
 <7558AC97-FFFC-4593-B946-9F8FBD8D62FA@mac.com>
 <da6f4aa8-e79d-d70a-eeb5-0068ffc1ef52@huawei.com>
 <BE6684D5-1CEE-46AA-84BF-C6146667D84B@mac.com>
 <69656f63-d2ad-8215-eba6-12603fb38f62@huawei.com>
 <4FBEAA67-7829-481C-8EB0-06621B73F935@mac.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4FBEAA67-7829-481C-8EB0-06621B73F935@mac.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_140723_438162_A827B571 
X-CRM114-Status: UNSURE (   9.44  )
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

T24gRnJpLCBKdW4gMjEsIDIwMjQgYXQgMDg6NDM6NDdQTSAtMDYwMCwgR2FnYW4gU2lkaHUgd3Jv
dGU6Cj4gWy4uLl0KPiBHTFVFQkkgc2hvdWxkIGJlIG9wZXJhdGluZyBvbiB0aGUgL2Rldi9tdGRi
bG9ja1ggZGV2aWNlIGFuZCBub3QgdWJpYmxvY2swXzAgYW5kIHRodXMgdGhlIGJvb3QgcHJvY2Vk
dXJlIGNyZWF0ZWQgYnkgb3BlbndydCBzaG91bGQgYmUgdW5hZmZlY3RlZC4KPiAKPiBhdCBsZWFz
dCB0aGF04oCZcyBob3cgaSB3b3VsZCB1bmRlcnN0YW5kIHRoZSBzaXR1YXRpb24gaWYgZWFjaCBh
cmUgY3JlYXRpbmcgdGhlaXIgb3duIGRldmljZXMuCj4gCj4gd2UgbmVlZCB0byBmaWd1cmUgb3V0
IGEgc29sdXRpb24gb3IgbWF5YmUgbWFzdGVyIHJpY2ggc2hvdWxkIGVuZCBvdXIgb25nb2luZyBk
aXNjdXNzaW9uIGJlY2F1c2UgdGVjaG5pY2FsbHkg4oCcaXTigJlzIG5vdCBtYWlubGluZeKAnSBh
bmQgd2XigJlyZSBwcm9iYWJseSBib3JpbmcgdGhlIHJlY2lwaWVudHMuCgpJJ3ZlIHN1Z2dlc3Rl
ZCBhIHNpbXBsZSBzb2x1dGlvbiBoZXJlOgoKaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjQvNi8x
Ny8xNjAyCgpZb3UgY291bGQgdHJ5IHRoYXQgYW5kIGxldCB1cyBrbm93IGlmIGl0IHJlc29sdmVz
IHRoZSBpc3N1ZSBmb3IgeW91LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
