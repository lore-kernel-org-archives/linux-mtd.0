Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3ECFC71153
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Sep 2023 19:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xcnYfwuJcQ1/1ZWDOSxcH+3mIZBgFa8XSCp8M3tTO9k=; b=oChG782Hn46BL2
	Nst/316cvdHcleWQeoCdQD6qQBjAKj3IKQEXkuKt744NbW4c7WFINIwNn3Gxxga0Rg55D64mfobn5
	STrlOJSbgWnKVSVkpLuaCXfdsxtVdGoAiPveNPQh+zdeQ2C23WOKXvz1ZrSbuaWdxdjqyY0WPTndc
	VHOSJYJu7G1sO66p6bbIy4lnUP63QDLOKASCN1G7mE4OUmhK1MeI/1CnaJwX0DHl+Gmwx74DiGBUP
	6o9bnBIcDeGU9Tl0Rs8kAjE7x/9Bq5iTn7e0XHLyHUAk/tuJ7kwGw5gjdJlLkPgK7ny6OAbjPii9S
	I6roFPxcQdUIs3RpT6mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfmAp-001AB0-0P;
	Mon, 11 Sep 2023 19:02:15 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfmAm-001AAH-06
	for linux-mtd@lists.infradead.org;
	Mon, 11 Sep 2023 19:02:13 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qfmAg-0000w8-1z;
	Mon, 11 Sep 2023 19:02:06 +0000
Date: Mon, 11 Sep 2023 20:01:57 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mtd@lists.infradead.org
Cc: Zhihao Cheng <chengzhihao1@huawei.com>, Rob Herring <robh@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/8] dt-bindings: mtd: add basic bindings for UBI
Message-ID: <ZP9kJYHMFwZ8GFnA@makrotopia.org>
References: <cover.1691717480.git.daniel@makrotopia.org>
 <a640bb10e6fbaeef96efdb9e8b666ca39e993589.1691717480.git.daniel@makrotopia.org>
 <169263908218.2000617.16931192155432403196.robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <169263908218.2000617.16931192155432403196.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_120212_065856_9DFD0237 
X-CRM114-Status: GOOD (  10.24  )
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

On Mon, Aug 21, 2023 at 12:31:22PM -0500, Rob Herring wrote:
> On Fri, 11 Aug 2023 02:36:37 +0100, Daniel Golle wrote:
> > Add basic bindings for UBI devices and volumes.
> > 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 

Patch 3 - 7 have previously been discussed on the mailing list, patch
1 and 2 have been reviewed by Rob, patch 8 ("mtd: ubi: provide NVMEM
layer over UBI volumes") still needs review.

Is there anything I can do from my end to have this series moving
forward?

Patchwork: https://patchwork.ozlabs.org/project/linux-mtd/list/?series=368347


Thank you for your advise!


Daniel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
