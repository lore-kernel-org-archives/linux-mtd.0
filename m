Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86727C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 11:29:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFE9F651C9
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 11:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFE9F651C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eMpB6cWZHFk4I8aFR8de14FCK8z8s9TsAWQ2b+xl1Ww=; b=GkuDuFmDWjZEM85gbglC8nJu6
	fXg4u9UnE5ipBxpraGEQPMJooIk5Lv49yrsFaJ832GWagXyrRDJj1Q+ViOXrt8QGWi5Lo4ptVrQgQ
	ksyPy+Kr3Gd6kUXqXKfcTK/egaFOqC2fwBwVSaIrF6CN/KKvtL1zmHhcWPniAfZyLCMM1Yz9fEy+4
	n9LNJKdIDZfgBKRQ7vwekTfnqybSMyArHOP/5gSE7U3pmaIWUWK6ePWddbdorFUF997Jr1rC0Y5W3
	ipcLkdpRR+Tr9+3Dmzr3xjYPKUCf/hTvhqSAR/Go6gVLdmjWJIENLbld8VsiB+d/hid/UNzXglw7D
	A3GePaegQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJE3a-00Gl2e-Vi; Mon, 08 Mar 2021 11:28:15 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJE3R-00Gl0L-UV
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 11:28:10 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 128BS1M1090144;
 Mon, 8 Mar 2021 05:28:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615202881;
 bh=q0Z0r2uMokg2qUPUFmiAW5LN8g55+RfYbTn+m396kSA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=uCgk7gvtOGggg8kk38QXHDyThtcIikyMFrTSOvrwrqNzxe9kQf3chRR/spzJW1Iee
 tG5cqN09fQa/4vMRxYKKIyZCKevWfmZ4Kn++IyrSVsay7ZpXvDE0JPBefS/cVwkGTF
 vgxnViTbwvyoG7yMhMbzgWsRd3DvjVljNgOJnSLk=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 128BS1Yk093808
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 8 Mar 2021 05:28:01 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Mar
 2021 05:28:01 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Mar 2021 05:28:01 -0600
Received: from [10.250.234.120] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 128BRwbB109813;
 Mon, 8 Mar 2021 05:27:59 -0600
Subject: Re: [PATCH] mtd: add OTP (one-time-programmable) erase ioctl
To: Michael Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-api@vger.kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, <Tudor.Ambarus@microchip.com>
References: <20210303201819.2752-1-michael@walle.cc>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <d3187aaf-e1cd-5778-eca7-9dc41f3827b0@ti.com>
Date: Mon, 8 Mar 2021 16:57:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210303201819.2752-1-michael@walle.cc>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_112808_111822_43D46AA6 
X-CRM114-Status: UNSURE (   9.55  )
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



On 3/4/21 1:48 AM, Michael Walle wrote:
> This may sound like a contradiction but some SPI-NOR flashes really
> support erasing their OTP region until it is finally locked. Having the
> possibility to erase an OTP region might come in handy during
> development.
> 
> The ioctl argument follows the OTPLOCK style.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---

Acked-by: Vignesh Raghavendra <vigneshr@ti.com>


[...]

Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
