Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225DFC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Feb 2022 14:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WD5bf7cId8bgb2UDncRThbrTSW7TbRpN1ivHUXBWJFc=; b=clawsf0SOJY7vl
	dJzOoFoeZ1RSNR9ov4CVRRkRxbN1EIeqdSOoqdoE34vGHTalmdJEt3Npc3DZVmriR85wwiAHN4Z/s
	hKxFaLUCzaxS/l1i+hj96SBMJ+K59jGiLSRc/u6WUDhrbBwQCf4O45KoJICdd3nK0/lyxWqhFcE1I
	t6iUzZw0rS4bAtqQllI5OTddefu/ChHmRhaXU5cZslf4RSyYy1Vd7EEoINuyLpum0dQIFFBX/ibCK
	0EAElSjaqMj+a+1P3nzJKLZOrCI4H5FOajxW/aFQjw1+YmH2xwGurEgFqekmpcYoqXfUfhLIItH+k
	HYpOV2o0XgfR6Ahu1hlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL4L3-00EnL9-IL; Fri, 18 Feb 2022 14:34:25 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL4Jp-00Emqy-I0
 for linux-mtd@lists.infradead.org; Fri, 18 Feb 2022 14:33:11 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9DFCA10000D;
 Fri, 18 Feb 2022 14:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645194788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P8wreGlX9R9giHg9TtUZfMq1UzO5U2luCRSST3Eos5A=;
 b=PGeF6w9lBkT1hVEhEqQt/p7nOYy2rD2ee18sQ0smT3QRM0pbn3dBzpxRzQMp3L/QTwpKNS
 /m7RrOnm2IiqPOzBpG7O2a0bnQVRCI8+v94LwjRgZhr0g4dsyPAy6aJfZ9GlQAAnh/PanX
 wdlsX26q/F2+DNz5DQz2Dy8QbldHzxpf4v0Le6pYC+egD5qwRaiSmnD5iKHI/GmRYLcumG
 QkNq53+GA+Nc4QjD3tGSY6sdAeUGMo0CxTSVPZEnC1flmx0/zDwkQLNV1bs0Y1SjxaebtR
 3trvHTIkc70ZyPM2hbeNTXVVK7+Rer4X/2TrmpAeR9WqNmkBwbSZSFubUfKzIQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org, p.yadav@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 chenshumin86@sina.com, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-binding: mtd: nand: Document the wp-gpios
 property
Date: Fri, 18 Feb 2022 15:33:06 +0100
Message-Id: <20220218143306.322284-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220217144755.270679-2-christophe.kerello@foss.st.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'cb57fae479be41d1233f5a49d4760de9a5692b6e'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_063309_775126_29987B6D 
X-CRM114-Status: UNSURE (   4.93  )
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

On Thu, 2022-02-17 at 14:47:52 UTC, Christophe Kerello wrote:
> A few drivers use this property to describe the GPIO pin used to protect
> the NAND during program/erase operations.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
