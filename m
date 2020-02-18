Return-Path: <SRS0=v3L2=4G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A934C34026
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 15:11:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F23FE207FD
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 15:11:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NxFyu5cD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="aMDXTYA4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F23FE207FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hhYr9qIT9A3/PskoXoCJl/FDX8nCZpNu7ty7/DVDBa4=; b=NxFyu5cDUgiSJZ
	rFi6ipIiqVi/KABYdxIRBqyShtlNjaxz/wlS6osXBFZOmC5rHaphWN4GPXuUWJOQRluuFvJ7jsdz1
	gvPahnOA7cXvBWysiqX+csSNFF2D10cF+1GPiMeRi00kPqdbtm2fHPv5OAQQz7ur6Jj/hR/ec0CRz
	9iPbCsayCosucXVKMP2IeDb+Y5vkn0YIA2jxQLJeYoXKYWHzqu7w49BlZ1NmA/qSCcsAwj24EM/ij
	jPcEe9SJwgNHHtHfG8/LMXbFcFhT05q6I+wjbVNpXmlnav4yYzE3Ao8zkvXB7AOaIb1cmO9R/lFmn
	xTG/5Tjic3xL+92bV7OQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j44Wb-00039S-RJ; Tue, 18 Feb 2020 15:11:01 +0000
Received: from mout.gmx.net ([212.227.15.18])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j44WZ-00038z-8L
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2020 15:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1582038639;
 bh=iIXeJbJphQxq+Yjke2Cq99I3fwTTqpuEc57IwA/qwI4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=aMDXTYA4YdG3w+SBl6RquCH6a8ThrGLNwRS7ClKeD7Ogh3PyYTzPSHGoW6jGO11TQ
 oCGAwzSHH837tYbT2dF85e0a2TEr6toDh9X9UwBEOSDqMvhiZa4KJnNWhPHPDwz24q
 yZhINGa7EXErOqD6EZziRsx6AaSTjgaRPcELXEDg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.223]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1wlv-1jRkOc2VlR-012IYf; Tue, 18
 Feb 2020 16:10:39 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: Simplify loop in spi_nor_read_id()
Date: Tue, 18 Feb 2020 16:10:34 +0100
Message-Id: <20200218151034.24744-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:zINvuvI/vP4dAMYLrRwlntPkwlGVie3T+Ss13bG2eo3J/0AfEe3
 0YO3URsROtHRc/YuHX6Y2WTsBDm4RPq3IQZuDJ3RtVaPsl1Z5fePm9ut7QzjIpSvm5wQ7ZG
 9YlU74y9lLrAGcyRYmo0iBc3afl7rasXCmDWKBpbH49NDlU5WtMtZndyKnat3oOFqKnen7c
 9vL97bWk4xTwWVqF4BtGg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fDc1hno+pvA=:8siC+ZbWuD87CjZH5hvgke
 mIVrlz83x/OyGaEJq8U1ObxXWQiQjh4VboBx7BDh1KybUCIRgoDSMLFo7S8SGpg/Qly//r2Vk
 zvpson8ii9CHJGJFre+vC2saQYko9rD3+0TZK3KpEyXt/nfrB1EdoQpfqo0IItUWNP1NYG2xJ
 luh7OfhKULfrallMVC2IQPZF5fkrnvuYjAex6x9QUQQJwUwvUtJks6eP1ghSAT3yqpRhKjJ33
 cMP1MpB7NuGnfe6JVi9PKFFg5exADAO8zmFhlmhUUbb/jH4gyQeiQuP+QXA1hyJ8gnYDp9/5H
 SoReeMlcB43HDfj9qTq8Ae33s84NASKl12ggPcC1tX8BTSlzICVyf0M2VW8hJ1vRQsYIgPW4Y
 rcQ8AXxhqFhbbceOyqd/lEroTFHyU8Ri+0ny49K3q0AXxILhzurdNm8EESgbkwYppL8X9ur9y
 QX7gUBZ8dhJMfrDHkxHdRUdJMW51RwzhB4pZuUteL9+8LxN1cjLMTmiNRxu9e7I6eWVpw0Si5
 BhHw1/IJ1Jd752o611fcqcI+VcO7YK06hRGchmn2TtGF+U3NXCCJHMOZ/jxL/lV/emA01Kf4T
 gYndDDS3rywdiIIV2DO4Ztcxdp/oJaP7U1tONeBlhZ/EbB9yFasBUaisWD9xxatkZsX3ISMnV
 +BZTVqUT8fNGfj+ARRzGs406RR+1DAltN9EZXmou5biX8MyQkwcLRKT7Y0TXgCmC/MMJjyJoI
 jAVR/Y4hgYpnUmFWcyzr+7So1XPO+FEBTxRjrOBQ56k+Pzi7MW5lqG/gG2svG+U7c3mTqm+Xj
 /nThGmMt76n51KM9IRHcUd2pFo4VAQHutoSQ4c7TyHZia8jwv1HnHERza1C5aRoTxZpl708PI
 G3PjyLnuLuQez24Srn9xzHMtnO9xmJZ3VK2mXe4WwNy7d87YOia/MICOXrViHeZjprVqFGmNV
 RG4smvPWSlU8R2B68XT0/BfOEUcWRleZFS7IC6XGPEKqmoS2jKXhpDwBKqXJSIWfDY2LdE9IB
 9jnszNArWivDaREhQvWugS/cao7oJeHIgDN8SpYtMVI/ugMdQouE/w4u6s03M4Qu2KUb7marV
 KVQM4ykkOVe6IqDbKv86bnclfz1BqP+4MGITRytX/g7/Gu7ri7FbHDzodTHBiMb9jrigW//Wu
 57fGAJsIM0Gu24HGMQ9N+ZCKNZwUjSuCxYZ678PnEQ9PKAH9rdeq6sr40OvmD1flR0NW4fK2C
 GRe3stiC5DoFqmhR7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_071059_593764_73AE8D3A 
X-CRM114-Status: GOOD (  10.26  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LSBEb24ndCB1c2UgYHRtcGAgZm9yIHR3byBwdXJwb3NlcyAocmV0dXJuIHZhbHVlLCBsb29wIGNv
dW50ZXIpCi0gTmFtZSB0aGUgbG9vcCBjb3VudGVyIGBpYCwgYXMgaXMgY29udmVudGlvbgotIFJl
dHVybiB0aGUgcG9pbnRlciB2YXJpYWJsZSB0aGF0IHRoZSBpZiBjb25kaXRpb25zIGxlYWRpbmcg
dXAgdG8gdGhlCiAgcmV0dXJuIHN0YXRlbWVudCBhbHJlYWR5IG9wZXJhdGUgb24sIHJhdGhlciB0
aGFuIGEgZGlmZmVyZW50CiAgZXhwcmVzc2lvbiB0aGF0IGV2YWx1YXRlcyB0byB0aGUgc2FtZSBw
b2ludGVyCgpTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZl
ckBnbXgubmV0PgotLS0KIGRyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jIHwgOCArKysrLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYyBiL2RyaXZlcnMvbXRkL3NwaS1u
b3Ivc3BpLW5vci5jCmluZGV4IDRmYzYzMmVjMThmZS4uYzQ5MTU3MmQ1MjY3IDEwMDY0NAotLS0g
YS9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYworKysgYi9kcml2ZXJzL210ZC9zcGktbm9y
L3NwaS1ub3IuYwpAQCAtMjcxMSw3ICsyNzExLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFz
aF9pbmZvIHNwaV9ub3JfaWRzW10gPSB7Cgogc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZv
ICpzcGlfbm9yX3JlYWRfaWQoc3RydWN0IHNwaV9ub3IgKm5vcikKIHsKLQlpbnQJCQl0bXA7CisJ
aW50CQkJdG1wLCBpOwogCXU4CQkJKmlkID0gbm9yLT5ib3VuY2VidWY7CiAJY29uc3Qgc3RydWN0
IGZsYXNoX2luZm8JKmluZm87CgpAQCAtMjczMiwxMSArMjczMiwxMSBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGZsYXNoX2luZm8gKnNwaV9ub3JfcmVhZF9pZChzdHJ1Y3Qgc3BpX25vciAqbm9yKQog
CQlyZXR1cm4gRVJSX1BUUih0bXApOwogCX0KCi0JZm9yICh0bXAgPSAwOyB0bXAgPCBBUlJBWV9T
SVpFKHNwaV9ub3JfaWRzKSAtIDE7IHRtcCsrKSB7Ci0JCWluZm8gPSAmc3BpX25vcl9pZHNbdG1w
XTsKKwlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShzcGlfbm9yX2lkcykgLSAxOyBpKyspIHsK
KwkJaW5mbyA9ICZzcGlfbm9yX2lkc1tpXTsKIAkJaWYgKGluZm8tPmlkX2xlbikgewogCQkJaWYg
KCFtZW1jbXAoaW5mby0+aWQsIGlkLCBpbmZvLT5pZF9sZW4pKQotCQkJCXJldHVybiAmc3BpX25v
cl9pZHNbdG1wXTsKKwkJCQlyZXR1cm4gaW5mbzsKIAkJfQogCX0KIAlkZXZfZXJyKG5vci0+ZGV2
LCAidW5yZWNvZ25pemVkIEpFREVDIGlkIGJ5dGVzOiAlKnBoXG4iLAotLQoyLjIwLjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
