Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99108C982D7
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2026 09:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PStAF/q/w6MIUmNlwq0I1YhgwTawzEQRYltKSM2i1JU=; b=N5kMOUoSKpk+6Q
	LEUJC/YxkvuF7W1Uyu+wT+S9u40gYVnilmNdi2W4ttgHqUtXgps+5Rp7m3HU7FWu5WHf7lMHvMcpT
	VtUFnfcZckd7S60eV1Ha5dNUQQAXepo8K30c0K+2WN4gFzGcthKmyBacr22my4QYUIOPQKacM5shI
	UnADcnwxW36MHHGYsY2F/1gnz6YcR1Q+D778N3KKS679L1onrAE0uCxV2/I06D7nbAOF266Tz8UCw
	/GavXTOGYHtKhQi3zJdPm5m+Q/tqzdKpoIGm6/tr0hsg0HRIIqJ37uigLsLwExyquMfMhr2RTZpGz
	O/4nX0wv7PNfx0D1rYmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Uxm-0000000DxVQ-1AEL;
	Fri, 18 Sep 2026 09:32:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Uxl-0000000DxUw-15Ju
	for linux-mtd@lists.infradead.org;
	Fri, 18 Sep 2026 09:32:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 81EBE41A0B;
	Fri, 18 Sep 2026 09:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D27A1F000FF;
	Fri, 18 Sep 2026 09:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789723976;
	bh=kZISdbIB8TZZ3TfxDB47me2kAn8nNXBGmtMZbJYMz1Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GUcJJ6Tyn7vWxGTLzmXroGx5D74W+aG5SVIwsNxUOf1vqoG2PWz7zJnOpJQ1NUlEw
	 LKhF/hwqcxodqSY5/zyCsjV9TMcw+2EVTK++P5RJ/1eu6O9pMeVuryLmTL6rMkvLRo
	 cUddNj2en2tT52da2kBZiycp8EJ1KyWigsIrOzI0AZ7WVhF6K9u8HDp7qnDeQo0Pop
	 V8UJBiL/ZHD4cuHCtebc+oOt7u4rS6wCG13HejafrZHK84At5tT9I/3e4FuT2YZmvp
	 xHJh7hNhG2dJH552f8T+t2Je+MUQTQjyeNVs60xWze114A7GBOQ/Vo11vGGjuXNIPb
	 5ON8A4M+VWmKg==
From: Mark Brown <broonie@kernel.org>
To: md.alam@oss.qualcomm.com, Johan Alvarado <contact@c127.dev>
Cc: konradybcio@kernel.org, pengpeng@iscas.ac.cn, miquel.raynal@bootlin.com, 
 j4g8y7@gmail.com, quic_varada@quicinc.com, quic_srichara@quicinc.com, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260911184416.109790-1-contact@c127.dev>
References: <20260911184416.109790-1-contact@c127.dev>
Subject: Re: [PATCH v2 0/2] spi: spi-qpic-snand: fix the stale ECC context
 pointer
Message-Id: <178965871023.285745.12128711183842663468.b4-ty@b4>
Date: Thu, 17 Sep 2026 16:25:10 +0100
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1730; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Zbc1GDm3o826G5XiQwmgTtJ5p1vRisvVJ2jF+Hjyl0c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqrQVD5DGJunsL1wCkmT9LZlVDRqw7LuON5fkBK
 ugStNQc3a2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaq0FQwAKCRAk1otyXVSH
 0DYnB/0eAGwNBYjqGdFy0Uo0/JpFvi7nrMeXEpd8FD+8HhHTS6AIivZp0IuI5wMADpU0+Wy7i+X
 VlnXWIgQiP3HjAQlsfuqnp+9BUoetp9Kq+YS+X5+4Lo/nyHzZF+wuN3WTDSkuQMn4OwL/8q9vvc
 zVE0PhBsKiRQI7tfRm4sYINBltVQD5jMQLq8qEhwL5bJJNsQtF5cvaDjPUa25pT96qsnYXj3C4F
 QawOvOqWeoP3xsMDek4p5p7rnqSUUvwKgwrfd0b7mZ/4Ph/konzDXT7uCI6BETDBDc06CwEa/Yg
 NrvD1NSdPAvl/HMTC1ATuLruMn9vwUCj5Y/DtZoPW+zS8/yj
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Fri, 11 Sep 2026 13:44:14 -0500, Johan Alvarado wrote:
> spi: spi-qpic-snand: fix the stale ECC context pointer
> 
> qcom_spi_ecc_init_ctx_pipelined() installs the ooblayout but never
> publishes the ECC context it allocates, so qcom_spi_ooblayout_ecc() and
> qcom_spi_ooblayout_free() run against a pointer that describes something
> else - a zeroed struct on a first probe, the previous attempt's freed
> context on a retry. On IPQ5018 the qcom,smem-part parser makes that retry
> routine, and like half the boots on a Mercusys MR80X failed to mount the
> rootfs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.4

Thanks!

[1/2] spi: spi-qpic-snand: publish the ECC context to snandc->qspi
      https://git.kernel.org/broonie/spi/c/f94c9b68bb5f
[2/2] spi: spi-qpic-snand: drop the redundant ECC context handling
      https://git.kernel.org/broonie/spi/c/8d6911645478

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
