Received: from mailout2.samsung.com ([203.254.224.25])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E84nK-0001EA-Q1
	for linux-mtd@lists.infradead.org; Wed, 24 Aug 2005 19:36:39 -0400
Received: from ep_mmp1 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0ILR002YI2WSTI@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 25 Aug 2005 08:36:28 +0900 (KST)
Received: from july7 ([168.219.213.193])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0ILR00B802WSF3@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 25 Aug 2005 08:36:28 +0900 (KST)
Date: Thu, 25 Aug 2005 08:36:29 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
In-reply-to: <430C50D3.5080808@gmail.com>
To: 'Bernhard Priewasser' <priewasser@gmail.com>
Message-id: <0ILR00B812WSF3@mmp1.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Cc: linux-mtd@lists.infradead.org
Subject: RE: [PATCH] OneNAND: Simple Bad Block handling support
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Thank you for replay and check the code

> 
> Is the following code valid (assuming patch has been run)?
>  > ctrl = this->read_word(this->base + ONENAND_REG_CTRL_STATUS);
> 
>  > if (ctrl & ONENAND_CTRL_ERROR) {
>  > 	/* It maybe occur at initial bad block */
>  > 	DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: controller error 
> = 0x%04x\n", 
> ctrl);
>  > 	/* Clear other interrupt bits for preventing ECC error */
>  > 	interrupt &= ONENAND_INT_MASTER;
>  > }
> 
>  > if (ctrl & ONENAND_CTRL_LOCK) {
>  > 	DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: it's locked error = 
> 0x%04x\n", ctrl);
>  > 	return -EACCES;
>  > }
> 
>  > if (interrupt & ONENAND_INT_READ) {
>  > 	ecc = this->read_word(this->base + ONENAND_REG_ECC_STATUS);
>  > 	if (ecc & ONENAND_ECC_2BIT_ALL) {
>  > 		DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: ECC 
> error = 0x%04x\n", ecc);
>  > 		return -EBADMSG;
>  > 	}
>  > }
> 
> 1) interrupt &= ONENAND_INT_MASTER instead of return?

	=> Yes It's valid. During the initial bad block scanning, the
OneNAND controller return ctrl error. If we use return -EIO then OneNAND
scan failed, then we can't detect OneNAND chip. So we don't return any ctrl
error.
	=> interrupt &= ONENAND_INT_MASTER. we always set master interrupt
bit in any case

> 2) return -EACCES instead of return -EIO?
	=> I don't know which error code are correct. but I think locked
block access is EACCES instead of EIO



Kyungmin Park
