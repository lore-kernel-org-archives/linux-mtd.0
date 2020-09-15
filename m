Return-Path: <SRS0=LGak=CY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C17C433E2
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2020 09:08:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 928422076C
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2020 09:08:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UKKc1rps"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 928422076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=04DjL34UrmMKRi7Omdy56br/rQBhEKUJO/qx9gKpfMw=; b=UKKc1rpseuZMn7+2+js3YsV8C
	giUr88OjTYpA0ibIq6pntNlMwOc4URDpqmyAg83IDBOTXnWX9Wp8k+/DnZ+EGAmvxNIq7gmB3ZCeI
	8uG86/+CrinMAkKzTjczljeqlRaRcj7LqvJSoeXjqHSh6KzspjCUS1kDQImNDi2JnrsKoKvN6hRmJ
	xrRt7IqC5AbvgdFy4/wKAD/mkc5n4Ftvf+815+2vmpuXPNoGYiPD7Cw/OLwuceXjnnBbTAso8oXbx
	xusiYlelc0gsvnJ8Gs5XrOCIfK6xOxNd3H+zkpKw9ApyPRW7RCN7c9GXXFjAl8GISc/hCbtus1rhR
	iLbq5Sd7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI6vF-0003RU-BO; Tue, 15 Sep 2020 09:06:45 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI6vB-0003PS-DT; Tue, 15 Sep 2020 09:06:42 +0000
IronPort-SDR: WJ5pzq0jxm14EXViPIzsOsgUvKDDPMxCofeh3hU2FhuT38uqOJLz57zjyu3ISmB12zV/I+zGUB
 9ysxRv7a1uZg==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="158509611"
X-IronPort-AV: E=Sophos;i="5.76,429,1592895600"; d="scan'208";a="158509611"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 02:06:35 -0700
IronPort-SDR: JN6muYTQqB3wm3kCXqk1xsORqKL94poqyPOQLwwV9SSOFBG1M/RLedvNq9ruyR1KSefDfAWvPJ
 brvH/uTc728w==
X-IronPort-AV: E=Sophos;i="5.76,429,1592895600"; d="scan'208";a="482690707"
Received: from emoriart-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.7.208])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 02:06:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Joe Perches <joe@perches.com>, LKML <linux-kernel@vger.kernel.org>,
 Jiri Kosina <trivial@kernel.org>
Subject: Re: [Intel-gfx] [trivial PATCH] treewide: Convert switch/case
 fallthrough; to break; 
In-Reply-To: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
Date: Tue, 15 Sep 2020 12:06:21 +0300
Message-ID: <87d02nxvci.fsf@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_050641_691757_142BDA97 
X-CRM114-Status: UNSURE (   9.41  )
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
Cc: linux-fbdev@vger.kernel.org, oss-drivers@netronome.com,
 nouveau@lists.freedesktop.org, alsa-devel <alsa-devel@alsa-project.org>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-ide@vger.kernel.org, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, dccp@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 kvmarm@lists.cs.columbia.edu, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-mmc@vger.kernel.org,
 Kees Cook <kees.cook@canonical.com>, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-nvme@lists.infradead.org,
 storagedev@microchip.com, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-nfs@vger.kernel.org,
 linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-sctp@vger.kernel.org, iommu@lists.linux-foundation.org,
 netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 09 Sep 2020, Joe Perches <joe@perches.com> wrote:
> diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
> index 5ac0dbf0e03d..35ac539cc2b1 100644
> --- a/drivers/gpu/drm/i915/display/intel_sprite.c
> +++ b/drivers/gpu/drm/i915/display/intel_sprite.c
> @@ -2861,7 +2861,7 @@ static bool gen12_plane_format_mod_supported(struct drm_plane *_plane,
>  	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
>  		if (!gen12_plane_supports_mc_ccs(dev_priv, plane->id))
>  			return false;
> -		fallthrough;
> +		break;
>  	case DRM_FORMAT_MOD_LINEAR:
>  	case I915_FORMAT_MOD_X_TILED:
>  	case I915_FORMAT_MOD_Y_TILED:

Acked-by: Jani Nikula <jani.nikula@intel.com>

for merging via whichever tree seems best.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
