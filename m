Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AEEC00140
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Aug 2022 08:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=VHYElEbrsAxTvcEf1xww1msAb/DYk5cHP9Whz5rqQkg=; b=1P5
	iGvn5VRSr/H3sq/njx7ySXHYOMkAr5QYOFK3p5uRTYB2uMQmWHURiF6ZI/GdZSLFBmlBxpYpiFRsA
	E7kPPU6NPx/4Ho8EHJRq8we62cjoGK5f1/avR+oXlwIMqCujZJ5vtmJ4HcYH6JD+qJUK0LWMz26Cx
	ojuy+zai4zZ0iEbIFMNxxPzANnQuzkAQb5odhmySPpk3Of+roerhKId5nuxa638Ts3dRXLyItOHzF
	JkVJALNKrfdFu2cy0OZ0VM0mQqT+C9yqepyhFeuaPYWaQpgva9s+YCyqc/Nf3PJY74TGnlw/hnwf9
	qYrCMiM1G8eVsuonHa8q5PJpj6zMM9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOb5F-0011an-3C; Thu, 18 Aug 2022 08:40:57 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOb5C-0011Ui-Di
	for linux-mtd@lists.infradead.org; Thu, 18 Aug 2022 08:40:55 +0000
Received: by mail-oi1-x232.google.com with SMTP id j5so879729oih.6
        for <linux-mtd@lists.infradead.org>; Thu, 18 Aug 2022 01:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=ruA7pN0lJtATAV83ddC02h/VTr+PLa+U2EfugXXWYQM=;
        b=bBj37Ga5O77ArsIlZCSe5+RnReAq6Cbanp+4EYOZHSbiB94jSVy96mJI9ePwmPjAcx
         JhbLiRTSszUZSXYURitMCn1aIPmz9Lr5EKvAY7UguiWySlFXuqtLdcbf2+00HSJuQkOA
         pqfhG9xNVmBLDIW/glG82vamHQ1jsg/vwStaLViv5ZFAdVOfcwhXLDXQlQ1e3iBetC6p
         YGF9WaKTOPa114E7MJm/a1USdli+d8/b8TuSF4lA27Q16WRbdsr3LpUVWX3wzb/7pYy/
         rzd78hRb6CWgzkUDoIQgn5wo6ZibADM9ZCN1V/bgPUeGhOeZMuYLxTvpvabzAZNi4xtb
         NZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=ruA7pN0lJtATAV83ddC02h/VTr+PLa+U2EfugXXWYQM=;
        b=BIXRsybmJvktFwiLKLyJF7xQkQz/RHOzQIDSB9BQh8RpfPVYg59nMKD8T273sPiLGD
         9WVVLOQ5G6P1usivw9/g4Sh8Y5gk1rolWPnexu+H1u9bDa4Te7P8jKyhvBlkiOo30s5Y
         OSnzBHrpHnf7meCYcysKdaFZZVEdWo5nD8nz1Rq6myp7JtLVHNunMepGKX0Kq4OGZLog
         tbDdIKCzXv3XiJZcKSKdGJP8m9NljDbiXaKOTBVJr0MnMBrFlmrHPt3V1QALjlVGo2Dk
         xwuXN68MGh8ovmgV/yQZZhH0LUhRH/JZvF4KVdDDwWvVmpxFyxCpSf76Lw+L4J2QjLg/
         fJjA==
X-Gm-Message-State: ACgBeo2jSOwKEOffOktyXbicFYtNSgLh2QU8lgyN8cJ0FbLClVeaHwPp
	SNIfyyFQyxQ/bctyWivW+6gmRneg7ptlaFPqSEAycIU6lwmFngyZ
X-Google-Smtp-Source: AA6agR5v4RG1y7yMc1vZT4j/08aje28P8/S6yeFS40pPR8lUpixCvNkvoK9kvhxoe+th/PGkWvh2YfiVkYFB6HYSVAo=
X-Received: by 2002:a05:6808:1b25:b0:342:ff09:2c32 with SMTP id
 bx37-20020a0568081b2500b00342ff092c32mr3247487oib.26.1660812051417; Thu, 18
 Aug 2022 01:40:51 -0700 (PDT)
MIME-Version: 1.0
From: Sergei Antonov <saproj@gmail.com>
Date: Thu, 18 Aug 2022 11:40:40 +0300
Message-ID: <CABikg9x3Bggj83otOTA2jBGu2gNK5gt1n=P9jdssUqWX43aacw@mail.gmail.com>
Subject: flash_otp_dump
To: linux-mtd@lists.infradead.org, Michael Walle <michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_014054_513140_F6059659 
X-CRM114-Status: UNSURE (   2.71  )
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

Hello!
Commit 0a5e2fa5c1e41 was described "add optional offset parameter". In
fact, the 'offset' parameter is mandatory. Change
if (argc <= 3
to:
if (argc < 3

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
