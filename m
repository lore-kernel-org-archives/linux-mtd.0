Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF3DC02183
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2025 08:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3i0H4vS0ThOJrF1IotJdJbJDGiGW1kAcSFJjGY+WoLA=; b=V2AjNJye2u8AKA
	nky9Goql7yELIaXu/6JmeyTqxcqD8eRXsSDTqiq4BsztxskFZP2elAdjmAfg0hslnQMyWS2FvWgyE
	uwVv17W6vFUzf9qwBxM4ah0njs5nRv2m/rre9pOEsRxs7sRIdbwWiiZF/KnVLSXdkOubVVOQ0mwns
	E3DDQYhabHHmM2y/yvIL/2M6QU4lZ2AACtenIcAM37fv9yAmBqej0lzfEH7vaouVFVVWnEH1BZrXf
	MPcQVZxGrtC9SGocqZklzCOWXK8280BfoJO3W4dV2PcZFI9UGS2dR8LI6m54HRB9bGiPOZadiXSIG
	CjuMhZZs3A3QOEOq9KtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXcYh-00000007s7V-3zcu;
	Tue, 14 Jan 2025 08:45:59 +0000
Received: from mail.completesolutions.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXcYf-00000007s76-1qEO
	for linux-mtd@lists.infradead.org;
	Tue, 14 Jan 2025 08:45:58 +0000
Received: by mail.completesolutions.pl (Postfix, from userid 1002)
	id 9C13424769; Tue, 14 Jan 2025 09:45:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=completesolutions.pl;
	s=mail; t=1736844355;
	bh=dqx6etWJTU7o7oR1uR2aRBCwaPXPl4dirwwzUCFBDcc=;
	h=Date:From:To:Subject:From;
	b=iFSfNskXbmGzWLCm5FnPxn2g7w4Fl2jf33rAUyPbAuyp+XR0ChwvpRF2w3kzRHAYB
	 CIc6ZJ0W+aLmQrb64S5xNW6TKM75eMSz/BsueWZOqQpb1OypBRuD9lF/nM2uA5uvR1
	 xnYuzpS2yzWskxSUuhezgyKDNSs56wRdcVuGHdI3ozaTNruW0VCp5+SHWKDhWo5mLx
	 3w+fSYH0RORYjyDFlfzYHPqrr9wdWBdK4nFaXdLlbqkpWYwdTxdMK+2GSbMM9cIbn4
	 C0ReEsIk1od3FgFE3kS4zzbdLk365GbQvtPGJyaL8NcipOVrgFp6Zs/hwoJTCvG/gv
	 RItrmd5cBpoVA==
Received: by mail.completesolutions.pl for <linux-mtd@lists.infradead.org>; Tue, 14 Jan 2025 08:45:13 GMT
Message-ID: <20250114084500-0.1.fu.26kjz.0.mjn3ro8qzo@completesolutions.pl>
Date: Tue, 14 Jan 2025 08:45:13 GMT
From: "Marcin Gard" <marcin.grad@completesolutions.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.completesolutions.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_004557_612858_8D39EFF2 
X-CRM114-Status: UNSURE (   2.13  )
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
