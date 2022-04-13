Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77272C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Apr 2022 15:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mz+GOq9UDH48om5jCjwIx+hxYF9KXRLy4b9UAUlBSi4=; b=H8G6kyEwx74Cf7
	/lTe+3/Yzmj3TmBe/BCqHW8VYa0uMpDtbhTaKRxIK+1UyhM52cyFx4ADaCe+w2VNtwSHHfnqxL5Vv
	sCMkquzPfPUYHYAs0RFF9xcSO5cJA11raY7U+FaOKYR6r4Ewr6O0IZZNpmOxyCP+PAJxBzsvaBeIs
	AZFuBK7Yv7MjEcpr4dHZk8mnwIU8oc0+8yKUAZFRES05S+gH4jnuKZYzVzVtW0CP6SNh4S1RJSjvt
	jfnJmerBN7tTPh9OGLb+941h46Calx8LLEBi3hUDD76Pvh5sjDK0oMtWQLE6LCtlzgNwI4NfwM0gQ
	NdW1dpcAJoMCBAuesjTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nef4r-001czE-NB; Wed, 13 Apr 2022 15:38:41 +0000
Received: from mail.fmat.eu ([94.16.121.4])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nef4n-001cwz-LO
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2022 15:38:39 +0000
Received: from authenticated-user (mail.fmat.eu [94.16.121.4])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.fmat.eu (Postfix) with ESMTPSA id 269A8E0067;
 Wed, 13 Apr 2022 17:38:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=matouschek.org;
 s=mail; t=1649864310;
 bh=NGaM4ZVSSdgZSfWWvtkIVOjrhU9vkzIB7T6Q2WNOJHk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MZ6b9wtuHKC873DpzPYvs9Dbn77gM92vCopWrXM20kQwBvkXcOPDfoFS0IF1qTdmN
 P3j0DSCLjVwrghmtENpXMTnhxZ+64t+waldVtHemm0i6Q7CrDOBAp3xHi3+Z5TjeHB
 l2oMot+KJYFI/ahby6+x9nXVqwmyO2a8H5uOdaa0mLpE9fhrKhn5S8dtsY5MRBgnX3
 UyMRK06HcMB/tmYHuUllNIUJYnLVAf5lejr1pGCHHVqWKe7v1ZZPsOOJs3c0LSxO/v
 +UTNePYLT7gNUADtVsneQHsHI5WdScBc66ot+Gac/RLvdEpEpSI/51qJdIdCh/9ZIy
 yXPEsoZlGJHFw==
Message-ID: <c49e86c8-5433-343f-d41f-ce6e9dcdf75b@matouschek.org>
Date: Wed, 13 Apr 2022 17:38:28 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2] mtd: spinand: Add support for XTX XT26G0xA
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20220408161904.94383-1-felix@matouschek.org>
 <20220411092311.3f0b97b3@xps13>
 <e697bea9-29b6-2f83-7d42-02afd88fa6b1@matouschek.org>
 <20220411220310.14e2da32@xps13>
From: Felix Matouschek <felix@matouschek.org>
In-Reply-To: <20220411220310.14e2da32@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_083838_251077_63F4C07C 
X-CRM114-Status: UNSURE (   9.12  )
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

Hi Miquel,

Am 11.04.22 um 22:03 schrieb Miquel Raynal:
>> According to the data-sheet (section 7, page 27) the switch should be
>> able to handle all values of the status register. So should I remove the
>> final "return -EINVAL"?
> 
> I think so, yes.

I noticed that there are actually some possible values for the ECC bits in the 
status register, that are not covered by the switch case. According to the
data-sheet they should not happen, but would it be wise to catch them anyways?
Maybe if something goes wrong?

Thank you,
Felix

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
