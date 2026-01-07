Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B71D0D17D
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jan 2026 23:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AhSUBCHlZ4P1M4hAP5zOCzK2O4jN3AtHAyftxNODbDw=; b=GxC36636AEPCQf
	/RpISrV7YhCUSXV+cRzjm9qw/Im2Nq2TH6u3M4GYshwKATFH/uglq+dMnmrDy7Kx3KbSjWosOG6Ma
	hGaabPJZV6AuMDNCMuMGPneH9DK4D6sQkaq4ZeBJE7ywdYw1WCcPgCbu9RNNmLFTEnGn/ukKr3ZlU
	hw1nIDxu7yzXO4unHRWa9/OeekkLbdsxerS7Ob6CbGdhpw09KIkDWqHzIjSG8uwDqmobgNBB3XV+Y
	jSFdQlG+6rdvhJo3X+E8xj7tLNqADD7JU3BPMaKIT7JTLfGKZYnsN14K9cXxIPT0gJ9bsEj3btC/g
	C9OdeDRVe0gcnRtLe8ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdcmg-0000000Fjy3-1O41;
	Wed, 07 Jan 2026 23:17:46 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdcmc-0000000Fjuo-1HKt;
	Wed, 07 Jan 2026 23:17:42 +0000
Message-ID: <0c69b711-4c88-4e64-afe7-f7de147a490b@infradead.org>
Date: Wed, 7 Jan 2026 15:17:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: intel-dg: fix array-index-out-of-bounds in
 intel_dg_mtd_probe()
To: Raag Jadav <raag.jadav@intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tomas Winkler <tomasw@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <aUZFLezigzZQVt55@kspp> <aUZLNTOMgvJ8WrIy@black.igk.intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aUZLNTOMgvJ8WrIy@black.igk.intel.com>
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

Hi,

On 12/19/25 11:07 PM, Raag Jadav wrote:
> On Sat, Dec 20, 2025 at 03:41:49PM +0900, Gustavo A. R. Silva wrote:
>> Fix the UBSAN: array-index-out-of-bounds issue below by updating
>> counter nvm->nregions before the first access to flexible-array
>> member nvm->regions[].
>>
>> from kernel bugzilla:
>> https://bugzilla.kernel.org/show_bug.cgi?id=220823
>>
>> Dec 15 22:01:52 orpheus kernel: UBSAN: array-index-out-of-bounds in /var/tmp/portage/sys-kernel/gentoo-kernel-6.18.1/work/linux-6.18/drivers/mtd/devices/mtd_intel_dg.c:750:15
>>
>> Notice that this flexible array is annotated with the counted_by()
>> attribute, hence the counter must always be updated before the
>> first access to the array.
> 
> Already fixed[1], but not sure if it's landed yet.
> 
> [1] https://lore.kernel.org/linux-mtd/20251111-mtd-nregions-v1-1-61db61e78c63@intel.com/

What's the status of this patch, please?

-- 
~Randy


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
