Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED02CC25B75
	for <linux-mtd@archiver.kernel.org>; Thu, 23 May 2024 07:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xoVRPUqkcP72GyOzBSNrgYpVjqUjyEROPt8DsVIFemc=; b=J+OxVIZqXsy6Ge
	sMe2zFOl/25OP4Ov/2MpQJ1lkZtg4RoIA3EcN+GgtJqfNekqh02xyE6iOQXmLkKKW/BlqkfyljLku
	WNekYR0UBpTCizknzVqmJII4Y/9GX970ZuVYiob/y23j5BLwjKXQYnHHBM/CZ0wwAUg170dcg43UR
	BVCuS94txF5HMuOzwrvtbBaC9WzGVJnE29Fjq5HiojJA7GqwcBeDMeVqyJh8ouVMmO4ydZRjjAiEV
	idf8AlYVBAiv7PHFanf5+bpb6RgmVZ3uSsQNFXYJ+237M+scn1GrxNAEcKkTPrENtdr+MZbukB82x
	r8Gk+guPu6+Op4TCIV0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA30Q-00000005Lmm-1mBJ;
	Thu, 23 May 2024 07:36:54 +0000
Received: from mail.haughton.pl ([217.61.0.142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA30M-00000005Lm5-3SrK
	for linux-mtd@lists.infradead.org;
	Thu, 23 May 2024 07:36:53 +0000
Received: by mail.haughton.pl (Postfix, from userid 1002)
	id 8B1CB82AA6; Thu, 23 May 2024 09:36:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=haughton.pl; s=mail;
	t=1716449805; bh=H2qKgXE2kH8cJbbzmMD4Hpjt6I9O7VcxhCsYYCpgFnQ=;
	h=Date:From:To:Subject:From;
	b=HjMhIyQyHjNBEeIAHYZsFgRf71MqSshGXLZRXfKPNYJoCtKvor+MNJcxjOLgXUU4Z
	 xy/mdeEnF5lSYuUv3y8J/daN4sfxc+s7FI/EzkwVAJekD6zxhMaIatHSQQ/SXvHm11
	 rInvUgOfipkvqfyAZcr31X1RDHTgTN6wj4LM22bSI7GgLCt2KswY7jLomuPL1GIlpv
	 RYRFBnYQM8f8VJUfjKGAjKXsj2+bqcnMblk7Pq+TgfgBoF4EPpkc8JjCuKHBLI5Fr7
	 sEYfp0MurAdjEEz09nROIZKwXyRWcwETlnbVl9xTRfqgVW8QQXjeqoVyw0efh1QEAn
	 egHguj/vZySbw==
Received: by mail.haughton.pl for <linux-mtd@lists.infradead.org>; Thu, 23 May 2024 07:35:58 GMT
Message-ID: <20240523084500-0.1.b.2e3.0.fmgp8izjd5@haughton.pl>
Date: Thu, 23 May 2024 07:35:58 GMT
From: =?UTF-8?Q?"Tadeusz_=C5=81ukomski"?= <tadeusz.lukomski@haughton.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.haughton.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_003651_696202_FD701908 
X-CRM114-Status: UNSURE (   0.62  )
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
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbSBzZXJkZWN6bmllClRhZGV1c3ogxYF1a29tc2tpCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
