Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD35C02181
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jan 2025 12:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Subject:To:From:Date:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=68nTLmHwWu/OAUKSPJMwzdkpXiZC0SOMIuP0PT4UupI=; b=q6HzxkH7pu/rkQ
	mjGN47z2r+XwKEvDXBtRgOdIyYHONLmdKHBGiFuXMidonkc5yR4lW0of9uxv0SsI0MOfwjH/U83IN
	kmiVY+NN+3/BQKfWtShn0KcHe3rolZoPP4AfgwElVZdJC6RrZWjOMlrpEPw8bjzuyfmePMPEs+cdR
	hPNog2X7Sfhv1KUZgndfiArtCiQRFxWuKp2HPoh0nBszaBeL/r8XpmFKQwAsPU1Yldvs1YOOghpB3
	3CpwdlMtqE7CL5ikoqQfSjZIt8cQCAf+0CG3tkXC6HQF8MqwaswzudmQOjq2sRULrH8zfW3xUlcA1
	mYyIT8VnRs69/u49wUyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc1jR-0000000HNoo-1djf;
	Sun, 26 Jan 2025 12:27:17 +0000
Received: from freezersmtp.redtablet.es ([54.36.4.79] helo=freezer.redtablet.es)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc1jN-0000000HNoF-35ya
	for linux-mtd@lists.infradead.org;
	Sun, 26 Jan 2025 12:27:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=os3sl.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:To:
	From:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=cmlt8t2ZpMfq4nfneP6kEgMrE/OJJMRfrfTaiaYtmc0=; b=RZqFs7vn7oFstJECA5mrIXU/j+
	K7OiYKD7gffoLFYLuvUmCV713BFyXQvf2wT00ImjVxV2AiL9ssTFtlRF4tw9C/Ehpit5mcRlBPTiB
	iLgjv3kXd1vSCeNFeW2ExCMiXjbVFM/HvSgFolkZkMguNQoEUSAo9G7pJVpKL5DFOj6aTu1+XrpAB
	PJs/BXZni+vh0iEbgB0D1DUuRPxyMKi10E2g0qhEEeuNAg8goVbGdZySS23Gh/BvSF4uGVcD97ZRg
	0sEdTT9B/d085zDLh0DiNo8ALca4aHeRKHVKiPL1oH4m7j9C+c59mspdocRJ1mG60oDX+S8j42XXs
	sApffmUQ==;
Received: from [::1] (port=43030 helo=freezer.redtablet.es)
	by freezer.redtablet.es with esmtpa (Exim 4.96.2)
	(envelope-from <alucero@os3sl.com>)
	id 1tc1ie-00059S-2f;
	Sun, 26 Jan 2025 13:26:28 +0100
MIME-Version: 1.0
Date: Sun, 26 Jan 2025 13:26:26 +0100
From: alucero@os3sl.com
To: Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org,
 Daniel Zorita <dzorita@eeesa.com>, =?UTF-8?Q?Carlos_S=C3=A1nchez?=
 <csanchez@eeesa.com>
Subject: atmel nand controller regression
User-Agent: Roundcube Webmail/1.6.9
Message-ID: <7105ca76cb68f6db95757f0ec74621ad@os3sl.com>
X-Sender: alucero@os3sl.com
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - freezer.redtablet.es
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - os3sl.com
X-Get-Message-Sender-Via: freezer.redtablet.es: authenticated_id: alucero@os3sl.com
X-Authenticated-Sender: freezer.redtablet.es: alucero@os3sl.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_042714_509904_70B131DE 
X-CRM114-Status: GOOD (  12.92  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi all,

A Micron 512MB NAND working fine in a 5.4 kernel was not usable in a 
5.15 one. I have not tested with kernels between those two versions, but 
the same problem still appears in a 6.6.51 from the 
https://github.com/linux4microchip/linux.git repo. I do not think this 
is due to being a non vanilla kernel but something which could still be 
happening in current vanilla kernel. In fact, the same function 
apparently being the problem is the same in a 6.13.0 rc5 (which I have 
been working with for other reasons).

The function is atmel_hsmc_nand_waitrdy and the problem being the call 
to atmel_nand_waitrdy if the rb type not being ATMEL_NAND_NATIVE_RB. 
This is used for at least the nand function for reading the params 
following ONFI standard, and being part of that operation is the call to 
this function for waiting the command/transfer to be completed. That 
implies to read from the NFC SRAM for the status, something I do not 
understand since I would expect the status obtained from the proper NFC 
register, HSMC_SR. I do not completely understand this SMC/NFC 
controller, so assuming that is correct, it is affecting the following 
read from the SRAM containing the params, leading to the nand detection 
failure since the crc check fails. In the tests I have done, that is 
only one byte read, but enough for displacing the full params buffer for 
getting wrong data and the crc failing.

The fix which seems to work for me, but not sure it is the proper one, 
in a 6.6 kernel is this one:

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c 
b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 3f494f7c7ecb..a64ecde52e45 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -531,8 +531,10 @@ static int atmel_hsmc_nand_waitrdy(struct 
atmel_nand *nand,
         struct atmel_hsmc_nand_controller *nc;
         u32 status, mask;

+#if 0
         if (nand->activecs->rb.type != ATMEL_NAND_NATIVE_RB)
                 return atmel_nand_waitrdy(nand, timeout_ms);
+#endif

         nc = to_hsmc_nand_controller(nand->base.controller);
         mask = ATMEL_HSMC_NFC_SR_RBEDGE(nand->activecs->rb.id);

what implies the ATMEL_HSMC_NFC_SR polling in that function.

Maybe this is only impacting the ONFI detection when reading the params 
page, but in any case, I hope this report can help for fixing the 
problem properly.

I offer myself for testing the patch to fix this.

Thank you


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
