Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB265C3600C
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Apr 2025 07:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+QFSjMhmlUrgrXIZWS+zxHYzurP31leb0Q7nB21xptU=; b=vpiS6d6LMSllym
	zCNcNP7auMdSPj0K4zrhyeP25klBgStDvU25rWOLI+LW8Vx0TRWMK8xlR2MepAnqbepU/CE/fCYD7
	icJYhNu+KzKb7JskdJ0AzaEgqQozxsflo6j4RiuCmUnQNwAk8+DiQtM1sPIcsHFOSODm5SKtKNxTt
	lBCEVtAdvYj+NQVq0Yq0cKxm0RxeaIafNUR7Pbzs1+tiiRAnfkKp/5DmHGNNiG9VyLY2JqkU7Dfyj
	mGVMvMoMRXlL+RBgceRdPL++EkAcKmfUFGKUCrvO5lwT46MVcXkxxfqMbRzZxRSlo6WwEJHWOtWrk
	3aA+dC9TZ518gxlDdcVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0F7l-000000088QI-28cF;
	Thu, 03 Apr 2025 07:36:29 +0000
Received: from mail.novaplan.pl ([51.195.118.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0F7h-000000088OI-1hTn
	for linux-mtd@lists.infradead.org;
	Thu, 03 Apr 2025 07:36:27 +0000
Received: by mail.novaplan.pl (Postfix, from userid 1002)
	id CB140A35F8; Thu,  3 Apr 2025 09:36:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=novaplan.pl; s=mail;
	t=1743665779; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
	h=Date:From:To:Subject:From;
	b=cT7lQgoI85ecpch+qNgd/RwN8H7tT461z57K+YIV0cTIwTN1xhgGVZv74LfkkA7Pj
	 sr+6UbtVCtkZAnT0PmsiGrc57KTFS5bNubv262BMeBIAeVz61t2etA6b2tj7D28Trh
	 NzztTHilh+AaBojvSa9/4HIuJPMJEJv7ViBNLaKFKKtsqaKn+uxuksQXIK3VNFlvb6
	 Zx4Gs3Qq5GhYhTBXNinW+sC7f0hUfVhWtgjPKCF0bLAf1fn4n2t4fDyJKMm6Ad5vwX
	 gg49SXDv+2/4FamvmTDrDx3KfzvAPS+6vF5BET/hCNe5XmY3TgcBMugOLsaHbjF8Rn
	 ZV3Y2+yn59wtQ==
Received: by mail.novaplan.pl for <linux-mtd@lists.infradead.org>; Thu,  3 Apr 2025 07:36:00 GMT
Message-ID: <20250403084500-0.1.kt.1ln3e.0.lbb8lqm2d2@novaplan.pl>
Date: Thu,  3 Apr 2025 07:36:00 GMT
From: "Adrian Liszka" <adrian.liszka@novaplan.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.novaplan.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_003626_153591_A3164482 
X-CRM114-Status: UNSURE (   0.58  )
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
