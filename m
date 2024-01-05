Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C910C3DA6E
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jan 2024 13:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/cwOmmSF8odcfxVsKLqV5/+e1LnQgXeKWgZMG1z4bY=; b=0vCYaKM6ALRgyPEwfNN996sOKF
	sbTHFF7RxID3gIZRO0fEIMLLTU3p8n0cBUPRVRSMR+JIwmW8uUq62XI+jmImJTZ0xoXfUNb8dn9cU
	AeEGEZDDOgpEx2jyzZFDBXrSCmoQDlGECzx6DajHvy/BbmzwYHIdf9w48gi0fXFR3hWl+ENFGbv0m
	FRUAAA6QbJSzr3C+4GO57UP4GvbqUb8mwIL5ury5TIvynN1ypoCoDc9kErO6PDHVZ1e2K0emNDQtu
	zirhqS8/7+H+U6IUy+cvwOAy2yAVPZEtKBbjf06/5/38aOmO1QWWe563EzNjFD6ZHEjtWvdBVoikK
	0Jx+kUWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLjv8-00GuTK-1x;
	Fri, 05 Jan 2024 13:07:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLjv5-00GuSI-1a
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jan 2024 13:07:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AEA2F61A02;
	Fri,  5 Jan 2024 13:07:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B62B7C433CA;
	Fri,  5 Jan 2024 13:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704460046;
	bh=gB+WAgxnsEqW/YH7k32txuN0PfGzjJFgxS4nO9oSnbA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SbowU7ho7bvt4e0+Ah9smac50VnAfgm+j4VVR4tvzvi//mAJJ1INIFKw0YifT7mq+
	 Zzqql/TMP8UO6zFw3go4FeLSlFB2WV7XgI7ZpjyV8DEWHkXehky6hwBDfUFrgY+WHO
	 CEyGk8VgistojlNfENqPIoAQY93JqU51sR4rL+Zzz3fba7/CkoRTsGkrFt26qcBWK/
	 pt3OSKHR6NX7b236+cUl6RcVfiW6eWcoUzMv4k41UJ2sznq3H2xUMzFO3Wx9wOer4C
	 EUacWk3TXUzBQZHEEbNXBS3E0tFSY1+gpMVUV0zvbBjXNXU+bDFv45wmQFlSSNy0o0
	 TRSAXaexbuHRA==
MIME-Version: 1.0
Date: Fri, 05 Jan 2024 14:07:22 +0100
From: Michael Walle <mwalle@kernel.org>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v7 6/7] mtd: spi-nor: add support for Macronix Octal flash
 with RWW feature
In-Reply-To: <20231221090702.103027-7-jaimeliao.tw@gmail.com>
References: <20231221090702.103027-1-jaimeliao.tw@gmail.com>
 <20231221090702.103027-7-jaimeliao.tw@gmail.com>
Message-ID: <ea7822c809dd4fd57a4b423b3c8e3e8e@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_050727_573577_4A62540D 
X-CRM114-Status: UNSURE (   9.32  )
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

> Adding Macronix Octal flash for Octal DTR support.

Doesn't fit to the subject nor the content of this patch.

> The octaflash series can be divided into the following types:
> 
> MX25 series : Serial NOR Flash.
> MX66 series : Serial NOR Flash with stacked die.(Size larger than 1Gb)
> LM/UM series : Up to 250MHz clock frequency with both DTR/STR 
> operation.
> LW/UW series : Support simultaneous Read-while-Write operation in 
> multiple
>                bank architecture. Read-while-write feature which means 
> read
>                data one bank while another bank is programing or 
> erasing.
> 
> MX25LM : 3.0V Octal I/O
>  
> -https://www.mxic.com.tw/Lists/Datasheet/Attachments/8729/MX25LM51245G,%203V,%20512Mb,%20v1.1.pdf
> 
> MX25UM : 1.8V Octal I/O
>  
> -https://www.mxic.com.tw/Lists/Datasheet/Attachments/8967/MX25UM51245G,%201.8V,%20512Mb,%20v1.5.pdf
> 
> MX66LM : 3.0V Octal I/O with stacked die
>  
> -https://www.mxic.com.tw/Lists/Datasheet/Attachments/8748/MX66LM1G45G,%203V,%201Gb,%20v1.1.pdf
> 
> MX66UM : 1.8V Octal I/O with stacked die
>  
> -https://www.mxic.com.tw/Lists/Datasheet/Attachments/8711/MX66UM1G45G,%201.8V,%201Gb,%20v1.1.pdf

Please use Link: tags just before your SoB.

> 
> MX25LW : 3.0V Octal I/O with Read-while-Write
> MX25UW : 1.8V Octal I/O with Read-while-Write
> MX66LW : 3.0V Octal I/O with Read-while-Write and stack die
> MX66UW : 1.8V Octal I/O with Read-while-Write and stack die
> 
> As below are the SFDP table dump.

Dunno if it was suggested otherwise, but I'd put the dumps
below under the "---".

> zynq> cat jedec_id
...

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
