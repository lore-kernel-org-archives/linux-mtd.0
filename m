Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E22DC77B75
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Apr 2023 12:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:To:From:Message-ID:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=+AE0NkD80XKvBVpNJIbEq6mnd3lcE9f2Y5aAT9UQ+wc=; b=xzO
	QXINd917bcv1zWAxb2pZStZbh8qgC6uTUbHXqJJKCRyMZOwlbHE9eNb/RK2Zrc6IUZudkueYs4NRp
	gJIZP6w7w4e7jeSylTV0Z9/KB6Fmw6GIiqImiiv6yZGj+UoISBXDrWteVbvLejZOpaOkyuf6KHYK3
	eUWhGcqUQ69WbVyrPWFyHuHNOPAopDPvJRk25NXLkc5qsK03JZJ832GZ92fp+NGa3rUzYlqORfAyt
	c1OEgCRbAUKk8oIVcZv1h4Th1iQcrk86Ehdk7AtTAc8+WWz7nhY663xcSBeZ6Lf9UGLliRirZz0q7
	cvxnlNXyeNq07U2K4hCz0vVBNvFal4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pppye-00AsI7-26;
	Fri, 21 Apr 2023 12:35:00 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pppyb-00AsHb-0G
	for linux-mtd@lists.infradead.org;
	Fri, 21 Apr 2023 12:34:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1682080491; i=deffo@gmx.de;
	bh=gTjcShf/1BmooS/QjyUZQOOH9eJwnKUptiKpzqbsNrI=;
	h=X-UI-Sender-Class:From:To:Subject:Date;
	b=HlLvEss3u4KaPE307GPCXh0O39Q0AGKzwyXZTk84e3N1Vus0n1DmiJN5mNOYSQBTn
	 ANyQ52J0aatPrlfe+Cn+FKWhJMubA7ptMxt3Qv+Jw2ZT13URx3lHJKRMrFIsJgf7n1
	 jIky8QYNmyiP23UoLAGX2t694Ektcal2U6QYNZAlSPJ20gSYjEuNF9M+iG4+OGfLsh
	 Oc/LcciGQ5Kt1lLPaqlR/eazX/AjJZstMUtqWB9iJi+Flhb4HXXVb4Y5P8EQ1CXVO8
	 TPFINbmVjsMqzMvfcUnsShM7q6R/xmwCRqEznXq6THv0NmHGliHku1g1hTr2cGhyGU
	 R9TTgCrPY7K+Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [46.5.1.147] ([46.5.1.147]) by web-mail.gmx.net
 (3c-app-gmx-bs44.server.lan [172.19.170.96]) (via HTTP); Fri, 21 Apr 2023
 14:34:51 +0200
MIME-Version: 1.0
Message-ID: <trinity-40e0cbf9-021a-440f-9ffd-6d8b211351ae-1682080491688@3c-app-gmx-bs44>
From: deffo@gmx.de
To: linux-mtd@lists.infradead.org
Subject: I2C FRAM as MTD device
Date: Fri, 21 Apr 2023 14:34:51 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:J+7fRKKn5pvFGvqHEzWVHsNlInxpwgFJC8fGdGOPtSILBGEIMUnBjai+7ex+Kaid0+GQY
 gRhgE8/3VGXZojW5Dlyt+oeY5kXE1YE6Xv3WMMnUIbvaDJjaD47XuVfjiMZ5Kp/yBYFDE9TGoRLL
 eBeWCa+vSB/etSJ+6Ri7Kx4hmLs194OGXlyYAVVAi+5i0WuaT8C10/GNncz1GRKCnth5dVxtqWoo
 z4MLs5heNHWQRjTWTGFPIznY1PeE2ZnfVUyxxfRuIKYUIbRPTSppg9cxnumsrKxVqnYFy1xMzdCu
 g8=
UI-OutboundReport: notjunk:1;M01:P0:jcEsH2Eji4c=;qr8ebkEb3q2/Mp3LX133VDNH6ws
 /H4eO0W695GttiGqngp5JpS94WItobFrWaRnWU/yq/8G2/nzzqauVwIg7wPgJLYAZWg67hBDG
 qptI/QJDPmXBUUSGduzdxxXUahdao9cqO31Yhd2vIx1hFDduyGGBbZltMbmFtffyG+dI7hrkL
 hZn21Z2c5V7QJs+jvDZ6aQsETjXF842Bbljgu/SgouKNJg3h2Ob5e7dz+Rqi055et4sc4hmjX
 h6x6/tzDsBtJnN7n310kg2kWn8STrGKTAXN+ZFB0KLHhc2PUmrIiA/422xVTtjYTLOnnHwK6k
 1TGw68cecD6aB9JgCjboxRhjoLAIAJPGB5mzS71p92Fcf2p/9BbHU9nm8VCqk2ocshTdCMP2Z
 GYpRixJmJPoPVGwJLtTd/DbjzlZ6CBI9jRAUCEjPVB+zYHz9yLkfEue5TH+WTqfXr4/30N5e8
 ENfb2/NlDkgmOi/VNqoT2q9Bs3wCy1q7xVKT8ZgZsYaL/Alk/ruhs5G61iGlpaYzPjL6J5ULP
 1Eac2LPCUGVzu3sRJQwyxm5mCP+avmDMFe3xKsFOl/2IbUsu+gmwQg0rSPeBcnVmYGsC+iy7k
 9joh/V9RUPxczdLvVeSacQbWTkv+0HcvKImrYtlPDAFRTdjnWgaouE2VP93hlImzUaeigiiPs
 7euO+5aG+zaxSK3mKXfr3IT97iDn42nm0/lBgcXAxHRieHje4K33hQVzJOZ1hMz95kGB94Xl4
 ArbK6R+7lU2PzVU89WlEVLtUwROvvTHSH2KgC1xTUMTE03Tq43P9QVwis7b2ZfTfzL1Wl3mct
 k45egQsQZIdfXtC7fdv5omoqE7gTIMyyBC+0hDFnvFYpw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_053457_431382_680B563B 
X-CRM114-Status: UNSURE (   3.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi there,

is it possible to use an I2C FRAM chip as an MTD device in Linux?

Best regards

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
