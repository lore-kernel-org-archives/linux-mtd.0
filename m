Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA76C54EBE
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Jan 2023 20:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=knUy8l/ZNRvEZOywGw5H8h2RqDA8pTRPjj8PeQipJL0=; b=Mj9UuYGLJfZ2Mr
	FMUw/If9ckvvSDrGWGKj7LEPkJPMijNI6a1OcToGRKlfBlNOjYdT+gn1ggh/AJQhEhkebj56hzpxq
	4yUMxhD8TJY88GRlGMIs2yKXy82tb8gf0Tu7NPKq1NqJe3IhZSHDsTxBL1U2Q42dYh2iRWAR3zybs
	FW9JFUHDR50A9wrSD0GEeMsYy57mMdCKVbNS09hmHCqd4f34wWxaqZ3GIgOEserDpv4Z+UY6xCsZk
	glbLM2TSgIfeVM6uMpjMNjsLH/iF51dWqbxgD3CevTJDsbFVynXdtDxAyONvVl9/FxcQVNyIWQURp
	qHk+EcUujZHgbZ7xduTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG4AX-00GuOu-FX; Thu, 12 Jan 2023 20:27:25 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG3lU-00Giwm-83; Thu, 12 Jan 2023 20:01:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 4C397CE1F92;
	Thu, 12 Jan 2023 20:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28061C433D2;
	Thu, 12 Jan 2023 20:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673553688;
	bh=DjplknG/Og42vIVzT/q7FbntQdQMbrnKJqFFsTyhjNM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EUafdQGi6kPVntwFcsX8dQ++eMfDpAt4hRufXGYp4rn3498p9O5an8Dtzb32f8VZO
	 /0dwxqLx9EiZWyrofGYjXdGydKTREAjzdQvusJ0Ow7D4V0fv83WO6VIMOVK93JIW2S
	 WKNFKVIBv7VwC+kTD5h1WgF5etFBp2YPn8S3ZXmT1Seav9nsmaQ1vhNBslaNNmcYRn
	 zsCLB4TmasZgZxWFa1UpanGfaUnDdJStrP+pk1HardQUH3NiBxgoCCXTezH0ic2ZBw
	 6otuSPV9m9aONvZu3dzL7IfHqeZgMZCL4VALktP1HibdXNi78cOSWjN0jogQQsvptF
	 31XhLFJQie5QQ==
From: Mark Brown <broonie@kernel.org>
To: Robert Jarzmik <robert.jarzmik@free.fr>, Arnd Bergmann <arnd@kernel.org>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, stern@rowland.harvard.edu,
 alexandre.belloni@bootlin.com, brgl@bgdev.pl,
 damien.lemoal@opensource.wdc.com, dmitry.torokhov@gmail.com,
 linux@dominikbrodowski.net, balbi@kernel.org, gregkh@linuxfoundation.org,
 deller@gmx.de, perex@perex.cz, jingoohan1@gmail.com, lee@kernel.org,
 kernel@wantstofly.org, lgirdwood@gmail.com, linus.walleij@linaro.org,
 marek.vasut@gmail.com, mkpetch@internode.on.net, miquel.raynal@bootlin.com,
 lost.distance@yahoo.com, philipp.zabel@gmail.com, linux@armlinux.org.uk,
 sre@kernel.org, slapin@ossfans.org, s.shtylyov@omp.ru,
 sudipm.mukherjee@gmail.com, tiwai@suse.com, ulf.hansson@linaro.org,
 vigneshr@ti.com, viresh.kumar@linaro.org, wsa+renesas@sang-engineering.com,
 linux-pm@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 patches@opensource.cirrus.com, linux-leds@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <20230105134622.254560-1-arnd@kernel.org>
References: <20230105134622.254560-1-arnd@kernel.org>
Subject:  Re: (subset) [PATCH v2 00/27] ARM: pxa: remove all unused boards&drivers
Message-Id: <167355367885.2500964.3629822486060649314.b4-ty@kernel.org>
Date: Thu, 12 Jan 2023 20:01:18 +0000
MIME-Version: 1.0
X-Mailer: b4 0.12-dev-8b3d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_120132_687257_2138D8E2 
X-CRM114-Status: GOOD (  16.71  )
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

On Thu, 05 Jan 2023 14:45:55 +0100, Arnd Bergmann wrote:
> Most of the legacy PXA board files were marked as unused in linux-5.19 and
> can get removed in linux-6.3. There is support for pxa250/pxa270/pxa300
> using devicetree already, which supports a number of boards, but progress
> on converting the remaining ones has stalled over the past few years.
> 
> The two boards that are left in the tree for now are the three 'sharpsl'
> variants (spitz/akita/borzoi) and the 'gumstix' family of machines.
> Both of these are supported by qemu, which can be helpful for completing
> the DT conversion.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[14/27] ASoC: PXA: make SND_PXA2XX_SOC_AC97 user-selectable
        commit: 5eab9265759e2fb042aa452931c3d06ab7ab8dae
[15/27] ASoC: pxa: remove unused board support
        (no commit info)

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
