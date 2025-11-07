Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69B7CCF9E3
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Nov 2025 08:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D054769zlFDbVa7tvf3RAzgpBThgnUVXHznEbCcgnZM=; b=dR/aGg2bgkbIrH
	dJM2UngVqpXUzuge+hC/14C67qyIKS0Qw9mRo9WQRiiJPd46Y/wJI7DYMG9yH/LGsvKSWjzGVoC/i
	yQTUWG1CvcFjFbqyhf23d/m6RYPUNESAcNb3aFRVx/zs4eLYX+qbURe2WZbsoqU3FJMbfDQvkJpkP
	A3k9bozAlylSmGV4NSvoYxmCTyw77FARPO359YzfId8tiLdmIjwCajSwU2NCFG/PO8YX+BAJXaxRK
	nfmjMf1U4vWl2QYXKqLn+L5H7zJAvIJGCPr2zL+YRJ3R9w3+aq9Wcbv4CPmnOH0SDutvgCoGzzBY1
	Q+5CtNcRB1Nx5Y5gbtQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHI6z-0000000GuUV-2NAX;
	Fri, 07 Nov 2025 08:46:25 +0000
Received: from mail.stratevo.pl ([51.75.21.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHI6w-0000000GuTq-1fzN
	for linux-mtd@lists.infradead.org;
	Fri, 07 Nov 2025 08:46:23 +0000
Received: by mail.stratevo.pl (Postfix, from userid 1002)
	id 83D4725232; Fri,  7 Nov 2025 08:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stratevo.pl; s=mail;
	t=1762505178; bh=WgPvEaA7Jyt6CWeuFbgwfiiyPfJ8i9ON9uEjDF6DE/Q=;
	h=Date:From:To:Subject:From;
	b=KcFzuiojuOg2RZC8QA0UT3Mp4CWMOBbPLQ3mIxXZpmFZ/4YBTto/Dr1Dn3cOmyJUf
	 8URubqPERsYrsIcDx6mPhA/SyEj+L0/7g7Ky20DfozVJq8+4DEPMWs7nR7ZpGE1Sm7
	 LhEQM/UZe4gcHOyhsmtEi+1NoRC82QG1iO9Q7xk8O/oUYsLfwoH6Nc1arrVDfojvD2
	 a4GlJfCVbd/Ukrvli+GIf7TFnaK2bWRNr9RVgXbn8Bngv9/74xcanf7/w+Al1H7nij
	 M6vQF18AcCM6bWksAArqEFIea16GYI07ALVg6CjAFWn7pbd9DwRO8GnZMr9yrp9dRp
	 hPTMgdYRnCAJQ==
Received: by mail.stratevo.pl for <linux-mtd@lists.infradead.org>; Fri,  7 Nov 2025 08:45:21 GMT
Message-ID: <20251107074500-0.1.3l.osph.0.k7ggupacpv@stratevo.pl>
Date: Fri,  7 Nov 2025 08:45:21 GMT
From: "Arkadiusz Jakubowski" <arkadiusz.jakubowski@stratevo.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d_?=
X-Mailer: mail.stratevo.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_004622_713841_9DEBAB15 
X-CRM114-Status: UNSURE (   1.42  )
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

RHppZcWEIGRvYnJ5LAoKZmlybXkgdGFraWUgamFrIFBhxYRzdHdhIGtvcnp5c3RhasSFIHogbm93
b2N6ZXNuZWdvIHJvendpxIV6YW5pYSBkbyBtb25pdG9yb3dhbmlhIHcgY3phc2llIHJ6ZWN6eXdp
c3R5bSBwb3p5Y2ppIGZpcm1vd3ljaCBzYW1vY2hvZMOzdyBvcmF6IGljaCB3c2thxbpuaWvDs3cg
ZWtzcGxvYXRhY3lqbnljaCwgbS5pbi4gcHJ6ZWJpZWcgaSBzcGFsYW5pZS4gCgpKdcW8IHcga3LD
s3RraW0gY3phc2llIG9kIHdkcm/FvGVuaWEgb2JzZXJ3dWrEhSBuYXdldCAyMCUgb3N6Y3rEmWRu
b8WbY2kgendpxIV6YW5lIHogdcW8eXRrb3dhbmllbSBhdXQgaSBzcHJhd25pZWpzesSFIHJlYWxp
emFjasSFIGRvc3Rhdy4KCk1vZ8SZIG9wb3dpZWR6aWXEhywgamFrIHRha2llIHJvendpxIV6YW5p
ZSBzcHJhd2R6aSBzacSZIHcgcHJ6eXBhZGt1IFBhxYRzdHdhIGR6aWHFgmFsbm/Fm2NpPwoKClBv
emRyYXdpYW0KQXJrYWRpdXN6IEpha3Vib3dza2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
