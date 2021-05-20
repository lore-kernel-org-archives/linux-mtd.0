Return-Path: <SRS0=TxUZ=KP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45CC8C433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 19:50:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04B5D611AD
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 19:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04B5D611AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNi6WJsswIqB4cayyUepcjdXhKqW5Ht5DBwSD7SmmD4=; b=RyomATMS36GZe8IMD8q8yI2owD
	brg1CTOeI/q5vo8JyRdVhZEzFcobWlwm7nglNxWV/MaB285o6DHmLDn7PL/evSXShMTNrWx4XQclA
	7YnSuVPbg+U4Ou8PwaDvWRrF4nJbwqwP8+93c1DCXs1+lUFhSXXUhtQr8OFpXVBirKrOohSGP908D
	5ai9SFO/Yo3wFW4l61+BXZdhDx8wlWSr/pYNtS1bSEfC1WnGV/XqDFeqtUv8vWcAgW3yiCDSNCi/k
	204kctUInJL17PLpO0fj4kmVzFAHf49xeSREX31KiJfNF+qWv2wJKYdQycpgS21dIqyWTKJObhb7J
	UCNmhuUw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljofn-002YZj-2I; Thu, 20 May 2021 19:49:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljofc-002YYM-Ex
 for linux-mtd@desiato.infradead.org; Thu, 20 May 2021 19:49:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=xyoIeN35KyACIUB9MIasxTVjdgU2oSu4rX9sr8VLho4=; b=Hbxd8k1T5y3SnNLsUrGzgPjO+R
 WP2MobJDNp4AeJ8Igqh5h3YiNk6IsGtiVBoXis3pU7hrQLeSgUln+1HLgfcq1WV1Ctu62gwu4sNSr
 8BhlghGoFqVlEW70iQWB9HaahvLcfaTjKA+ozjEWaI4OU77VKQEvf7OxqlDd+LuoegdTWcP0zZdAU
 v8V5EMgEjN84gInOvZ0ZxBcICcY1imzjBVMNg9F6F/GuhWLI+WZKS1v5GntjxLkxSBpjKeWRFJ1VB
 JwPEBNLQSXE0/zz7DaTcQqV7b7o3h5pDE60LPcp0/oGGtPsCkvmJjmRiqM/fh9fIEd6tyu418AHjN
 UHjjRHGg==;
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljofZ-00Gd7D-OZ
 for linux-mtd@lists.infradead.org; Thu, 20 May 2021 19:49:23 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 250C62224F;
 Thu, 20 May 2021 21:49:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1621540160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xyoIeN35KyACIUB9MIasxTVjdgU2oSu4rX9sr8VLho4=;
 b=t9Krgx+fyQolZ5LOweq2ffcExdJpwo9CJOn7OK5FUjbFwZPJUGSvKBxAf+R2IJtkvAI9gS
 J23PfaTuI05k5BwVdMt8qnMSJQb+eltWoAq5B19Lz5jdttmWHnmclfACeXpTyn4ZkTVfOk
 pUCXaOQjonH4T2zCuWMOOV5ol8HqiIU=
MIME-Version: 1.0
Date: Thu, 20 May 2021 21:49:20 +0200
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: Add documentation for spi_nor_soft_reset()
In-Reply-To: <20210511093958.17258-1-p.yadav@ti.com>
References: <20210511093958.17258-1-p.yadav@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <a158404bfbe5835075d66112fc1db3cd@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_124921_981786_D642B0B4 
X-CRM114-Status: GOOD (  10.04  )
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

Am 2021-05-11 11:39, schrieb Pratyush Yadav:
> Document what the function does and that it should only be used when it
> is known that the device supports it. This will avoid unaware
> programmers thinking that they can arbitrarily use it to reset the
> device.
> 
> Suggested-by: Michael Walle <michael@walle.cc>
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
