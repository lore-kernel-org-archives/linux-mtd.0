Return-Path: <SRS0=9794=3U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E54C2D0DB
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jan 2020 15:47:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2606215A4
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jan 2020 15:47:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NU+I2aiy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktH5RzxX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2606215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zfmcpea5wJQILhcdzb5saIx0CtdNHtugJA1JDA/Uzuo=; b=NU+I2aiyYf4zIe
	zsV3n+5xc32WRDgXOAFn3iKkHfRjb5SxOeWOBbB5SHiRB9FEs+7w0CeR58dU1IBk2Sii8j+qYcbUg
	hYTkysE0jhxD6cj5tULSgEQdkwPeNezgzoW9tfHeRWbVpwg9L1xDJNLlxo5V9OIF16jUONlA86BE0
	lLVf/B/jS2GE7BROaQNdMnyjrEr9DO8iQ271zX7z/+NWsdpHrSVCWNmmE6z71FJBXnvxaw7lZSUXa
	h9dkxZ3/f80ROh+2isC8BJmjeumWH2FTqwbD6ilhx7SqeckWq4mHd0+Ng4DrI40TghfcdRCMe3k/h
	5CSDKeXupDLu55qbOqrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixYVS-0006Dz-FT; Fri, 31 Jan 2020 15:46:54 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixYVO-0006Cq-LL
 for linux-mtd@lists.infradead.org; Fri, 31 Jan 2020 15:46:52 +0000
Received: by mail-pj1-x1043.google.com with SMTP id e9so3011456pjr.4
 for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2020 07:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=20E0tLR1e2lz9G6IdX950Sr/F1JbRNRc72pTD1KbpUo=;
 b=ktH5RzxX5QP2mEJgmf+3+EmCIxCLbS47vn+m0ivWcrbF7Ug2/wJxNnnKlLYS4zpfC/
 wOST6FQY5IeaEdBxsx2xvoENwSFgicaHwhlrGp04lemZNVdnEL+TQn9e1H9n6Q2tJPtI
 7TeWU9SztQqXVU87G/b40uUOXotnao2uadaFIvUeaj/TfVwhDSPoGGLW3AixLo7JdVNn
 EfnjKxjQxbdSK9XZYbVWYgScGs8OleW841MzlEdYzol0kZkF8jjuGDOE93u/q4dPCbIu
 AOvHcOL3RZAXi0Q9bNWAEUszaEHh4Hfkbs9XUWdGwiTLQyN/YHG1m5T/RLidmZGjeN+o
 weog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=20E0tLR1e2lz9G6IdX950Sr/F1JbRNRc72pTD1KbpUo=;
 b=UshASqgkbxdmg4fQXHNjGWOAyEMCiPgo3tMREpzaEZDFdbFil+4F4aNdDStzgVepUi
 Yv1lSDlYu9jNYsPYQQmGsyQ4jQ2Sx2cAxHZCD0gg0raqPgyFe4SzuEvfzVZdI2/ec2mD
 TzO1qYJFxBLeSexSYtMFxCb5TsqwRrQRZn40Q13RbyfGOgmCrqXoWSKoBySxjIXgXBOU
 8USZA0uFqPlZF5CbwUDubcViA37tMrxtqqp9NmNVgiXjfe3vJhMFveGiav7URDkCN8zB
 Yb9QPXbpT6KGL/SdR+Z0h6h2DlB+XgUZTYFtNpJLy4SYR1HaBLgyx0f9pUl3s16K262q
 sjmA==
X-Gm-Message-State: APjAAAUOP1bHeeEj3ZYNOpTOQYG31kiiZWy/lfMOZxxOiiUgdqGDGaRL
 b3NUbrcRrsRWlZU694rg5AvBk0/wthisLrfKkyE=
X-Google-Smtp-Source: APXvYqzqatk1VScaz2nJKJO1gCXqZihSdef8LqWJv55wUY4BND/+R9BV7L3dBUfBB5VN+XOCF9JwnodMXvjtodssym0=
X-Received: by 2002:a17:902:d20c:: with SMTP id
 t12mr11072217ply.18.1580485607842; 
 Fri, 31 Jan 2020 07:46:47 -0800 (PST)
MIME-Version: 1.0
References: <df67b562-7d82-19f6-7581-680190a7772d@huawei.com>
 <20200110140726.GB5889@sirena.org.uk>
 <6db83881-927c-d11c-9c77-23a45892ddab@huawei.com>
 <20200110193119.GI32742@smile.fi.intel.com>
 <612a3c5d-69a4-af6b-5c79-c3fb853193ab@huawei.com>
 <20200113114256.GH3897@sirena.org.uk>
 <6dd45da9-9ccf-45f7-ed12-8f1406a0a56b@huawei.com>
 <20200113140627.GJ3897@sirena.org.uk>
 <CAHp75VfepiiVFLLmCwdBS0Z6tmR+XKBaOLg1qPPuz1McLjS=4Q@mail.gmail.com>
 <20200113142754.GL3897@sirena.org.uk>
 <20200113143403.GQ32742@smile.fi.intel.com>
 <0252a76d-7e2b-2c70-8b1b-0d041d972098@huawei.com>
 <CAHp75Ve=ZwJe2XV8Y1UN6sMe1ZHOBwUtRUD=aGqhR4Gc7BNUcg@mail.gmail.com>
 <136bd652-dcb9-3efa-a92f-2263cbf840ad@huawei.com>
In-Reply-To: <136bd652-dcb9-3efa-a92f-2263cbf840ad@huawei.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 31 Jan 2020 17:46:39 +0200
Message-ID: <CAHp75Vd=TY0tPfSHMSLTh1Pgg-E7MCP5Gym1yjpLgH0Tx-2xSg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] spi: Add HiSilicon v3xx SPI NOR flash controller
 driver
To: John Garry <john.garry@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200131_074650_723435_97CA3B90 
X-CRM114-Status: GOOD (  16.89  )
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
Cc: Jiancheng Xue <xuejiancheng@hisilicon.com>, chenxiang66@hisilicon.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 tudor.ambarus@microchip.com, Linuxarm <linuxarm@huawei.com>,
 linux-spi <linux-spi@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 liusimin4@huawei.com, Mika Westerberg <mika.westerberg@linux.intel.com>,
 wanghuiqiang <wanghuiqiang@huawei.com>, fengsheng5@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jan 31, 2020 at 2:03 PM John Garry <john.garry@huawei.com> wrote:
> On 31/01/2020 11:39, Andy Shevchenko wrote:
> > On Fri, Jan 31, 2020 at 12:08 PM John Garry <john.garry@huawei.com> wrote:
> >> On 13/01/2020 14:34, Andy Shevchenko wrote:

...

> >> About this topic of ACPI having no method to describe device buswidth in
> >> the resource descriptor, it may be an idea for me to raise a Tianocore
> >> feature request @ https://bugzilla.tianocore.org/
> >>
> >
> > The 19.6.126 describes the SPI resource, in particular:
> >
> > ---8<---8<---
> > DataBitLength is the size, in bits, of the smallest transfer unit for
> > this connection. _LEN is automatically
> > created to refer to this portion of the resource descriptor.
> > ---8<---8<---
> >
> > Is it what you are looking for? (As far as I know most of the
> > firmwares simple abuse this field among others)
>
> I didn't think so - I thought that there was a distinction between width
> and length in SPI terms.

My interpretation of this field is a data width of the slave.
Basically what we have as transfer->size inside SPI in the Linux
kernel.

> So how do you find that most firmwares abuse this field? AFAICS, linux
> kernel doesn't interpret this field at all.

From all tables I have this is the result of appearance (some of the
tables are like 10x times present in my data base, but nevertheless)

    140 SpiSerialBusV2(0x0000,PolarityHigh,FourWireMode,0x08,
   411 SpiSerialBusV2(0x0000,PolarityLow,FourWireMode,0x08,
     1 SpiSerialBusV2(0x0000,PolarityLow,FourWireMode,0x08,
    36 SpiSerialBusV2(0x0000,PolarityLow,FourWireMode,0x10,
    35 SpiSerialBusV2(0x0000,PolarityLow,FourWireMode,0x18,
    35 SpiSerialBusV2(0x0000,PolarityLow,FourWireMode,0x20,
     1 SpiSerialBusV2(0x0000,PolarityLow,ThreeWireMode,0x10,
     8 SpiSerialBusV2(0x0001,PolarityLow,FourWireMode,0x08,
     1 SpiSerialBusV2(0x0001,PolarityLow,FourWireMode,0x10,

So, it seems I stand corrected, the field is in right use, although
cases like 0x10 and 0x20 should be carefully checked.

We may teach kernel to get something meaningful out of it.

-- 
With Best Regards,
Andy Shevchenko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
