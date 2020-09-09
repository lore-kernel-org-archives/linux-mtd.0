Return-Path: <SRS0=hzeh=CS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C52BBC43461
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2020 22:37:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E77121D7E
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2020 22:37:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZyrMlkoK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="NyzBsT+J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E77121D7E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J0kAqeSKCIh1uAqA4lE/XwXnHiigHAKXrED993KHUdM=; b=ZyrMlkoK/9Gv4QXdmJ1G5aaVg
	2xeM7stCd4qLJSLtr1Q/uBEc8G2XO8MuqCYDgZ3XDAvCaUmRQq0jr/AnuSbTmYlqngPKQU9JYmuZ4
	/W+PT3+jdAvvFVoxgAqpotTFSVpzmmcLln/vi4Z0KqMz0CRlx6h/1LXgWeGedN4pShMmJ2kgAHKIv
	I5lpvw2xxQ55xZhrAKed1hpTI3MobIbH3dC0s3PlLEyk7VsVG7/TQcTUPkickm5mZr3l4FKV/adn3
	z27K1M1yvzJsq4iNBKtaLacHPEDXYpW1whmhayGSCgmc3lLSIoaQVUXl15ZQdUz/18HnSsVp4W1hE
	sNtCWbrXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kG8hJ-0006PP-6V; Wed, 09 Sep 2020 22:36:13 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG8hB-0006MM-P4
 for linux-mtd@lists.infradead.org; Wed, 09 Sep 2020 22:36:08 +0000
Received: by mail-qk1-x742.google.com with SMTP id q5so4152210qkc.2
 for <linux-mtd@lists.infradead.org>; Wed, 09 Sep 2020 15:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=c134n78aG+T1D05fG/7gwyDy+RohECK5LAEVlOiODCw=;
 b=NyzBsT+JUu0U0kwfTlzpDClheXiWwFCChT8B3B3AnRObKvk4drNujFjFruGeHjyE5E
 J/ekKdFGX4ZPNWUfEPhKExoK0sWWjXwST+pbBqDSQQLO3bhHO97u7XE9KwITCllyZTNP
 KD49/yc1MfvhSPgbWZUU1AxUsv6U0vCFkivBcLxiu3ppVdmJeK1Itxs2CD5ayafEhare
 Y4u34snA9MTl4Likr5RS+E4LR0hKde+fx41J4h2BvlUn7go15Yxb6eLzvLXVka4Mre/N
 zumvX8Blxljzlanq14R9XGa7dbkpGn90Uvx/RhT36f5UMVOZXDvQeH4wAZB+Eu6xRGBh
 woew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c134n78aG+T1D05fG/7gwyDy+RohECK5LAEVlOiODCw=;
 b=F5kbnoclTk0lqK05FWUXg2bzSym+rm/4mTfTpQwZF7myX5Gvw3o4p+kr7B9oVZpTzm
 XcQpOZcsL8KYmj9WD50B+uZn0454yiF1Wppxf22jy+7bbX97GJR0bENCgPwKoU8igbtP
 Cm3DcsxZ2eZgfUo6lZA2DUYGbk8hyApbfzVRQFHSazxUQVNGW0CBcgLgK0dsb9QFDRv+
 IIiYAWMPBBR4rEwJn3tnfNuefz4u3d0brVRyR+524qyuHMwTqLEyhfOeU12u6ldffRoT
 2mf26uivSzxzpEf0NiNsZ1oWn/QRRT+uSOX2h8uWrTuPv28B7x6v7X8ohFVVDZCT5HDp
 PD8w==
X-Gm-Message-State: AOAM530pvY4wRIqSsbNpPdRr8VrWIhT/2GEqpuVyNV34GVMj2c6SAhpq
 Ch4R6rVNID2Zi4ujl7Aw/rZMvA==
X-Google-Smtp-Source: ABdhPJx7fgh7UgPdTXT6uFy6snoRxxciP2Hd+WS8NFMVek051RlvF5/SRN4VKGquIHZA++zqp1uC0Q==
X-Received: by 2002:a05:620a:2225:: with SMTP id
 n5mr5229154qkh.171.1599690963887; 
 Wed, 09 Sep 2020 15:36:03 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id g5sm4497430qtx.43.2020.09.09.15.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 15:36:03 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kG8h8-004BIN-8t; Wed, 09 Sep 2020 19:36:02 -0300
Date: Wed, 9 Sep 2020 19:36:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Joe Perches <joe@perches.com>
Subject: Re: [trivial PATCH] treewide: Convert switch/case fallthrough; to
 break;
Message-ID: <20200909223602.GJ87483@ziepe.ca>
References: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_183606_141083_68B4E011 
X-CRM114-Status: GOOD (  12.50  )
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
Cc: linux-wireless@vger.kernel.org, linux-fbdev@vger.kernel.org,
 oss-drivers@netronome.com, nouveau@lists.freedesktop.org,
 alsa-devel <alsa-devel@alsa-project.org>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-ide@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 sparclinux@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
 linux-rtc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, dccp@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-atm-general@lists.sourceforge.net, linux-afs@lists.infradead.org,
 coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-mmc@vger.kernel.org, Kees Cook <kees.cook@canonical.com>,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-sctp@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-nvme@lists.infradead.org,
 storagedev@microchip.com, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 Jiri Kosina <trivial@kernel.org>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Sep 09, 2020 at 01:06:39PM -0700, Joe Perches wrote:
> fallthrough to a separate case/default label break; isn't very readable.
> 
> Convert pseudo-keyword fallthrough; statements to a simple break; when
> the next label is case or default and the only statement in the next
> label block is break;
> 
> Found using:
> 
> $ grep-2.5.4 -rP --include=*.[ch] -n "fallthrough;(\s*(case\s+\w+|default)\s*:\s*){1,7}break;" *
> 
> Miscellanea:
> 
> o Move or coalesce a couple label blocks above a default: block.
> 
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
> 
> Compiled allyesconfig x86-64 only.
> A few files for other arches were not compiled.

IB part looks OK, I prefer it like this

You could do the same for continue as well, I saw a few of those..

Thanks,
Jason

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
