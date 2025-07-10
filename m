Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA26FC83F1D
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jul 2025 09:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6PvaUQy74vSzvsRZUrJNBQ94rzgeDa1aZPx1L6gaEUE=; b=2/76Wl7+Mt6J7c
	9za2Xk2fiyGbXHtRwpMG9TCvFVWvtjfuuKN/GO/dVccyfFwkPWOkqZp4yXzBhnKRe65QWHDuCADSp
	XkoETfIh9CBO50a97tFjZdc5WzZkT/j0ankpzhCA2kOBTYAmmhYiz2zFppFU675RbXNqIMaZ769Rd
	h12YQuK4k5AeaSz6ja/WozUq4wkmtxBhWOlTeQAopG4Q9R2YjNQan17kJizUCbLEDoSrgH8hGyfId
	Eqi/CCekB+inDY9ynGvxFqo4OtNOe5iOn1VLeLnffOoHB05BYmQfi3y+ChOR9YjgGqOptz7ow2Dnl
	WXWypIn/emmEK7L2/DNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnDq-0000000BHqp-2vBO;
	Thu, 10 Jul 2025 09:05:42 +0000
Received: from mail.biznator.pl ([162.19.205.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZmC2-0000000B5y8-2Rki
	for linux-mtd@lists.infradead.org;
	Thu, 10 Jul 2025 07:59:47 +0000
Received: by mail.biznator.pl (Postfix, from userid 1002)
	id A436129921; Thu, 10 Jul 2025 09:56:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=biznator.pl; s=mail;
	t=1752134227; bh=DjNALEe96gRlzA4ffLINmOD2oI1cqzpVK/E4I+uckvQ=;
	h=Date:From:To:Subject:From;
	b=bBDUmKQ2DyBj0tsI0drxbprTmONHxsr+uRKgWPcvYsZDKGtmqd/0BIoI/JlVttXvB
	 3+PSbUl++Z7liTIw1JLhXNKJu38FSWFo2X7UDY7ecWKo8nqsWLW/ClcE+ZfPFDrRSA
	 p+ElNhrh55LFwZkizBvUfnrJrf6xj1yhDR+ZdwsohpmKdmqAzj3JYHF2gJ6TM5wCnU
	 o9kZoqUQfJLrMapi+Q78y6vHyeTL2GdLBfhulhyyDIJt9PxG4BdhY7ZfSsVfdj5cUw
	 dVUEPpkwWZMA1bRnFw1cCqfNqvTX2RB39kcwx0iw9CeeYdePdVk1jpTCZ6RtETaqqN
	 YUmOOcZQiysDw==
Received: by mail.biznator.pl for <linux-mtd@lists.infradead.org>; Thu, 10 Jul 2025 07:56:22 GMT
Message-ID: <20250710084500-0.1.id.13zfd.0.crl7qg51tm@biznator.pl>
Date: Thu, 10 Jul 2025 07:56:22 GMT
From: "Wojciech Mroczka" <wojciech.mroczka@biznator.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Instalacja pv
X-Mailer: mail.biznator.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_005946_773822_9BD318BA 
X-CRM114-Status: UNSURE (   1.00  )
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

RHppZcWEIGRvYnJ5LAoKY3p5IHPEhSBQYcWEc3R3byBvdHdhcmNpIG5hIG5pZXpvYm93acSFenVq
xIVjxIUgcm96bW93xJkgbmEgdGVtYXQgZm90b3dvbHRhaWtpPwoKSmFrbyBmaXJtYSBzcGVjamFs
aXp1asSFY2Egc2nEmSB3IGluc3RhbGFjamkgaSBzZXJ3aXNpZSBuYWpsZXBzenljaCBqYWtvxZtj
aW93byBwYW5lbGkgc8WCb25lY3pueWNoIG5hIHJ5bmt1IGNoY2lhxYJieW0gcHJ6ZWRzdGF3acSH
IHByb3BvenljasSZLCBqYWvEhSB3c3DDs2xuaWUgeiB6ZXNwb8WCZW0gcHJ6eWdvdG93YWxpxZtt
eSBkbGEgUGHFhHN0d2Egb2JpZWt0dS4KCkLEmWTEmSB3ZHppxJljem55IHphIHdpYWRvbW/Fm8SH
IG9kIFBhxYRzdHdhIGN6eSBtb8W8ZW15IHBvcm96bWF3aWHEhwoKClBvemRyYXdpYW0KV29qY2ll
Y2ggTXJvY3prYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
