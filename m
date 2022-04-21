Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992E3C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 10:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pIGEsz6V4pCRaIGue/1E2H0yk3s4Ee+tCCk3IRRPQzY=; b=ix9ajDkNh81nTC
	1Xg3KfrRhzY8l+XXu1xMJ+BdJScSYzFLTqhTfTqEjNgDB7DmG3fup+qyf+tIOFfmj8Ew0ODAbtk3O
	BN+AvNW0zdELxWpYX09qv+XpyAB2ssbfF1L7L++ehouxm7ExPARH21W9VhMapGOX8j2aAVB2nOhTJ
	7xzeyz24nZ85xM+66/F/m7DpCmZNanD1IALQLGDcp/uBSPUCK/xK0tCtVlQIt/q9hD/3RDiyoTKxt
	J0jM3Dwero/puVBzdKvXdVfq49HMWtuzJXHHVB2ku2GosMwLv5lQHPT2It87caVgKCa4sj6GrBqkX
	V33rbxTHHlbD3kCWNuRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhULl-00D4wL-M8; Thu, 21 Apr 2022 10:47:49 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhULi-00D4uP-Q7
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 10:47:48 +0000
Received: by mail-pj1-x1032.google.com with SMTP id bg24so4627824pjb.1
 for <linux-mtd@lists.infradead.org>; Thu, 21 Apr 2022 03:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QFdiyMBXOGlXNO05rtmIBMvjF5pQN7PP2KakX3yKHXM=;
 b=WRqg2YccLvVc+h4KBI8aZzknr2+aHhGvSfN2EVMGJW8FE3WAg0da/Fb69xMalSc1ah
 JOSoNkQ3cAwRTdBk7Q5eXLrdyW57VquDXB6x1WINQcVTg5NHOW2ksOPe1OA8kE/Bg2QN
 VzIUVwKyzlkH5q3IT36gkOlnRh1Xs2ighOeLb/XsxI9JJYEUwgjk/v3ZVGCIIsUHNPIv
 WRqMPWQLgL9cynuBqqgiZXDNLxxOYBGC/tihgKTWJ4tVM2H7wzanU4tVun7Oq1/tAaqt
 Z0McdAn8IxMnQyTCll9psF0pD+LyBnyw1IsvIWW2nZLydDm5BjsoPA1Io4ZYlIzpbrUI
 Z6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QFdiyMBXOGlXNO05rtmIBMvjF5pQN7PP2KakX3yKHXM=;
 b=JXj8/waXgRynLTdKwdWUnwd2Aviqms5siVihV50d1LXoYN4eCJa8/mINnCLPAgIHp3
 lAfYzxjBNVRKh6Ljl5nNZJVrI/D6osbmm8MDYRg0xJsrYPpMZJdk2xPIIFTAJ5PnOvli
 EvObp7rwuCIvx59kMStJHDr5/h5ug/z4H3WbSFOrSVC8AdMm8ZylVIbxgxtHET7y1ilq
 rhsAf5CFPsHwRRref5llcBdeWmDhRoEyC+qCWfk8Ual10ELEfe5NmL4FQ8LGbHKIDBLj
 joYuB8bw0EH73z8ejyxAEqCES24c4nwhnQ5S4WYdaC3ILACo53mc2/z86VovON0w6n3R
 UTTA==
X-Gm-Message-State: AOAM532vOiqNEmFXZta6I5tbkrH4e7CE1Lw2WjG8aW/lc4peYnczmIOJ
 RXp3yL1Ocx4DwSv174mioKc=
X-Google-Smtp-Source: ABdhPJylHaNavrKr0kWPypu122BMQsuCtMci7GIYX/mGY8rQCls6G+JmcKuTXFJnRcefNzOR6xrkbA==
X-Received: by 2002:a17:902:d709:b0:155:d473:2be0 with SMTP id
 w9-20020a170902d70900b00155d4732be0mr24248013ply.151.1650538065469; 
 Thu, 21 Apr 2022 03:47:45 -0700 (PDT)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a056a000a8200b004e1414f0bb1sm24579900pfl.135.2022.04.21.03.47.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 03:47:45 -0700 (PDT)
Message-ID: <f96c55f6-8d27-57f2-892d-d4fd922bd2e4@gmail.com>
Date: Thu, 21 Apr 2022 19:47:42 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v13 2/4] mtd: spi-nor: spansion: Add support for volatile
 QE bit
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 p.yadav@ti.com, Bacem.Daassi@infineon.com, Takahiro.Kuwano@infineon.com
References: <cover.1650532121.git.Takahiro.Kuwano@infineon.com>
 <2c04068f34e4dbd25da541062f5309b1d9878c22.1650532121.git.Takahiro.Kuwano@infineon.com>
 <fff074e7-07ca-0334-a6f4-f4c0d57577d8@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <fff074e7-07ca-0334-a6f4-f4c0d57577d8@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_034746_899530_AF85E83B 
X-CRM114-Status: GOOD (  10.81  )
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

On 4/21/2022 7:41 PM, Tudor.Ambarus@microchip.com wrote:
> On 4/21/22 12:40, tkuw584924@gmail.com wrote:
[...]
>> +/**
>> + * cypress_nor_quad_enable_volatile() - enable Quad I/O mode in volatile
>> + *                                      register.
>> + * @nor:       pointer to a 'struct spi_nor'
>> + *
>> + * It is recommended to update volatile registers in the field application due
>> + * to a risk of the non-volatile registers corruption by power interrupt. This
>> + * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
>> + * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
>> + * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
>> + * also set during Flash power-up.
>> + *
>> + * Return: 0 on success, -errno otherwise.
>> + */
>> +static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
>> +{
>> +       struct spi_mem_op op;
>> +       u8 cfr1v_written;
>> +       int ret;
>> +
>> +       op = (struct spi_mem_op)
>> +               CYPRESS_NOR_RD_ANY_REG_OP(3, SPINOR_REG_CYPRESS_CFR1V,
> nor->addr_width is 3, isn't it? can we use nor->addr_width instead of 3, please?
>
No, at the time this method is called, nor->addr_width is set to 4 by
spi_nor_set_addr_width().

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
