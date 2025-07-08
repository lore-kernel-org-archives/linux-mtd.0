Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3907FC83F16
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Jul 2025 07:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MKeQbiPEnNA7j0cIzGkmH9t7AuZe+Cti6zzGSx0Ay4Q=; b=2QSC2/B9WMxiim
	0/AmRGO/Mhi+2hK6HGAnv80lOWNxj/IKvt8M/TUzNvC9B5fssMv+0Jp9iI/+nbRlLO1BLo/szrh28
	JDDfChGctHwr0FraphFGz16HUfszzvHcsGVaubjZNJPiycR46H2Qq7vdpJYX6fKiXSlx32yurl/ye
	HClPLhKs4iDUnyNBB+4EJ+p9lawEZEPEfFZncYct8Lq9JAAQuQ02R5nPoM86jGIrZsgkESf8vTjKK
	eSWezJU/NaXA0HFy7Y6GKoOrvOrFOX+EMynguLOWvqNC1/5lthV9gxdnHLFnm2NyGahZq8K4tbHj+
	DmlNUyvwWi78ETlt5Vig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3Ee-00000004fXn-3I9F;
	Tue, 08 Jul 2025 07:59:28 +0000
Received: from mail.commalix.pl ([141.95.18.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3CH-00000004eoH-10Gm
	for linux-mtd@lists.infradead.org;
	Tue, 08 Jul 2025 07:57:03 +0000
Received: by mail.commalix.pl (Postfix, from userid 1002)
	id AB01CA5018; Tue,  8 Jul 2025 09:55:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commalix.pl; s=mail;
	t=1751961343; bh=CJaxe0/Oss+uuu+rAIpDCRNP1r/1Sj5XETuqIxCAGFI=;
	h=Date:From:To:Subject:From;
	b=fbkiHFLfqzGRx1twHIVPztwU9Bpy0QYQqbN/eAoG2VhyCTkS1npe+5chYBy+ny+0Q
	 QyH5mQMOwFdMeq43RybArG+AY0Smv1HGNE+76+Sw+zWWMmX1ahAGTsKmntI96mCYuN
	 AOUt/Zeqi3DChsTqwn59Q0WSpB1f8BgtErDxVA+Le8CXl84ddArqL7DpbCiyoz8U0d
	 IvOg2mW0Ck3wCTXMeptcCgWuqKS1157ZIm3iQVmaeOHp5y6IlCFoFhVW3UA52y88zJ
	 pG7OqWmhFC2K4lia6dDifKssaAUUITulZL+zrH/ILpjxat2hoXVZnT32gPrL4RMnV5
	 EXohDSAH0pM5g==
Received: by mail.commalix.pl for <linux-mtd@lists.infradead.org>; Tue,  8 Jul 2025 07:55:26 GMT
Message-ID: <20250708084500-0.1.kv.2o696.0.rhcylj0nal@commalix.pl>
Date: Tue,  8 Jul 2025 07:55:26 GMT
From: "Piotr Toczek" <piotr.toczek@commalix.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Rekrutacja handlowca 
X-Mailer: mail.commalix.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_005701_972195_D956C419 
X-CRM114-Status: UNSURE (   1.66  )
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
