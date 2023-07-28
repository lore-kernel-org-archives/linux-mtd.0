Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E563DC001DC
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 02:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o8OpPQi8E+eoIuH9vFZzXoMMoZ4JZvbWe7Kgc1SjEyU=; b=HdqoM/wDCf78E6
	IAUxaAInBqckWowdXPfJoc/K8grtFx9g8DUoQPNhR/T0Xlnz20IfPLbntpxpaFECNHH5VLChmzV81
	5N4+h7CO3BuvuCCbtelRNvTqzHWIktAizgTVTkKeLmkYUYVeDDOoyv6l2DGTQMRgJR15cvazwF3Pt
	P3IQg6bSW9mysIwNwP7EjqJm69lc6jaFXSDWz+vqd9xmlMIKmEGbDOzS7Wdlni+4i8/rFv7xaop14
	P9sdl6GlvR5xeFI90U3DsEgyq3khQCcRzadXqoddptg7D/p8UKUgzJ4OT0KWQKtF/7D0/4cgdxcB2
	dq3WyLS0eY/AuczyaTxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPDCX-001IdB-1r;
	Fri, 28 Jul 2023 02:27:33 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPDCU-001Ic4-08
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jul 2023 02:27:31 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fbc656873eso18428235e9.1
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 19:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690511248; x=1691116048;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=onLaeoAbgFGAjJgteZ8y+3Fjue20MI2BaiZFc8uo0rE=;
        b=TQKaaXU6VgwP09AG7EsQWWGi5gWqx8zn/14OVSOCt1a4TUwA/WQ2OK88fjFhw+c0W6
         2Bb7Rt36aClwcGuic15Cm1vQddDhhJUQTjzRQ7uhBD1jCCMi9QQoPu2u6WYkoZORGify
         4aCUKFm0RLCacbwesUHDxLax+p4LgGbNqWiIj9ZpoNtEPPxgGyIyCZELwWNm/NaSrex7
         3d669aAH1wR0NLfrmpDxb47hEwPaE7gZq/uT1Z+DfVazVcnbKwUN9ZNyJLJg1MnB/SgI
         oW4A936RfHAYSowmbRkOF+UDA1NJOeuDTPIu7iDOtTVAkFvOBvY3Ho1kXmF6NT+iX7Go
         BrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690511248; x=1691116048;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=onLaeoAbgFGAjJgteZ8y+3Fjue20MI2BaiZFc8uo0rE=;
        b=LRf503C8fRpsbOS40qhmC6QVoLMklNqyHAmTjFm5pn6QcLdbjhySTCl2A3y3QuBnbl
         /EV/USE9LwWjCuVRMOWkGElUn4NjuU/tIhhtx/yOmaL/FIvDDBczi2fWRy5rJgdl294I
         tzDpPcC+p82XePa2eXB5pSaLoULWpHPKIuvZcbSuS2ex50FyV9EI+QH8gRACdYEDrc8e
         ELk99oKQSe16VtiLX/Nq2HV7rZ1csRbB2AqVGIPopDXAL2Hj/Q7U8c5jAa6MBQhDlwLj
         ET3L9pLoAv4G2DgudbJyzaz0F+QvnMNInRCz6CDlnZa8l3jq+BiIfjRp9B6x+USmDIIB
         BkaQ==
X-Gm-Message-State: ABy/qLZMzdN1frRMV7HVXo94MaVDBJf5h7RmvK5rICR6H2j8FsGF8Eju
	y0AOn+ICEHzvLSNjRTsULCL15Q==
X-Google-Smtp-Source: APBJJlHeDhkeg/t3SDqXI0Gb70NrfH1gStJefo5IQ6n+EijhNE6sE874G6XwZxFJT4f3Bobu7c4mrA==
X-Received: by 2002:adf:ee10:0:b0:317:5351:e428 with SMTP id y16-20020adfee10000000b003175351e428mr765150wrn.4.1690511248370;
        Thu, 27 Jul 2023 19:27:28 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id i17-20020a5d55d1000000b003143be36d99sm3503253wrw.58.2023.07.27.19.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 19:27:27 -0700 (PDT)
Message-ID: <954f2f20-c5b2-b70b-992c-952fd8a98fa1@linaro.org>
Date: Fri, 28 Jul 2023 03:27:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 8/8] mtd: rawnand: qcom: Fix address parsing within
 ->exec_op()
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Md Sadre Alam <quic_mdalam@quicinc.com>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>
References: <20230716144612.32132-1-miquel.raynal@bootlin.com>
 <20230716144612.32132-9-miquel.raynal@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230716144612.32132-9-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_192730_104613_9F8E03F7 
X-CRM114-Status: GOOD (  11.73  )
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



On 7/16/23 15:46, Miquel Raynal wrote:
> The naddrs variable is initialized but not used. Fixing this could have
> been a matter of dropping the variable, but the right way to do it looks
> a bit more complex: we can avoid useless writes to the q_op structure by
> using it. In practice we could even have possible out-of-bound bugs with
> the existing implementation. Let's fix all that by just performing the
> right number of assignments in the addr{1,2}_reg fields.
> 
> Fixes: 89550beb098e ("mtd: rawnand: qcom: Implement exec_op()")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202307131959.PdPSC86K-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202307131730.NOYbcjBr-lkp@intel.com/
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
