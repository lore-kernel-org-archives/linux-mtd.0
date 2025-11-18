Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EF3CEBF93
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Nov 2025 07:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EWaH3M9admgY+u/3IDfH2cFtlbunuxyzUH/SUNrRj4E=; b=RPg2+Ed2BTIl3d
	EwIrzLbPi/dS6Um9CIO/GS9SNXdL1b/JNkBjPRitthlbbet950RVnY1jpAexBEOsnL87yFF2WZvrw
	6G3pV/mpSHfI/I2dELdNvvUwXsAm19FpeCuzGXGkbLlkzIGZWCTVtSiNT8Qz9g532iwdDtbu0o5ej
	p6BBXzr6aWl/4kJsyH56zA7MasTUegh3AjliEVcCQRUDisACPUEtIlQYP4htYoyHbgeTIp0wkcRy6
	kKZjCCz4wSOY9gp1SIkmiawVkkClQs43Z3pFJyaMosx3GnFY4Xn8LS1LuMO3t8BEenoinHI2AnD1t
	jEzfD7BoQCmOrsmy2uXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGBb-0000000HZTD-3irA;
	Tue, 18 Nov 2025 07:31:35 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGBX-0000000HZSI-1J5z
	for linux-mtd@lists.infradead.org;
	Tue, 18 Nov 2025 07:31:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=gbR/pSrpPdQnCy3o6uUWzPGyYQA0J47Ic/sF8Ai7qyc=; t=1763451091;
	x=1764055891; b=ASFHn6vPMlhkp8RxWYH0fDZgoqOO2uaBCjh6an3NqWMhrOm7KJgREm/21khJG
	PA6d/2NJndX5bK38eIxR6w1PhJej0mp9O0mNqq8zGqbMGrmUYwn8mcDuatcqah0S0hprKeI9j3fLt
	5C9rcoTZ2r/WbrW1RN2RUcxecmVWqJMSw0kr1KS2Qd+KkBdRC5v8h+mxoUBzmi2Hkp2pkm3IG9Cye
	byHQYiN5FOofFQEGl2+eVnUwHSu1QJ4R149t0Lz53tgU+bivHXs/EKrqzs894g5bLPESAP++Vifo9
	nqX6hJmRbEbDMt4WTW3Hs8jxn/OkvmVFYzPeuSASbYluJjgxag==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1vLGBQ-00000001Qib-0YKK; Tue, 18 Nov 2025 08:31:24 +0100
Received: from p5b13aa34.dip0.t-ipconnect.de ([91.19.170.52] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1vLGBP-00000002GbE-3d0W; Tue, 18 Nov 2025 08:31:24 +0100
Message-ID: <6e2e9edcd9247c216bfe1ba637629a9a838f9fed.camel@physik.fu-berlin.de>
Subject: Re: [PATCH 0/3] mtd: maps: vmu-flash: Fix build and runtime errors
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Florian Fuchs <fuchsfl@gmail.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger	 <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, 	linux-mtd@lists.infradead.org
Cc: linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, Rich Felker
	 <dalias@libc.org>, Artur Rojek <contact@artur-rojek.eu>
Date: Tue, 18 Nov 2025 08:31:22 +0100
In-Reply-To: <20251117224408.498449-1-fuchsfl@gmail.com>
References: <20251117224408.498449-1-fuchsfl@gmail.com>
User-Agent: Evolution 3.58.1 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.170.52
X-ZEDAT-Hint: PO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_233131_500130_663BA926 
X-CRM114-Status: GOOD (  11.11  )
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

Hi Florian,

On Mon, 2025-11-17 at 23:44 +0100, Florian Fuchs wrote:
> This small series fixes build and runtime errors in the vmu-flash driver
> (enabled by CONFIG_MTD_VMU) and the included maple.h. These changes were
> verified on real Dreamcast hardware with a physical VMU. The VMU can now
> be successfully probed, read and written with MTD tools like mtd_info and
> mtd_debug. Previously, the driver failed to build or crashed during
> probing.
> 
> 	bash-5.3# mtdinfo /dev/mtd0
> 	mtd0
> 	Name:                           vmu2.1.0
> 	Type:                           mlc-nand
> 	Eraseblock size:                512 bytes
> 	Amount of eraseblocks:          256 (131072 bytes, 128.0 KiB)
> 	Minimum input/output unit size: 512 bytes
> 	Sub-page size:                  512 bytes
> 	Character device major/minor:   90:0
> 	Bad blocks are allowed:         true
> 	Device is writable:             true

Thanks again for this series. Before this can be picked up, I would like again
Artur Rojek to test it on his Dreamcast, so let's loop him in.

If he confirms the functionality, I'll pick it up. I'll try to get it reviewed
later this week.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
