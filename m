Return-Path: <SRS0=GAYx=BO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 768D8C433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2020 19:07:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CF5A2086A
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2020 19:07:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eWbZPnaE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CF5A2086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pFahqyfOHNaU+5MKdIaPDfqOW3QKdOkN5uup2VlE4Ek=; b=eWbZPnaEtXrPMnTr16Hs9O5lK
	x7BCweevhA3VGV8OZvqzNg3Vx2xJS2iHFXT58B6EdVb5dR4ph3YgXuJZjeBPgA7Na3VyAUt723rh+
	BKh/55nOb3FIKj6RRpjtx0xvw+EjzAhbwOSUnDfJA5TkoHHPv/092yii02NhgBfo6gE58EPHzBTr0
	X6ANTLUqxRiQ9z6LM4HjQOlNbYjlkmxc9JFDtQqlzQKE2OeTNSIKX/AFCN1G0xfOKPl23eQfWbg5z
	22usj8kYqQ/umdFeDIMjxfQXtHAUdXrE4+nbxhj0eJR4exqDcNOjKIqYNF3sWr3H8cwr1YcZ6a2O0
	rQ45HYEMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k32HA-0000mD-Hg; Tue, 04 Aug 2020 19:07:04 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k32H6-0000lo-SL
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2020 19:07:02 +0000
Received: from mail-qt1-f175.google.com ([209.85.160.175]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MxDck-1kvxDB28z2-00xdRI for <linux-mtd@lists.infradead.org>; Tue, 04 Aug
 2020 21:06:53 +0200
Received: by mail-qt1-f175.google.com with SMTP id s16so31784740qtn.7
 for <linux-mtd@lists.infradead.org>; Tue, 04 Aug 2020 12:06:50 -0700 (PDT)
X-Gm-Message-State: AOAM531oJ0Ciquh4wOmra0tjUOz0FR4CMDpi4MKPGx8ohbbhOjHnKPae
 9Mw0wIaXDErXABaebiqLcjq3uyfcIgSVQLB5AV4=
X-Google-Smtp-Source: ABdhPJw6CNFtZzp1Y4f2ymVMDAs5tsX39XjtcTFQ0oGQ/v8PSJdHj9DFeJUOOpF/S+U3b1KheF+OKZkTGqRkaEBRGQs=
X-Received: by 2002:aed:2946:: with SMTP id s64mr23446375qtd.204.1596568010056; 
 Tue, 04 Aug 2020 12:06:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200804135817.5495-1-daniel.gutson@eclypsium.com>
 <CAK8P3a0_fJ0BfD5Qvxdo0s7CbjPWaGA8QTgYhbXR=omafOHH4Q@mail.gmail.com>
 <CAFmMkTHEm8k+5GZkVJbDZMEhMwpsqVKRb-hGskSpBstdLRuFyA@mail.gmail.com>
In-Reply-To: <CAFmMkTHEm8k+5GZkVJbDZMEhMwpsqVKRb-hGskSpBstdLRuFyA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 4 Aug 2020 21:06:34 +0200
X-Gmail-Original-Message-ID: <CAK8P3a27bTYyn3N+tX=i_6f4KrQkOmkUA1zUQfvCW7qw6smSkQ@mail.gmail.com>
Message-ID: <CAK8P3a27bTYyn3N+tX=i_6f4KrQkOmkUA1zUQfvCW7qw6smSkQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Do not try to make the SPI flash
 chip writable
To: Daniel Gutson <daniel@eclypsium.com>
X-Provags-ID: V03:K1:1Vp2/+5hWWCbvwbwkSr1HVib3D24lc+MRxFxMVaHclUwHplblKN
 gT3VsEyks9DefLLxwMD21VycuGWaH8dLCKz3uhdlhpXmrFOhxtv3Q4Sd0LRcq1xTeBHdGNC
 cImZKlNR6QrZndL9+vHI63Qrg74MTcWBTJRILJCovTuy6ILAnqhaVjAGU23EhalGAf4hlFR
 ErUvuG1hCKsvUWEKSbl2w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Rko4IezXJbs=:i6xDk1amRDprc+NVKvfkDJ
 51e0IsYVM0tmfDlPRM37HS27OGZu9KSOsR49n7+sCENlKlz8InQGwX+XdPSHUPe4PrjlVUegV
 0mOPSGOzcDDdrY6EC7jffRA3OWVKkb0/EjtkeDTYd6GbF1HS3YEO2rcZJTZM/hfEmSQvvBk7Q
 hjvn+Pi+KIfa2hvCroYDYqi/MGicOn4f3NYGUyzPlojWcCLbDM6PgoVI8wdr9oExWAckxoUiX
 aYeiXDFpCONPOdlqqNIwltAXyq7m65eqv86p0qDLQMsrj7UciUmnj2HEJSX13rFJqL43Kzx5w
 2wuf3fyIPioKJ0Wi1s4GBG8GimJjG7VI0bzuATtEIffEya//vri4PG8NWalLEHqI2Twt7HfQz
 6JIYM8Ffyo39N/EB15xTs0YUacdXz3qyNmS0lqs8/mYCWeWG1QeSCi7iGJESKDZGCaMsprART
 t0i2znB6EsmZDeyNUwTA4txFjVtenePjbuFG0jMZ9zAoG8MAvkU1oBewRCFr9UntIdyDB5dcA
 7stowvXWcHu6f2/6UX/91nctRLFI7Z3peKoWiWzKsQ5KTXJInwOg3MgWo9ill7nTRvcV1H4cW
 ieMZt++qOEOysMX2j5gn9T3UaN4Hop11YN+lQ1kHHHQgT4zxFEokYPp4UqzD2NmmGB883hEVW
 B/y3VsPr7LvOFeXLgMQr7iabW4tyjuFph0sNSYbSLU7TSNiDHd2DNRQlZOWI3ZnBiZ+vP+CJ6
 6Z1vjnJKoFlyMEsHHxrmELodS+m5Sy0lBnhBzzud1VjxsPzQ1BEQpaVXEd7d9LQPvYryKp55N
 qwr5YL2lcwPwaPW63SY/aW9Jfn2l1lnJzvdVf8vybMr2t/Bkm0fJKta9iYyg0foriD2DDoeNN
 K0WZ0lI74jdoA4/GUTU8H9ZPjcIaqwYJluy8RDCKE5TsOmeJbzC6wEzWN3zOXNkg8hI8jVaV4
 6CAlDKRLD+dGYOIyxRfmtwzKKf2/ZKSS09oNRB5PP+5282xBItWX7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_150701_793192_E2552F67 
X-CRM114-Status: GOOD (  22.99  )
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
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Bazhaniuk <alex@eclypsium.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Aug 4, 2020 at 5:49 PM Daniel Gutson <daniel@eclypsium.com> wrote:
> On Tue, Aug 4, 2020 at 12:21 PM Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> On Tue, Aug 4, 2020 at 3:58 PM Daniel Gutson
>> <daniel.gutson@eclypsium.com> wrote:
>> >
>> > Context, the intel-spi has a module argument that controls
>> > whether the driver attempts to turn the SPI flash chip writeable.
>> > The default value is FALSE (don't try to make it writeable).
>> > However, this flag applies only for a number of devices, coming from the
>> > platform driver, whereas the devices detected through the PCI driver
>> > (intel-spi-pci) are not subject to this check since the configuration
>> > takes place in intel-spi-pci which doesn't have an argument.
>>
>> This is still factually incorrect, as explained at least three times
>> now.
>>
>> Please either make the same change for both the Bay Trail
>> platform driver and the PCI driver, or explain why you want them to
>> be different rather than incorrectly claiming that you change them to
>> be the same.
>
>
> What about just saying
>
> "This patch removes the attempt by the intel-spi-pci driver to
> make the chip always writable."

Yes, that is much better, though it still sounds like it would at the
moment allow writing to the device from software without also
setting the module parameter. I would say something like

"Disallow overriding the write protection in the PCI driver
with a module parameter and instead honor the current
state of the write protection as set by the firmware."

(note also: imperative form in the patch description rather than
"this patch ...").

      Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
