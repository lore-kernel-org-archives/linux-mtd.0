Return-Path: <SRS0=zMDb=SA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33131C43381
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 02:13:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 028352173C
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 02:13:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nX5HcbxK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DeCr/w6c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 028352173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1RTYgH3YvzroamoXOyO/iF/ZjbMrg8oZbasEwEHVcFk=; b=nX5HcbxKsExlhW
	seF2i1DXuNRejTQM46AWIyBBhSMqjD/RHdiKOug1P7zNMkxZFaiLxSqAUn5CfLFqEJNrhxwhfdBqB
	crzLU1i6pHcRdF2l9VIuPhzrmY7AS+yCIUfa8uh4eje4zrO+Wx1+Lut467vYhx4iPyCP520z9UU82
	GL6fjgenmlAKETblRcC5GGxtkq2d8Td4dbtjngGx1ZagRCeYbSXPDquI8oFB3j3Oj5YfMb8DwKVza
	+gkskTPbO7HulQVSc99fWSDDzuREfcnTBbFPPCkDdSS4UeGDs6aRIon3t6ZuqOjqdUBo1Mgnwnvb9
	RACgbVozHyVusNO1BnmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9h10-00055b-LG; Fri, 29 Mar 2019 02:13:06 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9h0x-00053Z-N5
 for linux-mtd@lists.infradead.org; Fri, 29 Mar 2019 02:13:05 +0000
Received: by mail-pl1-x644.google.com with SMTP id m10so243064plt.10
 for <linux-mtd@lists.infradead.org>; Thu, 28 Mar 2019 19:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hR+bmCSBf6vm7GJgAQW7yY15oZgnfwYq+WtldE9VqVI=;
 b=DeCr/w6cxZa3En+BiU6WOCz8UCoPbdGcOx+LHzjCdDKeRhodLOf6TmykjgjZCIZwIZ
 yN9DEDpHvfurlCllnmBorxWT87rqMZo21iuCPVxdH3SfjmFuX+CYI1dJKmPx/uW/ZgN7
 uc3j6+Vw8ElJQwIrRq8KJg8j6z3uE8JIOCpHHaN5ze3zg/YOpxf1j8xpSWzOUBiu8od0
 QQUM7qngedsbF2u8OFGZp3HMNC4ec3pgwrkEaqrZZ7Qay7kF0BvRI83ISShUFTDqdkvP
 GKJyh4DEbXIXsgCTOlckILjvwsrztYyEPoXLhQigMIvW7PM3UMVMkvZwhICxGhPklQED
 ELmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hR+bmCSBf6vm7GJgAQW7yY15oZgnfwYq+WtldE9VqVI=;
 b=gMML+Vew2jlCWLkJPDUy2PBJky5UrymfbZbBI++Qa1b7B9+W9mUcDckzXjPOrYcn/d
 L20SRwKMdbolD9CXl0KwjFxtHCIyFx8ir5h8n9b48VrbqeR2J0TsiBGYln5xMXWR8ujR
 rBKurk2vVltevCkRTYYb2hB8nao60NYI640yIv3DVJ5IS/PO8hvr2bTra2yWUO8cH9xM
 iZs1TEI8/tj5KSXPsB0r5ZSShK6Gqm/zdLpwJ/u3RzeR+8mwee3G2tLuN8GYWmBxOPKx
 IBRp+OE4aXB1kHKHRNZDYmoptzI1WM1WSrBruu7Nz1DYL1ZrtMrZLr27wE8njo3HgTqN
 Xt+A==
X-Gm-Message-State: APjAAAVAl/i1KujQFbSHsueKV2EgIipY+Ujl034kWYNU/8guMRnXHSAy
 ezmg2jFxed/mrCkxp+xR9Bs=
X-Google-Smtp-Source: APXvYqzO7U3d5ORWk8TBFEq5DcW1zQ/4TbMxRF3CNOzbYqNR7SkWaSYO7pY5+Az8A4qVem/bOVizMw==
X-Received: by 2002:a17:902:7289:: with SMTP id
 d9mr45753588pll.314.1553825582516; 
 Thu, 28 Mar 2019 19:13:02 -0700 (PDT)
Received: from [10.230.28.107] ([192.19.223.250])
 by smtp.gmail.com with ESMTPSA id k124sm558566pgc.65.2019.03.28.19.13.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Mar 2019 19:13:01 -0700 (PDT)
Subject: Re: [PATCH V2 2/5] mtd: bcm63xxpart: add of_match_table support
To: Jonas Gorski <jonas.gorski@gmail.com>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20190328141910.5723-1-jonas.gorski@gmail.com>
 <20190328141910.5723-3-jonas.gorski@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <dbbd8258-0e10-5986-ec19-eb57dd10e758@gmail.com>
Date: Thu, 28 Mar 2019 19:12:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190328141910.5723-3-jonas.gorski@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_191303_787011_0549A3A5 
X-CRM114-Status: GOOD (  13.85  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 3/28/2019 7:19 AM, Jonas Gorski wrote:
> Add of_match_table support to allow using bcm63xxpart as a full flash
> layout parser from device tree.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
