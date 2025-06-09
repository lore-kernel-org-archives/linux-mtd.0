Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A84C677C4
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Jun 2025 13:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7YiHw/LMBfMUcgQpvC9szl8s20cexv+ccu+cTjKUDfI=; b=sqRre9mF52U1ys
	NgJpsSvmkIYPtsQGW2mx2qefsVibfyMhY2VH/K2UvpTZe37Xj/dx/kLEto1d/ofe76oxfxU4id9cA
	65bN0owFvrxZr86+XsEs6nN262NYjTV6FjssmMZR1Uw5uCOjyEckXEcGPD4uWF9Z2pdVTWEK84g4o
	i49GEEeUia80M3MHJwOXthq7oI0nxvkp+aQ6u+DO/MNIoA98es6WvAz3MnpwWseB721ZDUfChkMyW
	JybQuXUf3e0KnaRxmMpCw3av4mIZFHIgUlWAMm91X5+Y4N3cHhjQUSX6/Raf1/7NzhSe8mysSi+Zp
	/nb/TuKYdZYvi+w/7e9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOcnz-00000004Gr1-3oAX;
	Mon, 09 Jun 2025 13:44:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOck6-00000004GCw-0X6o
	for linux-mtd@lists.infradead.org;
	Mon, 09 Jun 2025 13:40:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 828F44A4B7;
	Mon,  9 Jun 2025 13:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9F3C4CEEB;
	Mon,  9 Jun 2025 13:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749476448;
	bh=PWNpIUfACgNMqjyCpMvNLYXJP3ujq/QCOWwkCMkHvLk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lUFx4Ao9NaOycYVdbGZ5Xy1c+6vjqNNzhdDlEg1Il1qHQFlEDgX8pe+2yoOR2Y4od
	 gVo6zDq7jHZm0HA7RkmYHAQ2bXAfRYAsaNqax36uhk923N580AubfL+h5sOhUUAKJw
	 YcJmK93tYas3qBgq4l0j6sK1sG7kVg22nIMvMnZwaUXMInoc1E0XucmLt2m82Lg+68
	 SNQaaa5moGyE8OqRbGlUcBaHv9JpiNDegJB2R6wW1CtVzTUHn3/sFMoQLIQWpCpAgt
	 EB0Iko69IC+vPMHRMkTCaf7qzR+uCKD3FgFt1+7GSYkOb5cSCJ81aiE8u6A4JFSf2J
	 eP9XHH0D0sHlA==
From: Mark Brown <broonie@kernel.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250529-qpic-snand-remove-qpic_snand_op-v1-1-6e42b772d748@gmail.com>
References: <20250529-qpic-snand-remove-qpic_snand_op-v1-1-6e42b772d748@gmail.com>
Subject: Re: [PATCH] spi: spi-qpic-snand: remove 'qpic_snand_op' structure
Message-Id: <174947644664.127013.16116071467167037102.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 14:40:46 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_064050_193400_562931A9 
X-CRM114-Status: GOOD (  12.50  )
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

On Thu, 29 May 2025 19:35:44 +0200, Gabor Juhos wrote:
> The 'qpic_snand_op' structure is used only in the qcom_spi_send_cmdaddr()
> function as a type of a local variable. Additionally, the sole purpose of
> that variable is to keep some interim values before those gets passed as
> arguments for cpu_to_le32() calls.
> 
> In order to simplify the code, remove the definition of the structure
> along with the local variable, and use the corresponding values directly
> as parameters for cpu_to_le32() calls.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-qpic-snand: remove 'qpic_snand_op' structure
      commit: f73dc37ebf45573349aee0aae168e8dc3d13ecee

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
