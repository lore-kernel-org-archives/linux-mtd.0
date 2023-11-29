Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1F9C4167B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Nov 2023 08:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZfA4B/3EVaZx66UNWW/Y2D2BtLx+M59aqYm868lqeI=; b=KnC7NLzL1/5/vEGSoBo4A9Ab8d
	Hg09oo2uCeo2lseoLal5OWXJiEhZIzfZ1lk0NAOD45+tDgXqEc22i5UZdAIECOyBQFXNHNfgizFtd
	Nio4LdCD/FVcRimGHINVI+s44n1J92AE2SuPz2BsmMHJ0XcHD6TjofBHJyPlRaAPN2fZZn6kXMw+O
	41HeyCmcxeFbdvakkD7gBUpxaUhElwmQ9JTBpV3bVq3hEWRuhqSALRdLbWI6MVtwf7C3DMRh+6pMq
	SjDFKI9kppyIlPfSoNEVzV8eZw25418mVjrUzRhnO9gZ+ERCQsNIBit7Vos12SPryLR4fZGlzakR5
	mng1YBbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Fw3-007T0t-0D;
	Wed, 29 Nov 2023 08:28:43 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Fvz-007Syo-1f
	for linux-mtd@lists.infradead.org;
	Wed, 29 Nov 2023 08:28:41 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 929098F6;
	Wed, 29 Nov 2023 09:28:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1701246511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wMoiMytgcumkKFLAJMoH9xk3ngRLwqpyXtXaQaRIiJo=;
	b=P3LJ36UgS3LTJz586QgMxNz+q8Zz5Jpc8V5Of21zhc66kfZa5NxxMfdJ4nip+EmgEISHRm
	DhaYhLa/U1u/oodhbGxToYg3iySiW9OGaoG1X/w40DD/3JXupBPJNsKpC8ggAp26ZzHPDC
	73FlP8zIjaYPkBgyybzBvUMUjc7hUSGgG7VduDW6RSvYok6ewKiTFX44NUxBeelxFdbk/F
	G/e4Aji9+6gx/bDN+l/36LDWDHnds2WBc07PIhBa4vX3el/fa/OGzrUmlrkljpjNrHztPF
	gxrxrAOp3XG6jV0AyrdkE+PwPVuSeA3aE/esK7cpRhQTUfsJeiWNzr+R+MuxXg==
MIME-Version: 1.0
Date: Wed, 29 Nov 2023 09:28:31 +0100
From: Michael Walle <michael@walle.cc>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mika
 Westerberg <mika.westerberg@linux.intel.com>, Dhruva Gole <d-gole@ti.com>,
 linux-mtd@lists.infradead.org, Mark Brown <broonie@kernel.org>, Kamal Dasu
 <kamal.dasu@broadcom.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?=
 <j.neuschaefer@gmx.net>, Mario Kicherer <dev@kicherer.org>, Chuanhong Guo
 <gch981213@gmail.com>, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] spi: Unify error codes by replacing -ENOTSUPP with
 -EOPNOTSUPP
In-Reply-To: <20231129064311.272422-1-acelan.kao@canonical.com>
References: <20231129064311.272422-1-acelan.kao@canonical.com>
Message-ID: <60dec3dd502baab260da06fe01453c5d@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_002839_739911_59D685A2 
X-CRM114-Status: GOOD (  19.60  )
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

> From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
> 
> This commit updates the SPI subsystem, particularly affecting "SPI MEM"
> drivers and core parts, by replacing the -ENOTSUPP error code with
> -EOPNOTSUPP.
> 
> The key motivations for this change are as follows:
> 1. The spi-nor driver currently uses EOPNOTSUPP, whereas calls to 
> spi-mem
> might return ENOTSUPP. This update aims to unify the error reporting
> within the SPI subsystem for clarity and consistency.
> 
> 2. The use of ENOTSUPP has been flagged by checkpatch as inappropriate,
> mainly being reserved for NFS-related errors. To align with kernel 
> coding
> standards and recommendations, this change is being made.
> 
> 3. By using EOPNOTSUPP, we provide more specific context to the error,
> indicating that a particular operation is not supported. This helps
> differentiate from the more generic ENOTSUPP error, allowing drivers to
> better handle and respond to different error scenarios.
> 
> Risks and Considerations:
> While this change is primarily intended as a code cleanup and error 
> code
> unification, there is a minor risk of breaking user-space applications
> that rely on specific return codes for unsupported operations. However,
> this risk is considered low, as such use-cases are unlikely to be 
> common
> or critical. Nevertheless, developers and users should be aware of this
> change, especially if they have scripts or tools that specifically 
> handle
> SPI error codes.
> 
> This commit does not introduce any functional changes to the SPI 
> subsystem
> or the affected drivers.
> 
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>

Acked-by: Michael Walle <michael@walle.cc>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
