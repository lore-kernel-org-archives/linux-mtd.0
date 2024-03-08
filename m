Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E957C54E58
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Mar 2024 18:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=spuu3G2pkGLhgzLfLYESJyWh0v9V0vTzRHEwQutlJpQ=; b=xyLQyHWEXm2kbg
	atKM1sQ3T37AK7fLw36nVLlwSyGmV4uxKtPHBIkWKHv63FgI3YIetO4LfYOtZsBUAyjiBEdRlaNSx
	lintYJSm8nBRz7My8Jl5nvNbrg893jhpXF7quHJ8tSdL/thkCWAvWSPoiXwcqYAoBpEUKyl99yGw+
	bXc2njfEnUQFcG42QlY/lxvS3exNMAPemQxJd8dBtQECxCvznhaE/Y3NMu00jWeF1OfqDvCNGeYbf
	LcU48FogE+tfcvhFctVx8CT2vnE6r99Nb+X+/jL/AQ/2oDwVflSQM0wb/DmpDysfPAYa0z4sbwdZo
	csT4F4RCTpnINf6FTeaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riec9-0000000AhM5-0Tn7;
	Fri, 08 Mar 2024 18:06:37 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riec5-0000000AhK6-3EC6
	for linux-mtd@lists.infradead.org;
	Fri, 08 Mar 2024 18:06:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ED89FCE2942;
	Fri,  8 Mar 2024 18:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57CAC433C7;
	Fri,  8 Mar 2024 18:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709921191;
	bh=HklvlbNKtDuuq0UHInjzv9d8PAGVxsP5M7610l7WjtM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LaUcJNRqYZ8ehDyXZCKHO7t7FjB+ttYBAMhOBNmBoCvASW1on8Y2LcwPUCK7ATKi1
	 IG64z/TO4HwuNk/rK9TA+FRYF0LHBEUUEqrjR/E1qI3/WOA4msT4R5KqoAPBnk5kSw
	 7KLDoN9XxfY3QvHZ+3Hvv7mEJC2Z/IOvkBWFKOMxmubmZdTaXR5K15TsQ9wpW2OecO
	 oOaxmCxu1/leXyavEUw7/OY6mHCaavQysxAQY43OenCQW6I6I4+5vMDN+w4NPF3kNd
	 IkZyU74NlR0w4D5KXgzkt5pEoEHOv3zwbShqHr1phxKZkYhEFBzBehYXDR8yCsvIj8
	 ELtcN8aDucUAg==
Date: Fri, 8 Mar 2024 10:06:30 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: kernel test robot <lkp@intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Memory Management List
 <linux-mm@kvack.org>, bpf@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [linux-next:master] BUILD REGRESSION
 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
Message-ID: <20240308100630.456498c4@kernel.org>
In-Reply-To: <202403090150.0gkUdeIc-lkp@intel.com>
References: <202403090150.0gkUdeIc-lkp@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_100634_027247_C90573A9 
X-CRM114-Status: UNSURE (   5.52  )
X-CRM114-Notice: Please train this message.
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

On Sat, 09 Mar 2024 01:52:56 +0800 kernel test robot wrote:
> |-- i386-randconfig-141-20240308
> |   `-- drivers-net-ethernet-intel-i40e-i40e_main.c-i40e_veb_release()-error:uninitialized-symbol-vsi-.

Hi Tony!

Is this one on your radar? I suspect netdev@ gets CCed on the reports
because of it.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
