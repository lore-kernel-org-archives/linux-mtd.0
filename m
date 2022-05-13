Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125F4C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 13 May 2022 11:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6iitpGkCWBkN5Kr8CVxbpfsRaVujbo9n2bnuxDOuw0=; b=kJAKAo6YP4eFHY3o0AwQU+JViy
	KhWIjLJM0QVPFjLlS9KIMAlgf1a0GJ70edKFQnJk4Ya5+dyfgq6zqsHiu1TN9CNCGdOnbbQ3Tt5i3
	PWsUTFnqaaUVWUqZIZMaW96hCt3RYzg+6liyatDf+L0FpwoVBspx1SjVxNZY14DcEKRbbS3MHsjpr
	eq1Pe7znLvnyFPr0riuzzVhydcQOHjfECi0zhFFkAo2E+o928kJ+PB4K6KxJw/SS0U8FgEvoZcBVX
	qe2wdWD1wHTvzWHAMUO45o8rBM9+b8BJ0wdoFiH1+vOlpLj+OTEGIGJs4gn5mrbWE5W3kzVtsh/Y/
	NSUsrnUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npTCd-00FjMf-5i; Fri, 13 May 2022 11:11:23 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npTCZ-00FjLj-H3
 for linux-mtd@lists.infradead.org; Fri, 13 May 2022 11:11:21 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id E8EDB221D4;
 Fri, 13 May 2022 13:11:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1652440275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9pV4ceZp2jBzmUpp2ZHmANTNVPZNX+S/qtaNuz/v8JU=;
 b=rDLw+uO7mxnfh6PH1ONHS1YDxUz4UVpEUka9QoM0qVf0lttGaNZJ2nZqi8qa8GBqX+HS2v
 oihlqaATznXfoDhAwwgXq8eDqu8EHRir1NhFr/lpQM6kXGelXOEpFvY1GsMm7LmAlj/MVT
 ugKmU5Gl6v/74YvYSorP0qDGsUHxaX8=
MIME-Version: 1.0
Date: Fri, 13 May 2022 13:11:14 +0200
From: Michael Walle <michael@walle.cc>
To: Alexander A Sverdlin <alexander.sverdlin@nokia.com>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: Support Dual and Quad Read on Macronix
 mx25u25635f
In-Reply-To: <20220513094759.44185-1-alexander.sverdlin@nokia.com>
References: <20220513094759.44185-1-alexander.sverdlin@nokia.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <34eccc66cc75dd0ffbf8a77780b6f8a7@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_041119_766360_C893C587 
X-CRM114-Status: UNSURE (   6.64  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Am 2022-05-13 11:47, schrieb Alexander A Sverdlin:
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> According to datasheet both Dual and Quad Read is supported. The read 
> test
> shows x3.8 speed gain.

Does it have SFDP? Try adding PARSE_SFDP instead of the
NO_SFDP_FLAGS.

Please post an SFDP dump of this flash [1].

-michael

[1] 
https://lore.kernel.org/linux-mtd/4304e19f3399a0a6e856119d01ccabe0@walle.cc/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
