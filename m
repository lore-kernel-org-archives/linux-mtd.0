Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52923C5B569
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 06:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Er+DTAwNi80TX3Rkg0bvyInHb5gLXJOvEyCgt3vpqXE=; b=2AzzzFWs7ExeLi
	ar++nHBWotDBkRFbse7pvRGQfeveNhcOOLKH/EwovajBs6nHj2mY1Wh7nT4t5bGUnsK94KGDD2QiO
	PIBC5FdCjCxvY8jaz9e1Y4BFRp6ywdhhzo7WGXkII4gtGD5Dc4CSNC4+mSwLzBY5WvgL4fClfc69k
	68rXKTksuFiy+whS2yO7cbOXL4IT6ppHUquhnLV+GwoNen7l54ysOgnc8EUehNWijuq/ZWUXxiHCT
	YaR3mqxFi9yNT+2LYnajXPNWP9OY0lCoSGek7tDR4DzLP3hHkPKkveJAglU1EUugdALGOCQt9x0nI
	HdMHqW8Ipzwl6ZiFmcXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfYw-0000000DMQO-0Z2X;
	Tue, 11 Aug 2026 06:02:10 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfYt-0000000DMP6-35Fc
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 06:02:09 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-6aca0f482e5so1844712eaf.2
        for <linux-mtd@lists.infradead.org>; Mon, 10 Aug 2026 23:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786428126; x=1787032926; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5VtF2e06tpanp+udcTWrYBDeYnqMz5g5fGAiiALqjG0=;
        b=Xdtmuu2jNODbshtdolaEyj/PNjHkoKuYGcpiLtWkxmnSMWlAR8bEKNJjGAgkxHpZCr
         cPXiaSaaveXCcrNNZV63BenBHlqizQDOfXP7aL0MXxx5oT0pL0XeiDX0+HJhivaJ12l5
         NjtN+iCYiGNK3aD0Zqoz6a68uf333Evpd0bgbYpTPTis/KA6Ctea4PsdZpnb4WhlJWCJ
         aQQKbvtwyRiP4H7V2Qp1r3DdXPYDQFzOb2gUhRE9rVQadHJqP8lrgB94bh65EfuLX/ca
         zBq+eQlbOnzigPj96y6Gp0qzuQZmX51fw52vk6vPg2bfvcrE+CX/TmBTaWpAujqQ9sCA
         5O4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786428126; x=1787032926;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5VtF2e06tpanp+udcTWrYBDeYnqMz5g5fGAiiALqjG0=;
        b=MoYmumrncQsQTDdEL6pRM1Wh+Mg+++flXoKSwGrHrKwQF6XNZE5DEwDvTPamt49q9O
         S7AKvg1j/TODdHpH04pKyUXCV4/94AnTu58eyXuwY7Qm9Jo2UmVTSH7duAUgrUYhSq5o
         pdeOyLhtvcR8qU2fssc5xhQ8aMAA3s2dD7p/Sm4mWG34omLKByatGMm8idMuYaXYOEj3
         5crmi0k/4Vss+vlG7byVQy0Rc1r509ydUldy881eVt8VpnwVnVwi+XaxuPF0othaSi9U
         fe+Qs8kBKyvs6VagkKtyEH/ExCgN8BdwCjOIbCQAayPe/QQTQ1yUuNJu2wCa4hYIsNEm
         JbLQ==
X-Gm-Message-State: AOJu0YzV/ACY+hwyyiSlCcRFKYlKaLN5hSPCKW+KdEl9RWbfD7nkKbKj
	b8vepRjmDUqjQCV0ovGKw62+TO1AZ52jIpTwl3Y9BYm4KyfzKnz2Zm35kvRf4g==
X-Gm-Gg: AR+sD13MZRIGGf513z8m2sxa30UEUVfBPN9QrXzmuIuyywGgONgFI2Pndcqw9ot74dD
	yllo9FA7TcBEgMN26Gb8Rcq0WAhtL6VKlpoHlrxAm8s7r3sMnE8HnkS5/AUceKenw0gDZXJigAr
	FyDNbFGwE74VVv3Czf9IWURbG8mn1GfbZtTHUyfQ7T+nM8GTPlP3XofKYoiAbjU/VWL1CxiS/8g
	7WRYiDiXNWU8CydYVzVvaSxGMan03r8ncZo6/uYfR0u/H8fABKxadE3y9LSXPSyi3vgyuBOq8ZW
	IDbE/cIYP4Www+KT/sQifg4PpNXHFWHCrrH/RhJXuf2+ByRwXgJDykPw109qbPblyj44pEb93U/
	V5N9se+oFMAhoZMkN5ip8NNq3Dvs2K3XtPk/kwHaZwcIC3CnH3wPa9eNNwgLfCcvkIUB1rI2QJc
	oUf6pe0oPDiNI5X9DYYyPDAHh8avv7XBSRn3+uhrgmRTPSACvAxVstUO/tJyfBhRnNFKvQ9Fj3l
	eJdJG1mGbvN5rQC8fRQjfzx9uQv0uVklUtxPutPIJbu3Yj/fE2MhGoHFg0t2a1kMcNtljV15+EV
	YYb3HY2lACRcpenq6Knc5ufwl5UDHeeQRQJZFpbRN4/fYur6CF2x1ohhyxSAln7g0dqLcCJwY8b
	My/0tuY+Ng7FVwVJJ
X-Received: by 2002:a05:6820:f026:b0:6aa:c3f3:fbb0 with SMTP id 006d021491bc7-6b0a31e9e09mr310661eaf.32.1786428126556;
        Mon, 10 Aug 2026 23:02:06 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b09fa1ef9esm676004eaf.0.2026.08.10.23.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 23:02:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/3] mtd: rawnand: sunxi: harden protected OOB handling
Date: Tue, 11 Aug 2026 00:01:58 -0600
Message-Id: <20260811-sunxi-nand-protected-oob-fixes-v1-0-412e50444673@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrDuQ2FaCVyldJGaq42IiGS2Ce
 PdO2+XP430HKFUmhb45oNKblYtY+EsDwxRlJORsDa1rOxe8Q91kZ5QoGZdaVhpWylhKwhfvpOj
 vOd2uXYghEhiyVPoNZjye/9YtzXb7qnCeH/SS012CAAAA
X-Change-ID: 20260810-sunxi-nand-protected-oob-fixes-15db4368a8ae
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_230207_786741_9DBA6ECD 
X-CRM114-Status: UNSURE (   7.85  )
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

The H6/H616 variable protected-OOB implementation has three related
failure cases around its per-step user-data lengths.

First, propagate failures while allocating the per-step length array.
Then reserve an encodable four-byte first section for the bad block
marker and reject layouts which cannot provide it. Finally, replace the
per-write heap allocation used for BBM compensation with the
controller's bounded 32-byte stack buffer.

These fixes keep the calculated, advertised and programmed OOB layouts
consistent and prevent zero-sized sections from reaching the BBM path.

Assisted-by: OpenAI Codex (gpt-5.6-sol, max)
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
James Hilliard (3):
      mtd: rawnand: sunxi: propagate user-data allocation errors
      mtd: rawnand: sunxi: reserve a full user-data word for BBM
      mtd: rawnand: sunxi: use a stack buffer for BBM randomization

 drivers/mtd/nand/raw/sunxi_nand.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)
---
base-commit: 15a3cbce32994141252bb4ecfe3ff3a5d22d0b4f
change-id: 20260810-sunxi-nand-protected-oob-fixes-15db4368a8ae

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
