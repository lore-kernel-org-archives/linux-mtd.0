Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB18C44536
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jan 2026 07:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GZj2fJpe0ASM3vH9jz5WJDrJNz5GluMnzeqNoJ3OXrE=; b=UBCDv8vlFdsCh0
	ZOPWFNkvPTEH9CLlQlfWqvKDCPJzohS+ZnBTrD/GIXMVkaGrN3vVnTm8PWBaFyhdmfGAOO17KXBny
	HedAJIaGYIK3EUu1gcv9LQ0fRMlqp0h84P+eMNt7STxfhRA3lBRDL/D6TkzCkyYh4UxcIWr4S1rlC
	b3MMr38qCjTYeAZF1JzDR3qaiiXFkTI1gDLmLTb/irqdqOm+PZQVuOUVgofjIrQgKFM5givAnuX1A
	28j0Llnt7quDn0Y6iXDzc30bGDkIJPFTcLD3Jt0fDgha9Y+BNK3RarJNYaN0xL9nompENPh/9sYMv
	v8u6tw1kehCNKeD5B/0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipYK-00000006cJ2-3iT0;
	Thu, 22 Jan 2026 07:56:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipYJ-00000006cIq-1I4w
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jan 2026 07:56:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E1B9600C3;
	Thu, 22 Jan 2026 07:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AA8FC116C6;
	Thu, 22 Jan 2026 07:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769068585;
	bh=IzFXMPrtJxAcEF7nLRo09OSi9EH876SkVdkEi0zSv7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h+jgzZLdo9HY2aFLY9ZnN0XC5hCnU9yeQNXt9VtJuc+XBkB6PI2qfQ9iNlStCiVpl
	 0QeMegGM348V/bZLeA3yATIjDBpXp70SJi99lEmTD1hNZC53fgi1flxMBCJ02ryonB
	 i383zs++JF67nmDDUXU+x0iMn0MywJM2DDDlWfSXqLTroMUtNeD3HAtlya/l3PSiY1
	 whFj4CRDzBqkYI+Q9latKKFeOd08V/7fVf7vnHzphgImlF2Z9teowEk89wSoV8TpMK
	 NHNHz9s5Kb5mGx7yANLPM+tJwgDD8trVg16vwC27xZIUecxZZgcTA75KK0WID4WDsL
	 APcohJJBUnFww==
Date: Thu, 22 Jan 2026 08:56:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, 
	William Zhang <william.zhang@broadcom.com>, Nick Terrell <terrelln@fb.com>, David Sterba <dsterba@suse.com>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Simon Glass <sjg@chromium.org>, 
	Linus Walleij <linusw@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Marcus Folkesson <marcus.folkesson@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Roger Quadros <rogerq@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH v3 10/10] dt-bindings: mtd: partitions: Combine simple
 partition bindings
Message-ID: <20260122-wakeful-apricot-gazelle-390bfc@quoll>
References: <20260121-dt-mtd-partitions-v3-0-ec3af93c8f93@kernel.org>
 <20260121-dt-mtd-partitions-v3-10-ec3af93c8f93@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260121-dt-mtd-partitions-v3-10-ec3af93c8f93@kernel.org>
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

On Wed, Jan 21, 2026 at 01:56:43PM -0600, Rob Herring (Arm) wrote:
> Several partition node bindings are just a compatible plus properties
> defined in partition.yaml. Move all of these bindings to a single schema
> file.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v3:
>  - Add $ref to partition.yaml for brcm,bcm4908-partitions child nodes

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
