Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0114EC433FE
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Oct 2022 11:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hov0Fv/LNtl+ITAluar9U7cferVd+lETPlECoJibaNE=; b=yKEscu7ccYViJ3
	NlSlewPRqN0NoZK0Mo9Aapg2dkF6r12gXw5TBzNYksxCk0u//8RluIZk/IoMGxhIis4s6CjtkqNiO
	QPpcUi3V4fwoDuGLAXqLYtpvY5EOAeDGSO6Gdjk9gc94MNswkyqJWWjc5t80Zf8Er5nWC3td14AxQ
	985bTQKaV+F5XPrweR1OVhUHUEJ+w4IzKK/+FcEHmmwxPxyzvpCzskDF9DdNiWlJew7iYwbzApiys
	tQPZh0jBaXb5UpaX4gdDCtqk9tqosGTN1CEUpslhpg5FCcdXRIxsHYKlRaMpvKRhgRgraHrkcU/MK
	rtkMV0muv3TtcRgijF+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omCcB-00CNvH-Kl; Sat, 22 Oct 2022 11:24:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omCby-00CNr3-QQ; Sat, 22 Oct 2022 11:24:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2820F60AFF;
	Sat, 22 Oct 2022 11:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED202C433C1;
	Sat, 22 Oct 2022 11:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666437854;
	bh=QlHVwvQAZAIgvjk8abE10EkrdDUL7r/AigVC5ALYQK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=un1PldCoLSJ88cWZRYnjm5Oi1KiCHJHB0LueFTTYXn8D7fIAxS0vK6V48SeMy9VdW
	 ZuWEiHtsrYztxbCEB+Ntyz+QhjY7UYniFteggfYw/ntXKMozNoEsqsq66wk3rOhU3K
	 hzsEaBZQY3uGlKbG/0kkX3FnGtw/tJtrFvWLyT24=
Date: Sat, 22 Oct 2022 13:24:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
	Simtec Linux Team <linux@simtec.co.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-samsung-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 02/21] ARM: s3c: remove s3c24xx specific hacks
Message-ID: <Y1PS3A75mXIEb+MA@kroah.com>
References: <20221021202254.4142411-1-arnd@kernel.org>
 <20221021203329.4143397-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221021203329.4143397-2-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_042418_922415_E782E736 
X-CRM114-Status: GOOD (  13.52  )
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

On Fri, Oct 21, 2022 at 10:27:35PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A number of device drivers reference CONFIG_ARM_S3C24XX_CPUFREQ or
> similar symbols that are no longer available with the platform gone,
> though the drivers themselves are still used on newer platforms,
> so remove these hacks.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
