Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49426C624DB
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Sep 2026 20:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PTWSHpABxc4za2am9zph1Wrn+JuythYhRNkxMNnuAAc=; b=T9ReXAAZPgA7cKFgWihBFMvwmg
	dcPJLYIvzb3Vzh6E1mDSV5EXjSIfif6/WhFScgwPxvC+E4sWGk7RDOxr4p3lybBa3WRR1UTdpBS+M
	UX0OuXksmkIA2JHQ4uaAfOSbTIoGr+DivoGkaCNEtxpQcflLpojefxHSHEMuaWWX3coPgQy3XhIp1
	tXeFqCpRzFyb3G0545R44v44e0LyWSUVBe9krLwet+b/g2XyCB6bCpJqp7T7hBAnQrzeuaicv6PDu
	wvh1qtLD+Ya8vq2X2k7cpROt9YYjdQ42Be7tRdjKIZ9RcZ1ApsdIeOHba2xMZ2YtC94dKBLTFxyX9
	6JHqDxcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2wel-00000004OIf-41CE;
	Sat, 05 Sep 2026 20:06:31 +0000
Received: from calculus.sigma-star.at ([188.245.196.96])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2weg-00000004OIK-3TR8
	for linux-mtd@lists.infradead.org;
	Sat, 05 Sep 2026 20:06:29 +0000
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1788638756; bh=uY8nEl9vzUXV7gAdd/utS2f
	Jjp+cM70N0dMgeZwfJLo=; b=M1g/EcfozLPiZTmsIIRig2cRzuua/OlXMrsn6Fu7XU2bR2FGnv
	NSsNF4CiYEWrZ5mQZhfBSzkwTYRxAjZIMqAA==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1788638756; bh=uY8nEl9vzUXV7gAdd/utS2f
	Jjp+cM70N0dMgeZwfJLo=; b=nSMsgPYiwbvDNo6+5vbBArRw1aJLJ/2gCoq7jvW6Gn+wyMRsy0
	dYAAdn6nCfbL0eBxecKkhsN2Ea1AKFEPdJztORSStsnbXsVVvmCIh1TaBYKi4DqjAIpA/oFsgpd
	65iNVco7LrWU5WfhcOQhcNPaODY4ArDKCNVvWtXJ2bwxHTzHkc/QyDgvoQJ4GvfDbphYyudOB9s
	WWTzjc0fK/5rpC5Lxuw5cDt0HOC4caG37h00cQQX8qkQxH09/D0/224Fx6eUcO6rADbwgvi+jUH
	D4MpiCoFZhaF64fOseKAx50ybxlDvFS05HQ9J1DdZwk2qTt/RJLqQPelpTFaqB3ch9g==;
From: "Richard Weinberger" <richard@nod.at>
To: "Karl Mehltretter" <kmehltretter@gmail.com>
Cc: "Karl Mehltretter" <kmehltretter@gmail.com>, 
	"Zhihao Cheng" <chengzhihao1@huawei.com>, <linux-mtd@lists.infradead.org>, 
	"Stefan Schaeckeler" <sschaeck@cisco.com>
Subject: AW: [PATCH] ubifs: Use the errors_* attribute names in the sysfs ABI
	 document
Message-ID: <mtotc0x2.ff6fc533-0b90-4fa9-aef2-c60560440ebf@nod.at>
In-Reply-To: <20260905102201.42933-1-kmehltretter@gmail.com>
References: <20260905102201.42933-1-kmehltretter@gmail.com>
Date: Sat, 5 Sep 2026 20:05:56 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_130627_036290_42ECB2B5 
X-CRM114-Status: UNSURE (   5.09  )
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

Am Sat, Sep 5, 2026, 12:22 schrieb Karl Mehltretter <kmehltretter@gmail.com>:
> fs/ubifs/sysfs.c creates errors_magic, errors_node and errors_crc
> (UBIFS_ATTR_FUNC(errors_magic, 0444) and friends). The ABI file documents
> them as error_magic, error_node and error_crc, which do not exist.
> 
> Use the errors_* names.
> 
> Fixes: 58225631cf9a ("ubifs: Document sysfs nodes")
> Assisted-by: LLM

The documented format for this tag is: "AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]"

Why are you just stating "LLM" here?

> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
