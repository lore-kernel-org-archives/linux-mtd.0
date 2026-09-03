Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F400DC61DD3
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Sep 2026 09:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=E037MsZaCxD51NBiQATHO+R68b32o9rZMI/Swyc0tts=; b=3+8kxwpGlxIztFKtxlhye9wWsG
	AjIlLH4Twcsmb3O8+JclJXeXTprH7QuHzVsgQbwEG75CpzQAA5yHOsRoi9KBv6/nUPxx/CqbcXd4r
	U2yG6kpZiQ7RwHxs0dse8wfgjFSyj6mtPdxJUt1AtRgqVs0Y22RHbYhITHMBinpiMSDydu22yT/Z8
	pt4N7INMRyzYXOhnlRDMC2DCJ7Fj1ExC0qjC8yUaqhLXoxaxioTS+CACOtxtiCnuysb0pLXBPG8n5
	wt3Kj5zNrXQ02WZAataNyAwyT+vcwcHsGlqTaknK2ZclVBF33OPVIVvWD+imbxOTQrn/3WZc3nCHy
	wkr8GW1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23or-0000000GxrS-3oPu;
	Thu, 03 Sep 2026 09:33:17 +0000
Received: from static.96.196.245.188.clients.your-server.de ([188.245.196.96] helo=calculus.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23oo-0000000Gxr9-0F0O
	for linux-mtd@lists.infradead.org;
	Thu, 03 Sep 2026 09:33:16 +0000
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1788427979; bh=pF39N5MHGzgAyoOgp5aiP86
	DPlk2yCMI61w4iLwldBg=; b=IF2L1bNsk7tNmLJbbnERIPM/ZGFLHZPQ5lsjXWzzW/LYxpY6O4
	ISBF8mfoVjoQx+QizZPHEcVeHH+saOlvLRCg==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1788427979; bh=pF39N5MHGzgAyoOgp5aiP86
	DPlk2yCMI61w4iLwldBg=; b=bXSCfSmyGlZV9Ow+XpHflEEPwmOzMbgBaUAN7sPUwAvbPeCuH8
	SMDv3pIXFl1KaS6z8xTHRE6Q8pchHL52hmeZYfofuUdyF0mL1WxBlt43JlfCPdgeP9uSvndI9fK
	O74nqm1ZN3S62T6f+J/KaN3yfgojCkDoVcYsiY8M8PZM7dHCwqNhQdulvgIa0ScXkLynEWG9vKm
	7wCbEtspB8os2kDo6u4ryEr22X4ZFNaSch4omGqB87n1M6GUuZCD00gGd7ByPIt4/SMBiMbfFr4
	N1DNL73QnXsERfQoqe5wsIm4xh1XCOfrcvkQy5NliJbE6K3LvuTTHVaoG441qcmidpA==;
From: "Richard Weinberger" <richard@nod.at>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, 
	<Takahiro.Kuwano@infineon.com>
Cc: <michael@walle.cc>, <mwalle@kernel.org>, 
	<pratyush@kernel.org>, <vigneshr@ti.com>, 
	<linux-mtd@lists.infradead.org>
Subject: Re: Sashiko to track linux-mtd
Message-ID: <mtlbucms.56b480e2-2d78-499f-b298-dbc82e6f3364@nod.at>
In-Reply-To: <87tso666qt.fsf@bootlin.com>
References: <875x38mlk7.fsf@bootlin.com> <2vxz4iismi2m.fsf@kernel.org>
	<87pl19s7ng.fsf@bootlin.com> <0fe3140096bc48a8e71838362220d9f8@kernel.org>
	<b224c6938e084763b017c63e0aa3fa3f@infineon.com>
	<8733xikmb9.fsf@bootlin.com> <8733xhiqyn.fsf@bootlin.com>
	<87v78yimb1.fsf@bootlin.com>
	<10CE8F35-D4FC-4CE8-B687-1154DF9915CF@walle.cc>
	<e2acce09375046f8afdddc3693ccd7eb@infineon.com>
	<87tso666qt.fsf@bootlin.com>
Date: Thu, 3 Sep 2026 09:32:59 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_023314_259027_03D0092F 
X-CRM114-Status: UNSURE (   5.28  )
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

On Thu, Sep 3, 2026, 11:09, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > I'm fine too.
> 
> Thanks for your feedback, I made the request.
> 
> Link: https://github.com/sashiko-dev/sashiko/pull/478

Looks good!

Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
