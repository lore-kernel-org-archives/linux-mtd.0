Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9E3C87FCF
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Aug 2025 19:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d4sLLUalOt0PnonqupmjkOuOKouutn3f+zrZWF3GIXA=; b=x9qnohZCDex+QX
	F3nAGht5Zh+EhE1I4bviTeS/lZcnu4kwupX1bClbezPn+wBBQLt+MIuTIl7QaPKK6e1vA/TmkbUrw
	JHT5fEBdJqppsv+Mi28eDPF/2B2rcDURa9AT+friC/WU+7sADU3Bzaiqc43bZg88Z/TW0t5UNg5gq
	TfCAJ0cQ7ClTJAL3aFph1+ta5xMmV6Fa/j0UIDa+G3hzqs10zN/dpNUCNIszPxw1/b0MLTEcCBfTv
	RX20vQPFZvKW0qDrLV9gAC3Tvwl0BjU/oHBylmdevn9/qGIZUD9/poow2tN4HG6qHPYRLeZzCo3/2
	W13q84GOjXhrZT+kvgMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk61i-00000001O16-0GuD;
	Thu, 07 Aug 2025 19:11:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk5zC-00000001NkF-0Iiw
	for linux-mtd@lists.infradead.org;
	Thu, 07 Aug 2025 19:09:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 97CF9417B2;
	Thu,  7 Aug 2025 19:09:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE7BC4CEF7;
	Thu,  7 Aug 2025 19:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754593749;
	bh=h5F9tcewokv2v0wx3iMjy8IfFAlmrDNK0aJoLn0Qpyo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pVIIHWHSzdnCE18ikP5QEvNUXONkDu+GsxtTfXSJZf8la3IxFqoVXeLrgHgpo7ap2
	 u5mYkKG80fY4kWG6cDHeCxyMJBmUBv4RwY4iDqcyVnYkyT6XlCjrAsbw/ykiQkMnrt
	 5fP5V6cvNNbuhANfslRaan05LMbI/AdgnKNbKReJXbAhnHs1Eqc5a4QNlZ1ZgJt8RK
	 WvuJxbeKjb/0wXdkWcWeVl249jeOBk2M19GLLg9yKzIVSEOSNm/QvHJStB/Pnr7ox6
	 ZYnP1B1kBDd8z823yk2J1eLNkfLm5s9MRU+lxjjPiOYbGwXTjufvuJrs1YCqd2QS26
	 dWpr6mv8acvCQ==
From: Mark Brown <broonie@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250805-qpic-snand-oob-ecc-fix-v2-1-e6f811c70d6f@gmail.com>
References: <20250805-qpic-snand-oob-ecc-fix-v2-1-e6f811c70d6f@gmail.com>
Subject: Re: [PATCH v2] spi: spi-qpic-snand: fix calculating of ECC OOB
 regions' properties
Message-Id: <175459374764.106952.4861259092289102637.b4-ty@kernel.org>
Date: Thu, 07 Aug 2025 20:09:07 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_120910_138942_0D957123 
X-CRM114-Status: GOOD (  13.03  )
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

On Tue, 05 Aug 2025 18:05:42 +0200, Gabor Juhos wrote:
> The OOB layout used by the driver has two distinct regions which contains
> hardware specific ECC data, yet the qcom_spi_ooblayout_ecc() function sets
> the same offset and length values for both regions which is clearly wrong.
> 
> Change the code to calculate the correct values for both regions.
> 
> For reference, the following table shows the computed offset and length
> values for various OOB size/ECC strength configurations:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-qpic-snand: fix calculating of ECC OOB regions' properties
      commit: 13d0fe84a214658254a7412b2b46ec1507dc51f0

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
