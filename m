Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F3FF8E499
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2026 04:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g8yZzp7Osz7tDI7ejgurd/w03T/ivd0sgJ9XsfbF0bU=; b=Tx42pnGeClwDab
	QDV5QYrzpytWGWYABY7Js6I2gq97aRcF3Mk9tUizRuG8IfhcnAPUeDNj9juSbzRsPeLCn1Fq4ItMV
	Ovwgg2KVa0ZvUH9UHBB5L2o+WoBj/uHrwj4G7TnMDNQYPyRRpr70bYPDbk9+vC6Bk2xbEVhKOBxjW
	Xfdss6cmTNTSxGzg7SWPQ1aNt/4VNBN1SuiQ7kiuyOwJaxS9kehQX5cd7iLgJbSJ0FnaV37PdaQkt
	7yvDnBVfDFPITlVfsuTmd668FDyIYrI9pOgeFJVcq93/Nprc4GTcnv/OHq7E2yTnsnCYC+Pdssi0E
	eZADGAgNVrGsAWR/Or0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDaWv-00000003PDm-2oMw;
	Fri, 17 Apr 2026 04:10:09 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDaWs-00000003PDR-42Df
	for linux-mtd@lists.infradead.org;
	Fri, 17 Apr 2026 04:10:08 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-35d99bae2ebso266784a91.3
        for <linux-mtd@lists.infradead.org>; Thu, 16 Apr 2026 21:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776399006; x=1777003806; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3neF+xX4HmJjMyAHJ11aaE9r5K9yxJu0FmjSK/keGQk=;
        b=VKJM/sBquPiNwRqdJEG04rrvLreUQ/MGAZbvzQ76YETfmkFiyUKHtVPPv/X9y4J8w6
         xrMPKauOIV2TwAGpgPrHOiWFY1+YqDerx76PNTkGf8hCJYTr/Bxrcyi+CQvoohdWt5xx
         972Z+2oIci6tCAwVQXdlhTT8+Ngox/jGuz+GfwpHPSQcsCXXszRM8MuQSOUO5+JtHkjN
         nu4CYhIDMZ6SzJtZBkNjKjMzbGZoI3mKlkDLmyo68I/sc9SGIOexoWoe40y96//VYjmt
         JJWl03UipIadv4R3DdmWvZZq91QhXO3w37cAj20kvoJtH7ahiftUXctR0A9yzRkvUvz8
         vBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776399006; x=1777003806;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3neF+xX4HmJjMyAHJ11aaE9r5K9yxJu0FmjSK/keGQk=;
        b=I59w8OTPeBfBEbJNw3IQp7td7jeq/9ZMSRDgwSUejRVT22NxSem0OHUkyErot3D/pe
         2MxETW1Ac/HM9c7h3iK4TXTreZAxXzpfuY0RF+r7zg5/ZkFVM3m8SnGq1jKKhUOUr/Qu
         Q6PeycwMkKVpslyFABdfb91MJRjv/R/9Yq2WZ79DzFCpE9hCFHYJoELwLX+2OK1YHRSe
         g9esPXsCWoWx+n8vFHKbhl4U+NJYd3pyw9K+LM+jT8NEYa9nzxLFkQgKtt/FLLE5Genq
         8M0mhA/hQpA5u36jLCrGX42k3TqKVxdHZ1ioyHPIXq8L5xEpriYgUBa+jAxsmweTckuI
         fF+Q==
X-Gm-Message-State: AOJu0YwyZrjqYe5+083hSXKXCY9EFGf1JAIqtOrg2y2qasOZ6HcGPGS9
	WO/WgVu/7+n8bELG/FITF9dGX+RO4CcvJGHZjpjlkt9cSLJxw+GSNNVf
X-Gm-Gg: AeBDieuLHGWWBhow6FBqEauWtypzKJ0saZ8f7YkgppAwUoxzYMFKhlQvNTYuEbEX9AL
	DlVlo0AAVtAm2z4PwWcxIj+A77MhJPV5fWSZDFhM4LuzWmnnOiVpI7aHckaVjUseNy/NH+/vGql
	86sD8xLbcPSp3qrE7FTNCAHsMJTk1fo8ReDMwcn+QjzJZZ84Xa5XalSGvqezDyxIOjKLI9sBjPB
	Izx7jflBHkv0JWwLf2tccH9VsfEji39rCn46Yn2BDLgkuYGrWSL2p21OITnPUrxq+ADMU52aKRd
	Xdc3z7oU4Z1qkQzIR4Y4dYGLop32YadtK1ZW/RXRaHS4MReMrQi9XsWEz73r2XtH6g8Hoklxt3s
	9Sf3jXK6D9ES9d5sZxMeyLsmPVaW7xdJ8XJDROqieoe2ZMALGpKMKuxWG6h3VpL7FWhvrU74Gih
	upO3CNOmCaDHOlce4P4QnDqLC/XjErxIR+NkxpTGJ1XXlA1/Nxa8Cs0hzvZP6uawQwsRtvI875D
	SQPsjsfbLuZo2Xq/veSYAmWHMmzQQ==
X-Received: by 2002:a17:902:b493:b0:2b0:c451:ae8a with SMTP id d9443c01a7336-2b5f9eaf437mr7564415ad.13.1776399005971;
        Thu, 16 Apr 2026 21:10:05 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab288aesm4505305ad.65.2026.04.16.21.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 21:10:05 -0700 (PDT)
From: Takahiro Kuwano <tkuw584924@gmail.com>
X-Google-Original-From: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Subject: [PATCH 0/2] mtd: spi-nor: spansion: fix die erase support
Date: Fri, 17 Apr 2026 13:09:35 +0900
Message-Id: <20260417-die-erase-fix-v1-0-4f93ca586c2e@infineon.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAICy4WkC/x2MQQqAIBAAvyJ7bkFNEvtKdLBcay8WChGIf086z
 sBMhUKZqcAsKmR6uPCVOqhBwH76dBBy6Axa6kkaZTEwIWVfCCO/aJzXo928C9FAb+5MXf+/ZW3
 tA4V2iz1fAAAA
X-Change-ID: 20260417-die-erase-fix-49a237ba9df4
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, stable@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776399001; l=501;
 i=takahiro.kuwano@infineon.com; s=20250227; h=from:subject:message-id;
 bh=IHlYF4bUVVlO8oNgskEZAXqn/27DnAwIfuXP1FAN1aU=;
 b=DL73fMSAOKt/pA5tDhHYKUkEi+eR2DGuE4EgogQ+oY3rFb1x62CPxZsSmpqJF81oy/faG6zws
 YbxK99sPyPBCm9XTitJMUCPKLqhZW/+pd81expv2IguXbd1Tgv9KIpU
X-Developer-Key: i=takahiro.kuwano@infineon.com; a=ed25519;
 pk=aS8V9WLuMUkl0vmgD0xJU19ZajdJmuyFBnBfVj0dfDs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_211007_009511_D608147A 
X-CRM114-Status: UNSURE (   6.39  )
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

Signed-off-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
---
Takahiro Kuwano (2):
      mtd: spi-nor: spansion: use die erase for multi-die devices only
      mtd: spi-nor: spansion: add die erase support in s28hx-t

 drivers/mtd/spi-nor/spansion.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
---
base-commit: a33dad83043ebcf18d0556ccc105b1620010f93d
change-id: 20260417-die-erase-fix-49a237ba9df4

Best regards,
--  
Takahiro Kuwano <takahiro.kuwano@infineon.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
