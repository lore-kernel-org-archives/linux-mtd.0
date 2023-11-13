Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D08DC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Nov 2023 12:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2QIYT8YRt8IFYEyHzybatbg5x7QlsrvLMFofRMF1TIs=; b=qaShS7C9ZHYAzW
	Tj8OE45ePEILi0sMHNNNUAD43Nc+iwy9FEi84H8yYUJshTmuMMwzo8PDZwkhjuGtbQahR66qj7EVm
	ncAfBD8VPNpRXw856jaCvJk+eK388HDadV7F6f28nT+pvmba4uHsC1+8bp4UqdS302K3lqb66X3Ru
	HibogcGjR6UgmeAlYT2GkDI+2JxT8pR5KUyrlNcWOnspRGEjCFAeAzPt6pOV9B7ALqXd6jSKiw9Jg
	syedurcGvaqABH4aM5Mz1PkY1A1xpuWw0XE0cYVyPlw7gm9lFG3y23UrwL0hUT5cVmUnz5ybtRMSo
	9kpeba/iYZwNXc/geybw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2WJ8-00DzI3-2h;
	Mon, 13 Nov 2023 12:44:50 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2WJ5-00DzHS-36
	for linux-mtd@lists.infradead.org;
	Mon, 13 Nov 2023 12:44:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 4548AB80D59;
	Mon, 13 Nov 2023 12:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 021C1C433C7;
	Mon, 13 Nov 2023 12:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699879485;
	bh=w3mr6OS81onuZnbxek6iE46F/Yw752xlsfKCcXvPfNI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=t9usVa5S4OmnwAAuzjCR79ebBTaskvZZ9Isi7UgVdnSROSsKbiy3WE3nZEYblK783
	 XtWGzMS4uHlC8l0TgBkKETmvzFm688u+EJkSTCt8yx4Ek20X7wbKYBEuiB1Wwausb6
	 y6bN7k9C4rVHjHF8YqS0cWaR1f3pRIZwCmpCbj3o2l5whtxLs8bnAXI7L4bdKouqIu
	 sNMb826dW75AUcBycR1L9osIxUeOKHIGJisWeDo5be5qcLUYzPgj/LUtsSOukwLpsS
	 5zAz+GFXvuvQDVjIsD0j5gy/oN1UYpKJ2oFJ11k22Ov6wkZM7SY2wdk4LhHbLB6FVs
	 bpNygWAWkbeWg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Michael Walle <michael@walle.cc>
Cc: AceLan Kao <acelan.kao@canonical.com>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Pratyush Yadav <pratyush@kernel.org>,  Miquel
 Raynal <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Mika Westerberg
 <mika.westerberg@linux.intel.com>,  Dhruva Gole <d-gole@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] mtd: spi-nor: Stop reporting warning message
 when soft reset is not suported
In-Reply-To: <7fbd05e9683e7c79d7d9ef1bf2cec5e8@walle.cc> (Michael Walle's
	message of "Thu, 09 Nov 2023 11:57:48 +0100")
References: <20231108094303.46303-1-acelan.kao@canonical.com>
	<20231108094303.46303-2-acelan.kao@canonical.com>
	<7fbd05e9683e7c79d7d9ef1bf2cec5e8@walle.cc>
Date: Mon, 13 Nov 2023 13:44:42 +0100
Message-ID: <mafs04jhpg6v9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_044448_149733_659A242A 
X-CRM114-Status: GOOD (  12.15  )
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

Hi Michael,

On Thu, Nov 09 2023, Michael Walle wrote:

>> From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
>> When the software reset command isn't supported, we now stop reporting
>> the warning message to avoid unnecessary warnings and potential confusion.
>> Reviewed-by: Dhruva Gole <d-gole@ti.com>
>> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
>
> Reviewed-by: Michael Walle <michael@walle.cc>

I did read your reply on the previous thread but did not find time to
write a response. I do largely see sense in your argument though I have
not fully thought it through yet. But I think it would be great if we
can ask the controller "do we need to do a soft reset?"

Anyway, I do not think this patch does anything too bad so it is
probably not worth debating so much on. So for now,

Acked-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
