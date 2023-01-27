Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FB5C38142
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Jan 2023 15:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w0ODeBxu9P6T/3pISG5QlMnFKrJIVxEjfJXvfX2pd5E=; b=3tFwEz+3gopptB
	qQu3TcAC1kqDBnQs5a2DB7cw9P8XcOQIlzuzTi354O5qZTb1rvwmUbxL24srAGoKTCaWK5QD+cGwX
	rIDTvKhHk/NkHvs36bkLEvTBWFx6olKfqZ752PtCphugVMeDbOk0SFuCbxEf5wuyZafVMMLNQBJOb
	va6UIwOHYpsCDGgpi3cpBpFz8QE2vEiMSHTRHryNDFsbzNSVJiT5R4wYDsY+mr4BYN/uXoV3FcxIW
	AmsfxQ5V9qn/CwROEvpzjAE2PxdFnj56DdyE6UiAeMuimjecLvRU1JtlAUWpujKMybrleID5yPofi
	SzCqBb4YRj8PIISx3E+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLQT6-00FR3j-SW; Fri, 27 Jan 2023 15:16:44 +0000
Received: from smtp-fw-6001.amazon.com ([52.95.48.154])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLQSr-00FQy2-Cl; Fri, 27 Jan 2023 15:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1674832590; x=1706368590;
  h=from:to:cc:subject:references:date:in-reply-to:
   message-id:mime-version;
  bh=J85XzxxjAKCt6wUsJoyOWvpKjjyw1igxFqPQ00CyA24=;
  b=m1twaUKAZ0yi8nEDFbRn8VC8/ASM8X+8UmxQBs5YCjYeyphZ7POIWZeb
   b3xNvzn5o0qjppVlOeC+1Gt+nI3ASkiBtIzBmaT+S8rPDEPo8mcToV2gZ
   iPtd6NMAHKvZcOrMPj0BVvPntCZMKDznX0cDgtXOZ6TMRC7Pm6KiXcUzL
   A=;
X-IronPort-AV: E=Sophos;i="5.97,251,1669075200"; 
   d="scan'208";a="292851507"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-iad-1d-m6i4x-d7759ebe.us-east-1.amazon.com) ([10.43.8.2])
  by smtp-border-fw-6001.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2023 15:16:23 +0000
Received: from EX13MTAUWB002.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
	by email-inbound-relay-iad-1d-m6i4x-d7759ebe.us-east-1.amazon.com (Postfix) with ESMTPS id A7AA943230;
	Fri, 27 Jan 2023 15:16:21 +0000 (UTC)
Received: from EX19D009UWB003.ant.amazon.com (10.13.138.95) by
 EX13MTAUWB002.ant.amazon.com (10.43.161.202) with Microsoft SMTP Server (TLS)
 id 15.0.1497.45; Fri, 27 Jan 2023 15:16:21 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX19D009UWB003.ant.amazon.com (10.13.138.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.24; Fri, 27 Jan 2023 15:16:21 +0000
Received: from dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com (10.15.11.255)
 by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1497.45 via Frontend Transport; Fri, 27 Jan 2023 15:16:20 +0000
Received: by dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com (Postfix, from userid 23027615)
	id 6FD3220D34; Fri, 27 Jan 2023 16:16:19 +0100 (CET)
From: Pratyush Yadav <ptyadav@amazon.de>
To: Dhruva Gole <d-gole@ti.com>
CC: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
	Vaishnav Achath <vaishnav.a@ti.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v2 1/4] spi: cadence-quadspi: Reset CMD_CTRL Reg on cmd
 r/w completion
References: <20230125081023.1573712-1-d-gole@ti.com>
	<20230125081023.1573712-2-d-gole@ti.com>
Date: Fri, 27 Jan 2023 16:16:19 +0100
In-Reply-To: <20230125081023.1573712-2-d-gole@ti.com> (Dhruva Gole's message
	of "Wed, 25 Jan 2023 13:40:20 +0530")
Message-ID: <mafs07cx8f1oc.fsf_-_@amazon.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_071629_611605_CFFAED90 
X-CRM114-Status: GOOD (  17.79  )
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


Hi,

On Wed, Jan 25 2023, Dhruva Gole wrote:

> If one leaves the CQSPI_REG_CMDCTRL in an unclean state this may cause
> issues in future command reads. This issue came to light when some flash
> reads in STIG mode were coming back dirty.

Can you explain in more detail what you mean by "reads coming back
dirty"? Because I don't see any clear reason why not resetting the
register would break anything. We re-create the register value from the
scratch on the next read anyway, and as soon as you writel() that, the
old fields get thrown away anyway.

>
> Signed-off-by: Dhruva Gole <d-gole@ti.com>
> ---
>  drivers/spi/spi-cadence-quadspi.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
> index 676313e1bdad..6030da942c6e 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
> @@ -549,6 +549,9 @@ static int cqspi_command_read(struct cqspi_flash_pdata *f_pdata,
>                 memcpy(rxbuf, &reg, read_len);
>         }
>
> +       /* Reset CMD_CTRL Reg once command read completes */
> +       writel(0, reg_base + CQSPI_REG_CMDCTRL);
> +
>         return 0;
>  }
>
> @@ -613,7 +616,12 @@ static int cqspi_command_write(struct cqspi_flash_pdata *f_pdata,
>                 }
>         }
>
> -       return cqspi_exec_flash_cmd(cqspi, reg);
> +       ret = cqspi_exec_flash_cmd(cqspi, reg);
> +
> +       /* Reset CMD_CTRL Reg once command write completes */
> +       writel(0, reg_base + CQSPI_REG_CMDCTRL);
> +
> +       return ret;
>  }
>
>  static int cqspi_read_setup(struct cqspi_flash_pdata *f_pdata,
> --
> 2.25.1
>

-- 
Regards,
Pratyush Yadav



Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
