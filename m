Return-Path: <SRS0=XuJY=IJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C6C3C433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 11:07:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99CD264FD0
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 11:07:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99CD264FD0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L1gIsQLPt/XKK6Zpbw++Mb/FX/lRwHCiQEVEusswj/0=; b=RgADzlYzrUrZwRqDlceTdC0Pt
	CIcvTy2b5HTXnHtkY6VQ9eKH+uLLXXO3fQt3e545eG4G+88QTWPfWnlUUzBHeXsIoK6ce0th+51c1
	JyZyFecoxaJSu2pyzjMXjODafIbUJhfjwFZ8GxP6GwZIBsdAprVV4jkjmwxmoZ3giNtMjVvjc85qg
	aO6ONjkg84RHYErL8XFGPu5MKHoUgxCvMIZ7iDmaA3pKGdRmvCFoyO5sQy+3ytrKlhG4VR3HI+IfA
	f7LhDBlBOxCW5yvxNai/v/RbSXY4VanF/8Sn2duF7a5xCV02b8thO1w/bOxh1xi++2WAcWgSC5Hn0
	knpEWXbwQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKJ8t-008uaV-Oo; Thu, 11 Mar 2021 11:06:11 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKJ8l-008uaD-NH
 for linux-mtd@lists.infradead.org; Thu, 11 Mar 2021 11:06:06 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12BB5wZt054405;
 Thu, 11 Mar 2021 05:05:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615460758;
 bh=LdUi8SVqpwGudFQodpNuw3WOuVJXt08p5H4MV67u4/0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=yZv9FzRLVYgKp+Aa5UbVh/oPUlfv4MCL8Q0qOAxTmbF/dEMsGCRGcKCyOL3d9FrlX
 rt8e5BePT3NV5Nxz7faPkv2Mcn5AytmPN6OaRCKdqf+uwdZ2b6/KY2A4OtrqUTd7Na
 mcuxWYy+s468Fl4BpYuQwbhJkCSLt+utM7CvK1lk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12BB5wrV055378
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 11 Mar 2021 05:05:58 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 11
 Mar 2021 05:05:58 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 11 Mar 2021 05:05:58 -0600
Received: from [10.250.234.120] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12BB5tHA053520;
 Thu, 11 Mar 2021 05:05:56 -0600
Subject: Re: [PATCH RESEND][next] mtd: cfi: Fix fall-through warnings for Clang
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-hardening@vger.kernel.org>
References: <20210305081933.GA137147@embeddedor>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <e6b57357-e491-a3d0-ada8-9590b2bb8817@ti.com>
Date: Thu, 11 Mar 2021 16:35:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210305081933.GA137147@embeddedor>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_110604_097505_76D81E62 
X-CRM114-Status: UNSURE (   8.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 3/5/21 1:49 PM, Gustavo A. R. Silva wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix multiple
> warnings by explicitly adding multiple break statements and a return
> instead of letting the code fall through to the next case.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---

Acked-by: Vignesh Raghavendra <vigneshr@ti.com>

Miquel,

Feel free to queue this via mtd/next

Regards
Vignesh

[...]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
