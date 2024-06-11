Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42232C25B76
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jun 2024 07:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3i0H4vS0ThOJrF1IotJdJbJDGiGW1kAcSFJjGY+WoLA=; b=qI5AXjBs6fT4yj
	oWbjCZwN2KOGRBX9yPT7Jh3nKS/Kt94LnoZ84vTE7HZXlEDeBWEImEwfRAyxGVy0zV6fjc02P3TNc
	UHeOvqABRFL+Gf37NwnWJaGkktq37dBpTl4cYlgoJoVocwgHJ/IsoBoiFup0DkHWN7timvADPoH/Z
	II7GMb/+I+UevuymFY56CyIjRL5hRWhDG0LVAxP4Yfg4LKOeN5jPk0Y9RIWNO8HUXPjt7LUSC/Agg
	eCIix1cJx+++n/U2Da4MyFYLTG/FEMDRfGrw3jx4LrXy1gTY5VC4/zLccxOpF5YJcnHN3GuyUIdHM
	bMQLtUMivoZveJGQA1Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGw8I-00000007tKT-0iW9;
	Tue, 11 Jun 2024 07:41:30 +0000
Received: from mail.explorepulse.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGw8C-00000007tCI-05jh
	for linux-mtd@lists.infradead.org;
	Tue, 11 Jun 2024 07:41:26 +0000
Received: by mail.explorepulse.pl (Postfix, from userid 1002)
	id 97F1524215; Tue, 11 Jun 2024 09:41:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=explorepulse.pl;
	s=mail; t=1718091675;
	bh=dqx6etWJTU7o7oR1uR2aRBCwaPXPl4dirwwzUCFBDcc=;
	h=Date:From:To:Subject:From;
	b=WVLCWGRiGsJM3oeA+1kBeG6jG8p1KfsOPURDD/y074U/BBvgRYtxeQhWNVbYI7VuB
	 RsCCKd5Rjl3dQzJXmpS4mUCNnxwVrX4nDtNd25+MqGAGjWVWSB/vIVzoGM8OEfNQ3f
	 V+w7tlqja3VDqSgktJB6tA/28JEuEfLQiowT+Y+BFl3Z4xAww15Hf0J0n4RDXS5rRO
	 mA0Ib0vnpP2baQiiAattPUyerfXmpSmzkzkTeeC8KvjyP/UsRhuT2uQyH1kdS8wdnS
	 c5RI4o/jnzqxG3VsX3LH22e5uUqP/ABgWDEvqNWAu5IyvRRWiztN02oG0aTrOhAycz
	 cFwNn14EVci6A==
Received: by mail.explorepulse.pl for <linux-mtd@lists.infradead.org>; Tue, 11 Jun 2024 07:40:54 GMT
Message-ID: <20240611084500-0.1.bp.shi6.0.d9djjeehl1@explorepulse.pl>
Date: Tue, 11 Jun 2024 07:40:54 GMT
From: "Marcin Gard" <marcin.grad@explorepulse.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.explorepulse.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_004124_858074_5F24A14D 
X-CRM114-Status: UNSURE (   0.72  )
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
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbSBzZXJkZWN6bmllCk1hcmNpbiBHYXJkCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
