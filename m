Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B6BC3601E
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Apr 2025 08:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M1p5+2kEskHoAf2VZeyyNk7JGofQ2Y3Eo3OIXxgQ328=; b=iGB/iIA2bb7FQV
	kZSPouvfH6QnP2diPNjD58TZRL1jfUY/h469oq75egPvpI9kne7jErLRQpIxomsWCy53dW/J0xT3K
	8UNC9hsIzuasVGTKPyW+4yQBUiuNwp/tPXqsP8K+S/fDmF4APLULedlV3bF/WlAIZNTnqvJf2rpFU
	Df/ad55GvkT3b26WKccWKjO4PEA5vZYDQSdmJN+NbsRCLVbJ/VYK8MQmGLiyFDZxT82uow+JeQ8pP
	LH5oDIbYT5B+7ZmIkj0IFAbkq9tBdrwfX+91sxjiMBlWEBlDs40m9WqlqAi+EskqDnDF7obim3/EG
	McjRE7w+jOeAtd0PZkmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0cR2-0000000B91e-3q7H;
	Fri, 04 Apr 2025 08:29:56 +0000
Received: from mail.ventrixor.pl ([91.134.88.136])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0cR0-0000000B90Y-2gxL
	for linux-mtd@lists.infradead.org;
	Fri, 04 Apr 2025 08:29:55 +0000
Received: by mail.ventrixor.pl (Postfix, from userid 1002)
	id 1924325EC4; Fri,  4 Apr 2025 08:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ventrixor.pl; s=mail;
	t=1743755299; bh=Pi9+p40l7//vLKO8DuYTv+ORJz3B9aWETGdVOxLyydc=;
	h=Date:From:To:Subject:From;
	b=ZmwlfYEbgmuw+OiIX6QR4/odMV2q39f5HCww/yap/eE76O9ifb/m7/EeAG4L91LHw
	 FlfBWXcHtv5qefdh1c4Zb2BeO3rfpONnd+sldpXzLhVrpKf3rSD1dzrsZ/wFVxcEPf
	 e79nh1CW00tjC97AtYbDB+hdfMvEfOO+XuG61Vr0RKQO1pIgfCTWCV+FLu25qatvud
	 v5Q7RjeiWD7K9xTnUKQOAOQPWNmjDUYFrEC+WflNBJcvPCn9nCenuZNfJm3t63vEpc
	 tofWbodmOLp4lM7txf0+yY0ZW2lkYDKvF6rIe5AkqlGKP35IupTH+oNZld9BP4DbHB
	 1wEbdSahCveeQ==
Received: by mail.ventrixor.pl for <linux-mtd@lists.infradead.org>; Fri,  4 Apr 2025 08:28:10 GMT
Message-ID: <20250404074859-0.1.6c.1c8m5.0.7d9kvc4lq0@ventrixor.pl>
Date: Fri,  4 Apr 2025 08:28:10 GMT
From: "Jan Adamczyk" <jan.adamczyk@ventrixor.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Rekrutacja handlowca 
X-Mailer: mail.ventrixor.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_012954_819538_337CA885 
X-CRM114-Status: UNSURE (   1.60  )
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

V2l0YW0sCgpDenkgbWFqxIUgUGHFhHN0d2EgYWt0dWFsbmllIHBvdHJ6ZWJ5IHogemFrcmVzdSBy
ZWtydXRhY2ppIG9zw7NiIGRvIGR6aWHFgnUgaGFuZGxvd2Vnbz8gCgpQb21hZ2FteSBza3V0ZWN6
bmllIHJla3J1dG93YcSHIG9zb2J5IG5hIHN0YW5vd2lza2EgUHJ6ZWRzdGF3aWNpZWxhIEhhbmRs
b3dlZ28sIFNhbGVzIE1hbmFnZXJhLCBhIHRha8W8ZSBLYWRyeSBNYW5hZ2Vyc2tpZWogdyBvYnN6
YXJ6ZSBzcHJ6ZWRhxbx5LgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHPyAKCgpQb3pkcmF3aWFt
CkphbiBBZGFtY3p5awoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
