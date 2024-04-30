Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D413C4345F
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Apr 2024 08:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3i0H4vS0ThOJrF1IotJdJbJDGiGW1kAcSFJjGY+WoLA=; b=EDqJ64y3jGCa0F
	tOnM/SBM/c1GW3wnIak/tndfFUykNzevXg9ZFPVkpuLu7z1ejWj2/Mw/qk0tbBReMilxxkpvoPmlE
	gpMH9m4tU3cQYExpAPb7FkHwzfJh/KEEvdzQ06g74UshIUILmY0Q49IdnC+kRtCM2h1g5EUZsPRcS
	P5SgKj+YSIfkEng9BsPy1CPmsdZKZ3gbnEGan3HK8PkETqeB+o5bt3jaEiPusWCWJ9B8X6Lm51BvS
	X4cg4XcGbB5ZHGIRg/K99HV8FPq3b97M/G14Ed3aw+q3pguVXtCXZtqkrs1pu6DWFYX14YNyMTN7f
	d6H/qetqv4Ve8it0Yk9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1idu-00000005ZMP-3uNx;
	Tue, 30 Apr 2024 08:15:14 +0000
Received: from mail.explorepulse.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1idq-00000005ZKj-1a9n
	for linux-mtd@lists.infradead.org;
	Tue, 30 Apr 2024 08:15:11 +0000
Received: by mail.explorepulse.pl (Postfix, from userid 1002)
	id C592B24863; Tue, 30 Apr 2024 10:15:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=explorepulse.pl;
	s=mail; t=1714464908;
	bh=dqx6etWJTU7o7oR1uR2aRBCwaPXPl4dirwwzUCFBDcc=;
	h=Date:From:To:Subject:From;
	b=Bp/Oqk8fsGsg/08Vq+5mow6dtGoY7nPSpIUBW5CpyjIUzr8dbfKIShFSS8vrmRjcD
	 m2WbXcGt8PIhlALpG4YyHOw50CDYillMnnQjWALf6UCd7TscbnewlZV48lU60kv1pK
	 J24UPgieJ3haG4Py8lEJBslH771y7bo4kvcZF10fFpl2XExbeTidYo7MJGQAy79qdx
	 J6XtieB0LWAKmMkG27ywJYUP63Mvyxi8xQCKyhcDTCwFfhbp/yfMPS53/XdkdaDOjz
	 lxuaoUFI+BQ9E8HhEnK7c+2sVaxPTFV3OR4+Iqve2oOKG1WESzLm0y//YAJujuISpr
	 wPpcycdiT+qEg==
Received: by mail.explorepulse.pl for <linux-mtd@lists.infradead.org>; Tue, 30 Apr 2024 08:15:05 GMT
Message-ID: <20240430084500-0.1.ax.nnvv.0.2pbysga3rl@explorepulse.pl>
Date: Tue, 30 Apr 2024 08:15:05 GMT
From: "Marcin Gard" <marcin.grad@explorepulse.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.explorepulse.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_011510_574774_AC9619C5 
X-CRM114-Status: UNSURE (   1.02  )
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
