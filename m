Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8E0C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jan 2022 06:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D8zQtR2qYvtL2GdfxY0XYz5fTmGaD1xRwBoVkJiV5YE=; b=kHm4BVSJfZBsBt
	4kCxVCA2GLqWWzlxRkxtOc3yM4m4AGYmNKrlsuK1mO9rAW/uz08T72F5gxGrOurLtuDDWG32Fc2sf
	OYhHUnWkDEPy7aU7/JQeX2WCCSjplu+AEyVreNAlpSeRjfFnKxjUStwDEi7jcA5lNk1OF3Gz2h6up
	LRJAiExAN8bYSrT4WXVBHYWYl7RSpR/h61BjYU/VcEgz6jtVhsgXPf4x/qECvc4jmqQKFBlAcAZab
	zEQjl7nIfQAGSUAnwLAn10kMawFJ/eS7tWG/KHYEGaCTjfiiG9GjicR/+FDtZZSuVTdzTurcjr97O
	G/qiNHBFYbAtGey0Tx3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCyJt-00EWsu-9J; Thu, 27 Jan 2022 06:31:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCyJr-00EWsF-Hj
 for linux-mtd@bombadil.infradead.org; Thu, 27 Jan 2022 06:31:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=iUqvms9+CgYq6dBbsKbOGY6IPx8/6JD1QpNM1DWf7/4=; b=QGovpg2C/otvkBp+KirpN8cXCL
 RP8olyz70BF4bzO3OiAVCsMmCCZ3G+PZpzPqRhzW0F9aE9RFioQP11iGcuLJ0gYPeX4FbjMRDHWqm
 CJScF2STTrjnRABFfqJbiqfEgWIbl9f1vANukl1gs+E8xKw1LA1/ylZhOBudqs/Vx7+TxrWLcAEBJ
 57kLhw1ziV9ZXzF5jKuWFnMXwhkA3Kb0bCvIb/n78RqzrnNLlcMNhsx83OD1RO/nxleNGqUqySDTM
 XDL14eyJs35a9ZOTBiJGmS8+Iv3c5hZmTVvIwHwN+yQU4+WKW7vfBLT4+hbcJ0+19X/uUHiLWI8/g
 Uuns43GA==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCyJk-00457S-Qc; Thu, 27 Jan 2022 06:31:37 +0000
Message-ID: <97434c08-b536-bb09-5770-6b752672393b@infradead.org>
Date: Wed, 26 Jan 2022 22:31:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: mmotm 2022-01-26-21-04 uploaded (drivers/mtd/nand.raw/Kconfig
 warning)
Content-Language: en-US
To: akpm@linux-foundation.org, broonie@kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-next@vger.kernel.org, mhocko@suse.cz,
 mm-commits@vger.kernel.org, sfr@canb.auug.org.au,
 linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20220127050456.M1eh-ltbc%akpm@linux-foundation.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220127050456.M1eh-ltbc%akpm@linux-foundation.org>
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



On 1/26/22 21:04, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2022-01-26-21-04 has been uploaded to
> 
>    https://www.ozlabs.org/~akpm/mmotm/
> 
> mmotm-readme.txt says
> 
> README for mm-of-the-moment:
> 
> https://www.ozlabs.org/~akpm/mmotm/
> 
> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> more than once a week.
> 
> You will need quilt to apply these patches to the latest Linus release (5.x
> or 5.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
> https://ozlabs.org/~akpm/mmotm/series
> 
> The file broken-out.tar.gz contains two datestamp files: .DATE and
> .DATE-yyyy-mm-dd-hh-mm-ss.  Both contain the string yyyy-mm-dd-hh-mm-ss,
> followed by the base kernel version against which this patch series is to
> be applied.


on i386:
(from linux-next.patch)


WARNING: unmet direct dependencies detected for OMAP_GPMC
  Depends on [n]: MEMORY [=y] && OF_ADDRESS [=n]
  Selected by [m]:
  - MTD_NAND_OMAP2 [=m] && MTD [=m] && MTD_RAW_NAND [=m] && (ARCH_OMAP2PLUS || ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST [=y]) && HAS_IOMEM [=y]



-- 
~Randy

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
