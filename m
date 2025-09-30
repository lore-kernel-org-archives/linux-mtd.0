Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5641CAC5BE
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Sep 2025 07:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M1p5+2kEskHoAf2VZeyyNk7JGofQ2Y3Eo3OIXxgQ328=; b=sXhHkLtL7ih1Px
	//3KuDECzR8yibtgllL4hsgA+etRaLRJhFgWlN0axp/h+wJBLDvf1NIbxfozDPjzrCXNCa2Isc20O
	uZOd8ubQBexz5A7/fi3tBs1FOO6E+tdCIGICFCIOItYFrTZwPIeQe2v0jj6u+5xyt8690i28WwuK4
	SDbW1oWN14vXhT+JhFhbflpXCombTRGssbIkowzjbCX61GGXsh8LwVwZjyvblrFPuJmMVc4udCnwz
	tb8IcXfzrX5LLF5mBBrzL9hLi6OBQd9JFkK8FMqcm7xe/1cawRfI4K8pudyTo6SJPsb/bHFMWARn+
	dH6NLxN4AUXFq2IMpBGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3V4Y-00000004XNd-0dtk;
	Tue, 30 Sep 2025 07:46:54 +0000
Received: from mail.ventrixor.pl ([91.134.88.136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3V4V-00000004XMX-0P5V
	for linux-mtd@lists.infradead.org;
	Tue, 30 Sep 2025 07:46:52 +0000
Received: by mail.ventrixor.pl (Postfix, from userid 1002)
	id CF44A2440C; Tue, 30 Sep 2025 07:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ventrixor.pl; s=mail;
	t=1759218405; bh=Pi9+p40l7//vLKO8DuYTv+ORJz3B9aWETGdVOxLyydc=;
	h=Date:From:To:Subject:From;
	b=wMf2L9SEWbWtkmfKEnb7mAZOUXxY8N9ln9BMqfoil8OVEx4oKaQkFXucJPvTp0GRj
	 war9AOaFlO5YP5zgPS4UvMewejVmiXuwK5Ij3VUaeGYJKl4VfN7lV8Mz1WmKgFlO3e
	 WTGRArd6vxINnrrGdOvOTUFLnWxoBtc8W6RuA2FOfrv7J8DYGw/B+iBt5WvCiZXTwz
	 ou4PW4aHeJtQFjavIANenxmcJb9Si38aVcTVrBP2Q5wcAzdRXwh9mVTz2zYVsvlxFl
	 BTHCuGY6WSyf4gHNW4rvYLPC5KKF/UvxmBe1OvPgpt6+T1kU+5eunWzh8xY9w8ZROm
	 ijBpZ/uxIxXZA==
Received: by mail.ventrixor.pl for <linux-mtd@lists.infradead.org>; Tue, 30 Sep 2025 07:46:24 GMT
Message-ID: <20250930064500-0.1.9p.274hn.0.ad6g6x3ltj@ventrixor.pl>
Date: Tue, 30 Sep 2025 07:46:24 GMT
From: "Jan Adamczyk" <jan.adamczyk@ventrixor.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Rekrutacja handlowca 
X-Mailer: mail.ventrixor.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_004651_431578_0E3EE822 
X-CRM114-Status: UNSURE (   2.54  )
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
