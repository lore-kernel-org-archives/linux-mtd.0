Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABDAC71135
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jun 2025 07:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MKeQbiPEnNA7j0cIzGkmH9t7AuZe+Cti6zzGSx0Ay4Q=; b=hIhj6xivBn48Nz
	WfO36ajZjIiI456au92h9Ft138nQfbBYLDiXxy9LMh3oXpP0aPjRgBcodQQCoY7b/NL7u1M8uMFkT
	3UP3unvfwEpbQ+K8t+q8UDNC3x4hCyNTF4TZPemleAjShd+AC5eqI+caqbhjtDSuhYPLAju3NfhR9
	EJO7hf3eUoj0IwYVZ0BrhZDhmLVPK1be3Qfd23hZQFRHi16C34WwKsSSMi4eaTvH0hYLRQ8QDShhC
	ndlISYeVSyNsP99SrWtcMgwq09/s7NTEktDf3tRQuiocInue24vUtp3Y5F0Eqw5wrzBuHwyZhS4t9
	Y8cFkCpnbtQgTIFbsubQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzII-0000000Fi2d-2lj9;
	Fri, 13 Jun 2025 07:57:46 +0000
Received: from mail.commalix.pl ([141.95.18.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzIF-0000000Fi1D-2twe
	for linux-mtd@lists.infradead.org;
	Fri, 13 Jun 2025 07:57:45 +0000
Received: by mail.commalix.pl (Postfix, from userid 1002)
	id AB057A65A0; Fri, 13 Jun 2025 09:55:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commalix.pl; s=mail;
	t=1749801341; bh=CJaxe0/Oss+uuu+rAIpDCRNP1r/1Sj5XETuqIxCAGFI=;
	h=Date:From:To:Subject:From;
	b=Y8TPn62wsqFNkaWMf9Jx6HHExCFcdeMYg6EtL+mb8Har9yuWJkfTKN0M93LClpvFK
	 RVnba0/6YCrcrYRxpNh4F/AmRHJ09zEvMwKZDH76wPBmvKO0SY3y5yWShnWoVOFzmj
	 tuj04N6G3AmwhfGVzWdYYwuaZr0DmdAZlCf9h3v75M8ZQdHsIzFhkQIYZcm+J0MUlM
	 OQci33Rv+6n9kRQhHQaTfrimGMiptFBz6Xv6vMKpCQIyXoLEBmsqONJdwceemeWEXk
	 pn50LeynZ6BpkwlMfW+5eZH5il8BYfs74wYF0jOWEqyBHrfUnT25N4+Tb8GcvPq/Tb
	 fPSQFZLtwCb0g==
Received: by mail.commalix.pl for <linux-mtd@lists.infradead.org>; Fri, 13 Jun 2025 07:55:27 GMT
Message-ID: <20250613084500-0.1.kf.2hred.0.c8g3bqxmlj@commalix.pl>
Date: Fri, 13 Jun 2025 07:55:27 GMT
From: "Piotr Toczek" <piotr.toczek@commalix.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Rekrutacja handlowca 
X-Mailer: mail.commalix.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_005744_430295_641313BC 
X-CRM114-Status: UNSURE (   0.74  )
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
