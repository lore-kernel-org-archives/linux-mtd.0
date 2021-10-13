Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D57C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 18:23:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54A74610E8
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 18:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 54A74610E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZCKI2WnsmuWVxHNleYrryg4CvFiqLkP+/pWeSFS50A=; b=Ip7/VRg2/TBhSA
	gH4q4eO8JwTuC5Uje43E1k/llh8gPmn0/IvtO5BQAWF6JzeCwoITUppozkt7LDAmyOYLSyzFIg1kG
	VpYz0K+hHIOar1ZrnNVEp1MqfgJX6N+nsYeSfPbpIHevua7alBiJU9qc106+Tpy9FueftoOavf+87
	F29ejUUpoi+f4GAhwdi5qpxiI8/NAeTc+qevgZdSoTHXrvEOVT/VVajARHVP72p3z28d7NDPk2vaz
	k9ky7Yi+lZkkHPAyUQim2wwioe4R80nIlEOIZMgDax3bj30iDjxUu74t7cgna1A/L8VZ2umC14lW9
	YsQ8bbVOs32Eo8fqIzdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maiu1-000Hnl-Pb; Wed, 13 Oct 2021 18:22:57 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maity-000Hn9-Kl
 for linux-mtd@lists.infradead.org; Wed, 13 Oct 2021 18:22:56 +0000
Received: by mail-ua1-x92f.google.com with SMTP id i22so6335856ual.10
 for <linux-mtd@lists.infradead.org>; Wed, 13 Oct 2021 11:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JG1HQyyMPQTh6Csd4yNqjO3wLupEnpfFk+sqAUPlTOk=;
 b=TFFzvH5Pu9WlzGI0InQxPwB3KxmNZSBDchOU6UGGLQGd0Xsenl03vyAl6SHXmxKQjy
 4qtW+cWYaPU4dr06zhFDGTUeLuqB776EveF7n2HPp0DP4OSGPKK6bfo9mGC73+t9asrW
 o75CBfjl6Ew/0ElWGVKnDFP6cyo6kQIUQlj3jQ0qrihFt0U9dE+TeihI0TxAfSf8lyeL
 ndGEYzI0Ey6wWTuWJuA96NjDAN9M2blmx7UFq3NkQYbpBFlJHkuZv5CIF0yrrbMqnQPD
 LubhmcsyJxzLoWH8v37eVMJAtypdbjA2h4XEq8hqTUCm8PqHOeL4kYfjICp9It2mktOZ
 pRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JG1HQyyMPQTh6Csd4yNqjO3wLupEnpfFk+sqAUPlTOk=;
 b=Bnddv83AAA+S7BIKTWQEcw891g9BXuCe3wLV4TzJtU1t7UJ4WYStDBfyr9sTevFTzV
 9mxcv37YKD2NZBBDK/Oy69l2IBslDsPHw+6ZSp/W/dfUoNW+P2jb+h94nydgxavh0Kgq
 Y9iw6VcWa4nKiWSQ5mI/GFO4I0OSN3kACDZsW5VtEy7IjttHW2GF9lmCEK2vKR5oxhTn
 aewamXr4b7jLuxqOh1Eji8cZrWd+62lVroWJaRAQVNGC1Iw9qENhuuAKPyLuUT0wmn5t
 JGQJAvYeMtidBkmBEWqtHIr2gzVhLMmuGwJYaWDWMIKFgQzglFDoG1nBgG8QZrwXLldz
 gxnA==
X-Gm-Message-State: AOAM531iOoiKhc1sQuae4zRoqFF302ugUOkRbpLAoyQvDh6BCW5l7d2w
 KOGZHVy/Fud8oIFjBFZm4xkLBmQGaCwyTF9ksnjZEg==
X-Google-Smtp-Source: ABdhPJz69Ai0nTaBa5bEtqV6hL9jm5/HIGfcBAki8oEE+O1Uf7WRzLApuYsiDnVEd0spVImB3Qr9gvfCbOLu1452jrk=
X-Received: by 2002:a67:e090:: with SMTP id f16mr1204482vsl.17.1634149372078; 
 Wed, 13 Oct 2021 11:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210930100719.2176-1-mika.westerberg@linux.intel.com>
 <20210930100719.2176-2-mika.westerberg@linux.intel.com>
 <CAArk9MPWh4f1E=ecKBHy8PFzvU_y_ROgDyUU_O3ZQ0FuMhkj5Q@mail.gmail.com>
 <YVqOjF/xjqFV+Dl3@lahna>
 <CAArk9MPY+rCQse+JXtvb4KqunN9FZ=toK_v=PV-ro4cO6=5s7Q@mail.gmail.com>
 <YWag+RpkujjggPsW@lahna>
In-Reply-To: <YWag+RpkujjggPsW@lahna>
From: Mauro Lima <mauro.lima@eclypsium.com>
Date: Wed, 13 Oct 2021 15:22:40 -0300
Message-ID: <CAArk9MPKLy0abox-ULNNuQ1XO_96aJn449qM0pAp_amxFY6RDg@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: spi-nor: intel-spi: Disable write protection
 only if asked
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee.jones@linaro.org>, Michael Walle <michael@walle.cc>,
 Pratyush Yadav <p.yadav@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jonathan Corbet <corbet@lwn.net>, 
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_112254_764197_478B8B3B 
X-CRM114-Status: GOOD (  35.71  )
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

Hi!
On Wed, Oct 13, 2021 at 6:04 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Tue, Oct 12, 2021 at 03:49:22PM -0300, Mauro Lima wrote:
> > Hi Mika
> >
> > On Mon, Oct 4, 2021 at 2:18 AM Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > >
> > > Hi,
> > >
> > > On Fri, Oct 01, 2021 at 05:23:23PM -0300, Mauro Lima wrote:
> > > > Question for maintainers: With these changes is it safe to remove the
> > > > *(DANGEROUS)* tag from menuconfig?
> > >
> > > I don't think we want to remove that. This driver is not for regular
> > > users, at least in its current form.
> > Do we know why this is still dangerous for the user?
>
> There was a bug in the driver in the past (that was already fixed but it
> did not yet reach the stable trees or something like that). At this
> unfortunate time there was no DANGEROUS in the name so Ubuntu kernel
> went and enabled it. Combined with the bug certain Lenovo laptops BIOS
> turned into read-only which prevented booting from non-default devices.
>
> This happened even when the driver did not do any "write" or "erase"
> operations, just clearing the status register or so.
>
> We don't want that to happen again.
>
> > My plan is to make a sys/class driver to query write protection status
> > of the SPI, this will be
> > used by fwupd to gather information about vendors, also should be easy
> > for the user to use
> > 'cat' and see the information from userspace. For this to be possible
> > we need kernel engineers
> > to compile the kernel with this driver enabled, but the (DANGEROUS)
> > tag is a no go for most
> > of them.
> > Is there anything I can do to make this possible?
>
> IMHO we can make certain parts of the driver, that are known not to
> cause any issues available without the DANGEROUS. I mean the controller
> exposes some information that I think you are intersted in and that does
> not cause anything to be sent to the flash chip itself.
This will work for me.
Thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
