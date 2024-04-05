Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9C3CD11C2
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2024 13:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5CS0JprEkuo651O+2hP96SFTxabcf8Px13HryxlBUzY=; b=TzZr//dFa2e7hO
	TuPSu1u/OTuDhoRGPG6YvdzVSttHUYMsnM7IkEengmWSUpTTTDfEawOe8H/oj/xNssKx+J4ZXAipj
	62hBhlIDFpmo07VWL1zCceE2SK6vlE/l9OZR05tGA9ojD0TW0sBD0CCGFAqAl2mqQYb8bHNbu2jcP
	7cz6R91DLNoyeY9uRMX1H/Jct9oJH6jxW2+/eWelETXsvhNJ8HidTxiDLmDXrmjiBIpIix8giryqB
	5YTLRN6dmmSH8XesjtswuPURrbfjXtOdsLAaAWnGjRj+3E6NY4JtSjvCiyl/HTD6YyStDA2UxR/L2
	/kL1yHyyIDRYTYRVnbIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsjEs-000000077PS-1QKa;
	Fri, 05 Apr 2024 13:04:14 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsjEo-000000077Mk-3PXE
	for linux-mtd@lists.infradead.org;
	Fri, 05 Apr 2024 13:04:13 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 14ACD2027B;
	Fri,  5 Apr 2024 15:04:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1712322244;
	bh=l7CqLckDLbgqOsa5j//MSRXiFTqbO5DRUoXwQ6kAxls=; h=From:To:Subject;
	b=ltlx3w2vw3Y+QWe1kOtgzo7BfRzUla8vaHq4YMv9qw2AUtt6fmMGbdFvqOK8LDRyi
	 T58fmgOad+HwY0S1XAOFI9b0EawRz6A40OTrTGbdMzqkSwAchh1KzxdG/db3r7Qvfl
	 /W9DSR+fTbtnEEfPo8koKpoHoKZZvY2EVd6flsP5lD5xW2RNbSNH8uVmQGQUm1QGe7
	 1GPGAHek+s3BFLEoPTfM0M0zDnSuQeGo4w8fe1Imo53XOx/zEGoJ0E+M0vJ5tyHWUf
	 Q0BZ2o5vbnZVs91k2Xkau32pQKhQ9NS4RUPVsHBIiLIn3eOUvjIAgkLoXWUdXtWMlx
	 nGO9TVFcS9+Wg==
Date: Fri, 5 Apr 2024 15:03:59 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Flavio Suligoi <f.suligoi@asem.it>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] mtd: spi-nor: everspin: add em004lxb entry
Message-ID: <20240405130359.GA308940@francesco-nb>
References: <20240405100104.480779-1-f.suligoi@asem.it>
 <20240405100104.480779-2-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240405100104.480779-2-f.suligoi@asem.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_060411_916851_EAD63700 
X-CRM114-Status: UNSURE (   6.74  )
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

Hello Flavio, thanks for your patch.

On Fri, Apr 05, 2024 at 12:01:04PM +0200, Flavio Suligoi wrote:
> Add the Everspin EM0004LXB 4Mb (512KB) Industrial STT-MRAM Persistent
> Memory.
> This device is JEDEC compatible (JESD251 and JESD251-1), but it is not
> able to provide SFDP information.
> 
> Link: https://www.everspin.com/file/158244/download
> 
No empty lines in-between tags

> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>

Francesco

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
