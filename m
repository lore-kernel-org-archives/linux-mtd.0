Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F122CAC5BB
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Oct 2025 07:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+QFSjMhmlUrgrXIZWS+zxHYzurP31leb0Q7nB21xptU=; b=v7mHSt+aM1QEq3
	/afmSe2B06x7jWDypxU9xGOenp/sINYDxI/qrpFBkDdcXk7rcBv+pzoGvv3dR8QCCb5j60BZIU4mi
	WAtNC6Pgn+RE25IYzhr7n3ssuCBuryxBSxcA8bn8xPl4eYm6qR+QU+xsp5esKF4DWzy7CUOEnUdmo
	In1BJeGUsE8rH2NkC2tDewSe+4xYsQaAHI9UsVMhZF+xcetUyE9LoQVPJL/Z81mQ3nM+Rb44nXPqi
	bjBEnC6vth/14NSh6okfGO61om81xbIjY5r/CwMwm1bXJv8DIuas5ansQ0lGzYne3ItlP/xVomd6j
	HnmCa4P2u1iWY7VYlpoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6P32-00000003OsI-3vUz;
	Wed, 08 Oct 2025 07:57:20 +0000
Received: from mail.proventix.pl ([51.195.118.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6P30-00000003Ori-2npf
	for linux-mtd@lists.infradead.org;
	Wed, 08 Oct 2025 07:57:19 +0000
Received: by mail.proventix.pl (Postfix, from userid 1002)
	id A15D8A39DC; Wed,  8 Oct 2025 09:56:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=proventix.pl; s=mail;
	t=1759910236; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
	h=Date:From:To:Subject:From;
	b=JFla2iTaMmdwDR1MeQAb4Ui3ruoJRvsgG5prkcbCmW+KVCH2QURiz8v1Wz/IKCo+v
	 ni9tmHIdVG/s9r5BEQqtHCDwA57llV0Zmf2TDH7ggJXJw7Hin7XP2Qe6LggDD+T6WW
	 oPwLgzJ3363k/xXPH1d86Wlfmolm29ours1cnJC4+/+m9ege37U/Hm2DCAj27joHh3
	 w0yE8SlkeVkL/BpWfSmeexAoARj9VYG8M6Rm2Z23XLMjMhddSIrYgsLJjHEXvkUC6A
	 wxszW1dDFiWDg+c+nW63gc9ZT9/hSMNt/xumcypBSkdb4xzvoyO6dcnaIs8D5NPsk0
	 XnrElC5HToTcg==
Received: by mail.proventix.pl for <linux-mtd@lists.infradead.org>; Wed,  8 Oct 2025 07:55:32 GMT
Message-ID: <20251008084500-0.1.od.3elt8.0.q9q5de8qoj@proventix.pl>
Date: Wed,  8 Oct 2025 07:55:32 GMT
From: "Adrian Liszka" <adrian.liszka@proventix.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.proventix.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_005718_868632_688165B0 
X-CRM114-Status: UNSURE (   0.92  )
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
