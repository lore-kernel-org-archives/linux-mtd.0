Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD7BC43458
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 13:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qOWlAAoSlhJFGiakWZW/DH0O7GuZgiFga6JCZr+zAhI=; b=GfC0yVyuNvtjFe
	i0J3DwVcpRl47gVTeeQiM2nVMB54lnG+sVSbvigfxfBPHSOvpeyDSWe6aeU9G1yiR8rIQ+NiGXziB
	iTRdfEYzvnA54wKdghLM8JsIHpRiDGqnyHzw1cfdx+4XHDoU+WOkSJyYirvvgWznZ3zlknxOka8aL
	kzOzR0uh46kQdJmhLPu/++OGwJYt/fonj7YPoiahlrKIqdr7gMc3XNWKN2NgGuqPtgPd3s7+R98k2
	aBcBPV9elfU1haKKNuuIkoGboeZGMfShudECbWf91fOBKVjgl2ZUE+sDG5aALX7PSuX4/whrfFkF3
	RQxcgd3ayVc4qYYFxp5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjLA-0000000Cb2Q-2bkY;
	Mon, 06 Jul 2026 13:26:28 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjL8-0000000Cb1d-0YSm
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 13:26:27 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493d3135f62so10244355e9.2
        for <linux-mtd@lists.infradead.org>; Mon, 06 Jul 2026 06:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783344384; x=1783949184; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VewHMeV2HgLnExdf3eHCgLjBbEBUzVfCGkn2dqN19pw=;
        b=LHATyHXUcIMBNeoo2RMRnnsJAyK32XhdiJsLWhGPpqfpfDGLurfhOK1UGYrFw47bvt
         ZuXInGNQdHrnNEAIfPIluTLx0uAPsFjAMNV/NFqo9yI5KKcdENDoqiV6i21U5mEaFVNN
         HtnlEeSNtTaZh2wIR5a8hWFRlKyTuwBdqiDko7vAAYl1y8XqPgs9ihjeRfUEPqwPbOT8
         j26+Z7KKfZZaLuCK6TqeZCq3O7JcOyuc5i8thmGsTMIi1BFzwzq4sSDOAD7Vo9lZZRz3
         W0tGX+CUgPzpyOnCq5EeQ2+d3QTSv7ibf6br/jUgCZiF+819gPDBrANNkMv3kL1dHHsR
         ikcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344384; x=1783949184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VewHMeV2HgLnExdf3eHCgLjBbEBUzVfCGkn2dqN19pw=;
        b=peus0J2GWyDz2czPBuxcrIIHtWmebkWzsUALz3GnmzZACvWd3UoDMuoCDV64JFUsPF
         62KGTpRmGopyWPbpXHGgLANkrEdRxMUKXpBGvaQpgDGAIUQtgf6bOQlIh1+zupa7RrFF
         0rm7urHwVDn/JBhS3xlX1c0B5j6WHQnY2VWmAuyj80CzS8Im9FcQ2h4djdIyV4TIZFMT
         /IjSBMxp474pxJwPiwvLBWtxjhL8rznUAyMV0zYVionIk5hE4UqbZrkXgrq0zHIfm5nN
         OyM+01wBi5gRe/K6BzVNCmJlOquzV/uCfv30ds1At8B4TUY7DOtakPqU4UiqcSVNQAV/
         oGmQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr4dEWqcChxk7lIN5V8/Qgqf/u6VG7IuKSEJeezKMWyfjJhnGV6mX2l/mMupyzg3eC5P5EBT35Jii0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZC6iIaI7otks4T5I/WySPCmWdDbztjekPlZgKfRkatyszS4XC
	MYu1XaUrbsGtRgaqUV9eN4s2Q4+eAFiCvIt/2/VbyQdeCMko6lmuCDfwnduDeQdDf+0=
X-Gm-Gg: AfdE7cmxuqcvZtEv8XJAGMJQsnr50q+JQqH8Rwe4l6aTMReDi1HmE3uVMydJpVNF2nb
	t0v6BZmdEPzRtcpm3+w3ijeEfnuJFoGSusoPYNlQehic2TOUFnl2ImVT4DidfYGq7CmFSyr9t/u
	Mc4P/x9uxCmWwnls1NLJrQqnrOzXBxRLX9wjACtZpzDMToZAZvbEZPV4r0jpVF7O6bYWqqH8RoX
	Pn6yD/5niCGo/OFRNe6xRlB3CxP+UmE/RwDomSbxmb0y5HOeJPt/y7gao58Hmp5xB6erF4PIcxy
	SsgL3yLiNn96SOjohcbhtbuaAgUuaVcR3hXzXUs9FQkriQcSh5O72B6Fe7m3E81yIaPBC3EAGSO
	a1JwtvYnKuKCcAeKy/qJxvbDdRyRRrxvOQgSOK6Mmw2sT5TIaGheKQXIj85gpVaXHQ0sSRmcHw4
	5OO2pPZGkV577HM4XTQ+UcStA65PJGBVeYWgU=
X-Received: by 2002:a05:600c:6a0d:b0:493:bc4a:fb51 with SMTP id 5b1f17b1804b1-493df077ef6mr3952495e9.39.1783344384207;
        Mon, 06 Jul 2026 06:26:24 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4a343csm326732325e9.0.2026.07.06.06.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:26:23 -0700 (PDT)
Date: Mon, 6 Jul 2026 15:26:18 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] mtd: rawnand: qcom: Add MDM9607
Message-ID: <akus-hN7-yf4Y6XU@linaro.org>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <4kdjxrn3bxg7rhkdovidxv2b2f6evnknng7gjtbz7pahyqaakh@qkgxaz6xlav2>
 <akult0UUSSwKQ8F5@linaro.org>
 <875x2smf39.fsf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875x2smf39.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_062626_207523_E69F71F1 
X-CRM114-Status: GOOD (  36.41  )
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

On Mon, Jul 06, 2026 at 03:18:18PM +0200, Miquel Raynal wrote:
> On 06/07/2026 at 14:55:26 +02, Stephan Gerhold <stephan.gerhold@linaro.org> wrote:
> > On Mon, Jun 29, 2026 at 05:46:57PM +0200, Manivannan Sadhasivam wrote:
> >> On Mon, Jun 08, 2026 at 03:20:21PM +0200, Stephan Gerhold wrote:
> >> > MDM9607 has QPIC v1.5 that supports the OP_PAGE_READ_ONFI_READ command, but
> >> > is missing the rest of the hardware changes in QPIC v2. There is also only
> >> > a single clock that can be controlled using the RPM firmware. Document and
> >> > add the new qcom,mdm9607-nand compatible for this setup.
> >> > 
> >> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> >> 
> >> You could ammend patch 1's commit message with the information I shared in the
> >> reply. But nevertheless:
> >> 
> >> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> >> 
> >
> > Do you want me to resend the series with patch 1 commit message
> > adjusted? There were no other changes requested as far as I can tell.
> 
> I was mostly waiting for answers on my questions from the DT binding
> maintainers, but I understand they must be too loaded at the moment.
> 
> > I think the current commit message there is fine, especially if you add
> > the Link: tag during applying. The extra context will be there.
> >
> > If you want me to resend, I would just replace the second paragraph in
> > patch 1 with the following:
> >
> > ---
> > On MDM9607 and other recent SoCs, the QPIC hardware requires 3 clocks
> > (ahb, core, aon). However, the access to these clocks is restricted to
> > the RPM firmware that controls the shared power resources for the whole
> > SoC. The clocks cannot be controlled separately, there is only a single
> > RPM_SMD_QPIC_CLK clock that implicitly enables all of the 3 clocks.
> > The only exception to this are some IPQ* SoC that are not using RPM,
> > there the clocks are directly controlled by the kernel via the clock
> > controller (GCC). Require only one clock in the dt-bindings for MDM9607
> > to avoid having to define dummy clock entries.
> 
> I am sorry but this is still incorrect. You don't have to define 2 dummy
> clocks. You would have to define 3 times the same clock (and that's not
> a problem). I have been working on the concept of clock nexus which
> may solve this kind of issue in a rather elegant way but that's not
> ready yet.
> 
> In my opinion the binding that you want to push (a single clock) is
> wrong, but since I've been explaining this for several weeks already,
> please at least fix the commit message and I will take it as you want.
> 

Thanks for your feedback!

Either way works for me personally, but now we have a conflict between
your requested changes and the feedback from Mani, who maintains this
driver. :-)

@Mani: Would you also be fine with defining all 3 clocks in the DT
("ahb", "core", "aon") and then assigning the RPM_SMD_QPIC_CLK to all of
them?

Thanks,
Stephan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
