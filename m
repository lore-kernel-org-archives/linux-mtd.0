Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C8EC677C4
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Jun 2025 08:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2wEJJVjRyUHOqVc1FvVUz3gfk4jb89TPla5NCnWIayg=; b=er5+5rzYIDiZIZ
	Tm4sjySYqNTQpdYJ11cf6e6ZOVD7s9YH413MzmYIt8w6ITFANXsAzyDukpptuiC8knBQ30dQcmpVN
	HO22FrNzTin4puuD51p9Ro7BiPFfq1bVjlDhNKH8CXCuCTvkjT6liIdyP8C62tVj7g4394CJ56C+Z
	DaHNV4Ws7zhHBf/s0wg9AkoeuEFENki91G2Yhn02f6WII9jDJagoTdJEgqqIZ5/1H74S25QGQmcqy
	pF1kkWajjoOwz8m3zO12d4W2+zWPOzh4Jo1wmCuy/h8+ZXL9sB7qxZxOep6Ng3rEczCddRx6iNE6w
	+l/YJLqjmd3yuKy7PwdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGw9-00000009Hhh-0dQP;
	Wed, 11 Jun 2025 08:35:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGWI-00000009Dmn-3chV
	for linux-mtd@bombadil.infradead.org;
	Wed, 11 Jun 2025 08:09:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Q6Mp/vCJCiZNgk6fb7utkqIErbcoVoR/CugPofoeCtU=; b=bUHfG9z3580zSmYdC5kN5LCdmu
	R2Bf5zk6mn/S5Mb1NzzdA1eOtxeG52aeif72BxOa+gEaG07bFPRvnUPJlEQ5frYp1DEaOu3X2eXzS
	OhtU2kGJoRSCz0qVy4fRhFNYVTS6ekapFUgSs/0css6r7OK2RtTjrjnG4TU99nkwHT4ENKfPbJmbW
	Vh1esbjBUud78sz/NuaDSVUwvvUoGHjv2t1As6dqr3M2pX5ao253tMyt0B/hjsnENj/ek8Xncxidt
	EvTPn7eR6LA9hWBtx7v4I84AbQBDBeMkqUwJRuIUcp3bACFIejh7c6vNdvA6vqCYycnzGTGUosOfa
	QaIaCTKg==;
Received: from mail.successa.pl ([162.19.205.12])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGWG-00000002BUO-1zcz
	for linux-mtd@lists.infradead.org;
	Wed, 11 Jun 2025 08:09:14 +0000
Received: by mail.successa.pl (Postfix, from userid 1002)
	id B419E2794F; Wed, 11 Jun 2025 10:07:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=successa.pl; s=mail;
	t=1749629293; bh=Q6Mp/vCJCiZNgk6fb7utkqIErbcoVoR/CugPofoeCtU=;
	h=Date:From:To:Subject:From;
	b=bhyVePFi99fbBI8f/TKMOWItGzKphT+Idlf15Ii240SK21j6iesC0yk1Z9ELUq4yM
	 XqzDU6sAMure6tr1L163r8CvvNOzWjLHlxJKGqTMi8Oc9X8ZhUCcl9u6Qp/EhmIRX+
	 e8L0hUU6EjCL2NIwoxegZblDkVOzJ5cq6G9FzK3+RuXdhY+Jgq/v+a0ujcV7HGuvn3
	 gqsA9RYZEt5+TPRH86KuHbkS+cQjWzCev2ueyR3nkNJRGA4w3HXaP14tuJ5B9w24Dd
	 y6RNgq6EqU3e5OW6rUfGd3ejJxR7YdqRHa36/LU7/K9HH3cD/D6WRqob8lqBN1ZbvU
	 iVLXCneh6Ktaw==
Received: by mail.successa.pl for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2025 08:06:07 GMT
Message-ID: <20250611084500-0.1.iq.1ryn5.0.im7aqefudd@successa.pl>
Date: Wed, 11 Jun 2025 08:06:07 GMT
From: "Adam Drzewiecki" <adam.drzewiecki@successa.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d_?=
X-Mailer: mail.successa.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_090912_958751_D8599BE6 
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGludGVyZXN1amUgUGHFhHN0d2Egcm96d2nEhXphbmllIHVtb8W8
bGl3aWFqxIVjZSBtb25pdG9yb3dhbmllIHNhbW9jaG9kw7N3IGZpcm1vd3ljaCBvcmF6IG9wdHlt
YWxpemFjasSZIGtvc3p0w7N3IGljaCB1dHJ6eW1hbmlhPyAKCgpQb3pkcmF3aWFtCkFkYW0gRHJ6
ZXdpZWNraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
