Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301FEC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Feb 2022 08:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gVE4V6ASbVQSXo2q8lsDMOQHtKS8cQPc0wgyVPfAJWc=; b=H0D8xRmyJ8TenH
	fFPefMl+b+iZYyIDjn3CMDv+3GGeFQNYrkV1SV8g06e5SShYQjjZCdgmLIwtUcGqKyrmPi6/SHGHx
	MLiZHZkMF/Arl4mZRCj+bGjagpoZZB6hsR4hISY+74S64e0WTniDxk5UeGe1Xuj+zu6L00C5sZVjV
	oWxUo6iqq+IHUefnemlCu/n2oxPjsz6ScxXdzab2ajNYPLhtq4A9HEK+8lNG0CTHH/iRHdTNCYyxJ
	CQGaaaKYbDbQQzvP68GiglGJtESLHcimmYeQDSWrDInVFjgca1gTrvnBF6ubsRKNzMxBeDy4ktNGP
	2N+e/DGZ/fD6I9HtIt8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNViD-003rtm-C0; Fri, 25 Feb 2022 08:12:26 +0000
Received: from mail.powerangels.com.pl ([45.86.209.159])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNVQP-003ist-HL
 for linux-mtd@lists.infradead.org; Fri, 25 Feb 2022 07:54:03 +0000
Received: by mail.powerangels.com.pl (Postfix, from userid 1001)
 id 036E68367B; Fri, 25 Feb 2022 02:45:33 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=powerangels.com.pl;
 s=mail; t=1645775150;
 bh=07NAgW1e0WiNB9zqagiM2BnwZfWBCpNa2E4+ccxBPgw=;
 h=Date:From:To:Subject:From;
 b=xKqpwgSH/D3ouDupx4C7+CkcSbQLKpmNWB/PYNk3tKTjyHgnzldtzg+MphPHexoJI
 Dp4c/X5jBVJqa3lFnANKnu3iZXRVho1+uKzDPNfnTQVCjM384QMySZKwt1zw4/k1pm
 x5U2zDK82I7GJhG0dIrv0oCvPN1J69mOF4YrIHYIFeJnTd8g+EqVj9EdOPL1lCDHA+
 4T1j4J6PPep52oyef08VF5ZTVpPzerCISvTMCFg5m21VGCvdJllpyZXelHsHpzuEyQ
 LA/88Htk1e4OZIdi2WuBCLBR3PUTxVRkpXCXJrvBcfKBlHJLQEY17rr2UhPaHGwB8X
 B1XAJDfnmnxMw==
Received: by mail.powerangels.com.pl for <linux-mtd@lists.infradead.org>;
 Fri, 25 Feb 2022 07:45:30 GMT
Message-ID: <20220225024500-0.1.j.20nr.0.rjyj4zn21g@powerangels.com.pl>
Date: Fri, 25 Feb 2022 07:45:30 GMT
From: "Jakub Daroch" <jakub.daroch@powerangels.com.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.powerangels.com.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_235401_633786_9F612688 
X-CRM114-Status: UNSURE (   1.35  )
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

RHppZcWEIGRvYnJ5LAoKZG9zdHJ6ZWdhbSBtb8W8bGl3b8WbxIcgd3Nww7PFgnByYWN5IHogUGHF
hHN0d2EgZmlybcSFLgoKxZp3aWFkY3p5bXkga29tcGxla3Nvd8SFIG9ic8WCdWfEmSBpbndlc3R5
Y2ppIHcgZm90b3dvbHRhaWvEmSwga3TDs3JhIG9ibmnFvGEga29zenR5IGVuZXJnaWkgZWxla3Ry
eWN6bmVqIG5hd2V0IG8gOTAlLgoKQ3p5IHPEhSBQYcWEc3R3byB6YWludGVyZXNvd2FuaSB3ZXJ5
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sCkpha3ViIERhcm9j
aAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
