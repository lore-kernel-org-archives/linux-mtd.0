Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597CF10F3DCD
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2026 14:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lyF43MQ2djGU76Vf9lG+NeYnKLHXXGk5E3Gpn49N5+c=; b=wniKtElliF1Rci
	0OEXA0UguQlHQfOXwpk4sRe9+ozwpesC+lC5qxjSWvMeNmRWyTxz4hFPx6QpxsRGb/YbC/ODUvEWt
	A59uspkz84dWYXdyz8zI+vMhASaWUlaW0mAn8A4TMCaLbyVruyIEXeyznPCDJPsKpk0q+flQtHKv6
	xg7ZDYORV/xLwqfGg4FyiV38+Cn3YoyKTAL2mZrmKaffWOMUOHUxvRwEZmaTkRGsS98ks++e1jnH0
	oGEKgNZqrLhX+Xh1TS65bPPEljZCr6BH9bLk0EccLqUwTK/5zJ8rq79wpvc5vRgMl97HqQgBC4Wj7
	8Psdk/mmpPkbCmqPByEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DKc-0000000BOQK-33Rc;
	Mon, 30 Mar 2026 14:11:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DKa-0000000BOPZ-2k1y
	for linux-mtd@lists.infradead.org;
	Mon, 30 Mar 2026 14:11:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A691438AC;
	Mon, 30 Mar 2026 14:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE70C4CEF7;
	Mon, 30 Mar 2026 14:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774879863;
	bh=4im8A6qI3vNo5u1cIKaeC/wVSOXe9GnXsdheMSJcYlE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VGwELGrJxZKgimq0j6OK2Mhv+JpXJcad7vWxpMxVQlCa8qfyatgpb4bDfBMU/JWyA
	 DVQFhMvsSuZHabwRvtiv+zkke6X1buHyH5hIvGOXj4rvSfHeFBNCR1EYBkHYntc+ow
	 vSwfiVHqRFFHtPH+8j6arS/JPlFEM4PelCc+awDxl5AclaLxN2lCiw49T8ZmFaKk/G
	 DVKI4xvZGXS7SRU6PDPdfAY1aIibwD/YMS8XxXkXGbAYIv+HmfHNT9vk9YdSIm0Mtc
	 VKYmBbgkN7/i9a+1PKNZELBRe4xPYaMM2mRiYwjomtI3mwkn+vGkL437E/nzAfzbti
	 r6LmcNRGrKsxA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Eliav Farber <farbere@amazon.com>
Cc: <tudor.ambarus@linaro.org>,  <pratyush@kernel.org>,
  <mwalle@kernel.org>,  <miquel.raynal@bootlin.com>,  <richard@nod.at>,
  <vigneshr@ti.com>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] mtd: spi-nor: winbond: Fix protection handling
In-Reply-To: <20260218143523.17467-1-farbere@amazon.com> (Eliav Farber's
	message of "Wed, 18 Feb 2026 14:35:20 +0000")
References: <20260218143523.17467-1-farbere@amazon.com>
Date: Mon, 30 Mar 2026 14:10:59 +0000
Message-ID: <2vxzcy0l1k7g.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_071104_712497_A294A42E 
X-CRM114-Status: GOOD (  13.08  )
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

On Wed, Feb 18 2026, Eliav Farber wrote:

> This series fixes block protection handling for the following Winbond
> SPI-NOR devices:
>  - w25q256jwm
>  - w25q256jw
>  - w25q64jvm
>
> The devices do not correctly describe their Status Register layout and
> protection capabilities (locking flags, TB bit, BP bit configuration).
> As a result, the spi-nor core rejects protection requests and locking
> operations fail with -EINVAL, e.g.:
>
>   flash_lock -l /dev/mtd29
>   flash_lock: error!: could not lock device: /dev/mtd29
>   error 22 (Invalid argument)
>
> Update the device flags to match the actual hardware behavior so that
> locking and unlocking regions work correctly.
>
> All changes were validated using flash_lock on the affected devices.

Applied patches 1 and 3 to spi-nor/next. Thanks!

Skipped patch 2 since you say that you haven't got a device to test
with. I don't have a very strong opinion on this, but I do think we
should test patches on real hardware just to we get some sanity checking
for the patch.

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
