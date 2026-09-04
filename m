Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CEFC61DD6
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 13:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q+QjL4UWzjLPoZIudGr2xKkojOngy0vUZv+jNkaX0ow=; b=Gjks+TT+KvsU/f
	f8w51AQJaam4WlMrYElBr/YqblILFOUhm9HntIUIdqDQXKcZIoOzLQtMzRpCyKDQBxFquAMmnvy0L
	xXMzpJLBEXCb38E/jHt5kTIZyS3JNCTd19LlL8ODxK3xFzeMF15axrUlZPKIu/DjKH9wx5Oo063hQ
	XeqfaCZe+mrQ9sxXvrdH+ItEz0L/h6AKgvDDSORMbyy3YWtvxoGdAYQERc3kVfhaWF4jZeuua6QHC
	s2RUEIKKA8phvhq2gBA2P/D0dOmj0EydoKflIyjzKyVO7llBsuaZyRzXHEi7TzuTyH39lzpQ7aHv5
	Hk++sD641sFDoIjXEPDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2U9l-00000002Fs5-3hkB;
	Fri, 04 Sep 2026 13:40:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2U9j-00000002Fr0-3S4R
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 13:40:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 20166600C8;
	Fri,  4 Sep 2026 13:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC261F00A3E;
	Fri,  4 Sep 2026 13:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788529234;
	bh=Qe5f+g+FV/dICLmx/be0Vfy+xV8+SKt9swqXdGmGdfI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PqAMSWCKTeEfd8f76F6i4H0wh/VWlOQdBQA55452Pyx7FyxlqeUVo3xCp1fKY+KUP
	 7L7cTPQSAX7BbxiMwRtfJmHar+O53MLiFM9B7BDgiPNm6HsNyN81o9D0SJ8tRVVWw3
	 QFsXd7ENcP6vCLGgmvhFgZbBLyuWynJYYrJQ3GVynHcu6h+bV1hg7pkBV1wQ9+BGQz
	 1EGc8VgpegDjrKqvyHmAYa/ISDFObMgKQY6EnxxKk4u/9zAYxS2ayrf0XcagGWJS7i
	 BTfJPUglVqNNss5sNaLdLEfmFjI/QlNnDDbuj9OztXlk4WuKMKSpyyG3DlPXfw+Kun
	 ODVoKNBq4uivw==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-kernel@vger.kernel.org
In-Reply-To: <20260713091206.2414400-1-mwalle@kernel.org>
References: <20260713091206.2414400-1-mwalle@kernel.org>
Subject: Re: [PATCH v2 0/8] mtd: spi-nor: Rework flash parameter
 initialization
Message-Id: <178852923271.3340372.15008856603494234277.b4-ty@b4>
Date: Fri, 04 Sep 2026 15:40:32 +0200
MIME-Version: 1.0
X-Mailer: b4 0.16.0
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


On Mon, 13 Jul 2026 11:11:38 +0200, Michael Walle wrote:
> Try to simplify the flash initialization and get rid of the legacy
> handling. As default, all the flags of the in-kernel database are
> taken and amended with the SFDP data.
> 
> This might have the consequence that all the flashes now get a
> RDSFPD opcode which might be an unknown opcode. But that was already
> the case for any flashes which were unknown to the linux kernel. So
> far, there was not a single complaint. See patch 8 for more
> information.
> 
> [...]

Applied, thanks!

[1/8] mtd: spi-nor: spansion: s25fl256s0: remove SKIP_SFDP flag
      commit: 0132eaac40518f6ebb42131e5005efc375473e8e
[2/8] mtd: spi-nor: don't clear the SNOR_F_4B_OPCODES flag on failure
      commit: a4cd8da7f2bda7562a7e156ee9c9e9b3ba98208e
[3/8] mtd: spi-nor: move cmd_ext_type into spi_nor_flash_parameter
      commit: e37ee8734881a7f92dbbeecf8cc129dd8a6a76b8
[4/8] mtd: spi-nor: move flags into spi_nor_flash_parameter
      commit: 0ede46b4f5b38cb43225927abbf088dd568db54e
[5/8] mtd: spi-nor: move spi_nor_post_bfpt_fixups() into sfdp
      commit: 69d9d7dabbebd91cd8aba4e23caabe9b34d2722c
[6/8] mtd: spi-nor: spansion: s25fs256t: move ARCFN check into .late_init
      commit: d395d4b8e76b1dfdb2f46b29c62e7f1f4850c9b2
[7/8] mtd: spi-nor: push the rollback mechanism into the sfdp module
      commit: d20029474a76a06a2a92427453c2326cc3e98dfa
[8/8] mtd: spi-nor: rework flash parameter initialization
      commit: 90a8ed3c63b905dcd375585da6f4851d88cc343d

Best regards,
-- 
Michael Walle <mwalle@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
