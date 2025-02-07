Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C44C02196
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 08:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xoVRPUqkcP72GyOzBSNrgYpVjqUjyEROPt8DsVIFemc=; b=OWN0LJ4PUwKw48
	Mv+RAAiuaH97wr9OZyMx2+H9qbCB9CYu2RMY32eBB3oRECUrQA+Lrh9VlSYmsf0qdjtsBnQ0gU01+
	VWMaJ47B3tGOhy3YVDMwSh3Do6ojfCnjJGXz0enC5XeuXL5hrxgU+MxboUHJIAhatLEBCNnCzOuZ+
	X2N9Phx8oIHIAJy7RZ0KZM9Ts3paiJQ7N+pF9izgTV4ggXFC0pwp1P2wqot20vD7eh6jBwMrPaczL
	G7WeeATQxO7URGgM1eK8NvFpwhCBJM7Wu5UF9t1Rs4xf4UTb0lPyWvLhqif4nmGRXdt4MEA0fDVXc
	fUEAdzP6JsSYCuvLbUhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgK8d-00000008th2-3OuL;
	Fri, 07 Feb 2025 08:55:03 +0000
Received: from mail.quantumquest.pl ([217.182.69.186])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgK11-00000008sGs-1Xk2
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 08:47:13 +0000
Received: by mail.QuantumQuest.pl (Postfix, from userid 1002)
	id 344D24B139; Fri,  7 Feb 2025 09:45:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=QuantumQuest.pl;
	s=mail; t=1738917965;
	bh=H2qKgXE2kH8cJbbzmMD4Hpjt6I9O7VcxhCsYYCpgFnQ=;
	h=Date:From:To:Subject:From;
	b=IzqSb6jf3vwgYopsoz4NEUibLF3EqKd69+09abjf+rS9X0yxkGUD5BG4Ywjjne7Lk
	 Nwrpht6jJ4j2wS12EUgJugOJGIZhs2vlH1aqmh8SOlE0g2IWVqvQzSZQH/wgNVKyxw
	 Kj7oLtugTyeFGVJ5bXE2XBrPR7SaiPgs1ovg1WymIm0CGxzuBgPbbUFRLJbX3VRs3N
	 QW32GFa0qaBo1jtIp9oCTEqHnySII6HOx+zrh92UMm4AAYDJI92FF8I7wF3H1Sjv49
	 jF5kSYjUKz0mM93A7RKtAx6F6XB+LCWbAB1UPULiba64R4aSMj00NHuz+j00voFf1l
	 laRPEczn2XcYg==
Received: by mail.QuantumQuest.pl for <linux-mtd@lists.infradead.org>; Fri,  7 Feb 2025 08:45:48 GMT
Message-ID: <20250207084500-0.1.e5.2ai46.0.mu4ja8el3l@QuantumQuest.pl>
Date: Fri,  7 Feb 2025 08:45:48 GMT
From: =?UTF-8?Q?"Tadeusz_=C5=81ukomski"?= <tadeusz.lukomski@quantumquest.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.QuantumQuest.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_004712_082173_7435C0CA 
X-CRM114-Status: UNSURE (   0.99  )
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
