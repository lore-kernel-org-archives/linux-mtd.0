Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A9CD68BCF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Nov 2024 19:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tMgTxMAymkTopLhs/a8Ltdl0gjhhAyQjkgWLInzZqNo=; b=VG9p/YvKUT0Yv3
	/qqUqrl92QzyxJrrslBGRPjzDiQ28FWj+KA1andOF/LtxZg8sZtNrG4C1qG8M1ae53EXyqCDUckI3
	9/x2W4q+ReMiU2m8zfJJY9lOLFQhqyrTRvZpzhU+Mwt4RwkhUWG9aj6wr0ukbPOK5gWoV9xyOtCIv
	Ooe43IIxMINk9Iej01h6NVxkLmEc5Dff6zBMELshJ8iTZ9q9eYR4dT3A2vSgLF5c9kOvJIAVi3GCe
	p3HgMdRqQCqCJapXd+KYJNyXbDVrqMctLJpmY0NDheN6bSQp4OHBckmDtf3Bl6oleJtJKisHiSoxW
	6ZyQXWLAtLHFmAv4ED9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC2SX-00000003wyK-41w2;
	Fri, 15 Nov 2024 19:58:25 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC2SV-00000003wuf-2EyM
	for linux-mtd@lists.infradead.org;
	Fri, 15 Nov 2024 19:58:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DCEA9E0002;
	Fri, 15 Nov 2024 19:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731700700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T6fzcxagWyMTwXuJJwuCweyoeq3e4Jn/aH3kJkkVikk=;
	b=oN/OXCB2lWBwrp2SmLeOnPni2S2XVS25+JTSJaJbjqKOu+EJrX9l0CaafNc2yfLPzpIHNL
	vA/521AiTIvtmGYkozCUK32I+qDBbsiyuU6ptcNT6dqJgxBVdgg2/V/s4kIQA9yE1wHjWN
	a0RE9gBWXw/T6KKFdva7DTWlJ2BS9rwirLg38FPDQhHppOJ2PLZECv2+zT1t2uTqCnkQB5
	7T9mvYqsSHgAWx5QVPZ9i1MF4ELLERQ6aqRA6vkEGdo8zvUHg0bmXo/BAI8suEpefWiFn2
	pF+D/0/40ccM44Qjgti0Tdo/6gCaPS/bvcXKP02bglbf58JqYlDv3b4O3idBKw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>,  Krzysztof Kozlowski
 <krzk@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Herve Codina <herve.codina@bootlin.com>,
  Christopher Cordahi <christophercordahi@nanometrics.ca>
Subject: Re: [PATCH v4 04/10] memory: ti-aemif: Create aemif_check_cs_timings()
In-Reply-To: <20241115132631.264609-5-bastien.curutchet@bootlin.com> (Bastien
	Curutchet's message of "Fri, 15 Nov 2024 14:26:25 +0100")
References: <20241115132631.264609-1-bastien.curutchet@bootlin.com>
	<20241115132631.264609-5-bastien.curutchet@bootlin.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Fri, 15 Nov 2024 20:58:17 +0100
Message-ID: <8734jsmfqe.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_115823_703766_4868CFF3 
X-CRM114-Status: UNSURE (   7.60  )
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

On 15/11/2024 at 14:26:25 +01, Bastien Curutchet <bastien.curutchet@bootlin.com> wrote:

> aemif_calc_rate() check the validity of a new computed timing against a

                    checks

> 'max' value given as input. This isn't convenient if we want to check
> the CS timing configuration somewhere else in the code.
>
> Wrap the verification of all the chip select's timing configuration into a
> single function to ease its exportation in upcoming patches.
> Remove the 'max' input from aemif_calc_rate() as it's no longer used.
>
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
