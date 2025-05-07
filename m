Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5C0C3ABC0
	for <linux-mtd@archiver.kernel.org>; Wed,  7 May 2025 09:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+QFSjMhmlUrgrXIZWS+zxHYzurP31leb0Q7nB21xptU=; b=SrPaX+R9vijJLj
	qUzvzPngblWXl2YMlkxqUvXCivnYIgbQsU3C9FPWmKLLlfjWzTqvEJ3mYWZGbvvYD17VKnuWp/V9u
	oJaWZTtS9MUVfLNIQrdu7YI6KiIv4Y7aK57T6/aSBsNmemgj4Rxs4Al50ak/SBV/x9TXAS4gniizW
	mkAjpeF1Z49aKlDUyo65d29zSoVC9IU0Ro1daIvz89nJkx16XMmMXS54LcJXXEabAOjNYWqMDMdti
	s7UQz+pk8rnAK/WRZ4fHyUuwLJgTEpvBrFifYasZAHjccMPyN0rHQe8cgXH827jmm/TrMkJJPvjBZ
	koPZ2+fH1Ngr6dOA3Dlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCahy-0000000EqjK-2dhw;
	Wed, 07 May 2025 09:04:54 +0000
Received: from mail.novaplan.pl ([51.195.118.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCZqs-0000000Efmx-3ZpY
	for linux-mtd@lists.infradead.org;
	Wed, 07 May 2025 08:10:05 +0000
Received: by mail.novaplan.pl (Postfix, from userid 1002)
	id EE3D0A41FF; Wed,  7 May 2025 10:05:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=novaplan.pl; s=mail;
	t=1746605169; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
	h=Date:From:To:Subject:From;
	b=HDiYa5eTquJv6cVkxF+x5Hxr+zhdNoCYHCOvG/dXgVduj9gTTwNZsQ/+zWPsAYWje
	 zzPIms59gfapiXHq9M4X++44ZbKpbLRNrq0Q3UAz/Gm34rDfnsMfnhUYYgCvsX5pOL
	 9IAdpK7+N7NZSHn5+7b7US3LdV2Nod+KgkC+Z01WSfmJECK7uCw7SdCAe/4TJVAW37
	 1Oqkd6X2qqODWxXmDb+cf+jxIj57Yo3s2fQSyBqsT4TrKApLVsu+i5FvhmKp/GPKah
	 L2LwR/vje5YB1/Tlwl6tjF4Ok8SE4Em/QzaOGVq47CJ0v+rHfNAV8wL5Zh92qcxEuS
	 SLo7wCJWCDtow==
Received: by mail.novaplan.pl for <linux-mtd@lists.infradead.org>; Wed,  7 May 2025 08:05:57 GMT
Message-ID: <20250507084500-0.1.le.1usb3.0.ym8q4iqxgk@novaplan.pl>
Date: Wed,  7 May 2025 08:05:57 GMT
From: "Adrian Liszka" <adrian.liszka@novaplan.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.novaplan.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_011003_574739_FAB6E4F7 
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
