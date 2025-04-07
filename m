Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79107C369A1
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Apr 2025 18:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wm9zgDRvzU+Lw5xiNiG7v1AwAkKRSER/olMlQeFZpvY=; b=RVkrFnpKFN9VM4
	Ne/AuEOVA1HS+VYl7evo+SYJ7Dl07SiH5BMkfmMgQ/jxvZKyHOQ31f3gEr+uyzuzOSReK7p7+Zm1e
	SHhf5TzG4cYTckVyg7dzoKSRMkIUJR/+FjJcTOwZ279cMSE3KKg0r6D5TQo0E/BCao1omjdDcSZ1y
	Lt1AURSV7dQ4c089i2eYT643la7awSUMH7zLox3Z20Kh76ATUI9Ohg1S7MKhhyXDhKL2xC3nsjN7w
	kQpvOoAXYgWGw9SA+H/mFxk6PmceGt4pr9zbn1kI1u93CV1Os4fhzjFULH+9Dml0xbBl6dSmv9h/K
	EJW2T+RD7f3o8VYnCR9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1r1e-00000001VXT-2QLr;
	Mon, 07 Apr 2025 18:16:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1p8b-000000017qW-3K6y
	for linux-mtd@bombadil.infradead.org;
	Mon, 07 Apr 2025 16:15:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NlnadeUtfIffpDHS95wqPo0yPGar+etcKexR3IwBc9Y=; b=eGiVJyuDV/EJoRd6H5kua+oVRM
	iizkdWaKoWCGPVxDb3ywpJ2PzCmAixnsro/IwQUTGjGUwuniGcRFrweInhZCa+r7ix9VUK79lQQom
	bllmJ/7qEGlLMLU1b3EreRVzwWhORYYW46TGVdEhl1ZteQruahFNAeBDgtSXOHnmaNa0idmmRaRRn
	aclBF0sWZz6m29o3gu6ED+AnUIZFC/DovvmJtGa2vkMMdIWqfG7b+dkpyMycxXw0AI1j8IgXmkXV9
	4R9wEQokW+uowFarpisM3gjNnA1hKCAG5VuMPhCMS7kZmRTmcygMSQToDup1Pki+OEwE6DdAeOfSR
	S5tNU6nQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1p8Y-000000082yP-2d4P
	for linux-mtd@lists.infradead.org;
	Mon, 07 Apr 2025 16:15:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6427644F0D;
	Mon,  7 Apr 2025 16:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E19CC4CEDD;
	Mon,  7 Apr 2025 16:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744042546;
	bh=/vZrV4sTxkcoN28b/L2BHGZocW18xExXmkYKNBBY7JA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=m6+8k+pTP+eQ5L1rJZalS2n9o8JLaIHkqpYaDH4HWm5Jt8FAOftYvYzgYYntHdbgt
	 VRfxh6vTQhLfVW7KbLPtcSdrv+0O9cgh9hKGPzAR2SUUncF6Z1fMjBB/poXyzJjPy4
	 rZVUxatZDX9MyjueUQ3lwriMMxzoj7APJL6eZX4waS5/c7XryZuxLG3E4hw1zzkyyL
	 /dWEzGvDZqSVvncbLDPndVQfNRfzreNpqz1JaF3M0OD+NOuJlaxWy93Mxkx7Pdb6EL
	 Gm0ZC1FOYMQjkHVSSjTtTbp45X4bAtrsMaRM2fnyqbo1JhJr0zyi6FpiLMYzBCqDE6
	 5TDpTGvVM2HCw==
From: Mark Brown <broonie@kernel.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, linux-spi@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250320-qpic-snand-kmalloc-v1-1-94e267550675@gmail.com>
References: <20250320-qpic-snand-kmalloc-v1-1-94e267550675@gmail.com>
Subject: Re: [PATCH next] spi: spi-qpic-snand: use kmalloc() for OOB buffer
 allocation
Message-Id: <174404254509.780717.1127447329039664549.b4-ty@kernel.org>
Date: Mon, 07 Apr 2025 17:15:45 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_171550_904896_84312A24 
X-CRM114-Status: GOOD (  11.02  )
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

On Thu, 20 Mar 2025 19:11:59 +0100, Gabor Juhos wrote:
> The qcom_spi_ecc_init_ctx_pipelined() function allocates zeroed
> memory for the OOB buffer, then it fills the buffer with '0xff'
> bytes right after the allocation. In this case zeroing the memory
> during allocation is superfluous, so use kmalloc() instead of
> kzalloc() to avoid that.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-qpic-snand: use kmalloc() for OOB buffer allocation
      commit: f48d80503504257682e493dc17408f2f0b47bcfa

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
