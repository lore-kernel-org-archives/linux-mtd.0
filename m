Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D9AC4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Dec 2023 07:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ROUx9u4m+SY68R5d1Ts3SZVAVMQAvlFFS7DXoxXzOtg=; b=rz/fFL7qrQcoYy
	eeciTBA42c9dXP115h4xCaedJtr3Xgwmk1QYH1PODLHPQKGkxVVMcMAMyjakHLBKXy9AWTJZmW6MR
	hEnLU3QIt8V1YVT4I3UdB3gKvrOkuXzWUgyAFTq+I7JWaCYpn5ZA/Fi5m/HNKUrNaiP+nA1/DvM92
	2Dy9MjP1oYs1/Dn8TsXTJtCk8Mgivs4E0qcKmQGLG45240appJgRuQMf7OYcGB4ebhwX65oxY9/60
	ww4rZIR5pyWfKSo2+kf2729Pi4SemXaZfboECMd2Vye3FQhVfus619hiYi7JNKpXY/Xpyn62JYo5h
	pcdx0TAGgZk36I2feEmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCxRc-00AwzT-08;
	Tue, 12 Dec 2023 07:44:44 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCxRZ-00AwyR-0j
	for linux-mtd@lists.infradead.org;
	Tue, 12 Dec 2023 07:44:42 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-58d18c224c7so2906984eaf.2
        for <linux-mtd@lists.infradead.org>; Mon, 11 Dec 2023 23:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702367079; x=1702971879; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CVyNkE7xMkhklYgaZ0S9yWEZX3/jVgffCVBej7CzE5Y=;
        b=hB/FVJ2av5dfZz+8sWS0SjNjMaJHGpROfih8RJqyjmhRoh47ywkT5kRJD6qQ21uMnl
         wzA2xb65zDSeuMutd9piyXstnOcprH7f7C8Iy2oinGblKrOD2UPW2I5F00ZTpFaBMmE4
         PpLRO6uhkXKXpPDa/5xtJI/DYY7R/uzJBdOVtl7v2m4qDvUbSfmbQtikAjmFyRDNocrx
         6rPVl3XLji+oLSWRtcUnTpXTHT48iVYLkMDSLBau5q18UOattThAtdjroxhrEeQJv3KS
         xARPpxu+LMp2+XCLb0/VgvtOWOAB44za5PxutlP7V+t1Ah0+KOeLyqTsswCPpPk4/53a
         BcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702367079; x=1702971879;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CVyNkE7xMkhklYgaZ0S9yWEZX3/jVgffCVBej7CzE5Y=;
        b=UovTpygQt14IAH029Y+oSjM0yVJfBDJlGvsz/01EKOg5uMqggZ6ZPLjg5znPtq8JLJ
         PJw0PCHKcJqMrCyw2wOUoObfybX5so62PSTQOanz+tl2NA77PVDm7MOeJAsrkE6gUX5F
         XMOjJXn6yUcyTDpBxNoBFlY7azh9rDqBI8lk0Y7mY+51soSJMFeMmt0hy6OKDWwxLwj1
         VmpRvIO+EKMJOWjuUt7pxhwxPpydf14Uq4mtYOU/Z10INTqtBqM3Z0hygJg7ClLZp2N8
         SNSNlfLPMgxO8cVumj3IRL5BtTbyS/6SYWNXYDRKXtaEx+2omORGMWzLTuaF6ETtZ2PE
         rS/Q==
X-Gm-Message-State: AOJu0YzXg9phxFpqJOPVztApnSTDABCcr0xQyQPoFvbQBcXyXz/+zObY
	9a1BeKOBic8r9YTewduRhv+K7wdr+79Nvx6n4Cs=
X-Google-Smtp-Source: AGHT+IH3g6610by3FlbXCytN2CFFIUVFkJ/OOZkmbfbgiATzWhze0MYC9FDI6oLhoPWqOqrl+f+cIcOWU3Y/VtQftJU=
X-Received: by 2002:a05:6358:9fa4:b0:170:2f73:84b4 with SMTP id
 fy36-20020a0563589fa400b001702f7384b4mr2724057rwb.54.1702367078881; Mon, 11
 Dec 2023 23:44:38 -0800 (PST)
MIME-Version: 1.0
References: <20231130083854.55221-1-jaimeliao.tw@gmail.com>
 <20231130083854.55221-6-jaimeliao.tw@gmail.com> <eb145cfb0cf10330f5125f0c7d2224eb@walle.cc>
 <CAAQoYRm=5smXRSRJki8MB3yOuh4UeQO4oBYG8JSG29bbyADHGA@mail.gmail.com>
 <d42c102528ac8d4188147b6e23b18612@walle.cc> <CAAQoYRnF5zn+RH6LaQfPioOnbRADG8LXBuVpBbQvDGGYqJX1-g@mail.gmail.com>
 <d32f9632-7d03-4a78-9bf9-622de518cb28@linaro.org> <d754407b5e7a6cbe58ac3ac4af8e1acc@walle.cc>
In-Reply-To: <d754407b5e7a6cbe58ac3ac4af8e1acc@walle.cc>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Tue, 12 Dec 2023 15:44:19 +0800
Message-ID: <CAAQoYRkJ145nTAUcy4eNeC9N4S1TVLrnRv0DnbZLWDuO4bevHA@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] spi: mxic: Add support for swapping byte
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_234441_265367_6DBAE4DF 
X-CRM114-Status: GOOD (  22.07  )
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

Hi Michael

>
> Hi,
>
> > I know for sure that mchp's sama7g5 xSPI controller can swap the bytes
> > back on the fly. What I did was to check the dtr_swab16 bool at runtime
> > in the exec_op() method and if it was true, I had to write a
> > configuration bit. I can't remember why I haven't posted a v2 on that
> > series, maybe I'll do it if I find some time or I ever get bored. I
> > have
> > a board. Anyway, knowing that there's a board out there, sama7g5ek,
> > that
> > contains a macronix flash that swaps bytes and also have a controller
> > that can swap them back, would it be acceptable to queue just the SPI
> > NOR patches for now?
>
> I'm still leaning towards not putting any unused code into the kernel
> and (maybe) increase maintenance. Or code which might need to be
> adjusted
> later if it will actually be used. Without a user, we won't see the
> whole picture and - at least I - cannot judge whether that approach is
> correct then.
>
> I'd say, if you ever get board, take this patch again together with the
> user :)
Is it necessary to prepare v7 or spi-nor patches will be accept?

>
> -michael

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
