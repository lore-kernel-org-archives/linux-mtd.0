Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDCDD68BCF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Nov 2024 19:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CaxkfPn3EWgJ3FXCPEzcOEhsk6nxZfS+7ZdS/IQ2azU=; b=riAjyJX9psspim
	TdBEsjbDXowU2/d1JLkq+bxs0nFW7DC8qloFPyE/xtKFixFuGkHpg2c3UFu78xSdRz/6oiEFUISpV
	08aj8lhPrbhQwBvaFFHKvhqGDO82RhYOuGbAitqf4yvX1ogulKyIf/lC/o7u6xAan65+F71XGG+Jo
	k4LIzIhajcqZaQQ7+8Dp3PIlEJlaa8liYrKnK0ZDK+4RDr9krGIJf2uvj77Ra+glRKMsaehLb0WN3
	i5AcbiQsO7bifWfWSLfzim0gVH+4KDl5qlwdTXp9ereyss8UTE319YZfxupifSyRZ07uNhmhGUlcZ
	02cH9Q1XaeVdu/onlqag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC2P0-00000003vqG-0TwS;
	Fri, 15 Nov 2024 19:54:46 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC2Ox-00000003vp5-1moM
	for linux-mtd@lists.infradead.org;
	Fri, 15 Nov 2024 19:54:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E94DFF803;
	Fri, 15 Nov 2024 19:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731700480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tj+HHqKLYPrccjAC29PM8AVMsHyVZb9kCqt7O7EJCGA=;
	b=YsJ4IZMaY8j9PHD0ZDjqx8IX/lCH3AkLuqdZy3SfO3QcuJ6zVNLMnWn6B7JPoTwgQW+kE/
	poLXgUbFDD66Oaqvl4WPEpEWMpMQCOwpt0/uQ912/hgpziHoXzlklsy0Ymtunf4fAn4gY2
	tC6InRRI3UaDxLvn3QEOYsc1WbOCRnsGURd8gbcd5NM7QBf9gKr2JPsdYVZOtbTpdR0w+o
	WuGTLXvx5RQ5SCK5999M5ODe/0PG1x0He0ujxGFyOPKHA+X4pkTDStzgCNBSjQu2YIcLs5
	X0wrggo7HuRqFAsHEOcegA7Wppg2fDMLtDX+6IO0cxxc3RyAj6xCeGn0WCYjdg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>,  Krzysztof Kozlowski
 <krzk@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Herve Codina <herve.codina@bootlin.com>,
  Christopher Cordahi <christophercordahi@nanometrics.ca>
Subject: Re: [PATCH v4 01/10] memory: ti-aemif: Store timings parameter in
 number of cycles - 1
In-Reply-To: <20241115132631.264609-2-bastien.curutchet@bootlin.com> (Bastien
	Curutchet's message of "Fri, 15 Nov 2024 14:26:22 +0100")
References: <20241115132631.264609-1-bastien.curutchet@bootlin.com>
	<20241115132631.264609-2-bastien.curutchet@bootlin.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Fri, 15 Nov 2024 20:54:37 +0100
Message-ID: <87sersmfwi.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_115443_598169_AB5683AA 
X-CRM114-Status: UNSURE (   8.81  )
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

On 15/11/2024 at 14:26:22 +01, Bastien Curutchet <bastien.curutchet@bootlin.com> wrote:

> The CS configuration register expects timings to be expressed in
> 'number of cycles - 1' but they are stored in ns in the struct
> aemif_cs_data. So at init, the timings currently set are converted to ns
> by aemif_get_hw_params(), updated with values from the device-tree
> properties, and then converted back to 'number of cycles - 1' before
> being applied.
>
> Store the timings directly in 'number of cycles - 1' instead of
> nanoseconds.
> Perform the conversion from nanosecond during the device-tree parsing.
> Remove aemif_cycles_to_nsec() as it isn't used anymore.
>
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
