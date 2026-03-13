Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D01105F79D
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2026 11:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aAC6Ci43AzW28mvY+h8NR2If5/xrEs6GCT6NXmwcjyI=; b=EdaomwV8xMp3x8
	x8agDH/qNfVg/s7DhrBq4LqNjumLmoMBBd6FgqhvPcDRigktOcZjXMOr0jgUAWBvd/uid64eYYaen
	jO0Ngmct4ioA+rNMGZ/NZy4cYZ1Ln4yRjaxOpQ124jCqG3DZaGSNLYeDNuunrCS6t7oevErLcO19Z
	FtpQX7u1Z1ptKAt4zBvZOVLcGPcpQIBc2a2tUOemKMUzmTA3dkcAbibLrmwQipN35G0xezKuMPk+0
	RitMH980zkd53xHpHm9s5g+g5wZ4fc7WtpracKiGHkAvpljkXC5Xvq5TfZCCNE10IyRfDwCRsI5rq
	80Id82P1VgVqOxgpkozQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w115J-000000004DR-0Vxi;
	Fri, 13 Mar 2026 11:53:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w115G-000000004CX-1VLi
	for linux-mtd@lists.infradead.org;
	Fri, 13 Mar 2026 11:53:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 86C1543345;
	Fri, 13 Mar 2026 11:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FFC2C19421;
	Fri, 13 Mar 2026 11:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773402817;
	bh=FbILK/dZqoCSveX32dGq+uxOScKMipAbdd6Aw3SBmaw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=P8Aul7DPxuNJEizljTh6YrCUoFZnC7mCyGtZOYU1TPT/SojnVDXHzAzcW4y+UzZ6Z
	 9IWq+9tcVeHbw3aen6Zdw7hgwwUCcA2MeEX5BnJGEFPnJ6qnSjHKA9qB5uqOeadqJ0
	 sYRTYqk5FpFpp+E++E271TEFf6ZtjRjX8uSP0r/kVY4OBB+4UprdLfzRl0HGM6oxG/
	 xWgemrtxzHCBFTDOhX3c+sqRAkseTMWfBkz/Xvy1qZeIl9zhBm7oBbRe8BmgucguNc
	 OEL/GRvf1+RP0ZC8m0TQfzv+MT7umd3lWlljc3VR/j+eOMPnsQZFyVBrfmZBqNB7NB
	 mKHQgRpbng5gA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,  pratyush@kernel.org,
  mwalle@kernel.org,  takahiro.kuwano@infineon.com,  richard@nod.at,
  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] MAINTAINERS: SPI NOR: maintainer and reviewer updates
In-Reply-To: <e79a7344-cbdd-47a7-aca5-cbba0d34ab0d@linaro.org> (Tudor
	Ambarus's message of "Thu, 26 Feb 2026 16:25:39 +0200")
References: <20260213-remove-tambarus-from-spi-nor-v1-0-6caefb1a63ae@linaro.org>
	<177203780705.1983427.17146838755296719140.b4-ty@bootlin.com>
	<e79a7344-cbdd-47a7-aca5-cbba0d34ab0d@linaro.org>
Date: Fri, 13 Mar 2026 11:53:33 +0000
Message-ID: <2vxzh5qkdjya.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_045338_671816_44B67E9D 
X-CRM114-Status: GOOD (  10.86  )
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

On Thu, Feb 26 2026, Tudor Ambarus wrote:

> On 2/25/26 6:44 PM, Miquel Raynal wrote:
>> Applied to mtd/fixes, I will queue these patches through a fixes
>> PR. Thank you again Tudor!
>
> Thanks for queuing this up.
>
> And thanks everyone for the kind words and the great collaboration
> over the years! It's been a pleasure, and I'm very glad to leave
> the subsystem in such capable hands.
>
> See you around the lists!

I'm a bit late to the party, but thanks for all the work you have done
on SPI NOR. It was always a pleasure working with you :-)

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
