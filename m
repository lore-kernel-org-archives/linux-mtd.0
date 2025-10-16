Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF73CCD194
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Oct 2025 08:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MKeQbiPEnNA7j0cIzGkmH9t7AuZe+Cti6zzGSx0Ay4Q=; b=LVjithC/9MbkKi
	yYbjUdtQF1/nXtaDnRvYTOA/pZBmbWgVDUo9rlpKKbRhdOxZRxd2hfbeFiKpphNht27L5aHD665Ic
	hUirTfSHlUdE0jOpLSKfIE76I7jI8Zb2VAi9ItCgRzodKlk7g+eSK3LGZx1OnIIp6tcBfQbXVgmIi
	irs/KGBCqjOG6/jTYUGw0xszY8S0qBl1FFvgr9tXhr8O+WmQgujFH/ikDxgnTiMdm64LQMmbc2f9p
	lnfFVGMK3vtYw7aF92T3yAft8nykmwIRRhWCI+BH+p8Cc+6XFsVh8d8ZTqNKhlzuoBpfutbGOhLGy
	M7IWXcslsYNWrrlkywCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Ivb-00000003q1D-3VTA;
	Thu, 16 Oct 2025 08:01:39 +0000
Received: from mail.commalix.pl ([141.95.18.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9IvX-00000003puq-2ZAn
	for linux-mtd@lists.infradead.org;
	Thu, 16 Oct 2025 08:01:37 +0000
Received: by mail.commalix.pl (Postfix, from userid 1002)
	id 992E5A54F5; Thu, 16 Oct 2025 10:01:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commalix.pl; s=mail;
	t=1760601683; bh=CJaxe0/Oss+uuu+rAIpDCRNP1r/1Sj5XETuqIxCAGFI=;
	h=Date:From:To:Subject:From;
	b=eQHadt7oyIU0NPBsGvQ79N9hb6Vhte6dVpd186/XyvRRQs2SxOp5lmbcMh1x7ohH3
	 35tVfnQMMpf8ZbaA4qfxzIhbOpe0BkIzV4GLUg3GGJ252OJ08KbhrWohzaem+N1uW6
	 ld2JGE27jPuvoRLRiLFOOpOQydO8rGIRxyDfDT3VK1q7hlrSSAhSnkIwWC7NGKfd6W
	 VrKDDajUzvbKqv+6jkpIE3xPR1QRt/8L7878kUTXL5jqlDFR79lCXorQckkrH2mGx7
	 MQ+5KBjlxqKvRevLyKajKNw7Ett/at7PlLrOht2spRXCY1M2hPya/mRri9JgYsdVc8
	 eWeSUU1Vkcjlg==
Received: by mail.commalix.pl for <linux-mtd@lists.infradead.org>; Thu, 16 Oct 2025 08:01:02 GMT
Message-ID: <20251016084500-0.1.mu.3ei82.0.haa1chwrfy@commalix.pl>
Date: Thu, 16 Oct 2025 08:01:02 GMT
From: "Piotr Toczek" <piotr.toczek@commalix.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Rekrutacja handlowca 
X-Mailer: mail.commalix.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_010135_963205_14CDB114 
X-CRM114-Status: UNSURE (   0.64  )
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
YXJ6ZSBzcHJ6ZWRhxbx5LgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHPwoKClBvemRyYXdpYW0K
UGlvdHIgVG9jemVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
