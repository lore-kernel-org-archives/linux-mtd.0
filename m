Return-Path: <SRS0=9jYX=DY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 904B1C433DF
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2020 21:02:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A9F0207BB
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2020 21:02:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LygkWlug";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel-com.20150623.gappssmtp.com header.i=@intel-com.20150623.gappssmtp.com header.b="ntIAxdfj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A9F0207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vhYXa9qx8tehMPI21zEWiPZPTd3pHi7Q/lsd1Jv3izg=; b=LygkWluguRt3T8quWecMmYEEf
	PMPQM5jtJ5f1/t38vMygJ2OAQW+oUMmt+g3RhKpOGIPeEJixz8YvPyN9bWOjOdoas8ICM6KrKeLhK
	7GAHsY44s3OoRHUssTypCK9v/yaNv5x0xkf6GtdUZ6gIMv6aoH/B1JbMqwzGoaDj0bBM2Ps05+Xsv
	rweEEC1TI5lKXlUi/YPdhxgqiGFXeunDLFRVHaZA2W64NFPeraW9vlIZxNQliS+2bjCqEC4PB569b
	47GFda7UsnSBRMvnk0C8Q6KDh68aa845e3ykoTLJZ1aXqFCPeTEL9/BA8GCV70cpwXx+IXQTIvelr
	xUMMQok7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTtKh-0002Fc-Sw; Sat, 17 Oct 2020 21:01:43 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTtKb-0002C2-5S
 for linux-mtd@lists.infradead.org; Sat, 17 Oct 2020 21:01:39 +0000
Received: by mail-ej1-x642.google.com with SMTP id h24so8465027ejg.9
 for <linux-mtd@lists.infradead.org>; Sat, 17 Oct 2020 14:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QU5tUnKrk3cCgEOM6DUuSpHohPcIoidzngrqxPrVqlg=;
 b=ntIAxdfj5B3UZZJPAO3W3zqpuYJdxZe6wmMN+Cg5+tfh5QjsxLbXR5o2amfdJQ2J48
 +r9G2vZiMs4S/e6t6kNU+/1RisTXP2Yspklt8lksB4PhSQjsUISEYusYJeN2p0XCHoqr
 5tX/QI+fZe3GQZJaviemAIYQlGxoIFC7s6aX8R5MJQLi2SOYJ/keQbrc62HNUeJ8pCOI
 7WYztP0OE4axPIRoGDfVK4aq4k9dPY6fZ69Y4fL3/a70qb0GrKtNhloBSbp9yIhwtpgg
 UECkhdkcAFyI2jUc3qFZfU7NKoc+E1dZJHZxhONiRQFFV//aVnbaYjp+hfJUaNjfh3TU
 ik3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QU5tUnKrk3cCgEOM6DUuSpHohPcIoidzngrqxPrVqlg=;
 b=bLPBxGJ4Zg/Hwmp/lonPfNbR1vVorN5gpkbNKEaXnyNDI8tvoJdtp4VZSYAUibyMOi
 rmBK6Ht4NZnicflD3a7UmAfrdYtQAnEBsKszmVRyNV2NS+8erqASLELn1hU+9iE3l5b1
 3eOIqiU41vPBdvuxw8CVZukTD7TK0nwsWI66Pm2LpvpjTdXhyx94Ex93TrQU2EUSRw4v
 FFgXGA8Fb6LlirZ9y5cHCZSDoU4BSjsGFTb9aVc84Sw0qaEdGZjTMdd+/bZ7lH9cXiNN
 tKDRUniVzPN/lRkkX5OLli8EiCGN8PKeRjMFXepkNAs1rbXYoSaMHocnk1JHvFxDcPU4
 1APA==
X-Gm-Message-State: AOAM532edwVn/pc+23txZm8LucJQvvWEdvyNpu75JYjGluNUNCMVxWZQ
 c3EdO5Q6ZhJL6pfEZwwoteQq21Eh0TrMf0OZ3nFOcA==
X-Google-Smtp-Source: ABdhPJzde2s6j/g/ekBLPPrgSH2EJqfd3KSDRuhe3Mnzr9w98lVRa6HniOngGCyhNuV4q/eDk1HFvyy/v8IqyEanGTA=
X-Received: by 2002:a17:906:1a19:: with SMTP id
 i25mr9957370ejf.323.1602968492144; 
 Sat, 17 Oct 2020 14:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201017160928.12698-1-trix@redhat.com>
In-Reply-To: <20201017160928.12698-1-trix@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Sat, 17 Oct 2020 14:01:22 -0700
Message-ID: <CAPcyv4jkSFxMXgMABX7sDbwmq8zJO=rLX2ww3Y9Tc0VAANY8xQ@mail.gmail.com>
Subject: Re: [RFC] treewide: cleanup unreachable breaks
To: trix@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201017_170137_247821_B237A182 
X-CRM114-Status: GOOD (  21.48  )
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
Cc: alsa-devel@alsa-project.org,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 linux-iio@vger.kernel.org, nouveau@lists.freedesktop.org,
 storagedev@microchip.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "open list:KEYS-TRUSTED" <keyrings@vger.kernel.org>,
 linux-mtd@lists.infradead.org, ath10k@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, usb-storage@lists.one-eyed-alien.net,
 linux-watchdog@vger.kernel.org, devel@driverdev.osuosl.org,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>, intel-wired-lan@lists.osuosl.org,
 industrypack-devel@lists.sourceforge.net,
 Linux PCI <linux-pci@vger.kernel.org>, spice-devel@lists.freedesktop.org,
 MPT-FusionLinux.pdl@broadcom.com,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 linux-serial@vger.kernel.org, linux-nfc@lists.01.org,
 Linux-pm mailing list <linux-pm@vger.kernel.org>, linux-can@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 xen-devel <xen-devel@lists.xenproject.org>, linux-amlogic@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net, platform-driver-x86@vger.kernel.org,
 linux-integrity@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
 Netdev <netdev@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>,
 Linux Wireless List <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-security-module@vger.kernel.org,
 linux-crypto <linux-crypto@vger.kernel.org>, patches@opensource.cirrus.com,
 bpf@vger.kernel.org, ocfs2-devel@oss.oracle.com, linux-power@fi.rohmeurope.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Oct 17, 2020 at 9:10 AM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> This is a upcoming change to clean up a new warning treewide.
> I am wondering if the change could be one mega patch (see below) or
> normal patch per file about 100 patches or somewhere half way by collecting
> early acks.
>
> clang has a number of useful, new warnings see
> https://clang.llvm.org/docs/DiagnosticsReference.html
>
> This change cleans up -Wunreachable-code-break
> https://clang.llvm.org/docs/DiagnosticsReference.html#wunreachable-code-break
> for 266 of 485 warnings in this week's linux-next, allyesconfig on x86_64.
>
> The method of fixing was to look for warnings where the preceding statement
> was a simple statement and by inspection made the subsequent break unneeded.
> In order of frequency these look like
>
> return and break
>
>         switch (c->x86_vendor) {
>         case X86_VENDOR_INTEL:
>                 intel_p5_mcheck_init(c);
>                 return 1;
> -               break;
>
> goto and break
>
>         default:
>                 operation = 0; /* make gcc happy */
>                 goto fail_response;
> -               break;
>
> break and break
>                 case COLOR_SPACE_SRGB:
>                         /* by pass */
>                         REG_SET(OUTPUT_CSC_CONTROL, 0,
>                                 OUTPUT_CSC_GRPH_MODE, 0);
>                         break;
> -                       break;
>
> The exception to the simple statement, is a switch case with a block
> and the end of block is a return
>
>                         struct obj_buffer *buff = r->ptr;
>                         return scnprintf(str, PRIV_STR_SIZE,
>                                         "size=%u\naddr=0x%X\n", buff->size,
>                                         buff->addr);
>                 }
> -               break;
>
> Not considered obvious and excluded, breaks after
> multi level switches
> complicated if-else if-else blocks
> panic() or similar calls
>
> And there is an odd addition of a 'fallthrough' in drivers/tty/nozomi.c
[..]
> diff --git a/drivers/nvdimm/claim.c b/drivers/nvdimm/claim.c
> index 5a7c80053c62..2f250874b1a4 100644
> --- a/drivers/nvdimm/claim.c
> +++ b/drivers/nvdimm/claim.c
> @@ -200,11 +200,10 @@ ssize_t nd_namespace_store(struct device *dev,
>                 }
>                 break;
>         default:
>                 len = -EBUSY;
>                 goto out_attach;
> -               break;
>         }

Acked-by: Dan Williams <dan.j.williams@intel.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
