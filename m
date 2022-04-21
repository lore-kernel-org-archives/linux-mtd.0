Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1175C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 07:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HU+lyJK7pnZvj3CUrC8etBrCIv2aYhjssIjRTURtl44=; b=K59mT/gduKajcJ
	QDjBGVfr4Ce5cFvoQcKPQymSkE2ucHxZnBl1+p2JX9TezsXCNL7sUsZBD1VkVJ4FtNmzM+tU1NwbF
	bpLMc42isA2+YahD7jeTWHx3k1RHqMyh0RytL6rVc7T4+K6VEZUJ74fRJXDwHixnYiRCDpeqEzBmd
	9739lw7ahH9RTy5rJiZ3h5p0S5Tg8JSDHKPId1Ga6Ki17bmaQaqouUU8Ye3EweZgpGtN8ne6PsE45
	aP0GPqYI7J903PxD1YAG2QAfzY8oA1QQRlMMbVMgb1Ju9ICmSJpl/YN0WURYpgJkl+/cj+M8kobbK
	/Kcv+Ig3KyV+U7i0tJ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhRLn-00C2sT-5Z; Thu, 21 Apr 2022 07:35:39 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRLi-00C2pZ-Dv
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 07:35:36 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 55E7A1C000F;
 Thu, 21 Apr 2022 07:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650526529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p4QO0moKpEkXz+ulrvSLQo0T9lC8TOEa3gAblMHHWcg=;
 b=W5tjJw+uF9lptPqXryNnTwotnKABgq9Ic3j79bCDlyH4iFgliXcsv9VSd7n99CplsWqHCq
 okVua35NKDn/cOEwdtfhzT3+mokU0WhN1lah0wBVHe3nqb6em5PDNp5vJtLwKz6yXV+Zgw
 vrf9KgFxLeQlocnMMpzXJHdG54xIiL887VIpXmBbT5sw8omtoMXb0CzImEZkf7fQPOs8iz
 HmgZr3qiTBbVnufIUcXIru9Cy+I0hPCyWbZa4qVPZbVclAW+xG73nDp16a9J9YYzuyj0j3
 Rd/slS5Gex4c2ycFMo2uZ3M9C51cMLv3LXCpbG7V+b7WX2aJimX71A4eDWNpwQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>, mani@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: konrad.dybcio@somainline.org, quic_srichara@quicinc.com,
 stable@vger.kernel.org
Subject: Re: [PATCH V5] mtd: rawnand: qcom: fix memory corruption that causes
 panic
Date: Thu, 21 Apr 2022 09:35:27 +0200
Message-Id: <20220421073527.71690-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <1650268107-5363-1-git-send-email-quic_mdalam@quicinc.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ba7542eb2dd5dfc75c457198b88986642e602065'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_003534_805432_8BACF1B8 
X-CRM114-Status: GOOD (  15.76  )
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

On Mon, 2022-04-18 at 07:48:27 UTC, Md Sadre Alam wrote:
> This patch fixes a memory corruption that occurred in the
> nand_scan() path for Hynix nand device.
> 
> On boot, for Hynix nand device will panic at a weird place:
> | Unable to handle kernel NULL pointer dereference at virtual
>   address 00000070
> | [00000070] *pgd=00000000
> | Internal error: Oops: 5 [#1] PREEMPT SMP ARM
> | Modules linked in:
> | CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.17.0-01473-g13ae1769cfb0
>   #38
> | Hardware name: Generic DT based system
> | PC is at nandc_set_reg+0x8/0x1c
> | LR is at qcom_nandc_command+0x20c/0x5d0
> | pc : [<c088b74c>]    lr : [<c088d9c8>]    psr: 00000113
> | sp : c14adc50  ip : c14ee208  fp : c0cc970c
> | r10: 000000a3  r9 : 00000000  r8 : 00000040
> | r7 : c16f6a00  r6 : 00000090  r5 : 00000004  r4 :c14ee040
> | r3 : 00000000  r2 : 0000000b  r1 : 00000000  r0 :c14ee040
> | Flags: nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM Segment none
> | Control: 10c5387d  Table: 8020406a  DAC: 00000051
> | Register r0 information: slab kmalloc-2k start c14ee000 pointer offset
>   64 size 2048
> | Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
> | nandc_set_reg from qcom_nandc_command+0x20c/0x5d0
> | qcom_nandc_command from nand_readid_op+0x198/0x1e8
> | nand_readid_op from hynix_nand_has_valid_jedecid+0x30/0x78
> | hynix_nand_has_valid_jedecid from hynix_nand_init+0xb8/0x454
> | hynix_nand_init from nand_scan_with_ids+0xa30/0x14a8
> | nand_scan_with_ids from qcom_nandc_probe+0x648/0x7b0
> | qcom_nandc_probe from platform_probe+0x58/0xac
> 
> The problem is that the nand_scan()'s qcom_nand_attach_chip callback
> is updating the nandc->max_cwperpage from 1 to 4 or 8 based on page size.
> This causes the sg_init_table of clear_bam_transaction() in the driver's
> qcom_nandc_command() to memset much more than what was initially
> allocated by alloc_bam_transaction().
> 
> This patch will update nandc->max_cwperpage 1 to 4 or 8 based on page
> size in qcom_nand_attach_chip call back after freeing the previously
> allocated memory for bam txn as per nandc->max_cwperpage = 1 and then
> again allocating bam txn as per nandc->max_cwperpage = 4 or 8 based on
> page size in qcom_nand_attach_chip call back itself.
> 
> Cc: stable@vger.kernel.org
> Fixes: 6a3cec64f18c ("mtd: rawnand: qcom: convert driver to nand_scan()")
> Reported-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Co-developed-by: Sricharan R <quic_srichara@quicinc.com>
> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
