Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB93C55167
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jul 2026 08:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wlb3Dvp7qAhk7G/3Q9I5a4v6HLd+kIj4KJzD/X52ukA=; b=vpxdO7dqEDGFpB
	7woM0oYHZO/HPv9q9tiqX49p2LE1Kn7v76+pRRazgsZQxjseKqaCxI+V84XA4dPq92zBqLuEbviB+
	hLKzYz5TbJ3kPhXyIMJQ0+8eMbWq266EWo72kTvoUgcYrOGw7nDE77t+enwefZVsOZsz3BXxf9x48
	+rRcjr0pNrN8JRVK/YWf+YC5glLEDYnemMOUE0ZLuQpvbHL82tZMR9TCVa+p7rI/f6+ZmK/56f9XU
	Mt+jJOpJLAbixhfiKJ7a1UL/b5x4WB2sPIdnVIbJ4+stqVJKeFUxzLYQAC074WR/ZNaIeK1cFkpGs
	AbnMRW5uvChCZtm+MSPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiDH-0000000C0gl-3HRI;
	Fri, 31 Jul 2026 08:03:27 +0000
Received: from smtp9.infineon.com ([217.10.52.204])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiDF-0000000C0fn-1qVM
	for linux-mtd@lists.infradead.org;
	Fri, 31 Jul 2026 08:03:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1785485006; x=1817021006;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Nlc0tXMJGdhGv2yJQszfCLy9faTw1TEQdO83VsRnfSQ=;
  b=mUdkvyF3l8hn3Cg84xYBipkcwfF7OJMy7tOKHlF8rjsfOupnp7973NR7
   li49T6qEQ/JNF35n05+hu3JZ1iuOx9G3ioC6ldCCeYPJe789wm1mtbL18
   n4MdS+3WnnyUYpYsiJDitv5ha1tXY8CljbsnTxVVIWVD2NCN65pvYW4+m
   I=;
X-CSE-ConnectionGUID: +4xXzzUmTkuXLL1FatdGAg==
X-CSE-MsgGUID: NgU9INIhS5OE5kM4VvMyRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="102969134"
X-IronPort-AV: E=Sophos;i="6.25,196,1779141600"; 
   d="scan'208";a="102969134"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE803.infineon.com) ([172.23.29.29])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 10:02:21 +0200
Received: from KLUSE816.infineon.com (172.28.156.170) by MUCSE803.infineon.com
 (172.23.29.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 31 Jul
 2026 10:02:20 +0200
Received: from KLUSE816.infineon.com (172.28.156.170) by KLUSE816.infineon.com
 (172.28.156.170) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 31 Jul
 2026 10:02:19 +0200
Received: from KLUSE816.infineon.com ([fe80::4a3d:fdb5:843:3451]) by
 KLUSE816.infineon.com ([fe80::4a3d:fdb5:843:3451%19]) with mapi id
 15.02.2562.045; Fri, 31 Jul 2026 10:02:19 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <tudor.ambarus@linaro.org>, <tkuw584924@gmail.com>, <pratyush@kernel.org>,
	<mwalle@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] mtd: spi-nor: remove unused NO_OP_CHIP_ERASE flag
Thread-Topic: [PATCH v2] mtd: spi-nor: remove unused NO_OP_CHIP_ERASE flag
Thread-Index: AQHczjpjWSeEpeRBG0a79SZUVhzMtbXjP1aAgKSpkkA=
Date: Fri, 31 Jul 2026 08:02:19 +0000
Message-ID: <5e4ed0fe6e17459782478f08ad71741f@infineon.com>
References: <20260417-die-erase-fix-v2-1-73bb7004ebad@infineon.com>
 <e3529aa2-9372-4b5f-b87d-c236cce11947@linaro.org>
In-Reply-To: <e3529aa2-9372-4b5f-b87d-c236cce11947@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_010325_802173_1EDC317B 
X-CRM114-Status: UNSURE (   8.69  )
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

Hi,

> On 4/17/26 10:17 AM, tkuw584924@gmail.com wrote:
> > - Copy to <linux-kernel@vger.kernel.org>
> 
> cool, thanks.
> 
> see what sashiko discovered:
> https://sashiko.dev/#/patchset/20260417-die-erase-fix-v2-1-73bb7004ebad%40infineon.com
> 
> and the patch
> https://lore.kernel.org/linux-mtd/20260417-fix-oob-read-spi-nor-v1-1-2132e61a684a@linaro.org/T/#u

I forgot to follow this up after the fix.
Rebased and sent v3.

Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
