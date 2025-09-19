Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7C2CAC5A5
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Sep 2025 07:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Edl2sGE30f23q6UHI0ytko6N79JdQSFCnnSVmP3JuoY=; b=UNk4fDMG4s/PYZ
	YaHu5c9PIKkNsgs0g3aAbiB3hSHJKXBjmscGxO9j1LKqiM3FIUtI8zztwj+7IbQNM9QvbuD3Wcwi7
	oJVWoKzGHMivbwERzxSLrAzKPOHCryD2wHTXpWUCQq35FlXbX2trnvVgs4rIkIT18F8HKbcGbT520
	vN5vR5jXzRGucPDzTeEUd9R/jndOoKVA3rhNuD5X9jHx3jIOQiZh0TtTL1Y4tIalklI1IV35ni2bW
	C+PfvJEBYQ+F0Q08NclB2hdLKAbQ83+Lc2iYfz/PBrr+qpb0GHRTALs7odKXcuIA7H9si/F078OfA
	BxojEZDi52jU8gPi3KFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVus-000000029Cm-0lAN;
	Fri, 19 Sep 2025 07:52:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVuo-000000029Aw-3PYW
	for linux-mtd@bombadil.infradead.org;
	Fri, 19 Sep 2025 07:52:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ENtF9dMmAFLBKN2RSrXhoJle/KDo1PSoRLO/+5jvepw=; b=LAi4MOiFdxuKAF4lQFjtiOcBII
	ZuL57YEQ/FDsfCb6k0NMjvRP4m5VRisrUxNQ9zLhkxKXmxnpRVJvMMj/EeLbzqHKeHK2d2aXuv2My
	1keT83gxC4vvjoQmbfyXUD9LFBJ3aPKo84aEZPIuZ25NvkEMdR/7hnrtWYUaRw23EyftC//WGlIkq
	1qKvLQO5VO582MamTWsTZbyRIMuLpw5A8BPWOR7M6Gw9xUHIQlLOlj0wimwnkcMYUtxfbZvo3/FY+
	5CX05ojAcgd4NlUF0mVS73IjR1CUOSPpclQHhwKlFuEn+6LbeO7JMPxZEoNuiPmb+3AeUlEAjRWCa
	FXJzanNA==;
Received: from mout.gmx.net ([212.227.15.19])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVul-00000007mN6-3qEy
	for linux-mtd@lists.infradead.org;
	Fri, 19 Sep 2025 07:52:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1758268323; x=1758873123;
	i=markus.stockhausen@gmx.de;
	bh=ENtF9dMmAFLBKN2RSrXhoJle/KDo1PSoRLO/+5jvepw=;
	h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bjKyB+LnPl/qRG2z4kxzaeJwYsvOFj2LrwH7KYgESHWzk/A/6eZPOg6//qe25iis
	 a7fmrCsQOMWW6RmXCqiw6o6azVLA9oDa91PJkGWc8kSM8ORIOaHHZM3573QmuuZj+
	 M2cKb4avdVGsTmD7OjQ17aojU5qN/3Xe/dbxUbiWvm3dULhWgFiFWhQsUjV82WZQq
	 bonDVK7jPCM75tC4FsMSxRPH0HUkmwQAOYNm+UM8+0+RIeeM5ntbgjdlooAndbLDU
	 riDmyCHytvH1SVsgMh/yu+KbiclfeWIXn8jCLZKrlM+GmcMtyM7LATy4ob/Gt7EmE
	 vJPrh7vQ+PGy6YOJFg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from openwrt ([94.31.70.55]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N17Ye-1uG61I3eck-0173HK; Fri, 19
 Sep 2025 09:52:02 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 0/2] Realtek ECC engine
Date: Fri, 19 Sep 2025 03:51:59 -0400
Message-ID: <20250919075201.4177901-1-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:lPbvLnyDlI3WNlSogoou85Wl+w1RMY3Q3d+38hxH13axA1Pk2Qp
 1Riq0WO1gSlzx+cdNxN43WPbmsFVf3JnI5CKaq+NGeMhFtNr6H9rMCddBagvQdZ+LxdfaQn
 11dYiBGI/Z2S8KxC1D6yKWzRMevv9nVCKTU+ukMdp9hEC6x1RisPqwAivnp+gh+vlD9pfy+
 aZTcXHdvcmcxTuvLG9LGg==
UI-OutboundReport: notjunk:1;M01:P0:5Eogg93pJuQ=;HG4lCjbwMQFr3n6ELtdCSw5qLz2 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 ohp26RUOuhEOAeD5VAWqaF6K4TBIvFWkKgi4K
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_085220_147556_35A7462E 
X-CRM114-Status: UNSURE (   4.34  )
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

This series adds support for the ECC engine on Realtek RTL93xx switch SoCs.



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
