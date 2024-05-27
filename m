Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D55C25B7C
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2024 13:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mpy9ulR8VRc+5QznLtr+ctcYWelJ5PRnHVgWxa4CkTE=; b=UKlKCuxMhcBDJN
	aYTKmXr8IPPLM86tN8I7UCG6tYx5nK4TMRd7+uHH9qS1VivJSvRweg05if3hgOivQpZG/Rsu+Q83Q
	ZgyybHyulsdey1kdHTpx25qkBaQnfxllgHa6s3ZbzbXUlnwqBQ+6cohKGSX2CXv8nxXlwvE97YZfm
	bLh8cCZL6txyJdiPWlpe+1+m0lp1QruGzGqXXaLiMo5ZBomy0Nyczm6EFzwqQjL3TYbPCTDDVYny7
	jH2PCzo8Z3x696Wula8CGsuyTm7/oFHdjpG+cAix5akpnt+W2l1SgN+wmYXEzuxyviq6dUdiwpzAI
	7IkPP0W5J+frij2EV6dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBaQr-0000000F61Y-3e9E;
	Mon, 27 May 2024 13:30:33 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZJh-0000000Eq9P-24Dp;
	Mon, 27 May 2024 12:19:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2420F1C0003;
	Mon, 27 May 2024 12:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716812343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9HFncU1PhOHKdcu8vvbi3jbm3StjIMaMlXJRXdVMGNw=;
	b=oTrXooR9clakWRqcxff2jUrpg+xOGC2/Wh2pZvkxR2oXNxjWE2TRUI2KnX9Qp/t+IT+YSy
	fMLZGe4NN5Nhi+YARc8b6vknTmcP36AfFysSNfnu7b991hGQFGSBo3qyp7O2bpCCPMzsod
	pCD1JUyBzL3fwovy8Y3C91BprjLGyxtJHhCJjG23Wfv+BxVG4cAla3AqvFdK6JY4ljgTNr
	TIkninxriOji7uPAJHNj1AqcduSwYWcXp1iQV4nT8RqEkQ6TR646EXTYIbOLIkxDwft3ER
	pwI6uQ1Js30Ab0vz0VIOtQ7Ptgnl87gONUKHqnjPILdVREfgob7Tc8BXrBivcg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	oxffffaa@gmail.com,
	kernel@sberdevices.ru
Subject: Re: [PATCH v6 2/3] mtd: rawnand: meson: refactor use of 'meson_nfc_cmd_access()'
Date: Mon, 27 May 2024 14:19:01 +0200
Message-Id: <20240527121901.178655-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240507230903.3399594-3-avkrasnov@salutedevices.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'2234585f5c12f2a633fff715cca32ce0b40cfa29'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_051905_824541_EAF6F3DF 
X-CRM114-Status: UNSURE (   5.08  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2024-05-07 at 23:09:02 UTC, Arseniy Krasnov wrote:
> Move call 'meson_nfc_cmd_seed()' and check for 'NAND_NEED_SCRAMBLING'
> to 'meson_nfc_cmd_access()', thus removing code duplication.
> 
> Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
