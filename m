Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061A0C5AD49
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Jun 2025 12:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LXDxTKNfNNJYZOoz0PpXjmLfM5Xfa0t62u5SNyrdxfs=; b=FBQanHEuRPWDzu
	ozL1FYmnp4auJWXe779CBNp47NSr1QtkGUG3eRH6uucpe1QRg4VnAyar8pVUIZVMGVkSYb0OCVlsY
	YPiz4NI/6plycxqsUnZJ09+vxbCZIJeYUCYy9VMNNKJB+yMRXlbD52RUeqT8tcoII2UH8uWy8CdG5
	suXhojvEVYhniIOlHOucJnpeC+pM47DU2rKMihb2fOIMwd60A76zEbJX4mVtuKwSL8cD7VGyYT/5T
	SuKcOxXdtzLDiAdQL1OysZSzth1psS/Ihi/vk7jk3FMeEAuTqBHXPGWUYep7wvmXCbCXQ/omMKr1z
	mWwG/4pmnFSXcDthCx2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOFWa-00000002c6S-1a5G;
	Sun, 08 Jun 2025 12:53:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOFWW-00000002c64-1YRH
	for linux-mtd@lists.infradead.org;
	Sun, 08 Jun 2025 12:53:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 44E635C53EA;
	Sun,  8 Jun 2025 12:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96240C4CEEE;
	Sun,  8 Jun 2025 12:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749387194;
	bh=WpC1dLFp/Wi7G/2VKn3FpcBmL1fZHH1R+LC1nGQz4XI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QEOYUUuk+I3G6jM3pO9RbfGR+898/w4Y2pN+fZUPsDAF7cMV4QbNu3agrdZVs8ksy
	 rzcRdp9kjzmyg/fZXivBA6+weCSANn1fjyWlZJX4B3rWpTHwH//u0OF9M/siuuJAJs
	 apiab57LHQQknxKuae3NVM5pQaBefaJTxGKuqfkV76ZEFGeC5csCU6tF689OBRE9Xl
	 GjeeCbFie3xoWRhcsunj9slesLHvP9ASIvCdd2CmDv4iQmdefAjo05zc0jbtmyJqKV
	 IqajMtvPVrw/VFrLy97AMTmV9KvBiuoK767UXHL8Q2B8s75iovH2h8azzpZk0wgo01
	 sPzPSBWhz3ahw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Cheng Ming Lin <linchengming884@gmail.com>,  tudor.ambarus@linaro.org,
  pratyush@kernel.org,  mwalle@kernel.org,  miquel.raynal@bootlin.com,
  richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  alvinzhou@mxic.com.tw,  leoyu@mxic.com.tw,
  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: macronix: Drop the redundant flash
 info fields
In-Reply-To: <d98f6eee-d5f7-43b7-bbc8-d6e7e274723a@roeck-us.net>
References: <20250407075400.1113177-1-linchengming884@gmail.com>
	<20250407075400.1113177-2-linchengming884@gmail.com>
	<d98f6eee-d5f7-43b7-bbc8-d6e7e274723a@roeck-us.net>
Date: Sun, 08 Jun 2025 14:53:11 +0200
Message-ID: <mafs05xh6pf7s.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_055316_457360_CAB19B5F 
X-CRM114-Status: GOOD (  13.63  )
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

On Sat, Jun 07 2025, Guenter Roeck wrote:

> Hi,
>
> On Mon, Apr 07, 2025 at 03:53:58PM +0800, Cheng Ming Lin wrote:
>> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>> 
>> Many flash devices share the same ID but have different part numbers.
>> To avoid confusion, the part number field is removed.
>> 
>> Additionally, since SFDP already provides size information and
>> functionality covered by no_sfdp_flags, these fields are also removed.
>> 
>> Furthermore, when 4-byte address instruction table is available,
>> the SPI_NOR_4B_OPCODES flag is no longer needed and is removed.
>> 
>> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
>> Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>
> With this patch in place, some of my qemu tests no longer recognize the
> flash chips (MX25L25635E/F). Do you have a suggestion on how to handle
> this other than avoiding Macronix flash chips when working with qemu ?

Could you share some logs? Does the flash fail to detect, or does the
SFDP-based probing fail? Since this is qemu, it would be even better if
you can share a setup/reproduction guide. I have been meaning to set up
qemu for SPI NOR testing for some time now, but never got around to
figuring it out.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
