Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4539FC433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Jul 2022 14:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZZqTC+JJODa0tI8QFNA8alDbS40VnZ4UjwYd1nCqokI=; b=dj9vbZmk5BEieG
	iFy9dEWbC+4Lh0gmbaANf8lH4u4Y0ffLy5vrU250JehjIDboS7KgCbqdl9QeyRoPUvvRm17evgdQr
	yYgzs45bcuYpLHNQgI1S6nHlQLWW7gK47HGVf5uGxlC97A0FmsLTXkoMRHltfQuqC0yQXpW6XFKUk
	63Bqk68z26B0+qPGdixTmJrwaUQ4vd7WsTuURC4wRxlHMOVeA1CDoSI1hrBMaf0CF1n49NGLxtHHm
	R3UOgbDtNitIVSEREM+X3e89JhoZglBJdaJbP4ReEDeMRjzubNoI6DDlugo9Gp+U/YqETnYGnmXxF
	y5CWODtNrwIWwui9mhlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9S60-00GOrL-MK; Thu, 07 Jul 2022 14:03:08 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9S5w-00GOmb-SQ; Thu, 07 Jul 2022 14:03:06 +0000
Received: by mail-pf1-x42e.google.com with SMTP id j3so6934638pfb.6;
        Thu, 07 Jul 2022 07:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=afbiyF16Fd4Ewaaf3EKKCpvpR7aHAsNAQp7K3TuQXs4=;
        b=EzpeppBfdoHkOWruUNAYNHzOi8S5lBuVkWR/uarc/O7MDVJ2qM1NUNdy3hxzZeKinw
         1f6tPe15AftcBiSP1Sugt5jiQpAKlLcyz+gPyHgHTvK6IkiuSg6SYHkmzqBCpGaHkm3K
         GirawtqITR+EFkG0pF8QxPm0bxzk97EH7JYJxQXFRi4d1kRfsZVOuxKRapjByLByJ3DF
         qAVqAZfaAfJT+F8T/W2rPtPmXy6/uaYwejGaDWQ5Frl3XCXwsQlqWF67lU3BIXdseGBS
         CTJ5pH+oR76s++4uNTCxHCZwHNyWF4xdxY3ay2k5fQlKGRbstnEbIjnAVDZkl7wMQgN9
         oSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=afbiyF16Fd4Ewaaf3EKKCpvpR7aHAsNAQp7K3TuQXs4=;
        b=N1Pm889/ZxFEDqfLXpSp3Pulplms+j8WQItLnmqecLAcF1WB2akH+TmTy/FmGml2/g
         zRSb+TjdUU6ZILaoXpBAnxekmDO29NhfUPNp6ThNUbpwFhwXpFj76HLWQydqAqjttPO9
         rsn/+dnFMrmiqiYdyTdIhNOF0RwSJfoxKsQ0BhArZsZ+xXeL8aI5+8dYzfPx3GjuLE4H
         Isn6n75mNhBJ8c6SXZMtimr9f6eK2nw3hhg+5xDwXPMqpjk7rOWbuoKmow1AJR3TAbie
         YUq67PbqmcmTKX7eOXB9HCz/eVJUWf26sFCrbJSeABCiOo8JJE6m1UesCXnIbwlVf7j8
         qdFA==
X-Gm-Message-State: AJIora/KahlyT5YYkbmw7be7XMyX9GGAIzTECmINdwRfdJFYT6BBNI9j
	miSSyh9tairCSSaBnCOFfNQ=
X-Google-Smtp-Source: AGRyM1uGEg1zRLKU3mt/8yK/HfEqKFBdv1eoQpzxhqHLW6DjIp1gLh6JEsU/RWRdBfoHFypH/TfaNQ==
X-Received: by 2002:a17:90b:4c8f:b0:1ec:cdd0:41b7 with SMTP id my15-20020a17090b4c8f00b001eccdd041b7mr5420238pjb.119.1657202580508;
        Thu, 07 Jul 2022 07:03:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k127-20020a632485000000b004148cbdd4e5sm1215293pgk.57.2022.07.07.07.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 07:02:59 -0700 (PDT)
Date: Thu, 7 Jul 2022 07:02:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: kernel test robot <lkp@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	virtualization@lists.linux-foundation.org,
	usbb2k-api-dev@nongnu.org, tipc-discussion@lists.sourceforge.net,
	target-devel@vger.kernel.org, sound-open-firmware@alsa-project.org,
	samba-technical@lists.samba.org, rds-devel@oss.oracle.com,
	patches@opensource.cirrus.com, osmocom-net-gprs@lists.osmocom.org,
	openipmi-developer@lists.sourceforge.net, nvdimm@lists.linux.dev,
	ntb@lists.linux.dev, netfilter-devel@vger.kernel.org,
	netdev@vger.kernel.org, mjpeg-users@lists.sourceforge.net,
	megaraidlinux.pdl@broadcom.com, linuxppc-dev@lists.ozlabs.org,
	linux1394-devel@lists.sourceforge.net, linux-x25@vger.kernel.org,
	linux-wpan@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-unionfs@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-staging@lists.linux.dev, linux-serial@vger.kernel.org,
	linux-sctp@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-rdma@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-perf-users@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-parport@lists.infradead.org,
	linux-parisc@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-nfc@lists.01.org, linux-mtd@lists.infradead.org,
	linux-mmc@vger.kernel.org, linux-mm@kvack.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-integrity@vger.kernel.org,
	linux-input@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-fpga@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-efi@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-cxl@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-cifs@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linaro-mm-sig@lists.linaro.org,
	legousb-devel@lists.sourceforge.net, kvm@vger.kernel.org,
	keyrings@vger.kernel.org, isdn4linux@listserv.isdn4linux.de,
	iommu@lists.linux.dev, iommu@lists.linux-foundation.org,
	intel-wired-lan@lists.osuosl.org, greybus-dev@lists.linaro.org,
	dri-devel@lists.freedesktop.org, dm-devel@redhat.com,
	devicetree@vger.kernel.org, dev@openvswitch.org,
	dccp@vger.kernel.org, damon@lists.linux.dev, coreteam@netfilter.org,
	cgroups@vger.kernel.org, ceph-devel@vger.kernel.org,
	ath11k@lists.infradead.org, apparmor@lists.ubuntu.com,
	amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org,
	accessrunner-general@lists.sourceforge.net
Subject: Re: [linux-next:master] BUILD REGRESSION
 088b9c375534d905a4d337c78db3b3bfbb52c4a0
Message-ID: <20220707140258.GA3492673@roeck-us.net>
References: <62c683a2.g1VSVt6BrQC6ZzOz%lkp@intel.com>
 <YsaUgfPbOg7WuBuB@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YsaUgfPbOg7WuBuB@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_070304_956905_F5982C70 
X-CRM114-Status: GOOD (  10.68  )
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

On Thu, Jul 07, 2022 at 10:08:33AM +0200, Greg KH wrote:

[ ... ]
> > 
> > Unverified Error/Warning (likely false positive, please contact us if interested):
> > 
> > arch/x86/events/core.c:2114 init_hw_perf_events() warn: missing error code 'err'
> > drivers/android/binder.c:1481:19-23: ERROR: from is NULL but dereferenced.
> > drivers/android/binder.c:2920:29-33: ERROR: target_thread is NULL but dereferenced.
> > drivers/android/binder.c:353:25-35: ERROR: node -> proc is NULL but dereferenced.
> > drivers/android/binder.c:4888:16-20: ERROR: t is NULL but dereferenced.
> > drivers/base/regmap/regmap.c:1996:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
> > drivers/char/random.c:869:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
> > drivers/firmware/arm_scmi/clock.c:394:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
> > drivers/firmware/arm_scmi/powercap.c:376:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
> > drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_powertune.c:1214:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
> > drivers/gpu/drm/amd/display/dc/os_types.h: drm/drm_print.h is included more than once.
> > drivers/gpu/drm/bridge/ite-it66121.c:1398:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
> > drivers/greybus/operation.c:617:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
> 
> <snip>
> 
> When the compiler crashes, why are you blaming all of these different
> mailing lists?  Perhaps you need to fix your compiler :)
> 

To be fair, it says above "likely false positive, please contact us
if interested". Also, the 32-bit build errors _are_ real, and the NULL
dereferences in the binder driver are at the very least suspicious.

Guenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
