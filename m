Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA59CCF9E3
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Nov 2025 10:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k9vAkcenoqFGa3OIk73EIzUvTJ7Y98nNaKFaurvnWcw=; b=vTqX9yTLLanifj
	4QUpW+hg3C8J5snVOY5qMQY0mY8FdSE5kCxJPtF4cxLwXa2ctGhb2HPtPUPGkSOeAls2Z52IxzwKV
	eZRrU0EBcvyDvXeYVu5JugfnqUI0w89CLjamwXwMGqtJYS98uXq/7XlXMwE/8TsPVHaRCN1JRqxuF
	l/CtuucPXmOrhtIu/GSXpVt6QzVtJH2tW3il9+pjGNbwhMN7ezLaMnkhGhZLEj/6/eKIgHpZfvIAa
	Mkl1UwFgzMLuegBbNCxRwKJdlBN8H3bbOO/Wuix8Hox5B93y3QFTxDA6WzSelGAoNTjABKMZbZaLE
	oVYWpsTqZJrPAComMhxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOwb-00000005AUx-48kq;
	Mon, 10 Nov 2025 10:16:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOwa-00000005ATQ-00xG
	for linux-mtd@lists.infradead.org;
	Mon, 10 Nov 2025 10:16:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 860DA43C78;
	Mon, 10 Nov 2025 10:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098BFC19422;
	Mon, 10 Nov 2025 10:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762769774;
	bh=DJA5Aa/vg9m7bpPMnFdOHwCVKA+4Me+gV58laoWd5cI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Bkt29zTo+SOJmqLIOVUOauthXmJqxSbhtbJDQ6lq4RuVobrP4yqQm/DV0WxvAU2e2
	 YKR0KaEAc6P07f6hLk2zya+gbDBK9Q+pPM++fbtGt9VKfEz+phBFiFLcdoMTP5NHCr
	 XMBR7Z+O8kWe4s88tvYrUH5nHvWaUAwlGIL7z/o6foHUAuRSafviGk11byqrLaiKpk
	 zVWkt/FCkf5YGdAP1UfZWboGADAi8CtjebRmoXQMwCa3RuElCWl3OiAgyLvKnY9fsH
	 /ywJh5dO2ElrqnMtWZUw/GxjMsLPtc3npybpTnqYvL6RbbKkQpuDMUgdj5HZUN5PeG
	 kGtaJ98xkCfKQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Sean Anderson <sean.anderson@linux.dev>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,
  linux-mtd@lists.infradead.org,  Richard Weinberger <richard@nod.at>,
  linux-kernel@vger.kernel.org,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: Enable locking for n25q00a
In-Reply-To: <31d01667-e80e-423c-bdab-8d05831d575d@linaro.org> (Tudor
	Ambarus's message of "Mon, 10 Nov 2025 09:08:07 +0200")
References: <20251006223409.3475001-1-sean.anderson@linux.dev>
	<mafs0ecreontu.fsf@kernel.org>
	<4888cefa-e8be-4f0d-9d4a-c82f9ff6cda0@linux.dev>
	<mafs05xcpo9sz.fsf@kernel.org>
	<26a795ac-e6ff-4363-a8b9-38793a9be794@linux.dev>
	<mafs0ikgnn07u.fsf@kernel.org>
	<d00d42ce-4262-4736-8c73-5d2544e86d33@linux.dev>
	<33cbbac1-c247-4644-b555-998eea6e8305@linaro.org>
	<92e99a96-5582-48a5-a4f9-e9b33fcff171@linux.dev>
	<31d01667-e80e-423c-bdab-8d05831d575d@linaro.org>
Date: Mon, 10 Nov 2025 11:16:11 +0100
Message-ID: <mafs0v7ji9or8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_021616_072224_618860DD 
X-CRM114-Status: UNSURE (   8.52  )
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

On Mon, Nov 10 2025, Tudor Ambarus wrote:

> The locking tests look fine to me:
>
> Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Thanks for reviewing Tudor.

I would like a re-roll with the commit message updated before applying
this.

>
> Sean, if you care you can extend the documentation on how to test locking.
> Also, you may drop the non SFDP data from the flash's static definition as
> a follow up patch.


-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
