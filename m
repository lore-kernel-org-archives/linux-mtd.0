Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDACAC021A9
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2025 14:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JsxcoiyW5TZsj4aO/a1DLY2DNyKSRdJOtGWXD8vuQV4=; b=CDVusVLrciPaAi
	0sdp7qhnUt0a3+hUcX2ixAA4GnwtbQnEXuPh6rKFViB4dlrmAVjX9umIk0nXJZmERXG6wSNFTz/pQ
	yeNIkvTtJZstJaG7ZNimkTn6Og00QvwnFCJH44OEFylAUwTyjhE/MrhIeCKCTjgUHz6rcE4rxbWeC
	2cnedLI4eE0tm5PgFMYJWkSSxlD4F9kxsEZ0qoG/0d+EDYUzYxv1Aqqy96/58fZo5eLhCVp7mKuC5
	/bfRcFrlbh3X9DGnq15RiOk6oaGaZboOlPIn6wfUfPjS4CYA3mkI61JrpGI5zKWUutcG/lFbdzOIN
	lrdAI6tty07oClHR2Rzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2Gm-00000004tP7-42Hz;
	Mon, 17 Feb 2025 14:38:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk1zl-00000004pSm-0LMp
	for linux-mtd@lists.infradead.org;
	Mon, 17 Feb 2025 14:21:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 21B81A4012D;
	Mon, 17 Feb 2025 14:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ECD3C4CED1;
	Mon, 17 Feb 2025 14:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739802071;
	bh=7wbfycFd+Qe/RMftqN+td76/PHMtQPAcus/+K4xM1aI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=N7+FeV1vKXvWtuhOP3SYj/BSducmwrI9QhBB/14Qoz3yFjWHwFv/iQJcJm2I/FTOb
	 jbuklG1VSi5VpgIPTCLfDE06In8qs8tuqIy+Ukw6/870plMSrHqq8JvK7jYpxKhy7T
	 R/SCchTrxJSmNciAFFL5Uima2VmJkyEe3aeSUm8AxQnZv/27ECLhLSTCs39cBobJ5p
	 8MyyyH55/ppqkIbMDLj4BIsESowVDp9LSW8l+kOOzrHg1M670KtKlMjOWwvaEW/IjI
	 KkjaOPb2++27vJq7spDm5//f3C/2323XakQR2ZUxWOspM+J8wghBSdh7KWpNwaNLIF
	 ZMVFs6I99On3g==
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
Date: Mon, 17 Feb 2025 14:21:09 +0000
Message-ID: <mafs0cyfgmz3e.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_062113_245190_11911567 
X-CRM114-Status: GOOD (  16.70  )
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

On Thu, Feb 13 2025, Amit Kumar Mahapatra wrote:

> 'commit 18bcb4aa54ea ("mtd: spi-nor: sst: Factor out common write operation
> to `sst_nor_write_data()`")' introduced a bug where only one byte of data
> is written, regardless of the number of bytes passed to
> sst_nor_write_data(), causing a kernel crash during the write operation.
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

Applied to spi-nor/fixes with Cc: stable@vger.kernel.org added.

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
>  	if (ret < 0)
>  		return ret;
>  	WARN(ret != len, "While writing %zu byte written %i bytes\n", len, ret);

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
