Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBE1C77B7C
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Jun 2025 08:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y2kDzPoK4WIplBBHmVBr0U0rgBf7ofjFkCC/GqXbB7A=; b=zrsOlRY2WtAxex
	WaTAtVn9+UVdspvHbcXN3ej726uWdwJMtjVeulKCtKFQLcKqVpijY0lAWKiiMo0cUDtKCLUKPzku3
	wTUxQxHUjNQYclr83FWVQ/FLvJNfhfKunk+Xu5BJsrxxC/Kux/u+QnOaKo7CjS+6Km39KarAQTfis
	PS9WyBN8B8ei0eJyqZ54oC8sC09sUKkdq4F8TPTek/e7Y7WNC75SrZuxnXxGhWti35cW771ZUeao4
	YgzVfx8a4zpk+D6iyO3CDJ/vpGG86gy7dhS/0k6dRiB0AUmNdR7wIlkOOuF4hYx49dQIS2lkjlpIE
	lSBa54Z/8f3GuHiePQSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULhg-00000007zmx-0FWT;
	Wed, 25 Jun 2025 08:42:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKua-00000007s15-3hGk
	for linux-mtd@bombadil.infradead.org;
	Wed, 25 Jun 2025 07:51:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=vUvp0ttX3lOxjdOrvZsKvJKNpHHNusfF6naBdS8j1E8=; b=kXKZForjMdPmQ4PtSsVJPymwu6
	8MiYk7Srqa2A+PYHY/So14l8I5IcArks9h6ufo+XK1B1WRrvzKNGBRMqeKxLicEMXGNhSRwifiFzU
	LnhBOg7dFWaEnJ5f3XRx2MUzgq/JdmPnX6BEPkwQ81jXevpPLFFgJRPF/hU/cLZF90VJnSdu5kjN6
	p7XsMbWMvCRS4cewJcJo6mCskFywegdoTGIVZxHIsfvjpJHZxlUnNR7FOBaiBFSVYNoPk9DF9aeGb
	10l+Ng1HnBGYQ7UZ4m8a0fs/NloKbid5UdhGALzVzCMpKUM9EnMZ1H8V0gSlLybUKRLFWJHFSUdKK
	JkxdNIaA==;
Received: from mail.fundixo.pl ([57.128.173.14])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKuX-00000005f6g-0CFm
	for linux-mtd@lists.infradead.org;
	Wed, 25 Jun 2025 07:51:15 +0000
Received: by mail.fundixo.pl (Postfix, from userid 1002)
	id CF2E3495BE; Wed, 25 Jun 2025 09:51:08 +0200 (CEST)
Received: by mail.fundixo.pl for <linux-mtd@lists.infradead.org>; Wed, 25 Jun 2025 07:50:59 GMT
Message-ID: <20250625084500-0.1.g2.39rbj.0.048d2qouym@CyberCitadel.pl>
Date: Wed, 25 Jun 2025 07:50:59 GMT
From: "Marek Kucharski" <marek.kucharski@fundixo.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.CyberCitadel.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_085113_203759_5C533B89 
X-CRM114-Status: UNSURE (   1.36  )
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
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpNYXJlayBLdWNoYXJza2kKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
