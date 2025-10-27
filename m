Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D15DCCF9E5
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Oct 2025 22:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YLUo7xWFtCJYd4VE7syD1xNsUTmSkn+vzuZxJMIVxi0=; b=0WMZATpr3G8EXH
	OML98RK5tYFOd+cwMMIscILuJRF5X4/X3GRHCWoC95NW1p/xaAxpsnMf4Puw/EjzSke752izVMDRm
	V/+LjKSd7JfOIlpZucIZMatCZ1OTDD0F8T/PcdUHBM5RoCH8RmvSeM+Iq2NOMHIjXn/RwoHotMzJ0
	h+eJ0I49hQOWWOQ4KBPhk/es0tabn1RiLCirWe8zGxVPMQb9jww4gx5wx0tEHO+CmYPAv6GBc9gMG
	sPMCkD/l6yz5ObRmwtEYjJOi7zGiCsbpeHYziQiK8L7pgCU+rfpDM09xL6YeRf8CarHKhrkpwAJDr
	2WSSq4coni0JdS7hwR8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVp0-0000000Eso8-0LRN;
	Mon, 27 Oct 2025 22:36:14 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVox-0000000EsmE-1Us9
	for linux-mtd@lists.infradead.org;
	Mon, 27 Oct 2025 22:36:13 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cwSyw2zzcz9srq;
	Mon, 27 Oct 2025 23:36:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761604568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WuUsLiuwoj8ggTq5lXiiF5Pv63rAFaiLnl6w9yXwD6w=;
	b=Mp2gBSbRnGy0ifaAn/i/w/m+OUb52rTU0WcpTnQzhZWQEu2vMN5ZaXLxyF7TB0MWFUvY11
	AKPftDx6jx5PtXn22dBN8HIdrju25ht2waKD1mL42vdQXaGvzvJkV+nwQOd79pA7msMqhQ
	JWz3u+MmGKPZAacgBDsoK5gVAY6TNPshTjLK/A7pBPN0crU4SfuE6tXM9T/F2obXde/QWy
	3q1xCe14aHSMQNppoockyJbIBs3vw3hxfQ+qKNVojuJZ7oPmsEq535hjhlmU+di9r+FhQx
	J3XmBxilXJui7ATKoovPpIVixcRIXtoG3iGZqHuxA1I8T1Zc5SynAeu8QpdHjg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=gePJdz2K;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <4af3080e-14aa-41a2-ac0b-9d1d5a5fd717@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761604566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WuUsLiuwoj8ggTq5lXiiF5Pv63rAFaiLnl6w9yXwD6w=;
	b=gePJdz2KIcowQSrB7fpeuhMfXiQNZYLQ+VRJt+zIj/vSohbLE3Eymbhfpb7jVWCxnPlvGm
	nlY0Rx7Lgj46+/Aqcx5V6SEtQRUr0uski0zfZFoSgZRWDgX/eXJcbgtmMf8tBIUpxsFOCF
	nraWvYm+3n1ZF7Gjpx+YJn3leJtjbBCAGSF5JSz4MCVav27Qpk7j/r/wTXiLvg1GFdqS1F
	ZzfUhq4+urMlCdwqwYYEDTegRUMEJ3sGApsZLM4qz6S4vQR02c8s+qaUjzLtOBz0L0I67w
	+EDXVGLJmMDbXPNrtpXG3uhnBX8kgEalkuxsiaN7JSoJYJeP6w9Spyb8PJHQ9g==
Date: Mon, 27 Oct 2025 23:36:03 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] mtd: spi-nor: spansion: Add SMPT fixup for S25FS-S
To: Takahiro Kuwano <tkuw584924@gmail.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20251022-s25fs-s-smpt-fixup-v1-0-ce26d4084b2d@infineon.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251022-s25fs-s-smpt-fixup-v1-0-ce26d4084b2d@infineon.com>
X-MBO-RS-ID: 7a2283d5367fe856f3f
X-MBO-RS-META: o487npcb1q1ndrkbdoizqs4tmhr98yok
X-Rspamd-Queue-Id: 4cwSyw2zzcz9srq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_153611_545483_CB48F594 
X-CRM114-Status: UNSURE (   7.41  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/22/25 12:07 PM, Takahiro Kuwano wrote:
> Suggest new series as the result of discussion in the thread:
> https://patchwork.ozlabs.org/project/linux-mtd/patch/20240914220859.128540-1-marek.vasut+renesas@mailbox.org/
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
> Takahiro Kuwano (3):
>        mtd: spi-nor: sfdp: introduce smpt_read_dummy fixup hook
>        mtd: spi-nor: sfdp: introduce smpt_map_id fixup hook
>        mtd: spi-nor: spansion: SMPT fixups for S25FS-S
I can provide:

Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org> # S25FS512S

Thank you for your help !

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
