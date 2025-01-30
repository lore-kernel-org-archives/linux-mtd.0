Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F88C0218A
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Jan 2025 08:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+QFSjMhmlUrgrXIZWS+zxHYzurP31leb0Q7nB21xptU=; b=tzjpzzScHjz0Hy
	1035uIc3afZBuWmG4rm+sRx7Kudn9Wgi0rFWNlU3txgd4t5DejCGNldLU285Ulo1L/nuh51NiP36o
	+afnHAk30e7/fV03Dc+cCY/qZxfilXeT18S0A/8OEyfAk+zGZyXFOWzf7IlzZrUT1XHImbxTE0Ktt
	bsL3tPZx1AcB3re3ukPmS41/Nm3rOw5+gDix3eQMTvdCTS5RMOuZItN2W96sBb+iFyj4G5il6S0hO
	tPrZO96lpt5WQenWnG35E9QLOSGW/12kJuGdj0kBzCBPO9TSj6B6YE6vQfSIBHJ5RH9Qp2KyVS0Jg
	ufrNT0yzn4rV+X74gCpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdPyn-00000008Q8K-3Ns3;
	Thu, 30 Jan 2025 08:32:53 +0000
Received: from mail.novaplan.pl ([51.195.118.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdPyk-00000008Q7a-0qKT
	for linux-mtd@lists.infradead.org;
	Thu, 30 Jan 2025 08:32:52 +0000
Received: by mail.novaplan.pl (Postfix, from userid 1002)
	id 66820A361F; Thu, 30 Jan 2025 09:31:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=novaplan.pl; s=mail;
	t=1738225964; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
	h=Date:From:To:Subject:From;
	b=tMTNoUE3LhXdsC45ir8FIhLc3qUyHuL20WoKDDiyjyedSgF7oGK5ZIHCc87qIpgxR
	 P6Zw2xCfiMgNf+5Nva1qcXtCnK85AuQ0dP7hrfKQi8TOJ4MEHoiAGs57f+a57SAHzS
	 pHwJg9G9R6HdNJceB6XNKM/KZj6MTfdezRGpg2CxKCyTAJyg1hSZ4Kp69znfZ6NTIK
	 Bx/KoBw3jJn8d37g6MJ95hiHPPBupk5HdjE/CW1I4K/A+3veSkmehfWePeOTKhQZSj
	 QjO2/t1KpeurZGE5jLAtp8G8iRhI4tZ0S0PH1w81663HWCxnefARPU1beoVi6S1++V
	 US+TT9wb5zC2Q==
Received: by mail.novaplan.pl for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2025 08:31:18 GMT
Message-ID: <20250130084500-0.1.jk.14xbh.0.ukthu23emq@novaplan.pl>
Date: Thu, 30 Jan 2025 08:31:18 GMT
From: "Adrian Liszka" <adrian.liszka@novaplan.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.novaplan.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_003250_930865_05839325 
X-CRM114-Status: UNSURE (   1.87  )
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
ZG8ga29udGFrdHUuCgoKWiBwb3pkcm93aWVuaWFtaQpBZHJpYW4gTGlzemthCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
