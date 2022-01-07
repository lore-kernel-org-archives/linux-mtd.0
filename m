Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78651C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jan 2022 12:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PpJOAjtLcWiBRQ7YRGDKKzvu+2DC47k98a7PUVWyd0o=; b=TeQxHLoUHqKspn
	DOsQ42a6/uRF7CqIlDxeVUWtwBXZNfU8pC01s2j3RyWTM9Gc+mV1JLebO974y3IKZRSBBw9h6JX41
	a79bJlHJt7BXRihmhokBJNazJ23zYZQVofoWSr0avxgLMYji0/etEr9YevxDRbTnaAuoOL7eWS3Yf
	FxZtsm9qCz95pN1qDnjmgpea8ydcKNpg1GsqoWHg357uEpmHC5FBr4RNASvnUQ9GVexa+b5V32LMq
	HbXoNT9squj1JR4AeLmmi8w+TPvXLFDmM+J+1q0YCweD3t3W7IxuaWfh33c1Y079HSh6U3IKI7gEc
	A4aA+JSqz5SUX5efl9wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5nty-003kuN-7p; Fri, 07 Jan 2022 11:59:22 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5ntJ-003kUY-Ji
 for linux-mtd@lists.infradead.org; Fri, 07 Jan 2022 11:58:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641556721; x=1673092721;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EdSqS4VAyQDEtNmAwMFPIrwHE7KgmcEsvaxdDJqC04A=;
 b=HN49xy1u8mHvDh3BEiEW7Dia+gpTKvP+rZ987mxdkIHHx/7ClSVuO3gA
 /Fb2VXDGDC2RZLz+m6J8X+M0Azpm0G9263fuP/cMmewJF3FGRP1E2Qqek
 djE5fA6G0QroBveXALhJJ8HT4SzNqHR6IkXnatBYsTqeAyqons9AXArlv
 tETzTkd87m87SMhciGz71FH9T17r9+4QrIJA9CfMG07/mtmLEqAz1j5UB
 1rxKQJjXmBrce8jeCPRq+it8VhwrluMMu9t3CDmr5JKuolciEXnwJGIEd
 yNw6KTfcNFOAe9v0oZftYkCC4cXz4ibHRv1BczDe7Vk3RVJid2w976fl9 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="242808040"
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; d="scan'208";a="242808040"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 03:58:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; d="scan'208";a="557243987"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 03:58:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1n5nru-007Mat-Eu; Fri, 07 Jan 2022 13:57:14 +0200
Date: Fri, 7 Jan 2022 13:57:14 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v1 1/5] nvmem: core: Remove unused devm_nvmem_unregister()
Message-ID: <YdgqmvBTQ2vZAjsn@smile.fi.intel.com>
References: <20220104133843.44272-1-andriy.shevchenko@linux.intel.com>
 <202201060932.tcQFIVfQ-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202201060932.tcQFIVfQ-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_035841_791021_1440F002 
X-CRM114-Status: GOOD (  16.39  )
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

On Thu, Jan 06, 2022 at 09:11:47AM +0800, kernel test robot wrote:
> Hi Andy,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on mtd/mtd/next]
> [also build test WARNING on mtd/mtd/fixes char-misc/char-misc-testing linus/master v5.16-rc8 next-20220105]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Andy-Shevchenko/nvmem-core-Remove-unused-devm_nvmem_unregister/20220104-213933
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
> config: mips-randconfig-r002-20220105 (https://download.01.org/0day-ci/archive/20220106/202201060932.tcQFIVfQ-lkp@intel.com/config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d5b6e30ed3acad794dd0aec400e617daffc6cc3d)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install mips cross compiling tool for clang build
>         # apt-get install binutils-mips-linux-gnu
>         # https://github.com/0day-ci/linux/commit/7877de3d47433a75d2beea38b696b3c4fde62082
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Andy-Shevchenko/nvmem-core-Remove-unused-devm_nvmem_unregister/20220104-213933
>         git checkout 7877de3d47433a75d2beea38b696b3c4fde62082
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/nvmem/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/nvmem/core.c:946:12: warning: unused function 'devm_nvmem_match'

Ah, even more to clean up ;)

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
