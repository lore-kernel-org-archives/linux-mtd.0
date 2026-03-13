Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B5C105F799
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2026 11:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o97tiRqvdVLALIxeUbng1PRP1gFPtC8aDC4DzoUER2A=; b=dg7aLqhuqlHw9k
	263TzUvfCxAhq7VhIlTfl4kZrojfSi6RKqNosqXQlgVTqi4Dl9aGyDYwGmnHp0XtFPYbRJ9zlTMbE
	/lemgWf+UIUWg4E45sNas6nq1Yv6pV4bWZafiXMCNyY3hiCWvg9wzz9fUTZ1T4zlJTyFKj+nbFFxQ
	r8eILbXsQM1etwmyhk3gQ9ec4sSDV5Gnqk8gmuV5p0kubpYtFDh0QUroeY4SMlVuSGDc+QfEUG/I7
	wzNL/3MaUKjlJeElh9XLNuPXVFt2Jq/mwgRa9sUWn/KAceRiPeDgyRHTAMy03vi/Z7Q4L7LJl0dpJ
	uzALeBQqYnMU7b1NhHsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10UH-000000000NH-2VCN;
	Fri, 13 Mar 2026 11:15:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10UB-000000000Ms-3iQ7
	for linux-mtd@lists.infradead.org;
	Fri, 13 Mar 2026 11:15:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 596B344353;
	Fri, 13 Mar 2026 11:15:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55DB0C19424;
	Fri, 13 Mar 2026 11:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773400519;
	bh=jYuoKNBhuCXL3heQKmgb9WQBJ5DvtrphUrCqIJ0uGqY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ip6AnNJ9yKRYxbPTdl2EIK3JPESyv4vhf3yOyiF7Gz37C3Jrs/f79o3FN4N99TpNd
	 hjC8wHtvLMnRDaWUv8wBT32FyNjaB6avj+oFRT6MJgEvHuluZ9a3343BrLNpBRFRB/
	 /FGZww/bXttWAXSmw59XjaFC7Tb6vAPXLuQIRqMJoYiDn2cQCtsiCEaM7Jd6qM3FCm
	 oAPa/Oahs3TDB0HIWkqyX0vR4ONjgY6hWXepRihyDexfuTnKwqNT+k0nhVthSI0K+t
	 ZGX54kwQXPXSyB7LyUy/364+6NrgVfBc9BMBu1jYgzO/Ow0lc3UVqheoDVSjYISEV5
	 ZzUm6osi4T2nA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Shiji Yang <yangshiji66@outlook.com>
Cc: linux-mtd@lists.infradead.org,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: swp: check SR_TB flag when getting tb_mask
In-Reply-To: <TYRPR01MB135884849485DE52A81D94965BC91A@TYRPR01MB13588.jpnprd01.prod.outlook.com>
	(Shiji Yang's message of "Wed, 28 Jan 2026 20:42:56 +0800")
References: <TYRPR01MB135884849485DE52A81D94965BC91A@TYRPR01MB13588.jpnprd01.prod.outlook.com>
Date: Fri, 13 Mar 2026 11:15:15 +0000
Message-ID: <2vxzzf4cdlq4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_041521_586156_8CAD0AC1 
X-CRM114-Status: UNSURE (   7.38  )
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

On Wed, Jan 28 2026, Shiji Yang wrote:

> When the chip does not support top/bottom block protect, the tb_mask
> must be set to 0, otherwise SR1 bit5 will be unexpectedly modified.
>
> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>

Applied to spi-nor/next. Thanks!

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
