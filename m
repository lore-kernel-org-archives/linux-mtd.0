Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206B4D206AC
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2024 07:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MKeQbiPEnNA7j0cIzGkmH9t7AuZe+Cti6zzGSx0Ay4Q=; b=YDumh5rXbBMcGJ
	u53zjGCHcxgcWXMeUFperfy1icZ2OL0ZqRbDDiYqtUIL2vmp3yrbXgWZD3zJyxPghWehjdPbzNgei
	HIwcAWGQzweLrFpBPSdSJnA+cl0V7GD+30XGiIRK4JDXOJS/4vgwLmQPZFTxLinPxUr583CnCnxq7
	IUkZxnT5YV0qE3dr1vMZtcArsUgyHOzOwT3Z6NY1Ejz2eyNx+byiOt9Dmo5x26fcOaGTbbXJUaK9y
	aZrWK0oO5pqtGk/mJs5NQ8pnDLHEnizxhCSqQD89b1BsuHpzMFtFkh1J0pHZnbiT3LN7tDWkKxP+V
	USo4FDQ8TKRnIBD/LK6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0yti-0000000Auk0-2F9x;
	Wed, 16 Oct 2024 07:56:46 +0000
Received: from mail.plivio24.com ([141.95.18.5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0ytJ-0000000AuZx-2ttK
	for linux-mtd@lists.infradead.org;
	Wed, 16 Oct 2024 07:56:24 +0000
Received: by mail.plivio24.com (Postfix, from userid 1002)
	id 9EE1DA4101; Wed, 16 Oct 2024 09:55:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=plivio24.com; s=mail;
	t=1729065367; bh=CJaxe0/Oss+uuu+rAIpDCRNP1r/1Sj5XETuqIxCAGFI=;
	h=Date:From:To:Subject:From;
	b=QE8xhG8PTJ4qdUMLy6sv3s1/hPNun5TO2yOjL0O2lNnd8OTjGGj73zzmUKWC+Sn0g
	 cJ5zCApLFyLf/vgcYLtoKlAUUvLXPwSGv1emPV7agns03Ek/4/eh60U7MOh2nCejpC
	 fhq9HC2UWHgO5j8lstWGirx6SyXp6m9p2tyABsuCOr2xrZ2nAzpwXYMVVgL74Kct/z
	 /QJW5glQpWL6hQDOthSHl17JFzS9vSxKG9mmtryhpEaLhsrt5Mh/AGQ4t2z6V6iSgw
	 wBdmrEgkq7ipjCjveSZJvZ4VusKsB9MmGR7Zr0hAfS3BkHUi34KC1faHubrLLPP/1M
	 ZgagdXsbCdu2A==
Received: by mail.plivio24.com for <linux-mtd@lists.infradead.org>; Wed, 16 Oct 2024 07:55:31 GMT
Message-ID: <20241016084500-0.1.fv.15akn.0.11h6jsh5oi@plivio24.com>
Date: Wed, 16 Oct 2024 07:55:31 GMT
From: "Piotr Toczek" <piotr.toczek@plivio24.com>
To: <linux-mtd@lists.infradead.org>
Subject: Rekrutacja handlowca 
X-Mailer: mail.plivio24.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_005622_732017_AAE4E74C 
X-CRM114-Status: UNSURE (   0.98  )
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
