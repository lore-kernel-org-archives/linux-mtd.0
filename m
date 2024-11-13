Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 335FAD41C33
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Nov 2024 10:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PVB/Vc7oNqY+Zk+qkA0qA9U0AxuSFXbK8xDPH04VtPs=; b=RoLrYlP9w+wz2K
	h0L/gooOeigyhuwnxGsN7L19vhGXPdnPNmcpEQVGcGwKuJ5U5YLLdEVCd8lYi6deFksDD3lSwcyp0
	CPRknc0mtW/P+VpP6mlEg4jkZUsgTCEBSL3FBSPla2cLO20D85Cs95IXzvUK2VYLY/LrVxf4blyWg
	Jg5xXnJRIqyl7aoA0QLSy6F7yjzdqSk0msLDPwv0PQOb5DhH7XiDg6oAzrFGCdgt6WGn8VHznAYmu
	0mDZpcPO96IgkVzFxVYYPBH6uSlkUObHQQVdZsTwA7RPD4y4sUhfy2R9PaUK0sPe7PkXVWTczkyyx
	pRJoe4t75Hkpj+ZjIVMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAyu-00000006VQs-1c5x;
	Wed, 13 Nov 2024 10:52:16 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAyr-00000006VQC-27fK
	for linux-mtd@lists.infradead.org;
	Wed, 13 Nov 2024 10:52:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB1632000A;
	Wed, 13 Nov 2024 10:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731495130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DXmkaewXV+jbmtfOFtF+vCWWc8QJDcVY8+FgkFNdz3s=;
	b=iMs3tmyUKGNew47ufeH21OT0z6vZVymsxg845TFTftjh4l9pwPZORX8Xdi+/VlrXkRI2xG
	HfKlhRAMr7T7+abHhE0zh/aJiQkLvIt0v6mxhjat9whvT9qmqN1szesxM4ukFqpfbhxy+W
	p+cnuUwkBlbN3ehRqdMJhJnSoL/uqQKdxdUZDtGm4IW5g/VkqHPoS4nlSkvjNX/2trNWSB
	bFYAmdtHXJF2RFaw3Ahltj6g7obARkvIaNyCH592iApg0+8FgG6wCVDh9RWcq4j/L3066g
	zob9VdNHFwtZ+LawXC8+Dh0HjJqBds2j2g0HO71UPZro53ZpLTdmgZu/HitFuA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>,  Krzysztof Kozlowski
 <krzk@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Herve Codina <herve.codina@bootlin.com>,
  Christopher Cordahi <christophercordahi@nanometrics.ca>
Subject: Re: [PATCH v3 2/7] memory: ti-aemif: Create aemif_set_cs_timings()
In-Reply-To: <20241113094938.44817-3-bastien.curutchet@bootlin.com> (Bastien
	Curutchet's message of "Wed, 13 Nov 2024 10:49:33 +0100")
References: <20241113094938.44817-1-bastien.curutchet@bootlin.com>
	<20241113094938.44817-3-bastien.curutchet@bootlin.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Wed, 13 Nov 2024 11:52:07 +0100
Message-ID: <87cyizquco.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_025213_696083_3D024D8B 
X-CRM114-Status: UNSURE (   4.44  )
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

On 13/11/2024 at 10:49:33 +01, Bastien Curutchet <bastien.curutchet@bootlin.com> wrote:

> Create an aemif_set_cs_timings() function to isolate the setting of a
> chip select timing configuration and ease its exportation.
>
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
