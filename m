Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A692DCAC582
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Sep 2025 22:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MKeQbiPEnNA7j0cIzGkmH9t7AuZe+Cti6zzGSx0Ay4Q=; b=gaUUxTn6A27r3S
	dW3GGvZxqIuG0CVkwM5jtGxCewV+ckbIpv+h1DmSKg0P5JT29SsPOU07n1NTe9mp7e0wLxL1LOLBA
	uJcTXhei42IXgvK9I3p8OJWHmzhpb2LEvqflDYMH6lruU4cOa/JyYEZd6hhMfKny/jVfaw77gweCA
	Mr72CJ7BeYWITnppnkYGkZd1bHeUROHXApyQL8xalM4U1CDc79KZ2OiDqS0nyVmBYk3xvf8CzNHeL
	iuirWNeC9U1Pah/R0PAs4gSysNUr1XUs/t45rWEasrPoRgo7Yqnw8HeX1K7cgQhk/aqPtvnkSiY2e
	CuK+BgnZOOS7QB+1FHyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxCAD-0000000Bpq9-3DUQ;
	Fri, 12 Sep 2025 22:22:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxCAC-0000000BppZ-2X8b
	for linux-mtd@bombadil.infradead.org;
	Fri, 12 Sep 2025 22:22:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=CJaxe0/Oss+uuu+rAIpDCRNP1r/1Sj5XETuqIxCAGFI=; b=J30WzBj2yd3AHAV0Im0gYTazl7
	ruV8qFg7nQuDynqxhD3i38phZsGXZr9WkfOmH3YIdh4+n/k6STfj+XO8/DufBty/YOyj6HRSAaL0z
	5fHHzdMPsaHjBl8LakGdw6WQ98OdN3xL3h/c2BTCzAXU+zOqHXicIQYacUwWplIrti0fIfojiVvPL
	CIzYNBO45sKU9fSKu7N+f3nwNFiRYU8pSNrTdlBxaMQS1EP861cqz4AudZxzw/QH9xKQxKsWBGTjW
	uaNMX8GVzYaRyDLFLnPXltOQKQF/m/IeeaJ7Z9cuTa1XK0KYjjRzc9ZUIqJgKsWNDARocOYpVrKPV
	VLC7lZHQ==;
Received: from mail.commalix.pl ([141.95.18.5])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwyhn-00000006GnF-1UXk
	for linux-mtd@lists.infradead.org;
	Fri, 12 Sep 2025 08:00:29 +0000
Received: by mail.commalix.pl (Postfix, from userid 1002)
	id 4914FA62D1; Fri, 12 Sep 2025 09:56:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commalix.pl; s=mail;
	t=1757663793; bh=CJaxe0/Oss+uuu+rAIpDCRNP1r/1Sj5XETuqIxCAGFI=;
	h=Date:From:To:Subject:From;
	b=rY2dqxyaTcI7cVBsMNNfZ2VI2+Gy+KCuzz6pZNWeGsUQ01B2O9sFwXS/GH35vwusH
	 RzwxIKsbBMMm6bOQz4guwCAd5mkb4/GQ68ksD4Cm9s195gj+kq+XLgHXG4wj5S34LF
	 lygKFGqwGzUkWSf6/TGP8BLY/2jZQ/pQI+941zhunkYtFkxPlcWHa5dekgT65WiRdy
	 mpqCjYmN+9Ah5fCi0dLDLHr6NsPOO2oxGNJjyZCf7Mt64/EOAmlFYcAYBn7eh0EmK9
	 79DOofmEeUJkzN9bbHLdQ7YdZGJ+nGwSdYRepoJqq4YAeOyJcP7BlpSdcU0mecbLVX
	 zw8Pgpf9ZkNdA==
Received: by mail.commalix.pl for <linux-mtd@lists.infradead.org>; Fri, 12 Sep 2025 07:55:46 GMT
Message-ID: <20250912084500-0.1.m6.385ql.0.dn83a686m6@commalix.pl>
Date: Fri, 12 Sep 2025 07:55:46 GMT
From: "Piotr Toczek" <piotr.toczek@commalix.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Rekrutacja handlowca 
X-Mailer: mail.commalix.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_090027_771520_4CCE02A3 
X-CRM114-Status: UNSURE (   0.87  )
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
