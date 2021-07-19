Return-Path: <SRS0=DZ8H=ML=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BDD9C12002
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jul 2021 03:46:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFE376101D
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jul 2021 03:46:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFE376101D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date
	:Message-ID:From:References:Cc:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+dHryl6B+mduNPMvdATfmD4kkUZgTsQsZDBeENHRRFk=; b=Dt4T0ebUTAR7ar
	AMmZT1FkoRNMN4DOnar1mfvWynR5c6vVO00sZNb7082H+242Ei3GMtO4iS/qDL00xCm1w7OGm5n6i
	79NqTQHwhf5VuEdrA/9ukaX9vCIAwx8cFUcxxVPj6XNP2Dzqr/zXfb269iOrNtFjaRJm+3jE2+qfN
	JBFY9eUZJSqMI/FXCmMkbAxXEcqwwlZPEMcBvfmMnXcUqODMslveixyG1oIIm+bKAtCoKQOHIi9ZI
	VtwfV15IlsV7bPadR4/AYn42iYxN2lf8F2r2CCPVZSMQ3zfiFW0ZP1Z/uMbcxPOH7aGDm/X078nxD
	Exb9f58yXA0c/K8GD70Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5KDp-008NEp-7r; Mon, 19 Jul 2021 03:45:37 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5KDk-008NCw-72
 for linux-mtd@lists.infradead.org; Mon, 19 Jul 2021 03:45:33 +0000
Received: from [192.168.1.107] (fibhost-66-234-106.fibernet.hu [85.66.234.106])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: hs@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1F7278033E;
 Mon, 19 Jul 2021 05:45:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1626666329;
 bh=ajhJrL/O5jCDrfjMHFqj2/38Xg58vxi40OeuMTyIfZk=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=TFYRpjE1p4t17tlIXF8AMWwwbjVIhh9YcFRahD5rbmFWA89dT6SGL8n7B4JY0EAM4
 7dvfXA6kMv5ZC3hNCQru0HTYdqQyYTuIAtrlrOsj7da79zOxkHXuX2Cy+A3bjx59t3
 G7R2wdhagN6jUhD+YnVo+UBAI4Ck80VG0zDDYAIIjdyN44oD4ZfvQtndujB429UfeB
 TYtyPlSLmgJqH1/ZJYwczYzApNFudjtXWM1lM9ZrhHx55itwiS+AgJfh05LWgWkPSH
 lvVjtpn4/mxZoPruFEEBig2965TWva+56F0mSoS+cCwiSq9qAVsEIQjCUpG/8P/UoN
 o4UAqvcs6TePg==
Subject: Re: [PATCH] mtd: devices: mchp48l640: Fix memory leak on cmd
To: Colin King <colin.king@canonical.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210712145214.101377-1-colin.king@canonical.com>
From: Heiko Schocher <hs@denx.de>
Message-ID: <807e8798-e64f-0026-90c3-eda8825b6828@denx.de>
Date: Mon, 19 Jul 2021 05:45:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210712145214.101377-1-colin.king@canonical.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210718_204532_455059_6C50B7F6 
X-CRM114-Status: GOOD (  14.96  )
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
Reply-To: hs@denx.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Colin,

On 12.07.21 16:52, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The allocation for cmd is not being kfree'd on the return leading to
> a memory leak. Fix this by kfree'ing it.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: 88d125026753 ("mtd: devices: add support for microchip 48l640 EERAM")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/mtd/devices/mchp48l640.c | 1 +
>  1 file changed, 1 insertion(+)

Good catch, thanks!

Reviewed-by: Heiko Schocher <hs@denx.de>

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
