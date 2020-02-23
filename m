Return-Path: <SRS0=rEYP=4L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE66C35666
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2020 18:07:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53AAF206ED
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2020 18:07:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J68KbGQE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="b9BK5zBO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53AAF206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ey0elhX+Ybwej0ZrDu3ehK9Edyb4+LFz8Dt0WuGmGng=; b=J68KbGQEFb6m7i
	rkTsga03uUjd3G80QyHzMu1u71nc/mf2eN6w0bO2WMAGFe+gmbBfrw7Ch32SXnhKsIo9/hb6mTK4o
	UfcmeXQe9+KEIMB7zLj44DtaR35DsKtpJlFdjMMT0cKk7kbs2ZxkbQUBNDtyuzmtwMBF9GNYkCVOF
	b0Nfi9SyaNzb2fPO/BTzl6gRS3mBShfCgool9ek2gIHSgPb/H1g6HsRCTRTiPULGtxGfVfaNZK9hG
	1S/5KR0w32+MxXUrhkCW2N8is/ANK9KrJ0Zks3TTvUjKwKZb9Py+Vh/ToaseBtqVXC4HgqtLG1bIq
	SsTlDugVp4FSkBATb64A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5veR-0002kX-EP; Sun, 23 Feb 2020 18:06:47 +0000
Received: from mout.gmx.net ([212.227.15.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5veO-0002jz-IO
 for linux-mtd@lists.infradead.org; Sun, 23 Feb 2020 18:06:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1582481197;
 bh=2NFrMCPNd4HHmEBukow80ok3UEzrJ4vUNsvLNSAoUNM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=b9BK5zBOk9QKo4BvPu6JmRInBs22BMgKXNV2XKl/uXhy1uWgL4pWTLfK1egxlzI/6
 S61+oxSgdjK29Zfwa4Ncyj9Dj5BZboXMhxCAaUtToeh73115Ft5fSTjqJSTbdfO6FK
 rdaOtfMLRKOCXg4IWZY0h2vevwqdfEJXxG2hVTcM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.195.184]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhD6W-1ja1LK3evy-00eKjS; Sun, 23
 Feb 2020 19:06:36 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: Fix a typo ("manufecturer")
Date: Sun, 23 Feb 2020 19:06:33 +0100
Message-Id: <20200223180634.8736-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:4Z5+5sy4KYL+oHikGgeU9ovylJ0mV0BYaJh75CE/JWMPWUANEEj
 1jyFlszYDOGhWnwjX2nrEbwwRsveVVgxzpVeS29DRbag5uUGww06+Nd5hY0QLC7zxIV/UlI
 xS3UUb7OI/SdmGCUjtjq7OY7CMNz8DSthUzsJkYJnMBtTDQ5v5CX5COlS2R0JyyQMWa/78T
 iLVkORXgBbDhdhZsMJ7zQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zOOz/ZTXQ5E=:/NBTSZZjrqCWLzcxrHbnve
 eBSHTRkRf9YoLh20gq/+Yi5NU8qlX+CtAHp9yYHxsTQ7H9v3KOnSm9KpUwzRPAwZOiBg8xHEP
 E9dflcIaprDZpKdbNw0V/ROw5CAhv421E54C+fxnM3K703HNttLBVnDtHKOE3zPqA71HWILgz
 2lHNFUexcP++IFB1d42La5kZo3yaOW9PztYqj4xm9gs7ztD5kqdTQUBkURiXmL8oQT7DK3iH0
 vJjFYesEkRVqLIC7CsY3J7q6ylxEngC40/+R+ccxvSogBh7tQkl91FoEYRw83Qf7NZ9FGOFq7
 D/LmpbmepaGCraGGlaM3lAE6p2vp/OL6shNgHXwQX3ekzvsfxzSGuY8ORwR7yGQpkIjg6KZmq
 l4bK+bbDv23aO6YL+shuEEOdXcK/gKYhQX68tW0iOc3MbuHhpej4SoAZr2j6Icr0OZeIBUTF8
 X681/PHyUUJk24BlU6UZRHd0Ql2hPyXkVIiVmpNIJsoFfT+vuAqnfymBJnxCXXoOkbgUAyO+F
 18K9n4IRmVXrD1FRKPBMedvvcFnbZRXVjr+/sHsQXsn+vkNUTFYD1SwMkR02JRXnYN7TD8/Nq
 XxZ/L6frz9ytC+nBapyLs7gUwmBJbc3tOLkxRtCZkSOQtgjQlrU8hQFIZMKQYAb+YcyT4H+tS
 IdKl5fZLZqUAAkvkxpdjV+QF00dmCvcjRfs6ddBFXjiJNkojUq0s5ulSiYfeztkrFB5oCn31/
 jluy9BwDYFIgkMQWOMAqKVFck87Bevde3QrUsCMb9jdJBzuW0rS6Z6/bxgZZQfiraLudK/Ntu
 bJN0rMPcDXRRCxCmJI3C/FgkeU4f7iE1MPglR5g1G5dQi2H/lCJzYnI2ZqE2I8J5XFn1DIV90
 +tRkkZkE7XrLOWL4m66/YqTXKKkluqWGpRIpk9u7DbsY5DAGVXT79o+/O8WjTjG7ovvSfwIod
 5d8a5CsCALDRcxkIzAyBCLVSxwbDqVXG/asJwAtO/RozbJLtdBFQII2pw9/gMZI3Vw58UihX2
 tf8mU/QVEWL0GQNveQALJFF8pIj4KN6s85ogQJQAfYdXdBkZfq8BWMVXHkbSi/Z5LtbnqelBb
 Fg5RZw/F6m7Hmox1rgiaaHZnGdNI58bc4NXTC+FDGdH2qt1yqzyUm6UzTqsXhquVN0qFrJjZW
 zdgD0JsrlEk/RF1LOAhHbAhZoP1jCy4wSxfDPzz73y2y3G7sW51l5WkDBrOrEt9rya0lQz61T
 GWoQLiXhUModPXlZg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200223_100644_902729_D68792C7 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

U2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5l
dD4KLS0tCiBpbmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmggfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L210ZC9yYXduYW5kLmggYi9pbmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmgKaW5kZXggNGFi
OWJjY2ZjZGUwLi4zYzdjMTVhYWRjZWUgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvbXRkL3Jh
d25hbmQuaAorKysgYi9pbmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmgKQEAgLTEyMTUsNyArMTIx
NSw3IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IGRldmljZV9ub2RlICpuYW5kX2dldF9mbGFzaF9u
b2RlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCiAgKiBzdHJ1Y3QgbmFuZF9mbGFzaF9kZXYgLSBO
QU5EIEZsYXNoIERldmljZSBJRCBTdHJ1Y3R1cmUKICAqIEBuYW1lOiBhIGh1bWFuLXJlYWRhYmxl
IG5hbWUgb2YgdGhlIE5BTkQgY2hpcAogICogQGRldl9pZDogdGhlIGRldmljZSBJRCAodGhlIHNl
Y29uZCBieXRlIG9mIHRoZSBmdWxsIGNoaXAgSUQgYXJyYXkpCi0gKiBAbWZyX2lkOiBtYW51ZmVj
dHVyZXIgSUQgcGFydCBvZiB0aGUgZnVsbCBjaGlwIElEIGFycmF5IChyZWZlcnMgdGhlIHNhbWUK
KyAqIEBtZnJfaWQ6IG1hbnVmYWN0dXJlciBJRCBwYXJ0IG9mIHRoZSBmdWxsIGNoaXAgSUQgYXJy
YXkgKHJlZmVycyB0aGUgc2FtZQogICogICAgICAgICAgbWVtb3J5IGFkZHJlc3MgYXMgYGBpZFsw
XWBgKQogICogQGRldl9pZDogZGV2aWNlIElEIHBhcnQgb2YgdGhlIGZ1bGwgY2hpcCBJRCBhcnJh
eSAocmVmZXJzIHRoZSBzYW1lIG1lbW9yeQogICogICAgICAgICAgYWRkcmVzcyBhcyBgYGlkWzFd
YGApCi0tCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
