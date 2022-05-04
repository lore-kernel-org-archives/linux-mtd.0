Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019F6C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  4 May 2022 07:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d83F8cFGCKgTSfBpfejVZRW9najIOmdTRyVthRO6cnU=; b=to3lMvob7RrZlN
	B4hTVd95jhigZozo9lmVNpEp94Nt9aQgEgHQbj1ui60lXxoQLGAI7jSk382MaHO5f/y5YyCA0lecg
	L8EdagBCw85Zhal1ZgG5msIoRgvUocASdUoqbnCnRjA0OL+4FVEW2JXzAli7/IGV0L8eTrautvvrX
	eHUyUwUNpwi/XHW8k7vW8dsBIMvxIAX2aSePrtLfglYBGAr2Mu88A348FTPF+kUrm78rGzlu5v7vw
	4g1qrAjaGTKnOAYeea06ejG0tzx0VUYSLrOVFPtJ/KPijtVR+2Ith0O4GBzS6xv4lHndqUXe9Aqtc
	w0BEQ7TOOsfOoksMcFFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm9rt-009NHL-Rf; Wed, 04 May 2022 07:56:18 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm9rp-009NF1-Oi
 for linux-mtd@lists.infradead.org; Wed, 04 May 2022 07:56:15 +0000
Received: by mail-pj1-x1033.google.com with SMTP id r9so537225pjo.5
 for <linux-mtd@lists.infradead.org>; Wed, 04 May 2022 00:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ytOe4Ts8sF9j4doyCupweIXNJL5a+eRiuRi+H9wls5w=;
 b=FkdB1V9fpnuyP8kF+V+m4nvLzjkDx2/aG81JN/lvtRS8wmbpLyerRmdkAAR3lP7rfB
 UAqhQ1lz/cTCoZ9mz+A3NjOJgKQYgL7w0G1IqIiwLqP1/pgwx9np697lEAaRi3pJuoT5
 YI+a5VN2So+tgQGuFGW/rxUfChqe9AqEVlzEleka3/6oakIFod7ldl5dfR36GmrDHzXs
 pzWz5tnOM+pcmoBahzb5gPVdTCPMCrpXfwY/9eU3f4cOiejZC2e9UMwv82aaUoCCIUWk
 2NHZ014fPqcvZmgNyuNo6qaNIjKPuma2MSzq4P3T6VuKPJ+vYtF6yzNN0B8nCAeHDgBG
 mJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ytOe4Ts8sF9j4doyCupweIXNJL5a+eRiuRi+H9wls5w=;
 b=d4n4I5L0WqmKpayZ6HPxpaYXdfFHG8QuxXsTpBKiyN9Syv2yRtb8I6onBb9aUWmxRd
 72Gr2C4Etfp/3o/HrkSvTdiFWP13+R7VrI3yvueL6YuONTcHLEtRL8ojyIa7ol5sCYR1
 IbMHFFwG43EKaxx7uUA2xnmW7lirjmddt5ZYjy1ioI1DpSuw35YY/cF4ilYnZdyT8npC
 3ATFn88a5JH0jbUaWMwjbnFwyikyXHh28NuAWHQc8h7ciHqxx1THAme25IT2lmAmjgVf
 pVr0NT2Zm4m0EKkFwNSA4v+42sBXGjiLvDTwbazQHEusXPrF7N2vNO1myEpyT4dwGL9j
 +y1g==
X-Gm-Message-State: AOAM530PpBTzw7BpNw2MvQ6xOzDwc/NhKhih8faQEP0PcvQ8GEySo+Se
 EvxwIutZ8qhu2spN0lRJmJE=
X-Google-Smtp-Source: ABdhPJyZNuu5Zywoej4Bs36Or1QtvXVaJcmsijqR2N4SJwFrAkMsNkazDhgmJwzMX+Z8CsHMi97/yQ==
X-Received: by 2002:a17:90a:1944:b0:1d9:7cf8:5457 with SMTP id
 4-20020a17090a194400b001d97cf85457mr8931806pjh.112.1651650972035; 
 Wed, 04 May 2022 00:56:12 -0700 (PDT)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a63f143000000b003c14af5062asm13626976pgk.66.2022.05.04.00.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 00:56:11 -0700 (PDT)
Message-ID: <4fa61e90-89e1-ae68-abb6-ed50c5c09308@gmail.com>
Date: Wed, 4 May 2022 16:56:09 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v14 0/8] mtd: spi-nor: Add support for Infineon
 s25hl-t/s25hs-t
Content-Language: en-US
To: Tudor Ambarus <tudor.ambarus@microchip.com>, p.yadav@ti.com,
 michael@walle.cc
Cc: miquel.raynal@bootlin.com, richard@nod.at, Bacem.Daassi@infineon.com,
 Takahiro.Kuwano@infineon.com, linux-mtd@lists.infradead.org
References: <20220503081627.341870-1-tudor.ambarus@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <20220503081627.341870-1-tudor.ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_005613_838771_95D5DDE6 
X-CRM114-Status: UNSURE (   9.33  )
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

On 5/3/2022 5:16 PM, Tudor Ambarus wrote:
> Hi, Takahiro,
> 
> Would you please test this series? It's only compiled tested on my side.
> 
> Cheers,
> ta
> 
Hi Tudor,

With the fix in patch 8/8, the series works well on my side too.

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
s25hl512t
zynq> test_qspi.sh
6+0 records in
6+0 records out
6291456 bytes (6.0MB) copied, 0.221878 seconds, 27.0MB/s
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Erased 6291456 bytes from address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0600000
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
9ef41f0cece253ea6b6537ab19e0878841954444  qspi_test
9ef41f0cece253ea6b6537ab19e0878841954444  qspi_read


zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
s25hs512t
zynq> test_qspi.sh
6+0 records in
6+0 records out
6291456 bytes (6.0MB) copied, 0.223113 seconds, 26.9MB/s
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Erased 6291456 bytes from address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0600000
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
c1d4227d75ed34ca1b1282ade1996e4130e7af15  qspi_test
c1d4227d75ed34ca1b1282ade1996e4130e7af15  qspi_read


zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
s25hl01gt
zynq> test_qspi.sh
6+0 records in
6+0 records out
6291456 bytes (6.0MB) copied, 0.221797 seconds, 27.1MB/s
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Erased 6291456 bytes from address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0600000
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
e4d22bbd91abe16d43dc4a0539ac49d653e99611  qspi_test
e4d22bbd91abe16d43dc4a0539ac49d653e99611  qspi_read


zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
s25hs01gt
zynq> test_qspi.sh
6+0 records in
6+0 records out
6291456 bytes (6.0MB) copied, 0.221968 seconds, 27.0MB/s
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Erased 6291456 bytes from address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0600000
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
43cf65d1b77dc4bdc31ca002166f150a97843cb2  qspi_test
43cf65d1b77dc4bdc31ca002166f150a97843cb2  qspi_read


Thanks a lot for your help!
Takahiro
 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
