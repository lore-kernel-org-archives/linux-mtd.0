Return-Path: <SRS0=TepB=IE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE464C433E0
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Mar 2021 00:21:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A6FF64E86
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Mar 2021 00:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A6FF64E86
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=btzMoH40JIrntN7oXvzxGUCirQ+xaSv2DmAGKMQry9g=; b=OlUcWnBm8bs40sm3OggzxXTT9
	3wYi/l5TS1Bsp0v87JnoUnP3sJ+SDQ8GhLap2/hQSt3wXZNsWPDHDqh3IjRGnr3Qe912w96SLeNAf
	pBse5VNLfLEx12URq09Zrb0xZ8Fa29/zgxBUY/zahLeXXiKgV+4QQIOjgunUp3P1kPa7DT2/jrxIG
	X0kSGg1Id++3P4RTr6JA1gfa+6ZcWJp2kmoPRHtqgVshdx9raU0GujF4YRCJv5Q9bFurKTRFVCYxC
	fUH83NZAEdjj8FSNutO9QbjWdgQ2WZe2j7P3s2WPpeaA6TfPrQOsOfINfvMkp3RL5DgjIuQ7XALYv
	HIJO2ftlA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIKg5-00HPG7-OG; Sat, 06 Mar 2021 00:20:17 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIKfx-00HPBQ-Au
 for linux-mtd@lists.infradead.org; Sat, 06 Mar 2021 00:20:13 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 05BDD22205;
 Sat,  6 Mar 2021 01:20:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1614990008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JW5vAf4n5pb2TjxCx8IeaoO6+tLJpPR88IxfEtpUY24=;
 b=gWaahd3QMzy5xCX+tyd7B+XCI4WN/jVVbRnTjCFmB2aKzIt+wlVJjFRtkZJdWWWmjTnE2o
 aOVVYjo7k0FNveBj/gWaOH3S+vXFIyuJ4Eu/rRL6Go9wlLDHPw/125IZD0GjGfjTRgYZPh
 vHqeMWYCxK+r6zO887gCmUl6Qe64Xuk=
MIME-Version: 1.0
Date: Sat, 06 Mar 2021 01:20:06 +0100
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v4 4/4] mtd: spi-nor: implement OTP erase for Winbond and
 similar flashes
In-Reply-To: <20210306000535.9890-5-michael@walle.cc>
References: <20210306000535.9890-1-michael@walle.cc>
 <20210306000535.9890-5-michael@walle.cc>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <874f75d980a42abe8df19a9952f5aa5d@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210306_002009_725969_C985FD86 
X-CRM114-Status: UNSURE (   7.92  )
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

Am 2021-03-06 01:05, schrieb Michael Walle:
> Winbond flashes with OTP support provide a command to erase the OTP
> data. This might come in handy during development.
> 
> This was tested with a Winbond W25Q32JW on a LS1028A SoC with the
> NXP FSPI controller.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

This should have had [RFC PATCH] in the subject. That got missing.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
