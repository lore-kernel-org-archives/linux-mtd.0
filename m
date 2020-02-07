Return-Path: <SRS0=Kp4F=33=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B82E9C352A2
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 13:01:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ADB0214AF
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 13:01:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LeTZEeXk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="biJM5pU/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ADB0214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+r9hPJIxfdTnts/QMwp7fGmjJgaZF0BMOkydJPfaTww=; b=LeTZEeXkCRAQSL
	K3kao1iDFIltOeY7KHVYTRr0azXJg+N+FciRVmTnfOD771uwylpmy+0nMphQ5PZmwVWZXpQLezCRA
	4HvHJELWE3VX6OU+y6Jq4Br3tz/GEuZePGQOfySNC3evsGsQPkkTnjVdpOOPnk082fySRM6I2FxCB
	lvRlQsO8LvhuZi61S9Oc07AG7OeMZF6+e8nbR4RYnTXv5j1qIApW1rlswF4DWQv1f0DKgtAa3cDR6
	JMC3xQMf83tLfxtX+D8ZdaT1isJ4bgwUSUaQa0L2pg2HV7jwG+UYdvkvsRb/dINoiQer1I7+YsX5Y
	oxb4HSoc0DjizH+NUBhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j03G7-00010D-0I; Fri, 07 Feb 2020 13:01:23 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j03G4-0000zc-J1
 for linux-mtd@lists.infradead.org; Fri, 07 Feb 2020 13:01:22 +0000
Received: by mail-il1-x141.google.com with SMTP id s18so1648734iln.0
 for <linux-mtd@lists.infradead.org>; Fri, 07 Feb 2020 05:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=4IDpUr8/lBjGDlP6vwyVyMKxwYxAKScLaCcjW3wnWfA=;
 b=biJM5pU/mOOpdic+lsjJl9Fn0v5FjdQZFF+FXHhrc1UuDAW15prA8UMWmaUluq4DB1
 NSIPM2qFURuFTiRk0KkL0vygXJ+RaIbmXDWnWG5s9uPl0kxlicOydTQI9FHk+poC+h3D
 7xGcO7ncGEoaViaTKi4869MUmr++TyBohmRfc5G1l94F5x+ujcP4wrNKGBbGD1R85Na0
 JC4HV9wNSYlz4irdwnhyHfvkIwgJSIjzmXEGC6oOZEl3qK7LjYzYELLVG3YEnDRSuzNy
 2GH3Gp4STZFJZIt0hwX1beiTVaCyMh9BeQnVsOHRmT60RIFii5sdh5QJS3jHFvHDxLrg
 CsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=4IDpUr8/lBjGDlP6vwyVyMKxwYxAKScLaCcjW3wnWfA=;
 b=NE7YV0QGOW8fUlGUiWGS5GYDHRnslTwdWsn7qC41QjpLYzuozlz0yJBnb4zMM1UCXa
 lhb/+tsuLw34ASFUOXJh+2f98zATos4UOuQcTilN7EXgo0VHqPyV2Xco4J+mkeB46364
 QHRsa5JWBCnjWSm05weuwftXW7a9r/+Kki4j3F3KnPdq1rvdYQVV6b+MDSclQJ+hX6fw
 wFuzafqKJoRzTmLXoSk5a4NUanJY+aBssEQMemaIPcAOD1w5ZzLt7aZfQ+eHyeyKCaPO
 yZBPJoRn+tiFRCi81ncAvBpkFRgWN20FNDinurzFgbmhMxtPdDrkZHdVPiqvHeidO2JK
 c0Ug==
X-Gm-Message-State: APjAAAW51DJNmSy00yye5Hm7IVe7sQcsK7fRnhHA1Ev/T+B6IwYAoT2L
 8G5Zk3KMSyHCVzStrJ+9oDg8mq/6EXD+S+91ADw=
X-Google-Smtp-Source: APXvYqwNIDHbSYPG5aN+ILU7k3NPOWD84Bm0vb30th4pSY8J48Xu8j7mMYm75hpXiKjGlyQcVs2oVHlK8t3IPQTDHnU=
X-Received: by 2002:a92:5855:: with SMTP id m82mr9072837ilb.302.1581080478082; 
 Fri, 07 Feb 2020 05:01:18 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP;
 Fri, 7 Feb 2020 05:01:17 -0800 (PST)
In-Reply-To: <20200207115521.i7flzwf6e24obq5r@qschulz>
References: <CAA=hcWSCZROrpDBWV5ZAA+LV6j0cjRSKxyjonOfWS4mCZAtdHg@mail.gmail.com>
 <em86bbcd60-f004-4acb-b508-4471dac5c7c1@andys-imac.leeshillfarm.local>
 <CAA=hcWQsP1N58iqrxEggZBdSksgHk+gfuG7yz0+C3G7o0=DzOw@mail.gmail.com>
 <c159fe1d7cc14f5c80878fe81a957bb4@tagmaster.com>
 <CAA=hcWQPrfb3UrYsfyhs4as8wGDf5DsyEtF=cgCo4gJprx=b1Q@mail.gmail.com>
 <20200207115521.i7flzwf6e24obq5r@qschulz>
From: JH <jupiter.hce@gmail.com>
Date: Sat, 8 Feb 2020 00:01:17 +1100
Message-ID: <CAA=hcWR8F_jP5mascw02RnLRi2NkAb2juFhNmEoaeuY5G74HFw@mail.gmail.com>
Subject: Re: [OE-core] [yocto] Support UBI u-boot
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_050120_631234_2A1B1B58 
X-CRM114-Status: GOOD (  16.43  )
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
Cc: Andy Pont <andy.pont@sdcsystems.com>,
 Yocto discussion list <yocto@yoctoproject.org>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 Pelle Windestam <Pelle.Windestam@tagmaster.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Meta Freescale <meta-freescale@yoctoproject.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Quentin,

Thanks for your response, so glad you help me here again :-).

On 2/7/20, Quentin Schulz <quentin.schulz@streamunlimited.com> wrote:
>> /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/cmd/ubi.c:448:
>> undefined reference to `mtdparts_init'
>
> This function is not defined. So you look it up in the sources, find
> where it's defined.

That is a function call in cmd/ubi.c:

int ubi_detach(void)
{
    if (mtdparts_init() != 0) {
        printf("Error initializing mtdparts!\n");
        return 1;
    }
.....

That function is in cmd/mtdparts.c:
int mtdparts_init(void) {
.......
}

It is in the same source directory, I'll have to look it deep, why it
does not compile cmd/mtdparts.c?


> Is it in a file which is compiled/included somewhere?
> Is it surrounded by #ifdef? And by surrounded, I mean the #ifdef can
> be several thousands of lines above the function definition.

Actually, there is no macros to surround that function.


> In that case, I couldn't find the sources of u-boot-imx (didn't take the
> time) but from upstream:
> https://elixir.bootlin.com/u-boot/v2017.03/source/cmd/nand.c#L35

The meta-freescale downloaded the u-boot source from
https://source.codeaurora.org/external/imx/uboot-imx.git

> It's surrounded by #if defined(CONFIG_CMD_MTDPARTS) so you need
> CMD_MTDPARTS to be enabled. Do the same for all the other calls. There's
> no magic thing, you thus have to look it up yourself most of the time.
> Even though arguably, that's a mistake from upstream (there should be a
> dependency on MTDPARTS in Kconfig, anyway...).

You are right, the CONFIG_CMD_MTDPARTS is defined in many defconfig
except it is not in my mx6ull_14x14_evk_defconfig, there are lots of
definitions are defined in other defconfig, but missing in
mx6ull_14x14_evk_defconfig. When I run make menuconfig, I enabled all
MTD, NAND and UBI parts except UBI Fastmap (Experimental feature) in
menuconfig, but I still could not find CONFIG_CMD_MTDPARTS and other
definitions. Need to look it carefully.

I suspect that to run make menuconfig might not be right command, I
tried bitbake -c menuconfig u-boot:

ERROR: Task do_menuconfig does not exist for target u-boot
(./meta-freescale/recipes-bsp/u-boot/u-boot-imx_2017.03.bb:do_menuconfig).
Close matches:
  do_configure

To run kernel menuconfig, I can add KERNEL_CONFIG_COMMAND =
"oe_runmake_call -C ${S} O=${B} imx_v6_v7_defconfig" to a bbappend
file to run bitbake -c menuconfig kernel. Is there an equivelent
UBOOT_CONFIG_COMMAND to run oe_runmake?

Thank you.

- jh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
