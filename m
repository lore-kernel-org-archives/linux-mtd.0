Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1715ECA0EE5
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Aug 2025 09:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xoVRPUqkcP72GyOzBSNrgYpVjqUjyEROPt8DsVIFemc=; b=RdaoTdx7DQquZv
	DZ/gsVhMXFBbzoBO0lHX1Arl5N5h0aHoPhD+/zBlKf+EvrRyLdffALmFtCJRr6CdHcMxsRe7pke9C
	vKjRtvgjtZs5yHMf29m+1+UhnnoBvRi3OF7dqNavYoDESJ9wVMjNmAOFvo7tUTfDgQCdQyol9zMK4
	mNbpcn/XGSgsrSjvv0BsjEX5JPCbaPYrzgHw3cEvZmnpKZq/fyMX4Qtlg73Yd3rwMIXV/pVvTcvmu
	cLNpmxueqHSLiUdA83ivb2b+m4CAZIMK60NfEKALSHb/XbIRiOGUTiCA0aeKcpuojafKC0gOAi3WI
	DRjdUQ7NjWpDjqZ9fyRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um80n-0000000DFwn-1sTD;
	Wed, 13 Aug 2025 09:43:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um7xW-0000000DFVI-0Paj
	for linux-mtd@bombadil.infradead.org;
	Wed, 13 Aug 2025 09:39:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=H2qKgXE2kH8cJbbzmMD4Hpjt6I9O7VcxhCsYYCpgFnQ=; b=F1PY186nGgky4KiRF9e5bUC/DQ
	QVjdYnEjWtjNKyEhDz6Jfrfzyoa4lHPNWJJOTYZ0kDuySMz5IoXERZ0yDNd8IR+OwgeN1tzZHSyik
	nSuKyo5TrHUDLRgQ+qZTGw0DJdhDJuAi8MPZIgGvegN/ntzuloAPMxUe070BBrKIEjV+4qNPwTTl3
	tfGDd7+kRlNbeRdvxqcID/7aQurx4YaHIfJPMq1E3eILV3ZHhO/b69qsLeZcV/xJX2B+/udUExIgU
	jm2lXzM/wXjMlAKjO3rWkKJ0rT5oIF8RzmkGO80OMU1MBbRZ78SjLEaJvnsQO8tjgyiD2/klxMBgC
	x7CcXegA==;
Received: from mail.monetoro.pl ([217.182.69.186])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um7xS-0000000G2ZT-1orM
	for linux-mtd@lists.infradead.org;
	Wed, 13 Aug 2025 09:39:48 +0000
Received: by mail.monetoro.pl (Postfix, from userid 1002)
	id 34DD84970A; Wed, 13 Aug 2025 09:35:43 +0200 (CEST)
Received: by mail.monetoro.pl for <linux-mtd@lists.infradead.org>; Wed, 13 Aug 2025 07:35:29 GMT
Message-ID: <20250813084500-0.1.hs.3czh1.0.6zpb3anmeb@QuantumQuest.pl>
Date: Wed, 13 Aug 2025 07:35:29 GMT
From: =?UTF-8?Q?"Tadeusz_=C5=81ukomski"?= <tadeusz.lukomski@monetoro.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.QuantumQuest.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_103946_553833_9662222B 
X-CRM114-Status: UNSURE (   0.90  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbSBzZXJkZWN6bmllClRhZGV1c3ogxYF1a29tc2tpCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
