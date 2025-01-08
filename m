Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC83E77188
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2025 08:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xoVRPUqkcP72GyOzBSNrgYpVjqUjyEROPt8DsVIFemc=; b=a69O9e53LBZRbv
	tJOWxE1aZ4hG1nDPHg/O1aNqp3WAZoLly2a49N54uCCytsRE/0zXn9jT+moPUUVYxRl3hWQt16zbj
	Oxpc9dGvyQvNu6KFK9uWQ3/NuAp+G2DcCBs8cTAbrCygymYhsoPLVVx1BgF8gGI5QDcrfD7cUIAV8
	6qiyqdKZeJbi5YcS9FT9dczgQO55bdZrUZBP2sml4+g1Yjb4kyzcUBoBdaeRAdj3E9Gl1b/uNtjoS
	s1OLjXslqDV9aLHHHXafwIia9E8v7AqfZ9E+zOTDm7MD5ZJtRKRSUKcfOqkpGz+c9RhYjq8S8nSOA
	ay21dEIkak+s0ZG23+UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRck-00000007baB-2l95;
	Wed, 08 Jan 2025 08:41:10 +0000
Received: from mail.quantumquest.pl ([217.182.69.186])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRcf-00000007bZi-3pI3
	for linux-mtd@lists.infradead.org;
	Wed, 08 Jan 2025 08:41:08 +0000
Received: by mail.QuantumQuest.pl (Postfix, from userid 1002)
	id 849CA470DD; Wed,  8 Jan 2025 09:40:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=QuantumQuest.pl;
	s=mail; t=1736325661;
	bh=H2qKgXE2kH8cJbbzmMD4Hpjt6I9O7VcxhCsYYCpgFnQ=;
	h=Date:From:To:Subject:From;
	b=oRYnvfQQyBIcEpm0V54lvzqMcQ4MfUWCM9HoFa/B8WwkdJt7SkvntEmScW4+BNMsc
	 Xy5eFxQrd7/BQipsn81sTVi2MLnOypUZG/do1k1c0SeDYkMKSjUOCt4n+jWb66kOLY
	 d6wZMJnacyNikqMtqVIHWo8h/3aPaGyUSR2LukiBrw5LIttNqV35gAG6rqlCTDrOrl
	 qnPatDogbtRdKvYWlJI6OBROIPP/BeeX/b4IIWk5BVvaESqgBMDQ/CNT6w8fFgsOEC
	 qLIELnvpHZvDNNTT/096lWWeuBb9sWOSQGvk6j5tWcZX44UKLWRnWIidCNRoRO2sw7
	 dDBthrJwsrpCA==
Received: by mail.QuantumQuest.pl for <linux-mtd@lists.infradead.org>; Wed,  8 Jan 2025 08:40:39 GMT
Message-ID: <20250108084500-0.1.dj.23skm.0.p58rdbtllv@QuantumQuest.pl>
Date: Wed,  8 Jan 2025 08:40:39 GMT
From: =?UTF-8?Q?"Tadeusz_=C5=81ukomski"?= <tadeusz.lukomski@quantumquest.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.QuantumQuest.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_004106_628686_D949597F 
X-CRM114-Status: UNSURE (   2.00  )
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
