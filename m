Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50FFC4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Nov 2023 16:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6H/mX6M78Vs3Yst7efP1i3dqn83vCnbzO2VuIcSVzk=; b=sUVXTPKPfmk1qXsh1p5BA+pemT
	IMUYQmK6rOe7+OOdYALqZZubshZFYVL9LmFKP5BIxj7eKXw039IuDcy/LDxd8qfaeiXWUDUM+/TUz
	Fc+pU5EidPC8U6UR9hrTOI4I6r7/vlOXJ1199xcI0uIFu0Dh3VHhTiIZuYjqW3WCIfL2EDpjZmw9J
	Z7tUK0X7iz7TOKe9YT0LbaNkA/jkSJ14n3pQZjLuEFOHW9jxRR7rFajp1AHDIsfoTPz5IaB/yF5va
	qbyo7cqgbDxRC2462Vr7urnXD8lHOhn3VPUKAzALWQ+WqJfHDo7BTTBpDEq2EdiEe558i01AABoWV
	zSEEPUcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyamo-009uIu-08;
	Thu, 02 Nov 2023 16:43:14 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyamh-009uFr-0o;
	Thu, 02 Nov 2023 16:43:11 +0000
Received: from mail.denx.de (unknown [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id BDDF3875BA;
	Thu,  2 Nov 2023 17:43:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1698943380;
	bh=WlETVdVKgp9rc2BEoIsxfzdMwIQM3PC9/k2FScq+Gvc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LKEupaoNxSVLiiffHsuvU4oCbzdcAa6epS/dZpo6588q5mqc8xLgEu/3MR1o2UvWE
	 laHINsx5KuC+3gjYsdqtJHyTP0ipKS9VlifPDZ8CQY5vSVY2yo2P3Natbmm681SS9s
	 meq9QT0FGefJD8S4fMLbhbdAPisHpd34fq3kAtwpet6XO/u6BaOAAiGc9oYR6jsflQ
	 LpwijOxKBy1Wpps/USdH6wmd59pORvr12kShEPeifE6UJnfTxvoTZRpWrXj/8uX0oK
	 MrU1jf13Z6g+Oz6VeqsHDccrVZMTstjf1ZcuTYVXLA1CezsZMm63vnEPCe5ZZkKBdl
	 fkgjt6QKEClEQ==
MIME-Version: 1.0
Date: Thu, 02 Nov 2023 13:43:00 -0300
From: Fabio Estevam <festevam@denx.de>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: michael@walle.cc, takahiro.kuwano@infineon.com, pratyush@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 bacem.daassi@infineon.com, miquel.raynal@bootlin.com, richard@nod.at
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
In-Reply-To: <e3901646-c918-426f-b219-e1670dc1e854@linaro.org>
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
 <20231101145853.524045-3-tudor.ambarus@linaro.org>
 <7fc95ddf-c860-49b9-93de-ef32b9383e42@linaro.org>
 <216d99d671caa2465519fcc3360c5001@denx.de>
 <e3901646-c918-426f-b219-e1670dc1e854@linaro.org>
Message-ID: <5c48f93a9dd9b2bdc1874dd4eebbf5bb@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_094307_538402_379F0EA3 
X-CRM114-Status: GOOD (  14.35  )
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

Hi Tudor,

On 01/11/2023 14:27, Tudor Ambarus wrote:

> Thanks, Fabio. I can't tell what's happening and it's getting late 
> here.
> Die erase does not execute if either of the status register BP bits are
> set to 1 (some sectors are locked), but that shouldn't be the case I
> guess as you could erase the entire flash before. So maybe dump SR/FSR

Correct, I could erase the entire flash before.

> before and after the chip erase op. Other idea is to dump the 
> spi_mem_op

SR is the same before and after the chip erase operation.

I haven't dumped FSR as I didn't find an easy way to do it from the 
core.

> fields, after spi_nor_spimem_setup_op() is called, maybe I got 
> something
> wrong there, but on a short look it seems fine.
> 
> I'll re-read this tomorrow. Cheers,

Not sure if it helps to give some ideas, but there was an old submission
for die erase support:

http://www.infradead.org/pipermail/linux-mtd/2016-October/069960.html

http://www.infradead.org/pipermail/linux-mtd/2016-October/069961.html

http://www.infradead.org/pipermail/linux-mtd/2016-October/069959.html

Thanks for your help.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
