Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B3BC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Dec 2021 12:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U64/CAFKF/S3XvOTo8Q/SZH8XHbTt/R13kfFRV8zh6w=; b=qdsKtBgUuuj0aP
	qg/NHEdY+xP6ePYXuRdf8L87f5L5Wq1BLXeSHUSfo0yDMYJCEg7i/C2skt6O4oCYRXTbbPOWGabqt
	MFtCNahEeI2SqbR2bW2k9aqhJj77KULOC1NsIN71smH5HgvL2OLL4yI8yCiutTXirp75pQH+ynAeA
	xtHPuG3j+tVQDjyso9Guq4stuFwIMBWj+5EOmp5slCWReRjdvOcz1oAZGwTCsBAMld0QtToC0DVCn
	pIae2XFIcSOUIKjiG9akzsSb4xwkE0Jd2Lbws+iZZRRFq1ZB+KZX3o6oxe0iApCrRTAhyt5G3vfPZ
	CPdpWF3qtcGC2LDv+fKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mslHf-00CJbL-8T; Thu, 02 Dec 2021 12:33:55 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mslCu-00CHuI-Gq
 for linux-mtd@lists.infradead.org; Thu, 02 Dec 2021 12:29:02 +0000
Received: by mail-ed1-x531.google.com with SMTP id z5so50318853edd.3
 for <linux-mtd@lists.infradead.org>; Thu, 02 Dec 2021 04:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yIHJduGhi+IgJjblRtFiKjHLP7Ao4GSCzCbgjV6AI0g=;
 b=bEYsv4wF853W8UKT+8STBH1C/eBQtC+ON3Re4sV3zlkHai540cHzD6xE96e+vYUGZi
 UiohbLIkxHnwTZfDMk8iBLuuZC1mkyxp+elc2Tf9JiPj9KoORf+AfZ+2kv8le9J9oo7X
 lm/NBTxhXW4+XeCD2V/KGi9weCBYzO1T6Rc+PzBInJF1bevBYSVqQO7J3gCUriljU9nr
 FAHXa71KoufMw1NkUz2bQnW9uZUm+9EdfJHuxCZwSpEaKB6GCghqJGU8t4DAgaKVsEJ9
 pGJ8mZC7zq3UTM1ntOtki3tLCO0ktvnYf0xTP8MdHcy821ym/i1+0j6sccsMWHLCfqAL
 4huQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yIHJduGhi+IgJjblRtFiKjHLP7Ao4GSCzCbgjV6AI0g=;
 b=Kv5xXkxXbQ38hyy2DDZSt/Z0m4CsD7oz+M8IFIZHi3KdKLuSOTE+CinKpFmbXgcWpF
 LEricEev3RlAI3GaAjMZUgYZb9N14nhw196/gTbn5+O9VG2Ost2VFNWcTmdcQXN1hXyx
 YWdqA6l2B9gyRPNGkbfpCupEmoIXoJdiwlag86PAuJSZyeSTpM+45KUtnC8G7TE+xaaI
 XLdmtCGWNE8TQ/w/Ov166HESVxqtsdtC54OKUkAYAR+ZKjGbPQdjCTRINto6MNb35Jlm
 /HqTMfmDbmSY2WzfRL4kjcBDIpwF+DcgRPw3JF2DrZr83fdhif0vKo7j3Y7quo3H/Bet
 odfQ==
X-Gm-Message-State: AOAM5324Wt4g2W4SyHmGE/O+XU12izR8elrofBt0H35Zns0pG07AZkb8
 evWIcTO1bqdJcnladwOXlKD30dCoH+ATV6/Vk4HZCw==
X-Google-Smtp-Source: ABdhPJwVLTfOeFrJH1vtaO5VgCmVt8kl/7m1GwfsGdFPILzfElCaVjFePEsuiYfj32fzPRUhQkb9mSEvHSNwJ50Wmo0=
X-Received: by 2002:a05:6402:4389:: with SMTP id
 o9mr17620193edc.138.1638448137066; 
 Thu, 02 Dec 2021 04:28:57 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYuupqqemLbgoVL2kYL4d2AtZLBo1xcshWWae7gX5Ln-iA@mail.gmail.com>
In-Reply-To: <CA+G9fYuupqqemLbgoVL2kYL4d2AtZLBo1xcshWWae7gX5Ln-iA@mail.gmail.com>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Thu, 2 Dec 2021 13:28:46 +0100
Message-ID: <CADYN=9KeKhZ-OSbx1QHKYfXu+p-nXVjubbay1sXd_g75LLSZRg@mail.gmail.com>
Subject: Re: [next] WARNING: CPU: 2 PID: 66 at kernel/locking/rwsem.c:1298
 __up_read
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
 sean@geanix.com, Miquel Raynal <miquel.raynal@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-mtd@lists.infradead.org, open list <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>, 
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 linux-block <linux-block@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_042900_612208_87F0C38E 
X-CRM114-Status: GOOD (  12.46  )
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

On Tue, 30 Nov 2021 at 18:01, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> [Please ignore this email if it is already reported]
>
> Regression found on qemu_arm64.
> Following kernel warnings reported on Linux next-20211130 while booting.

I bisected down to 1ebe2e5f9d68 ("block: remove GENHD_FL_EXT_DEVT")

and when I reverted 1ebe2e5f9d68 ("block: remove GENHD_FL_EXT_DEVT") and the
3 releated patches so patch 1ebe2e5f9d68 was reverted cleanly I
managed to boot without
a warning.

Related patches from next-20211130:
9f18db572c97 ("block: don't set GENHD_FL_NO_PART for hidden gendisks")
430cc5d3ab4d ("block: cleanup the GENHD_FL_* definitions")
a4561f9fccc5 ("sr: set GENHD_FL_REMOVABLE earlier")

With this said, if I revert 9d6abd489e70 ("mtd: core: protect access
to MTD devices while in suspend")
I didn't see the warning either.

Any idea what can be wrong here or what a fix could be?

Only apply this patch from Geert
https://lore.kernel.org/lkml/c26dfdf9ce56e92d23530a09db386b283e62845d.1638289204.git.geert+renesas@glider.be/
makes the warning go away too.

Cheers,
Anders

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
