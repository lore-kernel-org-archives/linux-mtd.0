Return-Path: <SRS0=IhQK=BN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 502CFC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 13:56:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CE61206D7
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 13:56:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p2F0NSht"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CE61206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dHQcJsxQ9cBVql5aALulegXh0bUZ+7LtRXmd7rJ/Ivw=; b=p2F0NShtIBIjQNZlWQCT7e8HI
	KE/YocBUXvX744UIdvS4uS3uDeFlQ/AQhlNolstS1iU2xqdT3sjKIYNeQ7ublgjNPDwd89aXoVNYu
	4gtEk9RzA+2pUJQwIa3v2MRv6GXmwuxrLMGksd6yy1or72UY2xORP0j+T0Bvjb/vZsJB9ohGBcD0D
	LWDSFhOKnbKtIe7/c32nKkd3kKWpoVWnQwo7Rod/NxW+ScvkAhvqGp0Ljb1XKcNM7xHat37+NG24T
	97+glQ4IDsQ0ZtxVjUiaAs9NntQFyLLr1SOCLk0XXn+3DGBe6Fdah8J0PQisR5DweUjo67zVUS8Iw
	dFBQxDADA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2avx-0007Nv-AP; Mon, 03 Aug 2020 13:55:21 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2avu-0007NK-T4
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2020 13:55:20 +0000
Received: from mail-qk1-f175.google.com ([209.85.222.175]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N8VkX-1kpUP21TZB-014VdF for <linux-mtd@lists.infradead.org>; Mon, 03 Aug
 2020 15:55:13 +0200
Received: by mail-qk1-f175.google.com with SMTP id d14so35127359qke.13
 for <linux-mtd@lists.infradead.org>; Mon, 03 Aug 2020 06:55:13 -0700 (PDT)
X-Gm-Message-State: AOAM533ELVrIfbOEyniSyb13ogoSgyo4Bh+kUXiKvhjqZ4HmE4L5AvMd
 OZLVNg9dL1liUuj2OPtROtG2Gdhp0yAeRWTpGCg=
X-Google-Smtp-Source: ABdhPJwItt/4ioy5OciMfCJ81qQb1OLD+6qsgpSAsbd9VTROSzQ27GXrFX2uRUohteFfQkLpdZ5x64Y+qqo2PEexr9Q=
X-Received: by 2002:a37:6351:: with SMTP id x78mr16250543qkb.394.1596462912141; 
 Mon, 03 Aug 2020 06:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200803134449.72502-1-daniel.gutson@eclypsium.com>
In-Reply-To: <20200803134449.72502-1-daniel.gutson@eclypsium.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 3 Aug 2020 15:54:55 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0rZi9hBsA6+YQCpCdYj6uY6z+cfVVi37jY1aNx7B5iTQ@mail.gmail.com>
Message-ID: <CAK8P3a0rZi9hBsA6+YQCpCdYj6uY6z+cfVVi37jY1aNx7B5iTQ@mail.gmail.com>
Subject: Re: [PATCH] Remove attempt by intel-spi-pci to turn the SPI flash
 chip writeable
To: Daniel Gutson <daniel.gutson@eclypsium.com>
X-Provags-ID: V03:K1:fshOzKx6YZ15ra+lV1ZLh19pt3t4zWlYKyb6i/bx+f++FLEDhV+
 YlnFEBnNd8FFYIBm2ld/xleTTCLKX4fmLmK/IFMjgGLC+nkWy1cHyi1XX1mZiXE23qTh7J+
 BrYH/D5HZ0fTKP59q08koSZe+nIUM3yQ9VBUaCQ/Kf6IJJjVy9Rj6ciD04dIL4Vky/1NzyD
 e7iXry7rEdP2gGZca1Qvg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LhlWXqhrgFs=:ev7eedJXr7b+ZYcJmfJh6R
 EiLhcYE4UiKGmp8F/Rmah5TYfnjBXoyZ7eJWUIQuaRYjCEMfl1hrExOi5+bkJGIFPb42pMG6F
 Au+7wFipnpZQc8H7CoveWv9x88oVpupbKj7i8LWDtMwatDRmqEUjW/1zIZt+6dFTf+gzxtLQ0
 Cyau5dmIIeJRaE30SUHrafDK77Q7hujsJ9KRZWhzMFR5HzfoOp7MUhJLST1+8Yi4vRGAhjKXZ
 I2l9bjQyGeQV80C2tZo3RVqQPFIEe5/VBn7f3mvq+UI9/eWBhu0dcWdzjw7y3vwBFkyZXtjcO
 Rda1h8qKhnF/1aCsmISMhhUUZ4oL/sJbCAMqPzKjbO4r6o1P0wcASIEe0DgX7GrKZ6JKlIuOH
 Z9pa8myRihioMtvlAmlyB15yJCLgSMgDpZB58Ds4Y++V3vkSjnTc4pL8wpk4AQRjy5YI5SStv
 2yD3GOWfG+zRRK3b+tn5kCsMhM8isFbpWUHucmbzW0VZfngCJnPtjO9B+plFUaKJRphE9S842
 wJMker2UAg4I9zMrcgtVGBj8jIUZ8mT6RMQKZUDA1+mPhqFStXTl4H5LY68Zn8EA6Km11M6pq
 +Gn7EE6MdKosmD09tVkSB2Jj0bL3LYaldvOWZYaX9/fpnDPUg2gNsJJPYVbjhB6kwHOULK1pk
 T0yXxPnuEyFDJ9vL5ufx1v1e+2J9s9ELHbTQSNpZGEmrYPiGgMiwGvl7Hr29B3BdYGyVgNSD4
 cVUfRGHKQpgBoDhlMrO6uaiWi3vnpkNfo/e2Knbfo3Yhq/ZPwVAMFMhpFKWuG2IMjHuDQ+l32
 aVKECzf6jKiiyt2RGz3V2lQNAiwr550w3ZKrgbQaZIHrnXy6mN8ptYbHTEFysBb51oa7Y7O67
 iIRcIPczKWXLnnPrLbsNuI6u26Yc+F67Z649Z1Nm6yqFznJxA1W0E8wzJ1lv3AJaz9LN7OB9O
 fpXzt9xq2RrtJzi9MHY3JwFhOs/+EzezfYiRCmETjR+dvXHhGze8p
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_095519_156065_A8FB6BC5 
X-CRM114-Status: GOOD (  14.61  )
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

On Mon, Aug 3, 2020 at 3:45 PM Daniel Gutson
<daniel.gutson@eclypsium.com> wrote:

> However, this flag applies only for a number of devices, coming from the
> platform driver, whereas the devices detected through the PCI driver
> (intel-spi-pci) are not subject to this check since the configuration
> takes place in intel-spi-pci which doesn't have an argument.

This part of the description sounds wrong: the current behavior is that
the BIOS setting is ignored for PCI devices and it only uses the module
parameter, the same way as it does for the platform driver.

With your patch, both the BIOS setting and the module parameter
have to explicitly allow writing on PCI devices, while at least for Bay
Trail platform devices the BIOS write protection is still ignored.

It sounds like this is what you want, but you should update the description
accordingly.

      Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
