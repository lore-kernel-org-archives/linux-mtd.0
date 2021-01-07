Return-Path: <SRS0=uqc5=GK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3856C433DB
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Jan 2021 01:19:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D929C23123
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Jan 2021 01:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D929C23123
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mba.ocn.ne.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:From:Subject:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Sy8B4gzeoWlilC34hZj1OhEU5a6qRMvIy0Qcn8s7YMo=; b=2LQErh1a0fkc6b6b+eYRJ9/rN
	cQxxXkBEnEID3Ws9f74EmbY2fO4xEEBWAX2iz4ZhfGT3QqSVLlwhvvLLQfF6zLFvhssTnAx3tPCMX
	NEFH1xNk5n9CnZIAMMPUKXsbqbli9k42cl5OHR6j9NgSAHImSjeK/QR7hVdMJqVCyGQopxMTsZXWz
	tT1PgSbfB3+7id58BTcCmfRc3K0QrAMwJZ9NRWjIHTC6l9x27woya5o/ZfTG7KGYNNMCzjk4MSsMM
	yAY4AJEiGgW2smWHSfHWqrRkOGqC+bdTVJdlqo0PszOklL614T7avS60cKYI/qSARR8ngX2dTSRgz
	W6Jffp24w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxJvq-00037l-WD; Thu, 07 Jan 2021 01:17:43 +0000
Received: from mogw5208.ocn.ad.jp ([125.206.161.9])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxJvn-00037D-8F
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2021 01:17:41 +0000
Received: from mf-smf-unw005c1.ocn.ad.jp (mf-smf-unw005c1.ocn.ad.jp
 [153.138.219.78])
 by mogw5208.ocn.ad.jp (Postfix) with ESMTP id 132CD2A041E;
 Thu,  7 Jan 2021 10:17:34 +0900 (JST)
Received: from ocn-vc-mts-201c1.ocn.ad.jp ([153.138.219.212])
 by mf-smf-unw005c1.ocn.ad.jp with ESMTP
 id xJu3kE3BKaeryxJvikLBIg; Thu, 07 Jan 2021 10:17:34 +0900
Received: from smtp.ocn.ne.jp ([153.149.227.165])
 by ocn-vc-mts-201c1.ocn.ad.jp with ESMTP
 id xJvhkfc3Tf1TbxJvhkXnKU; Thu, 07 Jan 2021 10:17:34 +0900
Received: from localhost (p1601136-ipoe.ipoe.ocn.ne.jp [114.172.254.135])
 by smtp.ocn.ne.jp (Postfix) with ESMTPA;
 Thu,  7 Jan 2021 10:17:33 +0900 (JST)
Date: Thu, 07 Jan 2021 10:17:29 +0900 (JST)
Message-Id: <20210107.101729.1936921832901251107.anemo@mba.ocn.ne.jp>
To: geert@linux-m68k.org
Subject: Re: [PATCH 00/10] Remove support for TX49xx
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <CAMuHMdV86BES7dmWr-7j1jbtoSy0bH1J0e5W41p8evagi0Nqcw@mail.gmail.com>
References: <CAMuHMdX=trGqj8RzV7r1iTneqDjWOc4e1T-X+R_B34rxxhJpbg@mail.gmail.com>
 <20210106184839.GA7773@alpha.franken.de>
 <CAMuHMdV86BES7dmWr-7j1jbtoSy0bH1J0e5W41p8evagi0Nqcw@mail.gmail.com>
X-Mailer: Mew version 6.7 on Emacs 24.5 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_201739_459647_B9FADFC3 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
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
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, tiwai@suse.com, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 linux-spi@vger.kernel.org, linux-rtc@vger.kernel.org, wim@linux-watchdog.org,
 herbert@gondor.apana.org.au, richard@nod.at, kuba@kernel.org,
 linux@roeck-us.net, linux-watchdog@vger.kernel.org, broonie@kernel.org,
 mpm@selenic.com, dan.j.williams@intel.com, perex@perex.cz,
 a.zummo@towertech.it, tsbogend@alpha.franken.de, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 6 Jan 2021 21:41:24 +0100, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> > Is that sufficient to keep it?
>>
>> for me it is. But now we probaly need some reverts then...
> 
> Indeed. Fortunately not all of it, as some removals were TX4938-only.

These patches should not break RBTX4927:

  net: tc35815: Drop support for TX49XX boards
  spi: txx9: Remove driver
  mtd: Remove drivers used by TX49xx
  char: hw_random: Remove tx4939 driver
  rtc: tx4939: Remove driver
  ide: tx4938ide: Remove driver

And these patches just break audio-support only.

  dma: tx49 removal
  ASoC: txx9: Remove driver

I think dma and ASoC drivers are hard to maintain now, and can be
dropped for basic support for RBTX4927.
(TX39 boards does not have audio-support, so dma txx9 driver can be
dropped too)

---
Atsushi Nemoto

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
