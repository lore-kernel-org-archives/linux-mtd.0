Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F33A4C433E1
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 09:10:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1F86206F0
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 09:10:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rwIflfZg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1F86206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NEyF1Yam+xVVTl+q/wUaJZaK90GPVHOhrieg3tP2E/M=; b=rwIflfZgx/4IoAyvFB6fS+Bly
	OyVmPyXEifv0kQ0UXhdpCzkGqrcoJpk28dPkt0GpZpc5c4SK2VT3lJteWN5XM97NovEgPxWI731Jj
	0vCNbKMJMjq1kvKi1Y5NVi/U+X2UXJdv1+T2VqvuZOb5DZcf5Tzy7dW4ud+o7PhDzMNLMQn1qWBUA
	0th3o8ofWq7+XlVdSEt9T2fVoWtYSX85fMJO5lkfjzgDVchLm05URY+0oPsRYWjUesQJHaS4EGGTf
	Qkcm6nKg4vM8B9PV/lFJO3hOhrdAfLT3jrygOxH6o2jP01fYmug6/FBLhuTklY+6/+une7XD1DGtb
	bd6h1QOag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA8TO-0006Zj-R1; Mon, 24 Aug 2020 09:09:02 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA8TK-0006Xh-Rc
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2020 09:09:00 +0000
Received: from mail-qv1-f51.google.com ([209.85.219.51]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MKt3r-1jvdtJ4A17-00LAtD for <linux-mtd@lists.infradead.org>; Mon, 24 Aug
 2020 11:08:53 +0200
Received: by mail-qv1-f51.google.com with SMTP id dd12so3407875qvb.0
 for <linux-mtd@lists.infradead.org>; Mon, 24 Aug 2020 02:08:50 -0700 (PDT)
X-Gm-Message-State: AOAM532Ffc/qgoCEecYoi9IuqAHfuACtMZFrH7OqycIqLyGt/7yzb0l6
 iCeVQnZpC+hA0BKjGbjb8OUolWq6q3lrUPkClu4=
X-Google-Smtp-Source: ABdhPJwZX+cjJ6iQYsZP8QaU/HljAAPbR5R+V1AQGPTEA6x/4DhuNUmNMX30QFbj29m2jqEE9gD2C7ba4jC+Fn0bWIM=
X-Received: by 2002:ad4:450e:: with SMTP id k14mr3691202qvu.211.1598260129733; 
 Mon, 24 Aug 2020 02:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a3mf8_Y4DWe3WuBO-Xo0N4Jj=-rrtFzD6w0TriGZPu1_g@mail.gmail.com>
 <CAFmMkTFzmC=aY0gR6urLu-8Oq8aeHBUWi-TodG8XhXKCcC057A@mail.gmail.com>
 <CAK8P3a13N_wNORz_3cYHTN8t29pPrY+dJ+g+1Ga_MmG1TmrUQw@mail.gmail.com>
 <CAFmMkTGm3pMsBzEenYOsRbhOZKFhbHiZ5LxPyVmTdYTTRpKzVQ@mail.gmail.com>
 <CAK8P3a2_RV33kiJ0c34aopZ4iG7LYBR-u=-+BbC+Upyjh1T0Eg@mail.gmail.com>
 <CAFmMkTHqQO1Gj7VeXr4Y_Umb1KzZc2Pf=1pDQvPPpb_XeAFPqQ@mail.gmail.com>
 <20200819065721.GA1375436@lahna.fi.intel.com>
 <CAK8P3a0Bq-ucgC4Xue+B_HV97pTX8YRr4hYh1gfrfGBV_H1EUQ@mail.gmail.com>
 <20200819091123.GE1375436@lahna.fi.intel.com>
 <CAK8P3a19MLfQARXEWzCD-ySq4t9nsyryB+con33HsQ193+muMw@mail.gmail.com>
 <20200824082227.GU1375436@lahna.fi.intel.com>
In-Reply-To: <20200824082227.GU1375436@lahna.fi.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 24 Aug 2020 11:08:33 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0==cZDHwZfqvCuvUg9jfjBOBG+AAomE9eqJ2xm-xNLvQ@mail.gmail.com>
Message-ID: <CAK8P3a0==cZDHwZfqvCuvUg9jfjBOBG+AAomE9eqJ2xm-xNLvQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Do not try to make the SPI flash
 chip writable
To: Mika Westerberg <mika.westerberg@linux.intel.com>
X-Provags-ID: V03:K1:UiM8/1/+uYJB5E48nmjhOWNartMl9OwSg4a9GYDexStiuuXan0n
 8PU0Iq65dl6OJ1u9bOsX3gX9kCEZ+uYM8bZKKjh9OwkqyjvrMEwyf5usotmqJAu6xkiDOjp
 Pa414fUyAzdbDngd+/Ho/+eXWRCBpjpWuPlhIdiifvG7Dy74Nrhq3w+OOtPf1PyU5dyw6Ht
 eC2FFZ1WiAjuuq12WSaiA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oB/nPaY1eCE=:yB19sz0j2tTxQsl8qJgscy
 /IAlOXW5x9LVfKuBf6yxYUKTcPWmL4g0qp62tIK0/cMB2bAgP2un/TKTlFYvUkXfuvunVagkc
 W4O85mGaOqxxsr2OSErGKCEA8Pu3kQYLcKtiBJqKxQ2xJkcI2Gmqj7HlPmtxgWFleMavw9Kap
 sYaxr6lcwnXDD8bo8M5y1+miudom4ROJV35wVKeHlNXyqraTEZ97I4D+jP1qIBCWyC8XU1ZGA
 VRuf3VdyjQZPvmq2yqsnE4L64E6xw42icgwAXk+1CXu4ODmpKnHZwOzqjnY9EWpeVqpyfetqq
 SAZeMZSLP4fdNHb+xNf68tqXtWnaazip0fI+xXp224t7E2C+eHUgEmYxNfLJG5yuDn6rHj+jF
 noO/65vAy157UUP1+KQVUvYb2g2NDs9GkSc49zV2Q1QUgF/rN/76iz5ti3/g5yKveASEUzI2S
 SidtnERex5dOlzBic8DjhnXKStykfzPPsKYuerPZH+su14igGUMXaq0MtmwQ17f1tjGqaTgvW
 BCZHJU+5Dw6uQx8n8t67pyfE+QyircM0xWYHVrI2vvPKkTtBhIysl7iQDjNlL6hsEj5KfNC3n
 NNoXbqSUwCS86CItL+t8Rb9kAkVbXG0OGG52vlm3XbXg2tXxyBD/Cqs4SnIrnEZFN7t7moDtQ
 nKhhsRkwwF+rglK5J4Ty3z4fLnMw/KlPsYFGqFxVpwOb+iOzBK5HQVczeUNzJK17isiW4yAIv
 PMbcmUTDDlVTiGOYvK/OTBvCMO3JH8c9kQtGJuqe0uu4P+R/ZUnI238+56dXsnDD3DwRn/FMW
 nc98QhxrtH3dSigjF6x/6mScE8y7Wizt53dgyWXGs+ZxCFKdN4e6tqTolkPxbbhCJvTFbgvqa
 S3Y5jmKQG6/kxmPUzvqsPxFJLb3W9yhDuCM66N39S4GRzeuGM8y8vOF1+cTkC9Zsda1oPcYR1
 wtnFGZL188TMtT/uvfPgKAzOM/HJlerRYVibGer0ftYo6wzXTeEg6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_050859_160997_D74B7096 
X-CRM114-Status: GOOD (  22.29  )
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
Cc: Richard Hughes <hughsient@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Daniel Gutson <daniel@eclypsium.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Bazhaniuk <alex@eclypsium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 24, 2020 at 10:22 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Sat, Aug 22, 2020 at 06:06:03PM +0200, Arnd Bergmann wrote:
> > On Wed, Aug 19, 2020 at 11:11 AM Mika Westerberg
> >
> > The mtd core just checks both the permissions on the device node (which
> > default to 0600 without any special udev rules) and the MTD_WRITEABLE
> > on the underlying device that is controlled by the module parameter
> > in case of intel-spi{,-platform,-pci}.c.
>
> OK, thanks.
>
> Since we cannot really get rid of the module parameter (AFAIK there are
> users for it), I still think we should just make the "writeable" to
> apply to the PCI part as well. That should at least make it consistent,
> and it also solves Daniel's case.

Can you explain Daniel's case then? I still don't understand what he
actually wants.

As I keep repeating, the module parameter *does* apply to the pci
driver front-end since it determines whether the driver will disallow
writes to the mtd device without it. The only difference is that the pci
driver will attempt to set the hardware bit without checking the
module parameter first, while the platform driver does not. If the
module parameter is not set however, the state of the hardware
bit is never checked again.

    Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
