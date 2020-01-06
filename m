Return-Path: <SRS0=lLyx=23=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE889C33C8C
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jan 2020 16:33:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0581208C4
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jan 2020 16:33:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BhYP12Xz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0581208C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rockwellcollins.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VIensrft0xlLzTAZtzqPlsgd+U/JvEwpZC+1iJGfGZ0=; b=BhYP12XzKitExn
	/bgyCnLA0ynIdLsA9RzDD11RugVpfv0OANfIJIpQiJcjwwULrmt1+B52995OVok05VyFnh7nfeJos
	o+I4XSsDYYtM5rXxw32X0i0bL44G4Tbl4JjB8l1CnRP0SHN0RE3DyNCkNVCfl9xUEnAaW5R78y+Tz
	ewqVonI4B3mVB7RXt3jChCpf4osRPr8PbynUh3RTH3Orvo9RwRL3s62RDQvdaoTvH6JjhUXULskQ6
	eix6JtPARURATZhWJZ5Nyg1Xk7kvG7+qCFHeDR+00Rg90g5J4Ntjb1X8vvO4/qaiwbzaaLedBMJyZ
	x2aJ9P9SRIE+axDjA7oQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioVJq-0008HO-0f; Mon, 06 Jan 2020 16:33:30 +0000
Received: from smtpimr.rockwellcollins.com ([205.175.227.47]
 helo=da1vs03.rockwellcollins.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioVJn-0008Gs-Dt
 for linux-mtd@lists.infradead.org; Mon, 06 Jan 2020 16:33:28 +0000
IronPort-SDR: wHenBJQ+Tskyqg2G55srqmT1XLi6kDShahH0GLlJlLULFGwnuNTp5Sa9Nu7jqqE/2QOMXNjqSf
 u3c6SjndivbxFzzY/X684pxrXrZCSUHpwyWO8aGYwdF3kLxv8gqPUimXb07i5M3U7pFkI1nWtq
 FK3PGzu1GENNB8GHUMxFVq0a+Jmu8NIzIkuc3RzjHtmboM1USPiY9u8ywvPnXXFkjuPKb+hsnU
 iBsK7nJe4UDSdUo9Nz1TFIDJtw1GHlYHuVdH16UnaAajNJpEGJQ3zwiZNTze24HlhyLWNgYvNH
 ycg=
X-RC-All-From: , 205.175.227.20, No hostname, joseph.kust@rockwellcollins.com, 
 Joseph Kust <joseph.kust@rockwellcollins.com>, , 
X-RC-Attachments: , ,
X-RC-RemoteIP: 205.175.227.20
X-RC-RemoteHost: No hostname
X-RC-IP-Hostname: da1ip03.rockwellcollins.com
X-RC-IP-MID: 36957225
X-RC-IP-Group: GOOGLE_RELAYED
X-RC-IP-Policy: $GOOGLE_RELAYED
X-RC-IP-SBRS: None
Received: from unknown (HELO mail-ua1-f69.google.com) ([205.175.227.20])
 by da1vs03.rockwellcollins.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2020 10:33:25 -0600
Received: by mail-ua1-f69.google.com with SMTP id t26so4732401ual.17
 for <linux-mtd@lists.infradead.org>; Mon, 06 Jan 2020 08:33:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TiWcE3nCea6IOCVNokQTgGT8mF7XjlCaYtLcdB5txiY=;
 b=fIx9ukOdawaxkshLe+AH1pE93amn0Z/hnTrBSmeICtf9QYGr797xDPWC5HVDlJ1VKR
 1jR7yhxcFXT20YpjopY7Du/xIqo6SSpf0VN0uKFLNN84IXQXwilBjV+/NpIRD1cqkic4
 WEbsObBByLBS7yRhZ1g+nRBgDm/SIsaP381Ad/UNUo2Fa+tJHKi8qVcJ944OBtHB+LEf
 7VB0daFdPJVbd9LD+TT5GDpNpV86aa3fEV41t7YYt5e8JXoo3qF+yzgdjlifv8dn1XkW
 /kAvCdehXQz6x5gBRzc/49yBhqqeecwNHnMW+L5O0RZWDc1nutpUeM1IfAYIIBAzuIdd
 6xhw==
X-Gm-Message-State: APjAAAWr53sMwRQYTQ6CCqQYi1LstziOiy3sTWTwXe+IawE5vxTClkB0
 ZOqqcWGm/heKhT7zHNOirYdCRSjYM8KrtnntOm38cJr3BwGKWnRxeGEcQ3f8R8ScoIhzg23oNbO
 3/jhL73W75Ce15Rdw3laGZDhwiWJTb7ek1ZL+WrWXKuRs+Vm13awcatFKpvor
X-Received: by 2002:a9f:2635:: with SMTP id 50mr60480956uag.2.1578328404479;
 Mon, 06 Jan 2020 08:33:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqxo0bkiQePU20UC/MfDGlZYdBpEJn8BIdxB1+UXnXwFQdD4m0FLPCzK4zQX4FoOiFIdwa+Ms4qlVwWQNHKc5A8=
X-Received: by 2002:a9f:2635:: with SMTP id 50mr60480921uag.2.1578328404050;
 Mon, 06 Jan 2020 08:33:24 -0800 (PST)
MIME-Version: 1.0
References: <20191117215547.163120-1-brandon.maier@rockwellcollins.com>
 <ca733470-b953-d805-110c-2696bb9576ee@microchip.com>
 <CAJzBf2Y55hXOpKAFkVwXx2=cX+36t8EuucVniDyne+_yp8eJpg@mail.gmail.com>
 <7d97c9a2-ada5-be2e-fad8-40e26f1be65a@microchip.com>
In-Reply-To: <7d97c9a2-ada5-be2e-fad8-40e26f1be65a@microchip.com>
From: Joseph Kust <joseph.kust@rockwellcollins.com>
Date: Mon, 6 Jan 2020 10:33:13 -0600
Message-ID: <CAJzBf2b7rOYPLr_GfpGx0P7oFy_3gEbf0mOPdYSVAt97Y3bafg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] mtd: spi-nor: Add support for sst26vf016b
To: Tudor.Ambarus@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200106_083327_545445_AEAB7B45 
X-CRM114-Status: GOOD (  21.37  )
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
Cc: marek.vasut@gmail.com, Brandon Maier <brandon.maier@rockwellcollins.com>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Tudor,

On Mon, Dec 23, 2019 at 9:34 AM <Tudor.Ambarus@microchip.com> wrote:
>
> Hi, Joseph,
>
> On 12/10/19 9:49 PM, Joseph Kust wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > Hi Tudor,
> >
> > On Tue, Dec 10, 2019 at 11:10 AM <Tudor.Ambarus@microchip.com> wrote:
> >>
> >> Hi, Brandon,
> >>
> >> On 11/17/19 11:55 PM, Brandon Maier wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>
> >>> From: Joseph Kust <joseph.kust@rockwellcollins.com>
> >>>
> >>> Adds support for sst26vf016b, a smaller variant of the sst26vf064b.
> >>
> >> How was this tested, what controller did you use? Did you test the quad read?
> >
> > This was tested on a sama5d3 SOC using the atmel,at91rm9200-spi
> > controller.  The quad read was not tested.
> > Kernel versions tested were branched from mainline 4.14.115 and 3.14.79
> >
>
> Thanks. The commit message should specify what modes were tested and
> on which controller.
>
> >>>
> >>> Signed-off-by: Joseph Kust <joseph.kust@rockwellcollins.com>
> >>> Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
> >>> ---
> >>>  drivers/mtd/spi-nor/spi-nor.c | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> >>> index f4afe123e9dc..500929903f61 100644
> >>> --- a/drivers/mtd/spi-nor/spi-nor.c
> >>> +++ b/drivers/mtd/spi-nor/spi-nor.c
> >>> @@ -2538,6 +2538,7 @@ static const struct flash_info spi_nor_ids[] = {
> >>>         { "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
> >>>         { "sst26wf016b", INFO(0xbf2651, 0, 64 * 1024, 32, SECT_4K |
> >>>                               SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> >>> +       { "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>
> The dual and quad reads will probably not work because they require
> that the IOC bit from the Configuration Register to be set to 1,
> which is not the case: the default value at power-up is 0 and we
> don't set it to one in spi-nor either.
>
> I can drop the SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ flags and apply
> your patch without these if you want.
>
> Cheers,
> ta

Yes those flags should be dropped.  We likely copied them from the
other sst26 flags and thought they were the same.  You are welcome to
drop the flags and apply the patch.  Otherwise let us know if you'd
prefer us to re-send.
Thanks,
Joseph

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
