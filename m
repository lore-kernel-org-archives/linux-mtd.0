Return-Path: <SRS0=hRrE=IO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634D3C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Mar 2021 17:46:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0A1965125
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Mar 2021 17:46:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0A1965125
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eetKBMRg0E6MzBHgW2lAE7MqNj0ji/XXTOP2vXDvHOQ=; b=mcoT+nr5RrIaMbwGHNlK82Zqs
	SZeoP6OpSTtKTTa/qQYcsSezR8MUaXb7UTv1V1mDEqN9D1LOcFrnPvso2141hJ9Qv2bA9cY7kOffa
	PbCO82Hfix7k2uZwNoKEx0Wv4sdX+Tnfn+7yvi2j2o+hIb7AmDKCSMWYqCHC0SDMrhCpZmc+AZ1aO
	EW39tlDIw1T5lcDgRjkJU5OB/7pDqXuHSz0aEptbPZbHSr15h+XXusO47aV3/4e6fkzstmEHiI6h1
	hM5WtOXR/0AuOYg51Ejow6J0y/nqZzBsACDGdACCj6KYbNk0gZcPzXZuug/BiKmntaIDSIg+kJmEg
	2tFOUYVeA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMDlV-001QpR-Sy; Tue, 16 Mar 2021 17:45:57 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMDlO-001Qo3-HZ
 for linux-mtd@lists.infradead.org; Tue, 16 Mar 2021 17:45:54 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 9348F22238;
 Tue, 16 Mar 2021 18:45:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615916749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N0IPrSvHYfb2D9+Dd0sH+zRB2NKqcmSi14A5U5gAz1U=;
 b=vZPeLHy6uNVuYY2qpX/N+aK0vmnYAv16QOqug9shJdIwhIQhfGZ5hPdSipGLf66uqrWM3Y
 SQN9TmxaDkOgIBYObE3YJf/ggiqo6eeISSs02/yDfOPyKQCvBWVnAleFs2UzZxV6KJpNg2
 kMgVEKn3ieff9cHXxn0HGhn6RMmex74=
MIME-Version: 1.0
Date: Tue, 16 Mar 2021 18:45:49 +0100
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Kuldeep Singh <kuldeep.singh@nxp.com>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown
 <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Vladimir Oltean
 <olteanv@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: spi: Convert Freescale DSPI to json schema
In-Reply-To: <20210315183051.ugvmz4zqrvuo6iqq@ti.com>
References: <20210315121518.3710171-1-kuldeep.singh@nxp.com>
 <20210315183051.ugvmz4zqrvuo6iqq@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <067c42f3726578ebe60d201a141dfdb6@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_174550_838501_5B5CEF44 
X-CRM114-Status: UNSURE (   7.39  )
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

Am 2021-03-15 19:30, schrieb Pratyush Yadav:

..
>> +patternProperties:
>> +  "@[0-9a-f]+":

Shouldn't this be "^.*@[0-9a-f]+$"?

>> +    type: object
>> +
>> +    properties:
>> +      fsl,spi-cs-sck-delay:
>> +        description:
>> +          Delay in nanoseconds between activating chip select and the 
>> start of
>> +          clock signal, at the start of a transfer.
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +      fsl,spi-sck-cs-delay:
>> +        description:
>> +          Delay in nanoseconds between stopping the clock signal and
>> +          deactivating chip select, at the end of a transfer.
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +
..

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
