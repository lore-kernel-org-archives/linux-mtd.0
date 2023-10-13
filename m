Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0884CDB47E
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Oct 2023 08:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wxoCR9WCDVfMBjKqggn0Jk8eA/EdvmdsS4hSLG1Y4Rc=; b=Ngz8zjtnT9ZclX
	ldb8VAcar2UiXaYVTkLn+XRZqdwCgRQACXuP614sV1+405Gdbgl6eohcXWvrXpsmK741iL1JqgZWg
	YfzLHfvsGzEpfICe4liq/O18wT1C38Sprht+QwapPwX5Y5yuyEAEs3E2ajrV+VPEvUxD1TvENOGLz
	7bi0blltagRbGmiGn/ggBlM12qV361vwsA/g0AQhIAsMyCTKTu1x88E8mlWBGAQH8IzUxmRyjsAfS
	1LWc0tjcqMxzMP8NVuBi2504R0PtSbPizu4VA+6FIysmSfBrcBDTJ0/GaVhGG7CPiTsuK2xP5q3+o
	bXrbamZJNhd+kfO8OxYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrDSy-002p7x-3A;
	Fri, 13 Oct 2023 08:24:16 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrDSt-002p6S-1L
	for linux-mtd@lists.infradead.org;
	Fri, 13 Oct 2023 08:24:14 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-27d153c7f00so1345743a91.3
        for <linux-mtd@lists.infradead.org>; Fri, 13 Oct 2023 01:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697185446; x=1697790246; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9esLjXu+4Q/Cb9LOyXitf7nc3JuRyqlIcvyk1tl1/Y=;
        b=enzHSgMQzPiarfKv+f8xv+mJ37ER/JkGN1BwGJFBKHWOHp9zyaPIOG6CabPWTM+9gt
         VZdogJgnqHeD7SJSuNvb8bU37N5q7JRVnk991i6fRLybtb+rkTwHHT2Tq4cnGCu4qOwl
         BPgcLBLOKjVhrdktagG+4pVgQXfa1o81IN0ji2wzFzK67xwyZ4c4DbsHQe7x7l2C3SAK
         HMkjirQ5jzSJURCOgGLa7SkaI5xKOg6jCTkDmaC8FHwbFe599qJCRw0Rog4hf81hhvHb
         kObgaoOPbv2nbk9l70QD3reakIFpwNq89Xth1dJuIkP4cgO7UcSdPrjhbTUmZx/GOy6S
         fJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697185446; x=1697790246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9esLjXu+4Q/Cb9LOyXitf7nc3JuRyqlIcvyk1tl1/Y=;
        b=snvvlj4yLKrIzYjM2kAuaKFvUo8n9DH9K2IW85ofZ8onMw3w/2NS5DA8qDog5aBRLJ
         Q1AGvHFmt0nyxYvt51citEWuqdRNQblg78ilMpMT6FZNS3E7TscqpCwgNFHBHDgT8etp
         ulfke8/7sOb52rnsOG5GjXSimPfMJ/Lb6v2VtDXxZZnLD06GPBx7eYkniwUo1SuTpCrs
         RJBUSOic5X7wD2Fu1qDM276XPkwoQBTbzyusa2rOcbRxXXiww8XwpzgO2H7YmeVK+q+y
         nb0rq5uvE3zvuReS9Y2FNLwwJJs/b7hh08OxN52KFj3YIWQPNCMIVR/NBmtpLL0M8VXA
         Lsbw==
X-Gm-Message-State: AOJu0YwEPsBsKivNEvbuRyPQZt2zEKn/NJkW1qExjwC+KWhTkp/otcpn
	13zQPEO+iH/dcXYhfj+43khEzXbbk/5mO7zTS9g=
X-Google-Smtp-Source: AGHT+IESRFkHvb9StFE3ZurUdcWL6FYgPTG+ulUqnBa7FlSNpghv+L/YT00nHRWQ+jk18OZjzWUn1HMPtmTkfxe7jAk=
X-Received: by 2002:a17:90b:1643:b0:268:10a3:cea8 with SMTP id
 il3-20020a17090b164300b0026810a3cea8mr23470114pjb.9.1697185446310; Fri, 13
 Oct 2023 01:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
 <20230908064304.27757-2-jaimeliao.tw@gmail.com> <b998ea18-8ce9-83b0-f42f-18e5ea08175b@linaro.org>
 <mafs034yppc28.fsf@kernel.org> <f60995d3d02d7639204c2c16abf9bfd7@walle.cc>
 <54e5662f-baf4-4660-9fc4-7959d2405120@linaro.org> <29bb3d952b9f49961da5e01cf86f9c4f@walle.cc>
 <b705c36c-1d76-45a4-ab8e-dacdcb844509@linaro.org> <cdd8fb4d9261892345588388a5de262f@walle.cc>
 <CAAQoYRn9C2biQXfcJYK3SKQcGVZc3ibvP6q5pbk8v78CS+gWVA@mail.gmail.com>
 <5fcf12b6fdb2afbeb6fd1f0c22e691c7@walle.cc> <CAAQoYRn51R3Ok1KEbdRVvwEoU+A4DEK8h2f7jCvn-cotmzFx8A@mail.gmail.com>
 <8ec055f3a5bb69e6d72d4f4c5c7946bf@walle.cc>
In-Reply-To: <8ec055f3a5bb69e6d72d4f4c5c7946bf@walle.cc>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Fri, 13 Oct 2023 16:23:43 +0800
Message-ID: <CAAQoYRnYQBXPX59u3y7_Omz1qW=XuqGi8dy6trzfJXGTA_QCqQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] mtd: spi-nor: Add manufacturer read id function
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_012411_453554_4670D438 
X-CRM114-Status: GOOD (  17.87  )
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
> >> > After checking with Macronix designer, a-a-b-b-c-c is the data
> >> > arrangement for
> >> > read id operation of flash in 8D-8D-8D.
> >>
> >> Could you please point to any specification? I doubt there is one
> >> and every vendor will do it slightly differently. I mean we already
> >> have some flashes which (apparently) reply to RDID in 8d8d8d.
> >>
> >> For example, see the Semper flash datasheet:
> >> https://www.infineon.com/dgdl/Infineon-S28HS256T_S28HS512T_S28HS01GT_S28HL256T_S28HL512T_S28HL01GT_256-Mb_(32-MB)_512-Mb_(64-MB)_1-Gb_(128-MB)_HS-T_(1.8-V)_HL-T_(3.0-V)_Semper_Flash_with_Octal_Interface-DataSheet-v03_00-EN.pdf?fileId=8ac78c8c7d0d8da4017d0ee6bca96f97&da=t
> >>
> >> Have a look at Table 78 (or search for RDIDN_4_0) and Figure 28.
> > For Figure 28 in this datasheet, I think it means that data latch
> > while DS raising and falling edge.
> > The data arrangement of read id follow the 9.2(Manufacturer and Device
> > ID).
> > As below are the data arrangement for vendors.
> > For Infineon, a-b-c-d-e-f
> > For Micron, a-b-c-d-e-f
> > For Macronix, a-a-b-b-c-c
>
> So there is no standard among vendors, infineon as well as micron is
> using 8d8d8d and macronix is using 8d8d8s. And - please correct me if
Macronix read id operation is not 8d8d8s, it just look like 8d8d8s on datasheet
but flash send 2 bytes data per DQS cycle exactly.
I think whether to use 8d or 8s depends on how many times data is latched
within per cycle.

> I'm wrong - the data strobe signal is optional.
As I know, data strobe signal is needed when 8D-8D-8D mode.
Infineon data strobe signal called "DS".
Macronix and Micron data strobe signal called "DQS"

>
> -michael

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
