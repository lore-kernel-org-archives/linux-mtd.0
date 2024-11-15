Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC075D68BCF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Nov 2024 19:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VeV3+9DrK/TgkAVXYT/ySNLqI58HrPEibNOKNl+izfY=; b=a9snrJhHhYacXH
	ummarA3GG7PARIiTHfvnnS0HCEZDc65+MRfYFegvaNrorPUNITz2r21Pn22HzEEeuBXn/iUwLXa0p
	JDVkpb/TnKwmbmiYkWV2Fa8OIjGkKR9aAi8PiC43sJWUwgKpmnkzxCEBQ4QaKf3CulvT4j98jejDX
	WpPeujmwle5BuvAnRoVbKEc1J2eA2wcSAyOGIbCQ8s1IchSYJwdF27xy/vnsgS1Y53hmjrSS2PSwg
	NX6oa5ao2C/pDyuqg7NLIB+fgBnCG6t+DwowvC+B6pMDB1sMaeoyveErpBIkzjdYZmYI+h5+lzrJS
	0pndDud5d2pnwHjoMNqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC2RC-00000003wIq-13iZ;
	Fri, 15 Nov 2024 19:57:02 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC2R8-00000003wH8-4Bsl
	for linux-mtd@lists.infradead.org;
	Fri, 15 Nov 2024 19:57:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5F1E1BF205;
	Fri, 15 Nov 2024 19:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731700615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RMPOtaSPR2u/J6W/otLqp/bAJKMCLqxDB3D+lpqWdvU=;
	b=j4ea1HT2ncPsYema0YJq7ESOcgNcHXZCn87eWbrnKmENKzLgtSsoZsmNNYAz8ZQWBKpQwf
	CTDvnuvHLFN8veGdWKfEPOb8pEArEMFtX2i13ygjxFxcU/NXGcGXyuA09qrR64Mg2fhMx6
	sF3oUiqPlCCJtAg9GXnWpNryodDHqRuVj7D6T2JnsHEMiKFuEJVesufVUxPDH9UI365y/y
	oq4GlUEHaWT4H5sQaHDdCg31ObgM7BZ9xmRgvhnFggQSj10h24iilT5KTAKeLsnRwixS3U
	qDYDdW7QwPG7eBjI7GkOM0DxzDSw9s7MetykRin2r8rpDlQMPjJ6tzilWLMNSQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>,  Krzysztof Kozlowski
 <krzk@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Herve Codina <herve.codina@bootlin.com>,
  Christopher Cordahi <christophercordahi@nanometrics.ca>
Subject: Re: [PATCH v4 02/10] memory: ti-aemif: Remove unnecessary local
 variables
In-Reply-To: <20241115132631.264609-3-bastien.curutchet@bootlin.com> (Bastien
	Curutchet's message of "Fri, 15 Nov 2024 14:26:23 +0100")
References: <20241115132631.264609-1-bastien.curutchet@bootlin.com>
	<20241115132631.264609-3-bastien.curutchet@bootlin.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Fri, 15 Nov 2024 20:56:53 +0100
Message-ID: <87bjygmfsq.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_115659_190352_475529D2 
X-CRM114-Status: UNSURE (   5.49  )
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

On 15/11/2024 at 14:26:23 +01, Bastien Curutchet <bastien.curutchet@bootlin.com> wrote:

> CS timings are copied to local variables that are then used as is,
> without any modifications.
>
> Remove these unneeded local variables and deal directly with the timings
> stored in the struct aemif_cs_data.
>
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
> ---

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
