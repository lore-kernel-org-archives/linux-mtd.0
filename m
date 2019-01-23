Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9334C282C2
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 12:57:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99E8521848
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 12:57:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="phD3ASFM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="LKiw8I8Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99E8521848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7JUFnTr8HKKMTPrvEk/TIAwNmFwLwVHKmKQUJt8TRmI=; b=phD3ASFMUTGjFc
	EHAnY/DkYhHogrDV6eUQVW5Czc+U6T5SvGBAs1xkl64ObL60WzlNCu9+MCtxGaUjcK7xXlwhJMfK+
	0VcqBSp0ABtItrnBDqXkFLp7DaSSB2C1H7+q2qDupHiXjaMPQuksP1lbvaFYKWRo+8Z+QMFCy57mr
	JO9/sbgAXih4iWiPL2nHO/wgwWdO1w4cyTXLDRwiaEH+0hGo7rw/k7vfxNef3kRyYrY/THsIMyTYm
	9r9k9O397e5uIhi/Et9u8F3b+Uzu0enOuGFkJBR/RbGz13oXzlW0sK/Ic3kkh8T3jV0MpeFinUm8X
	AGhkRY2Ttr2Ngqt+reoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmI6F-0004yS-1X; Wed, 23 Jan 2019 12:57:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmI6C-0004y5-Lk
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 12:57:46 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1A7A021848;
 Wed, 23 Jan 2019 12:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548248264;
 bh=eLl6bX8lnL3+YzW3aFWo3s3PTViCZWNv/jCwFQRC/Ik=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LKiw8I8ZCvmbD/XUX2y5U90VYRC0BUJvV3ZOytE+afb2/OY+QJKIwkpBaIH8kMBVq
 DL400bz7n1WldPpua04pAbjmAxcb3azUQ3JygazXcxG4K2elY9uBkE2fQL1Zd4BYXx
 jx+7BtVgsbXDP9C5FrYAF1zZP+1bgiQRTYzeExLw=
Date: Wed, 23 Jan 2019 13:57:35 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] mtd: spinand: Add support for GigaDevice GD5F1GQ4UC
Message-ID: <20190123135735.358fc9a6@bbrezillon>
In-Reply-To: <20190123134050.7efe59a6@bbrezillon>
References: <20190122145632.17547-1-sr@denx.de>
 <20190122175346.602894e4@bbrezillon>
 <263cbd32-b7d4-e440-c92d-4f24f5af27a0@denx.de>
 <20190123085202.0db528ac@bbrezillon>
 <870af691-e8d3-cd91-5a55-6478ef885446@denx.de>
 <20190123095504.7857ca34@bbrezillon>
 <a350a884-f531-353d-31bc-d51be8f6eb83@denx.de>
 <20190123103512.722095cd@bbrezillon>
 <adedc307-dc10-3200-84fa-36313b858dbf@denx.de>
 <20190123122514.0db87887@bbrezillon>
 <4f630269-5562-b795-63ca-92989d6c5059@denx.de>
 <20190123132249.2e7f65a2@bbrezillon>
 <358c78d9-6507-3998-a065-ddd18809d02b@denx.de>
 <20190123134050.7efe59a6@bbrezillon>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_045744_730293_078A4A13 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 23 Jan 2019 13:40:50 +0100
Boris Brezillon <bbrezillon@kernel.org> wrote:

> > This definitely does look better. I assume that we are we on the
> > right track now?  
> 
> Yep, and it confirms the ECC caps => 8bits/512bytes. Will send a proper
> commit for the fix I did and Cc you so you can add your
> Tested-by/Reviewed-by.

Oh, looks like a side-effect of migrating to the dirmap approach
(merged in nand/next [1]) is that this bug does not exist. Can you test
the nand/next branch and let me know if it still works?

[1]http://git.infradead.org/linux-mtd.git/shortlog/refs/heads/nand/next

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
