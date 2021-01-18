Return-Path: <SRS0=hsQV=GV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C9C6C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Jan 2021 13:04:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D56AB20829
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Jan 2021 13:04:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D56AB20829
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=su9Kp9c8nvE+EFCaBgsFqIgDNNAcH7pZ1O9cPdoZecs=; b=V3SpikJ61cgvPgkxMT9GVvjXY
	AsLWvPKMMtJb9PoxhP9Fgpnyuo+a6m+elx5B+GtRyQQbmsLhNTrEvMPJFcioqOS+Ho4o+4TPx8P2O
	TEt3MqcP5BjpziXHtGBHh+5t2Frw/uV+nz18LuhDseq0q6Hd9LYRrHifMtYh01X0A544shOhRFhWm
	ONaBvkv1k+HJtgvpLaqIwsrUCAgp7C4ZQOjO7D684L2rAq62Ry0rQZhgYVXdV4XDGUV3JNXHQ1+qQ
	uglCr1lA8GNyRS+FjcwMkmmw+pb8x3yqA6iJW288jjYU39SvX0Py+0a2ijEOzS5DYX0x6DsFG1aue
	MpGK176Ww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1UC0-0003vo-8T; Mon, 18 Jan 2021 13:03:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1UBt-0003tS-Qs; Mon, 18 Jan 2021 13:03:32 +0000
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1l1UBn-00047p-Mz; Mon, 18 Jan 2021 14:03:23 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: richard@nod.at, robh+dt@kernel.org, vigneshr@ti.com,
 miquel.raynal@bootlin.com, Yifeng Zhao <yifeng.zhao@rock-chips.com>
Subject: Re: (subset) [PATCH v16 0/8] Add Rockchip NFC drivers for RK3308 and
 others
Date: Mon, 18 Jan 2021 14:03:22 +0100
Message-ID: <2205525.ECZNHGQPT7@diego>
In-Reply-To: <161097370156.287816.7898637730580960045.b4-ty@sntech.de>
References: <20201210002134.5686-1-yifeng.zhao@rock-chips.com>
 <161097370156.287816.7898637730580960045.b4-ty@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_080329_903287_B8BA21F4 
X-CRM114-Status: GOOD (  11.15  )
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
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Montag, 18. Januar 2021, 13:57:36 CET schrieb Heiko Stuebner:
> On Thu, 10 Dec 2020 08:21:30 +0800, Yifeng Zhao wrote:
> > Rockchp's NFC(Nand Flash Controller) has four versions: V600, V622, V800 and
> > V900.This series patch can support all four versions.
> > 
> > 
> > Changes in v16:
> > - Fix some comments about 'ret' variable.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [6/8] arm: dts: rockchip: Add NFC node for RV1108 SoC
>       commit: 2525f194f9dc07c48b0a12697128357068c2e04b
> [7/8] arm: dts: rockchip: Add NFC node for RK2928 and other SoCs
>       commit: 9c2bfe53b2fc4a8a63311f162e80b27978db6c06
> [8/8] arm: dts: rockchip: Add NFC node for RK3036 SoC
>       commit: 4cd9a03435bcd20ce6f524e3826fd263951c22fe

I of course also applied patches 4-5 (arm32) in
- https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=v5.12-armsoc/dts32&id=2525f194f9dc07c48b0a12697128357068c2e04b
- https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=v5.12-armsoc/dts32&id=9c2bfe53b2fc4a8a63311f162e80b27978db6c06

just b4 seemed to hickup with my 2 fetches for arm32+arm64.


Heiko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
