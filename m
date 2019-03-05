Return-Path: <SRS0=LjUq=RI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CFFDC43381
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Mar 2019 22:13:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF1A120643
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Mar 2019 22:13:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SYEly5NA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="EKfDVCMX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF1A120643
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NgrPiaPJSKWdq2Eauh5dOfVOfNkn6wq3+MxPuxqglzQ=; b=SYEly5NABdiSUd
	YpbGUNlwh7UGgejQiX2dMtuFz9U2ARPp4y+hMdb2Iz1mNm2NcwDZ0S9RXE9AuyPBPxmegEOZcUTdo
	15znduTEINQPhPIpPIb71J589GA83cqvpsg9NYsU3FUMTIwCQo2GL6P4OQ7uPvit3Apw+llj0riz7
	DhItdEFTbuwT1tOjX4vKEjLvp0Bx0B4wLu0E2bUHCrSXXCtTJku5zZJ67mazMgi13OIUxmnP0QggC
	UxK05TJGQ8hkpJYY5dAnXIDt4QMAWGs5wCzaTzzyJwpxsxvZOgodCV6ENdNz+zJrAS6JEWGmqmH5g
	50FtJ6icdt24dElhORrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1IJA-0002aw-V9; Tue, 05 Mar 2019 22:13:08 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1IJ7-0002Zs-Fa; Tue, 05 Mar 2019 22:13:07 +0000
Received: by mail-oi1-x241.google.com with SMTP id u128so8182613oie.2;
 Tue, 05 Mar 2019 14:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WYJMlp5Vut5df0LwvjRW5FdzMglfOFR6RfxA4GeSLr8=;
 b=EKfDVCMXX1msbJMLIyY8hpA1mcUrfM9FK61JvpEImEwroyZum23uexEqYJzsa4gc+e
 hPmyyFRh5IG3/+fQ4HFE7/gDUfc6yUbhqiPy2SIE/hPO52QmPn9lqXMycbG1DBCUvpyI
 ufHMC+8JY3ZJgdvHyYqtQGL6JIEzLHrMGtzXWfVORooZ5mFuJw0PjVXvDpN1kDwS7QKN
 0ZO4LLE7JBKLXpe917duXI//jF54XYU4Z1O39LLA7kL61Qjj4sslelmREwZCvViV+TRB
 JR7DVRTELoZGj6LVGOrpm2wuD9pdCOU1WH0DJwmEEx53W8q+yksgOT9lAUZwtkR0X+TI
 Ar2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WYJMlp5Vut5df0LwvjRW5FdzMglfOFR6RfxA4GeSLr8=;
 b=AxswCiILZX4d09tm/w1H82rx7TYawdHuVWVA+H2QiydnnJ47cii5WdnzfBE6g7DKVo
 uqZsjPdbdXtf8jxuJqHb+RP0eznUgLaAtYU4w4+7bn75zwCfvgeEePRbkVDszjKnR0hx
 jHoQSXrarrHd9OVvfaxmvLQtXX3Yu4kD295LQSAl702yKJsL3YoiJmD7yg0zurdCSUhb
 FvoPY7Wt8KBGo25jN7MzWWYE0XcIa4pCcrItqtWs9s3Tfhpp3HUG0VoPhzhAoIPwgIh9
 EnoM5DUqr7cr2iYen8ENupMbkFzn0PufGq8jf0CGomSWzfKDSeAwPShiTARSCSWzp32U
 /1uQ==
X-Gm-Message-State: APjAAAWkBCQMWIaBdWj0Xn0OMOlTlTBLjHvwJ6zN++5vCrRUcc8kfRom
 kraPAxHth4f6/sXCuyfYYLD3utWPmVZlRyyiht4=
X-Google-Smtp-Source: APXvYqylHzWAsDKPWuTZSoY9gnoPcVZkPUYqAe4nNyKcSRdS+QdPRss2u5afSvvh1AM7Ifn49XQdRG8YusvFuCcZdYQ=
X-Received: by 2002:aca:aacb:: with SMTP id t194mr461318oie.129.1551823982304; 
 Tue, 05 Mar 2019 14:13:02 -0800 (PST)
MIME-Version: 1.0
References: <20190301182922.8309-1-martin.blumenstingl@googlemail.com>
 <98776767-c4d7-1207-6d42-97105f289bec@amlogic.com>
In-Reply-To: <98776767-c4d7-1207-6d42-97105f289bec@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 5 Mar 2019 23:12:51 +0100
Message-ID: <CAFBinCC7P40sqrDGTuM8M=jVOFTgZLDUK6rGdNpigFoepyCASw@mail.gmail.com>
Subject: Re: [RFC PATCH nand-next 0/2] meson-nand: support for older SoCs
To: Liang Yang <liang.yang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190305_141305_571672_1C440BC8 
X-CRM114-Status: GOOD (  25.65  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jianxin.pan@amlogic.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Liang,

On Mon, Mar 4, 2019 at 5:55 AM Liang Yang <liang.yang@amlogic.com> wrote:
>
> Hello Martin,
>
> On 2019/3/2 2:29, Martin Blumenstingl wrote:
> > Hi Liang,
> >
> > I am trying to add support for older SoCs to the meson-nand driver.
> > Back when the driver was in development I used an early revision (of
> > your driver) and did some modifications to make it work on older SoCs.
> >
> > Now that the driver is upstream I wanted to give it another try and
> > make a real patch out of it. Unfortunately it's not working anymore.
> >
> > As far as I know the NFC IP block revision on GXL is similar (or even
> > the same?) as on all older SoCs. As far as I can tell only the clock
> > setup is different on the older SoCs (which have a dedicated NAND
> > clock):
> > - we don't need the "amlogic,mmc-syscon" property on the older SoCs
> >    because we don't need to setup any muxing (common clock framework
> >    will do everything for us)
> > - "rx" and "tx" clocks don't exist
> > - I could not find any other differences between Meson8, Meson8b,
> >    Meson8m2, GXBB and GXL
> >
> That is right. the serials NFC is almost the same except:
> 1) The clock control and source that M8-serials are not share with EMMC.
> 2) The base register address
> 3) DMA encryption option which we don't care on NFC driver.
great, thank you for confirming this!

> > In this series I'm sending two patches which add support for the older
> > SoCs.
> >
> > Unfortunately these patches are currently not working for me (hence the
> > "RFC" prefix). I get a (strange) crash which is triggered by the
> > kzalloc() in meson_nfc_read_buf() - see below for more details.
> >
> > Can you please help me on this one? I'd like to know whether:
> > - the meson-nand driver works for you on GXL or AXG on linux-next?
> >    (I was running these patches on top of next-20190301 on my M8S
> >    board which uses a 32-bit Meson8m2 SoC. I don't have any board using
> >    a GXL SoC which also has NAND)
> Yes, it works on AXG platform using a MXIC slc nand flash(MX30LF4G); but
> i an not sure it runs the same flow with yours. because i see the print
> "Counld not find a valid ONFI parameter page, ...." in yours. i will try
> to reproduce it on AXG(i don't have a M8 platform now).
I'm looking forward to hear about the test results on your AXG boards
for reference: my board has a SK Hynix H27UCG8T2B (ID bytes: 0xad 0xde
0x94 0xeb 0x74 0x44, 20nm MLC)
I have another board (where I haven't tested the NFC driver yet) with
a SK Hynix H27UCG8T2E (ID bytes: 0xad 0xde 0x14 0xa7 0x42 0x4a, 1Ynm
MLC). if it helps with your analysis I can test on that board as well

> > - you see any issue with my patches? (maybe I missed more differences
> >    between GXL and the older SoCs)
> >
> i think it is ok now.
many thanks for checking my patches!


Regards
Martin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
