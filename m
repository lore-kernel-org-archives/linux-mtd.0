Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4692C02185
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2025 12:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DoWKgmxvKtHrXQssXiJjV+Zv01gTKGrouCJ6rRGDMpg=; b=yF8xJStQjBnXYJ
	sMWCkcvDhVu43aEDZm+U8GFEvnIJseQCEdn0csv7Cl3Y3swAgTZG2BlfxWc7UTuQ4qSIOQ2tQKEZx
	6rRXQNMnhUAQqtYwIvXi32fMt5UcIy6sCC7EE44jPOwkcSZTvdOcBI9aaBZ81a9VXzVLzuPX6jlji
	JLb0EJ5ZMvgJo1m19k2zroGafQL5ci4wJl2J6FQ/Jz/OX9rseP1WBXRycMSo9UKgSDIMcHjVnqI6i
	f0K7df7Qry9zjvboCbCAYvE9PBWjKXQwcL9JmzSHc60k418nsFzdTm6iCdAoyzJOR31ANXthw79uZ
	3uMRXIH/g5aCjJWCqaFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZrIc-00000005aCH-3QL6;
	Mon, 20 Jan 2025 12:54:38 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZrIK-00000005a7W-2JW6
	for linux-mtd@lists.infradead.org;
	Mon, 20 Jan 2025 12:54:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 453CF24000D;
	Mon, 20 Jan 2025 12:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737377658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=niS8yhjGEG7kTaHhimkQuAQuleYT6pZ/DZpG8RfuVdU=;
	b=jt6q+SaCOTvrT+n2U+bULG2DgFvhhLJUSnbw6D/ah24y3TJ40gyafJRRX/P7MvyubzNnxC
	/8c8cGz6C5xuuv7fL89VAry/h6FP0t2D8kUrjULsOOfu+iW16JThT1njQJE4ohW5tWXNv8
	AneSNuHJGUsFi9tdDw0iVzBwKMDdo0rLdNgPh32gmFCd5IKqkeR/49O57WqagYiMiO2a/S
	Mtwoebd1PeQ4j3Cf8GcBVMttOXhMVKWSYa8if3k9RIuc0qyhqO8iyGxihh7rRO7a0ykD56
	nwkusuGupXRw9RkKG2Oq0k3q1Ysf5DNxWldKC7apL6Sgrbtdu2BshIxPI8FZIg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-media@vger.kernel.org
Subject: Re: [PATCH v11 2/2] mtd: rawnand: Add Loongson-1 NAND Controller
 Driver
In-Reply-To: <CAJhJPsU1eFJ_R1-emENs8T5rrKXUKjvk-cQx9RT2ztTvmOTZug@mail.gmail.com>
	(Keguang Zhang's message of "Mon, 20 Jan 2025 19:08:55 +0800")
References: <20241217-loongson1-nand-v11-0-b692c58988bb@gmail.com>
	<20241217-loongson1-nand-v11-2-b692c58988bb@gmail.com>
	<87v7ufnc0w.fsf@bootlin.com>
	<CAJhJPsWe+maw+zK6uiwvObTd_Ew73yjH=KddkgxwY7Zp0Y7ZYw@mail.gmail.com>
	<87plkli9fj.fsf@bootlin.com>
	<CAJhJPsVhH=8dKmUgmTSHnG8H1_9G3zvovX9hDv_VM6fSUR5oQw@mail.gmail.com>
	<874j1tykgz.fsf@bootlin.com>
	<CAJhJPsU1eFJ_R1-emENs8T5rrKXUKjvk-cQx9RT2ztTvmOTZug@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 20 Jan 2025 13:54:17 +0100
Message-ID: <8734hdsl1i.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_045420_731058_3FA50475 
X-CRM114-Status: UNSURE (   9.25  )
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


>> IIUC, yes and no. It is the remapped address of the physical address you
>> want to reach, not the physical address itself. The type is dma_addr_t
>> and not phys_addr_t and you can get a dma address out of a physical
>> address with a call to dma_map_resource(). The numerical value might be
>> the same if there is no IO-MMU involved, but the good practice is to
>> remap anyway.
>
> Got it. I will keep dma_map_resource() as it is, which is called in
> ls1x_nand_probe().
>
> +       res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand-dma");
> +       host->dma_base = dma_map_resource(dev, res->start, resource_size(res),
> +                                         DMA_BIDIRECTIONAL, 0);
> +       if (dma_mapping_error(dev, host->dma_base))
> +               return -ENXIO;

Looks correct.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
