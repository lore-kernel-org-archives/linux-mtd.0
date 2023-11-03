Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9D3C4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Nov 2023 14:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8z30OPxLtCXTLYTLIfVy70aE9KI2/TVBu5gbxPXm/lw=; b=N/AnyuaYuPqgJ2yV7dCr9iSZYc
	ZP71OCDk2LXm/5q4wbi3LNDKkdLwafNWuVq35A/L8ZY97CCmyAj+Wr9Z9KSKuWLW9zGT2OjB46nsS
	QQ2jaQN80KykZ2EoOoKHGL7uf0nGuPNj1F+/HZaZH47QzdipwfeIMSMXRyuV8tDCae7dV+cj/ZRyp
	OXHYxPqBs8iHztGtOs4q+6NmGhWV2P/PDqlnl6JwGu7vOdsgeJHBP1JAgxmd1l4M3J09ZCRT+Oipt
	ThR9eMw6g1iB3//pm32cMkCl7ZkqgyttV/8bFtZbsVDze2q+9EzdH0A+f2b6HBuAWOPlu4HAu7YSR
	hNTK7hLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyvct-00Bdah-2X;
	Fri, 03 Nov 2023 14:58:23 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyvcn-00BdZt-1j;
	Fri, 03 Nov 2023 14:58:21 +0000
Received: from mail.denx.de (unknown [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 4A22F86F45;
	Fri,  3 Nov 2023 15:58:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1699023495;
	bh=pJmhJgPK5Nk+TaCiNcD+yEfdWRQgR9Xhfihk5gK3GNM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=k0eohIm3clNZAWsxGyD99Jm6bKb6uvBXd1VeZF1iM8FiwI40satQ9Sy0fyH0XhMkr
	 urK7Q4BpYqEkMg3oAes6pk/7xOuZOHx0i0ufY+VhH2TXepZkcXhhA77QtArC3eUGam
	 RKbs8dg8M9e43vJx7jD1UN2uLTJGE/9ngW96lXmpZy6CXl5+q6NhW76pdYiTJD25e7
	 hqMqO/nkB6r4Hh3q1FoOXat34CyPh2M/Jn3Tt8Mo6fxsqHgnOuX+mjlW0uCSwF76bi
	 Q8dbWnrHkARzOf8nS7NYCWyXyAOWoN0/3e483xzY4Fwv31qe2C0jp57nJc5PJ1t7IW
	 HzPXtcMCNGhRQ==
MIME-Version: 1.0
Date: Fri, 03 Nov 2023 11:58:15 -0300
From: Fabio Estevam <festevam@denx.de>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, michael@walle.cc,
 pratyush@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, bacem.daassi@infineon.com,
 miquel.raynal@bootlin.com, richard@nod.at
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
In-Reply-To: <5b3b8de5-b2fc-4c8f-a2d7-662748ce9213@linaro.org>
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
 <5c48f93a9dd9b2bdc1874dd4eebbf5bb@denx.de>
 <a7bee4f0-8591-411a-a105-0284df22c464@linaro.org>
 <632457ed6b022856496537bdf8a738ba@denx.de>
 <aa123456-7ec9-4bdc-a521-66c9582d5d45@linaro.org>
 <c26f6623-2d58-43ed-95bb-957870890a02@linaro.org>
 <6f1aa670-b3f7-4ea3-bc80-773a57e46c36@linaro.org>
 <968ba4c249926e986b02440ad0421e98@denx.de>
 <f2141a88-13d4-47b8-8382-5df8cc1bc42b@linaro.org>
 <cf0e4284f2e3193ddd57b715196ca202@denx.de>
 <25ca1a4c-683c-4b6d-938b-07323b211815@linaro.org>
 <c3f2b8a6-8b23-4a33-948e-62ff64db9a2f@linaro.org>
 <5872f7233bc0dc4669aa1324f3ae3cf0@denx.de>
 <95c16eb0-a785-4a8d-bb42-c5a09b034d0a@linaro.org>
 <e665266fc1565f9d346c95215df39f12@denx.de>
 <085ba0f9780b1f8b34bc9e1037fec5e7@denx.de>
 <b5c1d4d7-1583-4469-a604-dcf5bb3f96a4@linaro.org>
 <9004acceea77d2f06aaff0ca5f916cd7@denx.de>
 <a3ccb98e-b8bd-4ea3-98c4-df429602a7ef@linaro.org>
 <c533a2af60f27d21c9c703b6cb34ff77@denx.de>
 <5b3b8de5-b2fc-4c8f-a2d7-662748ce9213@linaro.org>
Message-ID: <f00d72ca1480a9ac6479bbbd149021bd@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_075817_823743_46D9480B 
X-CRM114-Status: GOOD (  11.36  )
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

On 03/11/2023 11:37, Tudor Ambarus wrote:

> I confirm I see the same behavior on n25q00 flash.
> Erased 134217728 bytes from address 0x00000000 in flash
> 
> real	3m49.082s
> user	0m0.000s
> sys	3m48.485s
> 
> I'll continue to investigate this at a best effort rate, expect for 
> some
> delays, I'm handling SPI NOR mostly in my spare time. Happy to guide 
> you
> though. You may join #mtd irc channel for short questions, see where it
> is in the MAINTAINERS file.

Thanks, Tudor.

Reading the datasheet at:
https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_u_01g_bbb_0.pdf

The last entry of Table 49 shows:

512Mb bulk erase time: Typ: 153 s Max: 460 s

512Mb corresponds to the size of one die.

mt25qu01g has two dies so the bulk erase time would be from 306 to 920 s 
(5 to 15 minutes!)

It seems that there is not much we can do about this long erase time.

Is my understanding correct?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
