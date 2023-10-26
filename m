Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8104EC25B67
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Oct 2023 15:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AHei5AIvhjediIqPASrSjICk02aZJ4cntfAO6b6lNfg=; b=hpyGj8W84Di19s
	7/sjML9rrhaPke2Nr0VVhSU/FHLDB4mfMoq1POO1FSSEjaSKmQiMmPxZVSeFdvulTgV8R93zzlRVJ
	Y3wtfehz2KsaXO0r6eGm2SSeVIr1/ZQrExupL7xGiBhNcvc0/Sj7eFHlX1+c7hsdUzzcT5pUDDbZU
	eUYDM+nCHbBnTBrDbWe1baYEaL0h8Q5wrrC63YxrmKfNg+N3Jynb4AQ2Zte0IVPXu5aD3FSSDPH5F
	mD/w0hsjVE1PxjZB428HZGCrGIVZXoX+y0PHB+jrYSecA1fB22SJgkIEcW9FWFPy2mgXzh57eneiB
	bxCigLZCpb29gxw6uq2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw1sY-00ElBR-1c;
	Thu, 26 Oct 2023 15:02:34 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw1sV-00ElB4-2U
	for linux-mtd@lists.infradead.org;
	Thu, 26 Oct 2023 15:02:33 +0000
Received: from [127.0.0.1] (unknown [154.135.84.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id B3A986FB;
	Thu, 26 Oct 2023 17:02:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1698332546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GIq7VKze7/YNlHMTHO1501ppnVinYDbNtzevWz67otA=;
	b=mwnfwqBdp+eT/hf0Iro83+z7Ih6IJQ+4AipPLZq9fCEfdSLFl3IcdCH3GKmN08MRc7tEyH
	D6k1GbUg197kRFHWWFZxbKngq9yCqQ1g+TageTzc2LUHrMN+UUdNZRVoXsKuB8uCf5MWul
	T1prrv7QW1+Bzibu+6xgYJigWV9Sgt3RXVAcNHvb33J8pYFv7i7LtIwaB5zuOPGeNIREIn
	Th1HNvaQ0ZIPChyUBWyveZmgGjvN+vYzi8wfbw0WuUkFSX3WqrdBa7kRHOUM03DNDQkpWR
	iTbvF3Qhr0WcVpzij52oioK3rtNnAPh55T/VLTCkpNBEIsmASMXrVySB98oNww==
Date: Thu, 26 Oct 2023 18:02:20 +0300
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <pratyush@kernel.org>, AceLan Kao <acelan.kao@canonical.com>
CC: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4=5D_mtd=3A_spi-nor=3A_Improve_?= =?US-ASCII?Q?reporting_for_software_reset_failures?=
User-Agent: K-9 Mail for Android
In-Reply-To: <mafs0fs1xmrit.fsf@kernel.org>
References: <20231026012017.518610-1-acelan.kao@canonical.com> <mafs0fs1xmrit.fsf@kernel.org>
Message-ID: <8D87B330-8FA1-46BE-949E-5A8DFB8AACF3@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_080231_962047_9EC97FFB 
X-CRM114-Status: GOOD (  11.61  )
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

Am 26. Oktober 2023 16:39:54 OESZ schrieb Pratyush Yadav <pratyush@kernel.org>:
>On Thu, Oct 26 2023, AceLan Kao wrote:
>
>> From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
>>
>> When the software reset command isn't supported, we now report it
>> as an informational message(dev_info) instead of a warning(dev_warn).
>> This adjustment helps avoid unnecessary alarm and confusion regarding
>> software reset capabilities.
>
>I still think the soft reset command deserves a warn, and not an info.
>Because it _is_ a bad thing if you need to soft reset and are unable to
>do so. Your bootloader (or linux if you rmmod and modprobe again) might
>not be able to detect the flash mode and operate it properly. 

agreed.. but.. 

>I think we should just not unconditionally run this and instead only
>call it when the flash reset is not connected -- that is only call this
>under a check for SNOR_F_BROKEN_RESET, like we do for 4-byte addressing
>mode.

.. keep in mind that this is a restriction of the flash controller. the Intel one seems to be the only affected one (for now) and it's doing a reset (according to mika) on its own. 

snor_broken_reset is a property of the flash. 


>I don't have a strong opposition to this patch but I do think it is
>fixing the problem in the wrong place.

if the flash controller doesn't let you issue a soft reset (or does so on its own), what's the fix?

-michael 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
