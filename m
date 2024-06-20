Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B7EC27C79
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2024 22:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XNaw9AbB0eDg2AUQNVI2yOtTLSQRPoU45RL5bnkeLM0=; b=DrgfHjtuROESfA
	2IEw4iqWrUmm38w/xDZfWc2rFrMv0R5aI9Ue4qjjdBLbfZKIumiVTyU5O6faFkGDJhU2CxzsMzdZB
	OKuUdg2eqrwcwdAeLtr3aOr6W19mJS2dvmAoiGEuwAZ+sExdNlrtTgWYLwQJT2MvN8m23Eux5zmCn
	frZ1hzBfAnPj600wZ6aKh9iR8YJwqAaRHEoXibOQDz9odkiA9mVWiWZjHsJxetve/4YbiatTZ9o+C
	9eBApfOrWYKXf5WqCtgnGkWzIo5q9O++p56Lxny4fTGEk+O9xGMFmQN1CPCqZ0n4LwmUHcrLloEzy
	eF8aDtIzeeO3Z3vImNTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKQii-000000071fa-1g3k;
	Thu, 20 Jun 2024 22:57:32 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKQie-000000071eQ-3GWS;
	Thu, 20 Jun 2024 22:57:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 630F9CE1E05;
	Thu, 20 Jun 2024 22:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B798C2BD10;
	Thu, 20 Jun 2024 22:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718924245;
	bh=oL0lOl8UlorqgDe4N96CXSn6qERkQqsRkdEwKmnMLpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WOyKtyGiw4R35+cQwJzIRKbOUcM5jG2Lw029k3dBxiy3q5r1r0iBa1pT8T3JHsfuv
	 a7nj6hsTr7uKLww9GJRlRMomasDZ05PZYMJBeTXxYcIOU7n8AaG41zowyTmRcz+1wt
	 h5ykO0hla58PvGtVSXoUdDz2mhTPszr6H5PEnIWIVWYCq6kSsGez5GkzxSillNnGZB
	 Anok5gtr5T61ZSZgYrb/Adj+xTWapsNgVeXSM82qZ28UuoeU2sSaNWl8H7KhrlwUn3
	 +5tlGup1Pd1RWHTQ8tCYqmf/N5c93MmUKsDabdSqJXdEbBZ4q9mx1LBv9YPJtJKrZl
	 up3TkdcO9Qx4Q==
Date: Fri, 21 Jun 2024 00:57:21 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"J.M.B. Downing" <jonathan.downing@nautel.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yangtao Li <frank.li@vivo.com>, Li Zetao <lizetao1@huawei.com>, 
	Chancel Liu <chancel.liu@nxp.com>, Michael Ellerman <mpe@ellerman.id.au>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mtd@lists.infradead.org, Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [Patch v4 10/10] i2x: pnx: Use threaded irq to fix warning from
 del_timer_sync()
Message-ID: <jgqhlnysuwajlfxjwetas53jzdk6nnmewead2xzyt3xngwpcvl@xbooed6cwlq4>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-11-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240620175657.358273-11-piotr.wojtaszczyk@timesys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_155729_019275_BC2FED0C 
X-CRM114-Status: UNSURE (   9.13  )
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

Hi Piotr,

On Thu, Jun 20, 2024 at 07:56:41PM GMT, Piotr Wojtaszczyk wrote:
> When del_timer_sync() is called in an interrupt context it throws a warning
> because of potential deadlock. Threaded irq handler fixes the potential
> problem.
> 
> Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>

did you run into a lockdep splat?

Anything against using del_timer(), instead? Have you tried?

Thanks,
Andi

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
