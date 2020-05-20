Return-Path: <SRS0=rTSM=7C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74EFAC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 11:31:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A79120758
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 11:31:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dc30V9hR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A79120758
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thorsis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LU9hk5u2DNibnvugc8n9SNjeQvhpFQYY4gbgusbgW2g=; b=Dc30V9hR5/NZ0vK75CzUqK0vpg
	u9KH7BLS5RK76PD8xZ7box1uDOALauvAUJQX4Ucl4AwdM+OXgODIUKx7Vh2GPnOMqjAgmk6aJ2+qA
	EnUjzBvKT03sfpMvHn32VMp+0nqhfyjsH2xByeCl5j56QpLY90dMGvEi/tKHtzw1KV/ejmOMXSKBs
	raeUf0qsy4oIPTWA8O9VvI7U3Adn90CqxT65foGvqgy8h8M3wKY/QPmcpG3oV93wC8eON+jhst8wN
	xz/El5NPJCsdjWPBryaqRSRtnC7zyggbJrucQm0BcHSwSfC8oS1xKo+CR/PiE6H/aMplcgkJgfLSZ
	BbbMpp0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbMvq-0004uY-4P; Wed, 20 May 2020 11:30:42 +0000
Received: from mail.thorsis.com ([92.198.35.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbMvm-0004qH-Ka
 for linux-mtd@lists.infradead.org; Wed, 20 May 2020 11:30:40 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id 0357EF73
 for <linux-mtd@lists.infradead.org>; Wed, 20 May 2020 13:23:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FOhKC6JSSIpP for <linux-mtd@lists.infradead.org>;
 Wed, 20 May 2020 13:23:07 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id D84513552; Wed, 20 May 2020 13:23:07 +0200 (CEST)
From: Alexander Dahl <ada@thorsis.com>
To: linux-mtd@lists.infradead.org
Subject: Re: Any UBIFS volume image installation command with selective ECC
 (DTB) in Linux?
Date: Wed, 20 May 2020 13:22:59 +0200
Message-ID: <1861744.E9oVbb6G30@ada>
In-Reply-To: <CAA=hcWT-Noe3hk-YYs2K+WYA9b2dLtT6A5boYyf3x-3YOKr-Dg@mail.gmail.com>
References: <CAA=hcWT7eQ5nXjqRyOG7jaH=K8OEa5w_AwbB_fTJ6JdM-=YDeg@mail.gmail.com>
 <CAA=hcWTTD3uLOq91GAAm6GXvAmQrDbhd6Jxj2EMH40O8n9ExoA@mail.gmail.com>
 <CAA=hcWT-Noe3hk-YYs2K+WYA9b2dLtT6A5boYyf3x-3YOKr-Dg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_043038_845246_2EF59F24 
X-CRM114-Status: UNSURE (   7.03  )
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
Cc: Jupiter <jupiter.hce@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVpIGhlaSwKCkFtIEZyZWl0YWcsIDE1LiBNYWkgMjAyMCwgMDg6NTk6NTMgQ0VTVCBzY2hyaWVi
IEp1cGl0ZXI6Cj4gSSBhbSBiYWZmbGVkIHdoZW4gdWJpZm9ybWF0IGZsYXNoZWQgdWJpLmltZyB0
byBOQU5ELCB3aG8gd3JvdGUgdGhlIEVDQwo+IHRvIHRoZSBmbGFzaD8sIERvZXMgdWJpZm9ybWF0
IHdyaXRlIEVDQyB0byBOQU5EPyBJZiBzbywgaG93IGNhbiBzZWxlY3QKPiB0aGUgRUNDIGZvciB1
Ymlmb3JtYXQgdG8gd3JpdGUgY29ycmVjdCBFQ0MgdG8gTkFORD8KCklJUkMgdGhvc2UgYXJlIHNl
dCBpbiBEVCBmb3IgTGludXguIFlvdSBjYW4gZmluZCBzb21lIGluZm9ybWF0aW9uIG9uIHRoYXQg
aW4gCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbmFuZC1jb250cm9sbGVy
LnlhbWwg4oCTIGxvb2sgb3V0IGZvciAKIm5hbmQtZWNjIiwgZS5nLjoKCiAgbmFuZC1lY2Mtc3Ry
ZW5ndGggPSA8OD47CgpUaG9zZSBzZXR0aW5ncyBzaG91bGQgbWF0Y2ggdGhlIHNldHRpbmdzIGZy
b20geW91ciBib290bG9hZGVyLiBJbiBVLUJvb3QgdGhvc2UgCmFyZSBub3QgbmVjZXNzYXJpbHkg
c2V0IHRocm91Z2ggRFQgaG93ZXZlci4gSSBqdXN0IGNoZWNrZWQgd2l0aCBVLUJvb3QgMjAxOS4x
MCAKZm9yIGEgc2FtYTVkMiBiYXNlZCBib2FyZCwgYW5kIHRoZXJlIEkgZmluZCBpbiB0aGUga2Nv
bmZpZyBzb21ldGhpbmcgbGlrZSAKdGhpczogCgogIENPTkZJR19QTUVDQ19DQVA9OAoKSG93ZXZl
ciBJIGRvIG5vdCByZW1lbWJlciwgaG93IEkgY2FtZSB1cCB3aXRoIHRoZSBhY3R1YWwgdmFsdWVz
IGZvciB0aGF0IApib2FyZCwgYnV0IEkgZG8gcmVtZW1iZXIgSSBoYWQgdG8gbWFrZSBzdXJlIHRo
ZXNlIHNldHRpbmdzIHNob3VsZCBtYXRjaC4KCkhUSCAmIEdyZWV0cwoKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
