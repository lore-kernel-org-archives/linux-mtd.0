Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1FEC0219D
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Feb 2025 07:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fwXc34V0607xwB1mDIZdI6+WUvp3dIQO2yPaukVbrwc=; b=npw7oAafUwZ/58
	Ymulfm+D1ixXZsGzi273N9na4BQBRR6Gt6PwJY65vRc2c9SpaN3s4bmARre7cloN55Yo7iL8hEwq1
	Be+6A/ja82gQRBWYvXnEAemxSRxE2QxMXiORXroAqjdokOx6j3X8cXKCHS2jUhxkqGixD6F5EwNOe
	6aT6Y1hwqqr12D0IRiQgJd3SlA+0PFt41sBrVfGI7dx+losJfMvEhAliUG8TeVKycp2qdFvv8OQY8
	7qUaLF9eNetFCYuHtwy20tamsLQyORK2+nW7zXhVwZHsnBaQMqXYfZzi7pEmEIHoXkD97avB5N3jj
	qaL0hbQuBJI6Sb/sSifA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTyE-0000000A9Sv-3JZW;
	Thu, 13 Feb 2025 07:49:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTx1-0000000A9En-0vjc
	for linux-mtd@lists.infradead.org;
	Thu, 13 Feb 2025 07:48:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B8E1E5C4D1D;
	Thu, 13 Feb 2025 07:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E041C4CEE6;
	Thu, 13 Feb 2025 07:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739432878;
	bh=3zKuyt240vV2fOidVY6npgpoif00jNww10ucz/+afGI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=j9bH5gfoWya5jZAbdHkubIZczTGcBZ+6azzP1qa59zfBZQqJJJthuR9+0at271dxE
	 xRQ/4q62PCXHkfjlre9L5+1W8Wj2+hTw1ogMHa4d0XWq7fakTJp4f7y53IeaW1At8k
	 RNS2+6sNugQ6wvu3D5WTEOmknTCJbb2Tj69A+LxY8Iy08RSQEXw7Ii4pZgzmmSihJ7
	 hhYrm7+laKYxyr8Etc5B3L1ReF/9G68yl5zZVXPVgb7bw7dvoi3mWW44DlcNECNTTc
	 dCqt+mh0Nv6MvKVgkh1ZriIEXI/yUaVPPFWWbeo7e8A6wC+inDDqkgFrIUUBoIee3d
	 5yVYio0w55MJw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: <tudor.ambarus@linaro.org>,  <pratyush@kernel.org>,
  <mwalle@kernel.org>,  <miquel.raynal@bootlin.com>,  <richard@nod.at>,
  <vigneshr@ti.com>,  <csokas.bence@prolan.hu>,
  <linux-mtd@lists.infradead.org>,  <git@amd.com>,
  <amitrkcian2002@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: sst: Fix SST write failure
In-Reply-To: <20250213054546.2078121-1-amit.kumar-mahapatra@amd.com> (Amit
	Kumar Mahapatra's message of "Thu, 13 Feb 2025 11:15:46 +0530")
References: <20250213054546.2078121-1-amit.kumar-mahapatra@amd.com>
Date: Thu, 13 Feb 2025 07:47:55 +0000
Message-ID: <mafs0lduaxp3o.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_234759_375954_5D5F98B9 
X-CRM114-Status: GOOD (  20.75  )
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

Hi Amit,

On Thu, Feb 13 2025, Amit Kumar Mahapatra wrote:

> 'commit 18bcb4aa54ea ("mtd: spi-nor: sst: Factor out common write operation
> to `sst_nor_write_data()`")' introduced a bug where only one byte of data
> is written, regardless of the number of bytes passed to
> sst_nor_write_data(), causing a kernel crash during the write operation.

Does it crash or only cause a warning? This comes from a WARN() so it
should not crash the kernel unless you set panic_on_warn.

> Ensure the correct number of bytes are written as passed to
> sst_nor_write_data().
>
> Call trace:
> [   57.400180] ------------[ cut here ]------------
> [   57.404842] While writing 2 byte written 1 bytes
> [   57.409493] WARNING: CPU: 0 PID: 737 at drivers/mtd/spi-nor/sst.c:187 sst_nor_write_data+0x6c/0x74
> [   57.418464] Modules linked in:
> [   57.421517] CPU: 0 UID: 0 PID: 737 Comm: mtd_debug Not tainted 6.12.0-g5ad04afd91f9 #30
> [   57.429517] Hardware name: Xilinx Versal A2197 Processor board revA - x-prc-02 revA (DT)
> [   57.437600] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   57.444557] pc : sst_nor_write_data+0x6c/0x74
> [   57.448911] lr : sst_nor_write_data+0x6c/0x74
> [   57.453264] sp : ffff80008232bb40
> [   57.456570] x29: ffff80008232bb40 x28: 0000000000010000 x27: 0000000000000001
> [   57.463708] x26: 000000000000ffff x25: 0000000000000000 x24: 0000000000000000
> [   57.470843] x23: 0000000000010000 x22: ffff80008232bbf0 x21: ffff000816230000
> [   57.477978] x20: ffff0008056c0080 x19: 0000000000000002 x18: 0000000000000006
> [   57.485112] x17: 0000000000000000 x16: 0000000000000000 x15: ffff80008232b580
> [   57.492246] x14: 0000000000000000 x13: ffff8000816d1530 x12: 00000000000004a4
> [   57.499380] x11: 000000000000018c x10: ffff8000816fd530 x9 : ffff8000816d1530
> [   57.506515] x8 : 00000000fffff7ff x7 : ffff8000816fd530 x6 : 0000000000000001
> [   57.513649] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
> [   57.520782] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0008049b0000
> [   57.527916] Call trace:
> [   57.530354]  sst_nor_write_data+0x6c/0x74
> [   57.534361]  sst_nor_write+0xb4/0x18c
> [   57.538019]  mtd_write_oob_std+0x7c/0x88
> [   57.541941]  mtd_write_oob+0x70/0xbc
> [   57.545511]  mtd_write+0x68/0xa8
> [   57.548733]  mtdchar_write+0x10c/0x290
> [   57.552477]  vfs_write+0xb4/0x3a8
> [   57.555791]  ksys_write+0x74/0x10c
> [   57.559189]  __arm64_sys_write+0x1c/0x28
> [   57.563109]  invoke_syscall+0x54/0x11c
> [   57.566856]  el0_svc_common.constprop.0+0xc0/0xe0
> [   57.571557]  do_el0_svc+0x1c/0x28
> [   57.574868]  el0_svc+0x30/0xcc
> [   57.577921]  el0t_64_sync_handler+0x120/0x12c
> [   57.582276]  el0t_64_sync+0x190/0x194
> [   57.585933] ---[ end trace 0000000000000000 ]---
>
> Fixes: 18bcb4aa54ea ("mtd: spi-nor: sst: Factor out common write operation to `sst_nor_write_data()`")
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
> BRANCH: mtd/next
> ---
>  drivers/mtd/spi-nor/sst.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
> index b5ad7118c49a..175211fe6a5e 100644
> --- a/drivers/mtd/spi-nor/sst.c
> +++ b/drivers/mtd/spi-nor/sst.c
> @@ -174,7 +174,7 @@ static int sst_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
>  	int ret;
>  
>  	nor->program_opcode = op;
> -	ret = spi_nor_write_data(nor, to, 1, buf);
> +	ret = spi_nor_write_data(nor, to, len, buf);

What a silly bug! Thanks for fixing it. I will let the patch sit on the
list for a couple days to get some eyes on it and then will apply it.

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

>  	if (ret < 0)
>  		return ret;
>  	WARN(ret != len, "While writing %zu byte written %i bytes\n", len, ret);

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
