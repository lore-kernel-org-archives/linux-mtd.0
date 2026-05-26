Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F041ACD5BC8
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2026 10:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FiG/BPq9rTSTLHTip+48A7Wz/Z0uijrOuO61fYE2ZgQ=; b=mBRpXaEVOdbQSY
	qsBZzRqTRYD7nnwRirwCDFh8W649PomFdxpsECJhIcFTIrLEEEUr9exos40PuCwWSBgEr8/VNRWCj
	53XFYNbZhPCIggeTsD17fHkivllPlex+5xGA5rJfAOdCHddZ3XN2SqUd/kL9DiKZwGD4yT3PNn0gx
	rzAPymOHIpypegBnG4Q9Cr0nlb9VcS8gFj0niqSJa58fQJYlArhKtJKmX0V9h/6SkmLE3JeXItlXY
	J0PUgOzCr1ThTA7bArPbhRbIUuh5CVo8GH4Am81kJft4t/QQDrTPTFEgPwliscES0Iz/yF+1A7IKU
	NMQl2t7JT7LeOJmSisqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpEk-00000001fzP-0fGe;
	Tue, 26 May 2026 10:42:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpEh-00000001fyw-2fUk
	for linux-mtd@lists.infradead.org;
	Tue, 26 May 2026 10:42:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E29D44431C;
	Tue, 26 May 2026 10:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB521F000E9;
	Tue, 26 May 2026 10:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779792130;
	bh=CIniGKWZGETDFXrPg5agUHMIS1SaI+CyeKuE7BZaFc4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=hu1e3EBLza0PivGAqiHr2a3mXIWD67fEqX+3G4WVyp9tU1sXqYS19H7UZcEnGMlvo
	 Xs/ovfuG/TN3PSxIzMgtbr9GOdhVuxOuLJcf+aYPOM6+QEG1/VDUW51Ch7uMoWsaQv
	 yEOC2lghOPRHB71Cp8B0qgxxfViBXWYkuJDxwf0DNKCu7MW2BKog3B6Lfaa/NBgRJ5
	 +usEMf6OWvKyPGkhCqcAxeUhohuw4Z0WQsbuHonczXwwaT1k51magHvqCTr1wpxhIw
	 Mf9i46lldBr43AMVgO61C11kOiNIn+JAdhCd5a4rBRADQLFTOM8imCpUqJWeo61vet
	 ETLlC/QNJYQcg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Takahiro Kuwano <tkuw584924@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  stable@kernel.org
Subject: Re: [PATCH RESEND 1/2] mtd: spi-nor: spansion: use die erase for
 multi-die devices only
In-Reply-To: <20260522-die-erase-fix-v1-1-733ac8967df1@infineon.com> (Takahiro
	Kuwano's message of "Fri, 22 May 2026 17:48:10 +0900")
References: <20260522-die-erase-fix-v1-0-733ac8967df1@infineon.com>
	<20260522-die-erase-fix-v1-1-733ac8967df1@infineon.com>
Date: Tue, 26 May 2026 12:42:07 +0200
Message-ID: <2vxz4iju5u68.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_034211_726718_CC0763FB 
X-CRM114-Status: UNSURE (   7.20  )
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

On Fri, May 22 2026, Takahiro Kuwano wrote:

> Die erase opcode is supported in multi-die devices only. For single die
> devices, default chip erase opcode must be used.
>
> In s25hx_t_late_init(), die erase opcode is set only when the device is
> multi-die.
>
> Fixes: 461d0babb544 ("mtd: spi-nor: spansion: enable die erase for multi die flashes")
> Cc: stable@kernel.org
> Signed-off-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
