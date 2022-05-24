Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D8CC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 24 May 2022 03:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bbr2sGu52h6R8pKaA5jtq6nknzZnj2Ol8rrdG+NsQi0=; b=HRCUWZhGwIuRW2
	u326ce5OTuJaJhu8hluRZ6O3k0OfaP0PoVQxEGEoc/B6HrH7gOQeXFBCCgmxRKsoMNoF/HipOw8d5
	xtrFkpIPQcYiIRcW4DwZUzNCt2JD3fpjI/6NJu9m2QNLE44tCLm9385G8fWnZe0q9YE6OINsCaXnk
	kV1VCIsXP5YVVMOzNUzZ/ci7fF0MH8R2NUdwO/rzZ+cbplg1nlJQAJ4iJzgSys7rIzBEmtOFBqI3V
	53E5KW0jk1lR5spqwDbPaAG+waCrGCrozIkkqlxAW352JZwmXxPEWKprfr/SRBO89/IkaIRax1rAJ
	HgC5Rob/Czg8weTSE4Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntLLD-006gjz-Uk; Tue, 24 May 2022 03:36:15 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntLL1-006ggs-KT
 for linux-mtd@lists.infradead.org; Tue, 24 May 2022 03:36:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653363363; x=1684899363;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ViMx7kYiUc2GfffEZdsU7jW+Xl12T7oj5pNftkb4D4o=;
 b=NfTlVGZXEooHGLTR2HkaAvj1KY3A3NoV20LjCFdf8gQngA5jmy6y3TuT
 5XIiMFMOQ9O1+5FBv4j+tIkvRqpn6bvnErA6O3Fgv/2b9aFpAT11/6Hux
 XkUucJkw//bKv1LkankWiQjwio0zC9LyjbcIN7EsowgTpKA201X2mcFH8
 ePraKvzPo235FHpNV0x4rlx+qA8tfDn/Cd1QnIsZ18bN07Agu2AkBten1
 yYw7agGRolcvt2IiEu6QL9tJ052f3q1+V1asYVHp6Zdn18eIPK8ERprqT
 mYzDzZgpMYtNUU+mAueJRY99+KrShP4qXn3XrnFlHcEGzaCTr0v0Zk4nd g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="270994326"
X-IronPort-AV: E=Sophos;i="5.91,247,1647327600"; d="scan'208";a="270994326"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 20:35:55 -0700
X-IronPort-AV: E=Sophos;i="5.91,247,1647327600"; d="scan'208";a="548287336"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.249.169.113])
 ([10.249.169.113])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 20:35:53 -0700
Message-ID: <91183d9f-a4a2-b237-b097-2ba546f9308c@linux.intel.com>
Date: Tue, 24 May 2022 11:35:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3] mtd: spi-nor: macronix: Add support for mx66l2g45g
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 linux-kernel@vger.kernel.org
References: <20220523150334.1758649-1-jiaqing.zhao@linux.intel.com>
 <e310ab2100f459346ae6cfa77c9ada19@walle.cc>
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: <e310ab2100f459346ae6cfa77c9ada19@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_203603_755129_CF0BFC82 
X-CRM114-Status: UNSURE (   7.45  )
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

On 2022-05-24 01:04, Michael Walle wrote:
> Am 2022-05-23 17:03, schrieb Jiaqing Zhao:
>> Macronix mx66l2g45g is a 3V, 2Gbit (256MB) NOR flash that supports
>> x1, x2, and x4 operation modes.
>>
>> Tested read/write/erase with Aspeed AST2600 BMC SoC operating in x2
>> mode at 50MHz, using Aspeed spi-mem driver.
>>
>> Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
> 
> Reviewed-by: Michael Walle <michael@walle.cc>
> 
> # is this picked up by b4? link goes to the sfdp dump

May I ask what do you mean by "is this picked up by b4?"

> Link: https://lore.kernel.org/r/2b859cff-2403-0526-f3ae-749920b3fd8b@linux.intel.com
> 
> -michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
