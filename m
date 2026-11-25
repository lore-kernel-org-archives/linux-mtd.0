Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1376606A32C
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 09:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v54wa+Xr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ri2++ZVm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8TxlANw8MBWnD8rgypPuM0ms/09TrFv71FSHigpduuI=; b=v54wa+XrlOXK0xf2gg9WWJbVLq
	sOVl3/7rRttyVCMfllPrUWFwP9w863Vrp7hEqAd1Ivc9Of+Ttt8E2hV+a9wnkh82CKQLePVfbVEwT
	KBD+bx81N5d8TFqayiMq2SyXSiCBtodb5oP+Vu6JxfKvZK6Zf5FXubUYLSbogwRhLi+xenN4j07+7
	mJI97kuXvZGVYxAhylTnxagAdL+XP0iW0cK7nHwqcoCPnM82UfrLLEfWQ0VJcmld5GQAxvhVccOta
	Vi7Cm/UzoD64mKzkTzIbxzvUm4M+C8TVjW/IGCfSNMxnnN4YrcDP6LJOWrl9JmPSP3blJGs5lWgcF
	f+aBXqhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9Fw-00000009H3P-2Zzp;
	Wed, 25 Nov 2026 09:25:36 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9Fu-00000009H2o-08hG
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 09:25:35 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso2603770a12.1
        for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2026 01:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795598733; x=1796203533; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kFVOFcFtL3Kl1lidL7Hzux9EmFfy+WWbY0BBgURBK0s=;
        b=Ri2++ZVmIwpYe9kq33xB2LV/6y7wh4RB4nnLtzt9yUnqmgkix2QE3UstSDIAiFjUKH
         4P2vXDPaSufWx1NPEZe1tPRrU+2aHYP2kyeCaZ92llK+cie4k/F1OrtttNMGHA9mviM0
         MOufveAx5eGL3CGFtUJEX20qDMVV6GFyElGysooB2QkdR/GY2W5pMDueDhtwd8hqHTz/
         CHVPW43YTFKau2NFPT6n0nLiaTDcZoqGy0FY3DtWD3bXe9steb6yyV3YBWVGowTmljXB
         aqA1x5zgxugZhMszx1/u4UdV1v4dwt+Sgp6mFTo1XuYRrSkzleYFAj3cbdCdxN9cT70N
         32WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598733; x=1796203533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kFVOFcFtL3Kl1lidL7Hzux9EmFfy+WWbY0BBgURBK0s=;
        b=DqZAdm1B0+HNhJGL1lyLCKySzKGRD1c2EJNNzJ1Ph24EjQjVdxOR6+KgEI9Fv6F7qw
         Zd1Y0qWrXnOZPYheq2WGH1lJu0VAx94ysFmgLDhmRxLdE8zHImoWdrPeICBHr2b+5ABV
         lKh1jY2Hwecl7tQAiXrAp6khSzyHjxKP6rPwwIM3ycwms9yHyFprmnrl+iJiGiv8r+zX
         CT+V63eMnA4S1A/LfWy9M/rSGFOQbY8scnMgXvmOOk5KcZRn8LvnI5ddqrHwJTWTDJVD
         FuOOJefwggLjq9Rsbo/bk+bUN8BC9kd9W9sRzFTTn5PzXifsVNNmjFd6c7egZtcVRxyx
         64Lw==
X-Gm-Message-State: APuU4Z8JxwaE8a1VfkgydF+TXjaeanUrhMm8hhxSVIrd5RopgnhBXo7V
	yfdCvacJBKWLicRu1lVnVfcnCqfYmtegxPcmVV1hbXw10oSNwPeQet/+
X-Gm-Gg: AZFdTZdEjawVjYMQVmw4pXRJ9XYVMa4npJBdMmjj9JOPiKHsDyvzfHqJPovK7oczIui
	95P0RT4oaRc96b2gAdaVRANwjKa7UFm4oDSff/0FeuXrufFeew4OJ/BHHhHFKjP2wOemdSqfRXw
	YHoGQX22FV9H1IZsg0Xx4EuDcK0C7Lxh6K5VV1eHqfRwTJ3u7Hxefol4LzUxx7v6n0Zv4AipJmV
	yFwPbv9rvLAsrhAsj2Y7hrzFIUdldWxhfmI9KZS2q0eEsbDH9pf/iQh5QNKFgf4l3GD6jkVP8kt
	i1mmYDcUm9776ZLUvF9H84QKKjq2Ag+CsLEwsy7Upqmg1RtfT/KuEhE2PMWyK9115IpDs1xBd1+
	cnfoOpPmdSc6bI6zdrbYEJHiswdHIEh5+mn7HlxNP/dje9UqeMt6wmt54+rVbpYVff6x04LBAAr
	6dVAW6qcXDqWXW78ZrZD+yI3Lo0VCJykkOf+6ZcQOPJRIyAh1MeQ1J7ogE7hdCoiOHJT+UkupCH
	MzQt7AdUAfYjhjWRwp/2nufXwVsSJ3odCHDjpSpW+OOaDGUzCEwW9UhC6GKjlBKDqnzbkIU/OSd
	DbPHHUIxPe2n/3HOChgF9vtcQJu5SQDC1mjvvur1I38dFhKMJqCDSJI=
X-Received: by 2002:a17:90b:3d4d:b0:3b3:b704:119c with SMTP id 98e67ed59e1d1-3b41c938935mr15697647a91.37.1795598732549;
        Wed, 25 Nov 2026 01:25:32 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm29160242a91.5.2026.11.25.01.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:25:32 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	leeonion.muyu@gmail.com
Subject: Re: [PATCH v2 3/3] mtd: rawnand: r852: bounce non-linear-map buffers
Date: Wed, 25 Nov 2026 17:25:27 +0800
Message-Id: <20261125092527.1938256-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <875wxl1ea6.fsf@bootlin.com>
References: <875wxl1ea6.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_012534_076786_4C65DE7D 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: leeonion.muyu@gmail.com

Hi Miquel,

On 25/11/2026 at 09:55:13 +01, Miquel Raynal wrote:
> Why do we need a local bounce if the core can do it with
> NAND_USES_DMA?

You are right, declaring NAND_USES_DMA is the consistent approach
with the other controllers in this series, and I will rework this
patch that way.  One part of the local check needs to stay though:
the 512-byte alignment condition.  The hardware requires
R852_DMA_LEN alignment, which the core condition (chip->buf_align,
default 1) does not know about, so misaligned linear buffers still
need the pre-existing local bounce.  The virt_addr_valid() part of
the local condition becomes redundant once the core bounces the
non-linear-map buffers, and v3 reverts it to the original form.

> Also please add Cc: stable to these three patches.

Done in v3, thanks.

Ping

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
