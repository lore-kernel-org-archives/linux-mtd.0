Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF8FC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Jul 2022 08:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q5J8ueSGXFiFlnHpdttrGaL5DtTyNK+muBFj/LO60EA=; b=uwVOdg9UDsWs6n
	Xcgqo2pCnG4pGaLG1ePw7gyrOH5WrWDwveCMwI/lYEKFFdXLO1Wo0NtLdxWku6EgfOi2Keep+rDkb
	X5nKMeQ70i3V2YLdtvJ/Li9Mi18BiYeQWf2HhzjESa3er6Sh96uvcDnbb/r6e8RZkZgI2jh/04nj+
	9CtI2AxAWJWjeFHSRhtOyCtlCoMKA7DB4XMscszwPVM6uW9t4SRKO2bZtzbB9OgciCsN8THYYXXAP
	Z2pMX9kJ9EKy+lj+f6lJz8fjzqTsBw+B3WYf+UqWyY6CkbK5OcE/N8t1pZADwGI6lH/7R/54ZowBt
	hSyTrZJj6cqp1OQqAPWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGG2X-00AJ54-Tf; Tue, 26 Jul 2022 08:35:42 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGG2U-00AJ0L-OU
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2022 08:35:40 +0000
Received: by mail-pj1-x102a.google.com with SMTP id e1so2229896pjl.1
        for <linux-mtd@lists.infradead.org>; Tue, 26 Jul 2022 01:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=h1CvIyQAlgdGiw9kZ00bO0OiCkkJJ79gBK127vUNxhc=;
        b=mYGWBo3HI5fRkSFOCot+P7hjGCAOC1dSOcQF9Vi946wEgWESr8X5X/QzpuNs6pmm/d
         DfjTRzLK2nmYC4O8CmT3lVjeuAP9SZB9V8qzMHwVEYTCwkkL6jzBVpDcyKCJfHXhzelF
         AzgA0yxpepPJym8dXcQkbEO9f0OZetbB/wt+w82lRhFmF/2EEeIADZoBYLzz//4/Gtd6
         f9P0WRBzD247rI/CmzpRFIMeFLjjXhiNtsrW7Zvme/gap172cjQs8v0acSTpUPp163aO
         oMKZdS83/MJGj+BeYpIHmGx/4L1UVvjG9QbbJsVESdpH8ITTdI/mb71Z2qZbi/IYXDc9
         2tVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=h1CvIyQAlgdGiw9kZ00bO0OiCkkJJ79gBK127vUNxhc=;
        b=taznntdh4g+7TOg/GGGEREJ+XN9s5siD4D0scrzM5Wp1oXQVV0406tbeyt1dnsdy3U
         meJlUORhMDN3LtfFOQjmcxmRkKqeBnfo0SWxTHWorgcOvcHPBxOneKqsIV/HU02gSwPz
         ilsR2rpYWzNbx/zsCLIPf/NJuG26c4H1u38hsA1JK0zUjphlObn8ZT+8et11ngF79zdb
         WvIYx+ksv/MNFMea6GifX69fnmwunDu2JTcUi1f3UsJtHnQG0eC7odUF2npdlVQqqGCv
         DZHiL0R6fB0GG0WwLLX92zDt4sZWhWwTwv9a78fbWp8cD8uO0SopECBnL91LRlGkfFbb
         PZmw==
X-Gm-Message-State: AJIora9qwuetBrHbwYyiybJklmVBzOWelvThs5TuP39JDAq3erfXA8+w
	C3SwnaTtQ2zSzEDLk5e/M/j0nKkb6k0=
X-Google-Smtp-Source: AGRyM1sEWWU8lvhHnSMcT1/qyua5k/f+P4iTgNDdoy0meRz+fn+1a7+T15VHLW/OS+tCjUQ8miUMpA==
X-Received: by 2002:a17:902:7c0d:b0:16d:500b:1255 with SMTP id x13-20020a1709027c0d00b0016d500b1255mr14969737pll.98.1658824536482;
        Tue, 26 Jul 2022 01:35:36 -0700 (PDT)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id w2-20020a1709026f0200b0016cf714d029sm10733351plk.288.2022.07.26.01.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 01:35:35 -0700 (PDT)
Message-ID: <49520da3-69b0-c50c-0ca2-ba017d2012a7@gmail.com>
Date: Tue, 26 Jul 2022 17:35:32 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v17 5/7] mtd: spi-nor: core: Track flash's internal
 address mode
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
 Takahiro.Kuwano@infineon.com, linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 Bacem.Daassi@infineon.com
References: <20220725092505.446315-1-tudor.ambarus@microchip.com>
 <20220725092505.446315-6-tudor.ambarus@microchip.com>
 <8e8cff77-bb06-fdea-fb0e-60e1a2639026@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <8e8cff77-bb06-fdea-fb0e-60e1a2639026@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_013538_848029_BC66F4F7 
X-CRM114-Status: UNSURE (   6.59  )
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

On 7/26/2022 5:04 PM, Tudor.Ambarus@microchip.com wrote:
> Hi, Takahiro,
> 
> Can I have your R-b tag on this patch, please?
> 
I confirmed this works on SEMPER S25 devices.

Reviewed-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Best Regards,
Takahiro



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
