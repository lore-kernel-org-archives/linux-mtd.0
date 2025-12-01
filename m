Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A423DD116F1
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Dec 2025 13:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lXE9Qi+86fdGO8TcgPHF0wcG9rX6PixSb3o5C8dBcms=; b=MA2n23YfsLKIMo
	Zkj+s3yLrRTu87aUCPLvN/8GlXntDYLU3Lu1eijIKkhWfNnS1grBDxoTkbplpf13cVxk5zqkt9P8z
	IF0q3uREY8jE7cNGKg8Uc43/AOLhCgbCT6oA1ZDFethsaoyBijk1d9nxK0jaaB3xnJAmvKPgvBi/2
	FstGmybhNtGcsCgbjkoUW17flfxvoP3BR+vdkoTSrViFOdLyoPNFQU7ZjctucX2RAi/AVBOOk3DxS
	RUj6Q5nIS0NdvLWPO6hUHCT6zGSXB2KteRDYYS/VPgpViWcpefpv7fYFM8ebPunOIXkibrGWyu+JC
	JhKnoPbFbdwJaYl4+J1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ42K-000000040cs-1h40;
	Mon, 01 Dec 2025 13:33:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3qB-00000003qd3-23Zx
	for linux-mtd@lists.infradead.org;
	Mon, 01 Dec 2025 13:21:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A28CE6001D;
	Mon,  1 Dec 2025 13:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F53AC4CEF1;
	Mon,  1 Dec 2025 13:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764595278;
	bh=cmj8TkS6o+DPVDGCnK3FP5bP3qjN9YljV2pICOwaU50=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=R0QM3yy5GrjhXTTBkhmn0146dnwPd/YA5s8vuB0N8iWtbBr8bp7dbkUtVEoHgikMF
	 7YffQCLq7wX/ttNUQJ546+yztJm1iXomVy6+gRBtQwpreGpjMZutJGQYgO8vRP+eOc
	 083AsFxnDxzOSEMuGG4ytWrNhrZyF/MyKwrlz1AZj0aaz5w2sCvOp7itzkO94dVEQ6
	 +UQx6s32aE/lxHoPlW7rSFGODjv5VZ9+NAd+AeDR+v8VPxEHqX/Lu/XFNwM5Wmz0nJ
	 zXVnUIhoFs5owhMiG0ww7SVJO3dBPMUpvE3l00k+36Bu8TOL4iB9Um0MH4YoisPxre
	 fhhRrW9EnHcaQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Michael Walle <mwalle@kernel.org>,
  linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: spi-nor: changes for v6.18
In-Reply-To: <87ms42cxiq.fsf@bootlin.com> (Miquel Raynal's message of "Mon, 01
	Dec 2025 11:22:05 +0100")
References: <mafs0y0nrumwt.fsf@kernel.org> <87ms42cxiq.fsf@bootlin.com>
Date: Mon, 01 Dec 2025 14:21:12 +0100
Message-ID: <86qztemj7b.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

On Mon, Dec 01 2025, Miquel Raynal wrote:

> Hello Pratyush,
>
> On 27/11/2025 at 23:32:34 +01, Pratyush Yadav <pratyush@kernel.org> wrote:
>
>> Hi Miquel,
>>
>> Here are the SPI NOR changes for 6.19
>
> Just in case, the 'Subject:' mentions v6.18 ;)

Copy-paste error :-)

I usually copy the last PR I sent and just bump the version numbers.
Seems like I forgot this time.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
