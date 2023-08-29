Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1177CC71153
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Aug 2023 16:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UKVbrurdzQP9cswWDWxSIltvDRue51XKA09JdxfXCUI=; b=lgrpGNoQB2wqKp
	thusSXIAr0mOZ9lbuyD+kKfTRdYlK4I/EemjSYcjPGx4a7yQv9FTTLzcm49Wy36md5cE3G44M0YlV
	3039jLXqJCdCmfyPqtsWDlP4zjSW7PPlqMjxjBqrwUzovSaz+rNKiP5/1V8ceort4VQQ7vcj4mxy5
	5sT1jvaMJyjIQnKLSLMVVvp1SZZ2YF6CpNuNqPGvMDNMI4NiDSKf5e1QVjK0NFC4KI9BOx3eMb6Fi
	3WQEfSXvLozgmD+s5DJS2sTsEABB/W7SilPH9cwEYmAsQFE79BfGbQ8vCyRvgRHNqLM+HV/PAVSaX
	RsYOUGFBipO+OO5cqIjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qb1ap-00BrDp-1J;
	Tue, 29 Aug 2023 16:29:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qb1am-00BrDV-2S
	for linux-mtd@lists.infradead.org;
	Tue, 29 Aug 2023 16:29:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 451E6612C4;
	Tue, 29 Aug 2023 16:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F99C433C9;
	Tue, 29 Aug 2023 16:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693326561;
	bh=aFNQOl9GThSiOFu9gLnEl5BlMX0sBoJ6rgKopXn7lC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ttx5461w/1DMZJSsPKH6b00TxuVY0uygT66P0+fis2PBMy7jtuFryPUaaGM3Ld1tC
	 3sv6iGnin/rTIRByoGXWhZKyT/AKL8GK0hO6L5N2+jI7+tqOCC+Rg8LGD0g0yTmB2g
	 c5QzBom7hrmkQP1TzhQJxKyGBDt9mDzrWOz6xbRHbn0h3dUUgzoUNTSP5tDlicEAk7
	 RLL8IpZQFi0ES46OyCpPq9jlLqyDDWuEa1xrOjCmJ/CXdtlGcIHkEZiFstx2cKOtWD
	 vlk1MYsa/6BSBqxcDXZUw2gMvUU1E9IPwPrmObv9qkO5xLkl1JJwUlY0ZdYun1/u8H
	 TEp0IaU9Jqa7g==
Date: Tue, 29 Aug 2023 18:29:16 +0200
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>,
	Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 1/2] fs: export sget_dev()
Message-ID: <20230829-alpinsport-abwerben-4c19ebb9a437@brauner>
References: <20230829-vfs-super-mtd-v1-0-fecb572e5df3@kernel.org>
 <20230829-vfs-super-mtd-v1-1-fecb572e5df3@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230829-vfs-super-mtd-v1-1-fecb572e5df3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_092925_066575_E5125F0D 
X-CRM114-Status: UNSURE (   6.69  )
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

> +	return sget_fc(fc, super_s_dev_set, super_s_dev_test);

return sget_fc(fc, super_s_dev_test, super_s_dev_set);

Sorry, dumb typo that I had already fixed in tree...

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
