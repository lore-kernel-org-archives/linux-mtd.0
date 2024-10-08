Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D231CED274
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2024 08:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5OP6uYTGZuqiBptH+wg+Bt34kklfrHBV+k6CyTpAgXc=; b=yZRJPk7T+/RDG7
	bfx5g6HOmW1yMWf84vsdOsF1wfp7QiM1VnKbj5E5GcVJRsIw0p3JzHhNah8V41IdD4ZBJ1x4RL7y8
	ECMeCfWnafd2AhzzNZSA0bLpItvJexxStFxMU0+nY6tgzQ3238nJtNf/M3uL9OLOjC2RaBzQvJ8zS
	RwgqlHeIadfB8EFgjVaIlZQsf4vT9WddxQoW7trD8NEAXtEaAgACun0FtzJ1lK6FnvZenAUD4dL1W
	W3P9O7oBHD4QwZsL5ad0qHgTfqQxAOU6oyqC9YBu8dIMO4fI5zy6QOCNCX6RH2mujgOXGftw2W6Oq
	PTCeARaaW+e9IpxSX5gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5bH-000000052b8-00zd;
	Tue, 08 Oct 2024 08:29:47 +0000
Received: from mail.bizinception.pl ([51.68.214.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5PN-00000004z7G-2NlC
	for linux-mtd@lists.infradead.org;
	Tue, 08 Oct 2024 08:17:32 +0000
Received: by mail.bizinception.pl (Postfix, from userid 1002)
	id 3131B52176; Tue,  8 Oct 2024 10:16:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizinception.pl;
	s=mail; t=1728375445;
	bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=;
	h=Date:From:To:Subject:From;
	b=WNLLH1GIygkujHmOHhsYohe+tAsABR4kun9XpC7HFCYh+OLeJ4ngZLVLOa9ULMUUE
	 DCbR5LKl9t9qG9OpN/+P9bZolz4hBz6iJEzcXaa2+2REr8QdD7iD2HpyVbfPfjBuv1
	 Mfqplck5fq+2HQeOzrTftq+Ccj3YCUlReSL7DbASK2KzQGMHBUfiWqz0MPAWJuPA88
	 yrTCPZ+3U0/4BGttolaShXmV24TskTucy+t6ION2ILonGjX1CCXnMVI4VW2mMKgNzJ
	 3bkMhREMfLR4oCWPB9Ru+Ewa+iUDyXUc9+ZYRj+1SvA0Ip4GDwPyHb7+x6z6jB8k3K
	 QsR2OD+DGzQYw==
Received: by mail.bizinception.pl for <linux-mtd@lists.infradead.org>; Tue,  8 Oct 2024 08:15:25 GMT
Message-ID: <20241008084500-0.1.5e.mu24.0.cp6k18eszg@bizinception.pl>
Date: Tue,  8 Oct 2024 08:15:25 GMT
From: "Dominik Lotka" <dominik.lotka@bizinception.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.bizinception.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_011730_300228_E7363794 
X-CRM114-Status: UNSURE (   0.94  )
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
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpEb21pbmlrIExvdGthCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
