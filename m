Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9368DE77173
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Dec 2024 14:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LEjSeABZ+ZY+zxSZlUkIPUxxiJyAGNDjg2hdHVGhW80=; b=ZmHKe7389u2jDP
	a7RTMKYD3tH7aUv+naEJDnC/aVP6z1HNfA4pfas7l+breLtlZFrpGzVOl9s/TUKPVirpDYAIODxRm
	wXqvzkrWl2AxJDX0uUr2W7z12DqXcE/whd+P8OTeDH3xUZy40TO7l5B9ENOjLKLp0N9ViGIQTACpC
	Oc/wJVJ0aMjH8LE7JaPUaS4XkBSOTWCdSZKODFinZbeA7QgNr6zFmQFSRq10UZ7ml8tyVVOcl4+S+
	55KGNsrmzEvpymey79FX5W1Q2CF5FRneua9k0HCEXrZyl3Ws/yr/vlSnqT5XK8M71loJcpC+nqBvz
	5+uOH9ZITPYNPc301hxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKIEz-00000005N8f-1Emc;
	Sun, 08 Dec 2024 14:26:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKIEv-00000005N8J-1y9Y
	for linux-mtd@lists.infradead.org;
	Sun, 08 Dec 2024 14:26:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 19A65A40C22;
	Sun,  8 Dec 2024 14:24:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D8CC4CED2;
	Sun,  8 Dec 2024 14:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733667988;
	bh=0Uv3eFUIrpjiAPwURX+ObvFZr92Jp4bxRVgE4ZCOAtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oBpCs4qobxen0mS1LfFy6sl8lUkyIz3KPBro9aLGNFBUWQbbGVpXC0f399ElpsIMA
	 /gfDKmaEGD82FgRkcbBnja3sPtGfjrnMZ+hI8IJdfRcsK8zh4PAnx1GwCw7sCOPCck
	 8ndJbV4k98jzKql0TKeAzPjh92WH2BGrnaLp2eo7UjK4MWFjELnRkhSnd4Kc3ANIUy
	 QW7O1py5XqOhJrGGnTKH1oYYox3r0WXxzdxigid5Mfj4fqNGAJGbNgt1hwCgg6mcQv
	 NrACxhJMeI4CJGWFc/hTIaoO9vf4B6m+qeT/0ZPfk2BgPO6zzbbnurLbTE3YyRTpC6
	 RPos9wfMQKxdA==
Date: Sun, 8 Dec 2024 15:26:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: niravkumar.l.rabara@intel.com, devicetree@vger.kernel.org, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] dt-bindings: mtd: cadence: convert
 cadence-nand-controller.txt to yaml
Message-ID: <ugcx6muozaven6lolhzpk5mvrt5fncoaahnsx5lbdsaurid4mc@i4qflh2edqnh>
References: <20241205053350.434370-1-niravkumar.l.rabara@intel.com>
 <87mshawhta.fsf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87mshawhta.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_062629_570962_4653FFBE 
X-CRM114-Status: UNSURE (   7.83  )
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

On Thu, Dec 05, 2024 at 11:22:09AM +0100, Miquel Raynal wrote:
> On 05/12/2024 at 13:33:50 +08, niravkumar.l.rabara@intel.com wrote:
> 
> > From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> >
> > Convert cadence-nand-controller.txt to yaml format.
> > Update cadence-nand-controller.txt to cdns,hp-nfc.yaml in MAINTAINER file.
> >
> > Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> 
> Looks good to me, but I'll wait for binding maintainers ack ofc.

There was one, but author ignored it.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
