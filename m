Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F01C54ED1
	for <linux-mtd@archiver.kernel.org>; Fri, 23 May 2025 20:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TXrgByNg003l2GT/BlnFt3sT9m7a/M8F+9nzaGVFuSs=; b=mKvhmC3+NDLtPu
	HDi1BIEpqGMrJZirTwF9kVV+DvVL2GfSegJE0cQW/mdoYsAPbx1xZINMIErSfX4JybxDo2xjMufKg
	XzvEC0WoiYBjZn2G+zQm444lzQernTjtAxebdeglXbiFV9YvC9LNJtuVBMMAr6FUhWCY3pY58D/D9
	TYIcraVtwaWKG1L79nfGPldi0IiCr2iR7MO6DQIHnNTriTJa6RBVM7klkdHCpLZZkhlz4i7SyCSp8
	IC9GM5YQt3J33MGfgRi1m0jUHFlcsg2ZRJ9DumRnDn1LVsDxLQ35T5azppHcLFyqLt8QgxBgRKMg9
	SUO3nWH4BD1jcwFHzzig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIZT0-00000004v8m-3NWm;
	Fri, 23 May 2025 20:58:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIZSy-00000004v8R-17ql
	for linux-mtd@lists.infradead.org;
	Fri, 23 May 2025 20:58:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 024284A8DE;
	Fri, 23 May 2025 20:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15402C4CEE9;
	Fri, 23 May 2025 20:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748033887;
	bh=EmbjA22m9ajw1HCI2ySGSC0gt0WZSqV+K2WSqww2qvY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MH/AkxiJ0ZhiXeKtn9XHoN/mnj7DteExbjIGhTzwLEACbzg1ihDTjT4u1QIT/eqzQ
	 PFZKMvGRSTpIHc0XXyWa4aVFhiscPdWq490x7xjCPTg6+HlonrXKv9b3JzgVYHcat7
	 WeIUSiVxGofUqSTRax+x2BDCgKqqzRoOucR+26QUdiPeS10jQHaVAwWDtrv3jL60q4
	 kCYX1FictIk9OtkRITiKCYzbbJvQQSYJBVRC3kcxtgsEtym3QklkHL3+zwb6Z0w74J
	 tJbZCcoil8HRsA///KZKWvSdoYD5h1QahFNAVP4vOKr3E12tKiuzd5q7/V0IN5LoyG
	 OwZeJV1uzLmcA==
From: Mark Brown <broonie@kernel.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250515-qpic-snand-early-error-v1-1-681c87611213@gmail.com>
References: <20250515-qpic-snand-early-error-v1-1-681c87611213@gmail.com>
Subject: Re: [PATCH] spi: spi-qpic-snand: return early on error from
 qcom_spi_io_op()
Message-Id: <174803388522.585305.16829284807234779965.b4-ty@kernel.org>
Date: Fri, 23 May 2025 21:58:05 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_135808_327727_E1503D6C 
X-CRM114-Status: GOOD (  12.68  )
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

On Thu, 15 May 2025 22:13:29 +0200, Gabor Juhos wrote:
> When submitting of the descriptors fails, it is quite likely that
> the register read buffer contains no valid data. Even if the data
> is valid the function returns with an error code anyway.
> 
> Change the code to return early if qcom_submit_descs() fails to
> avoid superfluously copying possibly invalid data.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-qpic-snand: return early on error from qcom_spi_io_op()
      commit: 72b17676d3683040a0add8988ec051a2a5adafd7

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
