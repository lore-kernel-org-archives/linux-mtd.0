Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4C5C4345F
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2024 15:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PG8aeIHUmPZ3q3juvxkMV9M6Zoew+5arXH9gKlxdg9E=; b=1tBZygrYOoF6FW
	SwtiNeZjU8UoM3CFjVmK0TPspiezRHkO9NvkniyOnrS7wFGeJfcmiwoKqTo8G4FuWBv0VaU1MZTIT
	Yi+28U+DLn1iYd6uR4FQUe3u7/RDESwCNRl4kNPw6OysXzt22nT95iNcbjh78dOnUJfDVFciGpmuM
	bUdIHVjwpK3UFq7SD4pcT4oc028XnZti3wzgSPcHlttKONUfxOW6W8YyDHfExjwQMcVcF978vT/Zp
	gup+KJK/WOTycFy/eIHvST89pEMpRWvhNGTuMJFt1WxSHz2p9GsK+r4bQ3j6wVoyZFqtBJxrxgfpm
	+3iwJIRSU7mfAqJR+A5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwOZz-00000008weF-03t3;
	Mon, 15 Apr 2024 15:49:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwOZw-00000008wdA-1Bcg
	for linux-mtd@lists.infradead.org;
	Mon, 15 Apr 2024 15:49:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C620560E75;
	Mon, 15 Apr 2024 15:49:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F75CC113CC;
	Mon, 15 Apr 2024 15:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713196147;
	bh=BJXjB4r8u0vb4Jwuxwghtyi9WRN5rvURICx0OP1Z1io=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=joCh/hq9tOzj6rQAF98jynVX4S0K+b70h1HXUwyOAd9QJgy1Y+AQInX4fkHj+qVHA
	 QnletxDqJLaMlTKAI9gq0/9GwL70u4G1LyHSKCRflUhmI1b3uLOtOkeiicJ9alf2Pl
	 am7MlrbTF/aB4fOa72+vRYSXuOayo+NSGvqMTOZulHBD5hi9a6VuS9qRK3iMRV/WoB
	 QadCiTi6dOMmLq1iTlNb7ySDygToYF+YWn9rq5lV4mjjPx56kuM4fRfj8uguk/F5HW
	 1T/kn2bXe9lWxAX4ro8rjgAH4BoX7ggwa/ukXdlIkn1zyQLC1HcfftexYuQxer1wc1
	 SdNjx4mImwP2A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v1 2/6] mtd: spi-nor: get rid of non-power-of-2 page
 size handling
In-Reply-To: <20240412134405.381832-3-mwalle@kernel.org> (Michael Walle's
	message of "Fri, 12 Apr 2024 15:44:01 +0200")
References: <20240412134405.381832-1-mwalle@kernel.org>
	<20240412134405.381832-3-mwalle@kernel.org>
Date: Mon, 15 Apr 2024 17:49:04 +0200
Message-ID: <mafs05xwi8w3z.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_084908_384185_83984D49 
X-CRM114-Status: UNSURE (   8.60  )
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

Hi,

On Fri, Apr 12 2024, Michael Walle wrote:

> The Xilinx flashes were the only user of the page sized that were no
> power of 2. Support for them were dropped, thus we can also get rid of
> the special page size handling for it.

Looks like the Xilinx flashes are the only users of
flash_info->page_size, and params->convert_addr (along with
spi_nor_convert_addr()) so those should also be dropped.

The patch looks good to me otherwise.

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
