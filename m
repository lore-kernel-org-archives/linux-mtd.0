Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6843C4829A
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Feb 2024 14:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gu9jdRX1M6Ht8ZZURiZGSaD37EHIWu27HmRW/H4/xWY=; b=sTBlplOrvbbuIS
	xsTEO1Oa53N3YYm1zWErp1s8mlHPyRv0WNl7p7CRLmLcuSfSHJFgoCxmYA9bXhD8XrUGMU/nfPbEI
	eQiKZk8T+i2NN/w9i7rNA8Rk2WwPmD+V/CWZW1ExtFDlAR1/Hbf0KdmHdwmjbnNj5/azFqXpxbzAm
	62CtyvyA80aNp4qtQSiD8DTgJrO7I22KB7/gBClKDdtMgUvqo4uldMpfJxj+cLi9RP9JegzDmVBJ+
	Vf+INECYSeFi/Bl7V/x9EFbJ76gokr8EbYng7rqaOtfScMDRwy62O2zvrllC+T2Z3paxgWkgDXr9c
	MOfvJVY4rpeQI6zEbwfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZu2E-00000009ZFD-3R4R;
	Tue, 13 Feb 2024 14:45:22 +0000
Received: from smtp-out3.simply.com ([94.231.106.210])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZu2B-00000009ZEL-1LUP
	for linux-mtd@lists.infradead.org;
	Tue, 13 Feb 2024 14:45:21 +0000
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4TZ3yd4Dj4z681k;
	Tue, 13 Feb 2024 15:45:13 +0100 (CET)
Received: from [192.168.0.25] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4TZ3yH6LD4z67wS;
	Tue, 13 Feb 2024 15:44:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=unoeuro; t=1707835513;
	bh=v6NrxM1eJN7Z7yzkWSBTKUltm5dbJ2HTXi9hG2LMSTA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fxRUG6+yBSU+BFXn6+rebuuiiuqqWopqe29Vz2GaIf78w+V69ZIB+Af31iKeLr62p
	 qpQdz7sWHzQ58CP3tqsZon5MfZ78+Sms5m4nebpjjUITGZQ1A2ZnKMsF4BxSh1OMBa
	 S898RixpmWtD3+3XqXRY4JGgZ7I8bBk64Oy1wp1k=
Message-ID: <4582ff28-a443-4b0f-ba92-f48c414e2248@gaisler.com>
Date: Tue, 13 Feb 2024 15:44:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Build regressions/improvements in v6.8-rc1
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 mpi3mr-linuxdrv.pdl@broadcom.com, linux-scsi@vger.kernel.org,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-hardening@vger.kernel.org, qat-linux@intel.com,
 linux-crypto@vger.kernel.org,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 Netdev <netdev@vger.kernel.org>
References: <CAHk-=wiB4iHTtfZKiy5pC24uOjun4fbj4kSX0=ZnGsOXadMf6g@mail.gmail.com>
 <20240123111235.3097079-1-geert@linux-m68k.org>
 <d03e90ca-8485-4d1b-5ec1-c3398e0e8da@linux-m68k.org>
 <0229fa60-2d87-4b1c-b9f0-6f04c6e4dbdd@app.fastmail.com>
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <0229fa60-2d87-4b1c-b9f0-6f04c6e4dbdd@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_064519_964708_441774A6 
X-CRM114-Status: UNSURE (   8.12  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2024-01-23 15:21, Arnd Bergmann wrote:
>>>  + /kisskb/src/arch/sparc/include/asm/floppy_64.h: error: no previous prototype for 'sparc_floppy_irq' [-Werror=missing-prototypes]:  => 200:13
>>>  + /kisskb/src/arch/sparc/include/asm/floppy_64.h: error: no previous prototype for 'sun_pci_fd_dma_callback' [-Werror=missing-prototypes]:  => 437:6
>>
>> sparc64-gcc{5,11,12,13}/sparc64-allmodconfig
> 
> Andrew Morton did a patch for the sparc warnings, and Andreas Larsson
> is joining as a maintainer, so hopefully he can pick that up soon.
Which patch do you refer to here? I can not seem to find a patch fixing
these ones in particular on lore.kernel.org.

Thanks,
Andreas


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
