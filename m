Return-Path: <SRS0=jI2T=XW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4418EC4360C
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Sep 2019 20:15:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0123121655
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Sep 2019 20:15:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZLqxeFx9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="jz/z+1TK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0123121655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+IBAANb1kzSDrQ5YBvMEfDMpESNrJtVc4jyjfq5u7tI=; b=ZLqxeFx9Ls7qBz
	NVZO/qQ4m+9c4s2qvLe2+EUWTvDX165U2IhGlZ+H920/HDRCvPf6TIBtO33L2I0vG7bWLmtIlwS4P
	MqIzFg5b0IBdc/uDxgUDdty1BXtevtkXx1+YTFISdVpck0GxaBKiR/WoL+7QipfVuUopR8RJ+G49P
	VE9Dc4+lX64SHnvJ4qqMhi7wuLcPpyTydjLTb62OqH9muyHtKZ4t4alNRF0K6xAomIJP1iXRGYLXu
	woe2QSs5YewMmmg6qG9BjhUSJYh/VcJT//ICFoI33e86CDEa9LPUn4et7VW7OO/aSpHeFYmLlbkQH
	E5sHWw4e1qPA4q/CkB6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDwdx-0005Zw-NZ; Fri, 27 Sep 2019 20:15:09 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDwdu-0004vA-Ag
 for linux-mtd@lists.infradead.org; Fri, 27 Sep 2019 20:15:07 +0000
Received: by mail-lj1-x241.google.com with SMTP id v24so3714348ljj.3
 for <linux-mtd@lists.infradead.org>; Fri, 27 Sep 2019 13:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mxg7KB0He8UcXOQjJpm4kviUXP45ftuhfOFgl+FxdhU=;
 b=jz/z+1TK/rtJJGwFTTkwyHeb+HZt4PkqRvsEk7GJU1N7E6zQ+3yTdy3aWWyMwDoIUn
 AdqtT00D4kckKH7XgEfYLp7RblEugrIPzXVtG7HC4Mg5o+QZ1DIjQBdDZJl2aTvlrGKU
 dRVkZ0kbmc31xz8JCfkrk4oVD4bKvv8sV3wt6lc3QZyfp2wCmRPZKc05pSt1/MrkHYE3
 7x3SIxUT0vWIcAnPvdRQqy4V0be7JpDxnjUuGZWHEPj9zl+TNd5DXO6dW29AmrRTAOoU
 tHsXTsG02H2zq0NobD5y3nGcvpZD5rpO5UHfIv3wrqKLvyLtOUiA8RjRU02BDco3eHIp
 8hFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=mxg7KB0He8UcXOQjJpm4kviUXP45ftuhfOFgl+FxdhU=;
 b=hRSkRMTKnKgyWFmqlTHsC50h1yqWJjPKimRmZZtq+mGprRHldrcMOeqUX5Y7HGfasR
 cQBl6JS0tD9ZZ+7v3Zyi0nrDdqd8/cBv4/Lope+Gcs0rFfhN/s3jBDfp+i7jnYqNA7uC
 B4NsYTtP95UlKtDV9mK+xEkIGMSz71HM67JSX1AH3hIp0KknicATCqgHBB+0cV2c5YgR
 Hm8Zm5HaQRg/H6HkI3pScpijcFLgvEMM05QXo5E1LB4iSj7po8EstkLHrmFFetlMpjf3
 3RVz6aiyctJsOvgAqBHTfIQSFrmI5Zj6ooFtO7gFwHPSllJRP4PSRxjNfpWjoKopzqfA
 pkJg==
X-Gm-Message-State: APjAAAXOGngmDXWHQqikgtYWiH/b804HgYgYz/CWkSbNe4jWpck3rVAa
 DAgLcJ5mIt6ns68iY80XW9ibVw==
X-Google-Smtp-Source: APXvYqyVbBWUexPof9++ySHHyIP4rnSmh5jIWKeCID8Ol7Tpctf+N1Sne3s8s93KagboCLOHA0A+ug==
X-Received: by 2002:a2e:b0d1:: with SMTP id g17mr4091164ljl.238.1569615304551; 
 Fri, 27 Sep 2019 13:15:04 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:8df:57d9:464d:c6f1:f498:da95])
 by smtp.gmail.com with ESMTPSA id v1sm658091lfe.34.2019.09.27.13.15.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Sep 2019 13:15:03 -0700 (PDT)
Subject: Re: [PATCH] mtd: cfi_util: use DIV_ROUND_UP() in cfi_udelay()
To: Vignesh Raghavendra <vigneshr@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
 <bd64fb56-c42d-7f7b-c6f1-4d7b43a6d191@cogentembedded.com>
 <CAMuHMdVdKgBYSGJemH2LP+N61T+uui0XX1Zb-=dM5sNEAaQoMg@mail.gmail.com>
 <90d87853-621f-890a-be59-1591cfe1f4ea@cogentembedded.com>
 <CAMuHMdWEwc8_=NxY_UQ=tzR9o95Vv3_b6WF5s45nHjkzmVygMQ@mail.gmail.com>
 <f182a0f5-eed9-56ab-a909-a327bcd5ba8f@ti.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <55a72373-0f46-ad6b-506a-a85e832532cf@cogentembedded.com>
Date: Fri, 27 Sep 2019 23:15:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <f182a0f5-eed9-56ab-a909-a327bcd5ba8f@ti.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190927_131506_558567_C0A08DDB 
X-CRM114-Status: GOOD (  14.91  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 09/18/2019 08:45 AM, Vignesh Raghavendra wrote:

>>>>> cfi_udelay() open-codes DIV_ROUND_UP(), violating the kernel coding style
>>>>
>>>> Perhaps "violating" sounds a bit too harsh?
>>>
>>>    Hm, indeed, scripts/checkpatch.pl doesn't complain on this line. Do you have
>>> other ideas how to call this? Or just omit this?
>>
> 
> scripts/checkpatch.pl --strict will complain about this.
> 
>> Just "use the existing helper, instead of open-coding the same operation"?
> 
> I agree with Geert. This driver file predates checkpatch and therefore
> does not follow all kernel coding styles. But its good to replace
> open-coding with available helper macro.
> 
> Also, please don't post new patches in reply to an existing thread. This

   I don't think I did this. It wasn't intended anyway, sorry...

> patch appears in-reply-to ("mtd: devices: m25p80: Use the spi-mem dirmap
> API") which is unrelated to current patch.

    Indeed.

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
