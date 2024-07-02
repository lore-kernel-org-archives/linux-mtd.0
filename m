Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F624C30658
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jul 2024 08:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R02jQnjFns5eXt4fvXIE6NAa8Q/OqQ3lbO4B5/8/ZOU=; b=DwMO/N7jzls3gk
	/1DBaPCxZRkSnMolmqaflDZVImGcVlS504Gi1xno2giJzwEWQA9ZdX+M+AMrF1CUT71pZGkJj6xCr
	Z+zrKBWQ0Mxis5OJSu6VZEZiMhH69zCUaE5bx7eCK0LHupaf9+113kdJDhF8HVt6uAYky3KrqsNCj
	NE2Tug2Zfxu59uljbJGuUpCDrmQbq4qRPjjx4cunF/FWqjpRPstfrBjEF1UfnseQY7kNEad3sCGQX
	ONZywzfwQcFwBvDzJSbTLoQlJGiPVe8NymJW8IN9+sPfvcjXaGnQPPP0UMtHqRXWsS8K/kB5e2xhQ
	bZsRD4pcazX5RdRDGUsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOZKL-000000063cb-139r;
	Tue, 02 Jul 2024 08:57:29 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOZK8-000000063YB-2s9T
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jul 2024 08:57:19 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so46104291fa.3
        for <linux-mtd@lists.infradead.org>; Tue, 02 Jul 2024 01:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719910634; x=1720515434; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQNWMHSAHhi1B2REf6bXB44AOtjzCQUTtwwc1XnHiu4=;
        b=e2ZZIWip6IUmTOvMHadZ4/0+iihNCXiUPLbai3saHNRw0lQYCWtTyGnxaMKHeFkAmZ
         UZWH55r2/d7/54i8NWOuQbm6TL8TtfNAN9t/+95JuIaeRtdCO3u0Q7MbYiP34Tv3yxs1
         s5E3E9biHURfDFIe3e1nsS92PTPB566usZriiPqXk93kv0DKTWbBxvsbBkjTm5TjZ9Qv
         wn6e6smXK+BS3g24gIpMKhtQZ+FeMVrPqp2gFEz6m3d6Z37XG1JlqG58/806OxCXrMPA
         3jYE3P5LJ3EX/yu/AjsxoRM6Sm20KuKQetfIzsVwfupGmzQNheOFoxHTc5dAES5IyX2/
         XF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719910634; x=1720515434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQNWMHSAHhi1B2REf6bXB44AOtjzCQUTtwwc1XnHiu4=;
        b=ozAaioPmG+k9lY4wOJM3KBYeXYpzvwdBIyYngXINo5ZdfEhL2SS32AD73nCM6WrRse
         +7AWlvzzuWS2YRh9PsSoTi1NbxemHG3gDWzd0ngkdFhgcgWBoIm8AuOIAHEnZ+gaePTY
         9RyR8LECtJVHsNxAg91fAQMj5LVCmoV8X5PVD+/kMLGzmE/0tSF3rgRWqcKYEgidNLMg
         9APFj4VHh+fm2def8K8IVFoWOPCQyjZaU8yaRQBLI6qNQ1lphXuUyMQfj/iudFVSSliL
         3YC56nlc0wpa8jMqbrVstR6mKDpWcyyBN/MtnOhCY4jzG11Evh1rfdhvXaRIBQBlhdN3
         6CcA==
X-Forwarded-Encrypted: i=1; AJvYcCVZmKUjm24LTP8HlKnegtdAlIHxtyaEODlNdoqeDgd/+PeZqwXmEoFrYHAU5U3i2yXYso+lPMfdCZ7OzToxFCwIOyAhFTy7UzXc7CnCXw==
X-Gm-Message-State: AOJu0Yzfkeusu7mUnm6sMAdPiU62Eawu5dSjAiNE/OS1icVsJXDRFqEG
	eF9HQYTvPgly5Tn4vgnqtFXLn7lxYO4XfshkNWxUOpv6NgzW71duLrTCeidah+7sWaH+wiNWdwW
	WOLv5ZlqxfuHB7Y4SUA9noWyRo4XRPWgYEKqJcQ==
X-Google-Smtp-Source: AGHT+IHo5eEIsVu44pGpnRevjVwA1ZpOtmw6Mmmn4Q+VHOJCxnzpE8v3YnPOHaBgvtoU17z7s4obBrZVrOf9sLuZILM=
X-Received: by 2002:a2e:bc06:0:b0:2ec:1dfc:45bf with SMTP id
 38308e7fff4ca-2ee5e6ba584mr55892571fa.42.1719910633934; Tue, 02 Jul 2024
 01:57:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-9-3fd5f4a193cc@pengutronix.de>
In-Reply-To: <20240701-b4-v6-10-topic-usbc-tcpci-v1-9-3fd5f4a193cc@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Jul 2024 10:57:02 +0200
Message-ID: <CAMRc=McP=K0jSD56JdCR9DPJmJN39Z74mjAo0qX2mEnTBN1GAA@mail.gmail.com>
Subject: Re: [PATCH 9/9] eeprom: at24: remove deprecated Kconfig symbol
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_015717_080905_E40F87E0 
X-CRM114-Status: UNSURE (   8.87  )
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

T24gTW9uLCBKdWwgMSwgMjAyNCBhdCAzOjU04oCvUE0gTWFyY28gRmVsc2NoIDxtLmZlbHNjaEBw
ZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4KPiBBbGwga2VybmVsIHVzZXJzIGFyZSBzaGlmdGVkIHRv
IHRoZSBuZXcgTVREX0VFUFJPTV9BVDI0IEtjb25maWcgc3ltYm9sCj4gc28gd2UgY2FuIGRyb3Ag
dGhlIG9sZCBvbmUuCj4KCk5vcGUsIHdpdGggdGhpcyBzZXJpZXMgYXJtNjQgc3RpbGwgc2VsZWN0
cyB0aGUgb2xkIHN5bWJvbC4KCkJhcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
