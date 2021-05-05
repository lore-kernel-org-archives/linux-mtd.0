Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B8DBC433B4
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 07:22:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC6BD61168
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 07:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC6BD61168
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YHzHj74q4df9xBGmVteH5lcwF3ARM6czPiCeT1UDIn4=; b=CbyrssrXFkIwPRQlCb8wHotIY
	9HLVdfeNe2YRyZW3wn/zvsKu+xty/leVGkFX3PHLXhl/qz6Jd4FCIjbVvjBettTeSTgAxgELPAoLt
	DBdSFkW+vUE/+R0HkRUwLfB0pfaqLkMMlW4bO1RT+I8OdRDIEXJYKouhtSGLMu+AsA3EWTzHHKMz9
	4wf+hpXWg4ByeJXe2/Oy12j6K+qy0XDdl1YVL7J2q1vZXh/p3enIRnNwNKYWfvboPxLdakHUE8uVl
	PhnvFRXn59LpNmol2ZojMpwlN5+jJSazaBl1+heaj+E+1KXYp3LQsMpHu391ez8wS8sOeEQxacN3S
	0bT4NFwWg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leBql-000Rln-IW; Wed, 05 May 2021 07:21:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leBqe-000Rks-8q; Wed, 05 May 2021 07:21:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=8/yAuhmraI0tqlt6iAwgkJ+3l0e6yI+x8bwBJnx/s2Q=; b=jHkGMf3BhpSvvWREjkLTSbjwqQ
 7Z4u7kpsVokq9Yq9V5ZLJqDoUdqEkjbuP3udnZbZ81g6CwhvxbeJqE2mC/ktOsjIqZU2iDuLDaY41
 WP5qZdZoin3FfYjRauMSuv98hAHR+yV9Gdh9OE1ibo/XrWeMRadUMHbOj7fo+HdAiwBVyePkSq4Xx
 MJLsu0LbrJxYgzDFuB1BwcL1FNGCkq4FSdIPFtOru/q7dnzLxR2t5PsPQj8H7QkuRZY8SOQ6fsdRM
 saG9wdsD+tM/1HSjU5LaoBhtUuPrS4ftMwdVGbGMBGov5yHJ1ah9nBJyY7jJEfbRvlKignWSqBtEO
 mH0q9bYA==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leBqa-004WhY-Q3; Wed, 05 May 2021 07:21:30 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1457Fit7014805; Wed, 5 May 2021 09:21:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=8/yAuhmraI0tqlt6iAwgkJ+3l0e6yI+x8bwBJnx/s2Q=;
 b=k+vCqSIoxOP8tNQSEvYXY0LpqoCBvF1AlYEeNYBPgjZt5bVejv1yfUUF7pMikiFHcEns
 PuyOVqZmuqEnRRFk1Wk6YwNW1dkRabc9DWrwN8JKzxK3sHBoXMEnmCbos4mnP2tveH7g
 sBgjpqhZYswcn0iKcZMjkWekUwGwBn12t+yzxye/8GCIakEXQlFEtUEUxT9V1Pnj9xSJ
 rUtHBWni74fr1C5MkvggwCyUEdf4LS4ovUw0GuTbq3AsluwZVrq6wUi6QuSPnh1WEUnK
 AXWSZodN7Z9EZhBD4MyCPsnvckywQYDTX0RNBpGHk4yLMLGk75Kh91NZ0hOEg5J/nY4E og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38be9ajddu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 09:21:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2EA3110002A;
 Wed,  5 May 2021 09:21:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0F50020F46C;
 Wed,  5 May 2021 09:21:17 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 5 May
 2021 09:21:16 +0200
Subject: Re: [PATCH 1/3] spi: spi-mem: add automatic poll status functions
To: Mark Brown <broonie@kernel.org>
CC: Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <christophe.kerello@foss.st.com>
References: <20210426143934.25275-1-patrice.chotard@foss.st.com>
 <20210426143934.25275-2-patrice.chotard@foss.st.com>
 <20210426162610.erpt5ubeddx7paeq@ti.com>
 <20210426165118.GH4590@sirena.org.uk>
 <28acedfd-6cd5-a8ad-0182-e61c3c30c27d@foss.st.com>
 <20210430155623.GD5981@sirena.org.uk>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <f472d75d-7549-191b-1b42-4e3921280c49@foss.st.com>
Date: Wed, 5 May 2021 09:21:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210430155623.GD5981@sirena.org.uk>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-05_02:2021-05-05,
 2021-05-05 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_002129_348368_13251C5C 
X-CRM114-Status: GOOD (  25.25  )
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

Hi Mark

On 4/30/21 5:56 PM, Mark Brown wrote:
> On Fri, Apr 30, 2021 at 04:22:34PM +0200, Patrice CHOTARD wrote:
>> On 4/26/21 6:51 PM, Mark Brown wrote:
>>> On Mon, Apr 26, 2021 at 09:56:12PM +0530, Pratyush Yadav wrote:
> 
>>> Is it possible there's some situation where you're waiting for some bits
>>> to clear as well?
> 
>> Yes, we are waiting STATUS_BUSY bit to be cleared, see patch 2 which is making 
>> usage of this API.
> 
> Then the inverse question applies - is there no circumstance where we
> might be waiting for a bit to be set?
> 
>>> We already have the core handling other timeouts.  We don't pass around
>>> completions but rather have an API function that the driver has to call
>>> when the operation completes, a similar pattern might work here.  Part
> 
>> So, if i correctly understood, you make allusion to what is already done
>> in SPI core framework with spi_finalize_current_transfer() right ?
> 
> Yes, and _current_message().
> 
>>> of the thing with those APIs which I'm missing here is that this will
>>> just return -EOPNOTSUPP if the driver can't do the delay in hardware, I
>>> think it would be cleaner if this API were similar and the core dealt
>>> with doing the delay/poll on the CPU.  That way the users don't need to
>>> repeat the handling for the offload/non-offload cases.
> 
>> Sorry, i didn't catch what you mean here. In PATCH 2, that's the case,
>> if spi_mem_poll_status() is not supported, the core is dealing with 
>> the delay/poll on the CPU in spinand_wait().
> 
> That's in the NAND core, not in spi-mem.  Any other users of spi-mem
> will also need to open code stuff.
> 

Ok, got it, i will transfer what is done in spi_nand_wait() into spi_mem_poll_status() 
in order to get the full feature in spi-mem which will profit to all spi-mem users as requested.

Thanks
Patrice

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
