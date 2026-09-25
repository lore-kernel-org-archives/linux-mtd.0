Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2872DC9830E
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 12:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=On2YiYExFHbTRmm3ZN1hln8jm6ZIh10gHjHsBexEb9U=; b=UnCoHAZd0r6fdS
	oY8OVbo5gpQwdU4Wp0JFPmX2ppqsnK6vsFTTfECzPTwOvTGiLfZ7kX+dnAvqsV2HKuezOGZoCHhis
	VZ8ODsYRoL0TKLaqshDPOAbXDG0+rsKwgvwm8Gj2kP7qozrK7u0EF5sG8O8Xqv/ICVsgXgi4FT5dJ
	VnXSD9gNvYKcDfV3ErwC6k0RIblCmqELkhZ5RYdHBNTGDFhTPl4/Ouycd0cP45WAUBq8wf6vn8+Qq
	sgyBLZuuFexuA+Xb9ewN+IB6TppOioun7Xlm3TJK5tclGpaVCHJa+oKEQpkJCQFS5YQcY3A5Qa8t5
	VOMjw+IUuoxgCshNUmnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5QJ-0000000DN13-0esR;
	Fri, 25 Sep 2026 12:53:07 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5QE-0000000DN0F-2vjh
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 12:53:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 86A68C13994;
	Fri, 25 Sep 2026 12:53:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE27D6073B;
	Fri, 25 Sep 2026 12:52:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2A13710328856;
	Fri, 25 Sep 2026 14:52:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790340779; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=PEEaU2vp1FHpkuf8xli/ZnKeWiTmwFfC1TUVaJBY9HY=;
	b=GDfH/Ud1Jdemye+Nz3G0qqOyXt1K4GSPD+M2rsPamQjF7EUxyT7kGLZ6SClOc1BhjvylF5
	hqI8vhcYK5G6K+EkOksEWw5QGTDccB/qYuVmV+q0R1dgBh59H5vQPL7f+2b/whpSK5FyTI
	3eMwyDM+Cgb3GweaXEGYXGmRWmr0QKadOKpQdRevKMbaXpwf2r3nYpGIBN80OMI1WLFZmY
	pV+5maGeK21VYaJPr/a/v/GL3Gtr9cmx5uhuHJWRPHqeCnls4jF5/oWzgLA83boWejZmOi
	Y7HAdAZarYGnG5JSiWxqcuV22hMtWGvGMxihmhe6bkA9oHDBydbj2IxO7orMTQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: arasan: Add ZynqMP props
In-Reply-To: <20260925122003.GD677989-robh@kernel.org> (Rob Herring's message
	of "Fri, 25 Sep 2026 07:20:03 -0500")
References: <20260922183138.290114-1-robh@kernel.org>
	<877bk9n122.fsf@bootlin.com> <20260925122003.GD677989-robh@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 25 Sep 2026 14:52:56 +0200
Message-ID: <87wls9jxw7.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_055303_660492_E33F94EF 
X-CRM114-Status: GOOD (  17.48  )
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

On 25/09/2026 at 07:20:03 -05, Rob Herring <robh@kernel.org> wrote:

> On Fri, Sep 25, 2026 at 11:16:21AM +0200, Miquel Raynal wrote:
>> Hi Rob,
>> 
>> > +  num-cs:
>> > +    $ref: /schemas/types.yaml#/definitions/uint32
>> > +    minimum: 1
>> > +    maximum: 2
>> 
>> I am not sure I get what is the purpose of this property. It looks like
>> a downstream property resurfacing. We expect one DT subnode per chip, so
>> I don't see the need for num-cs, we just need to count the children
>> nodes. For me, the correct fix is to drop num-cs from the upstream DT.
>> The only real use for it would be if the hardware could be synthesized
>> differently, with a single CS instead of 2, but I don't think it's the
>> case here.
>
> Indeed.
>
>> > +
>> > +  power-domains:
>> > +    maxItems: 1
>> 
>> This one, even though we don't actively use it in Linux, it may serve a
>> real purpose.
>
> The driver core takes care of 'power-domains', so how is it not used?

Yes, it is probably useful. I am pretty sure I did not use that property
when I tested the driver, but the controller was either already set up
by the Bootloader or in a domain enabled by another device. In both
cases, it is worth adding.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
