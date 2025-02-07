Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58E0C02192
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 09:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8vTIELGcT5nSEDFw1MUZa8E9gzlqQ4omlkiDmytCvm8=; b=aQtSeKrkgW0Xw0YCK34//ug5ES
	d6VBZbRuzxz67cpBzwdWAbqtf/LPXz7SW000A8rkLeoYXVoRknz3/ylEpMjz/Ttt3gezap+ncjrcc
	jKXKxaajyMxJw20ACV1X3icFjFFSvbjQC/HG+R5cMzDHCPBnZYWrLY7Or7Q6Pi8OGXXN50PS0yFAE
	9i5+ojIg/Sf54n/IU0EuK1F+KclGPHyOynJVV6N8J+K3cfwXnqFrIrbchQGsFr/T/DVav2so/KLIZ
	JmA8TezBmcN9WE8iivpg5itYTEOJ1wLXoi4OOfeqfz+845kGiZBtkLhi8cPKAtHdwUdt/kBIUgwjZ
	iHBwEN2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKas-000000090Yy-1M0B;
	Fri, 07 Feb 2025 09:24:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKag-000000090V0-0YSN
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 09:24:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E137B5C2775;
	Fri,  7 Feb 2025 09:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15416C4CED1;
	Fri,  7 Feb 2025 09:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738920241;
	bh=OotmR6f/3q3xsLu3f2l9TKJVJRnKtgPzQWc3wfsrkdo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=G5zOY6JaCQKTuPJNHM4yh0H1oa3ktqE3zNYoTV5lE+Pwm3UJ8WQQSVxOXhhH+7Jks
	 L57ylKBVa9wendT5Ba0FCiUnCnJIHpEhqyyrxVB7/2eGegFWPgUfNS6UyB+LtusBKE
	 d/aGBDpzLejEArZIx7/bLZ3WGksfVlQVTJJtPSPCYmvJt7i5Rlu3XZdVQD5R8EPWts
	 XUaFM83EfOHnhv7Yd8LxEKs5Zl7hSeECzjedvBv0fDw4esSF/p+kpDarEQh0Hl6zBZ
	 utMIMHh9R8EB/lwM13Lz2BQUa8EVrQBmO2ucjCX5UgpGlfVRJ6Fi+tmxO9pH4T3Q4r
	 D3w2PfNYnYc8g==
MIME-Version: 1.0
Date: Fri, 07 Feb 2025 10:23:57 +0100
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Cheng Ming Lin <linchengming884@gmail.com>, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, Cheng Ming Lin
 <chengminglin@mxic.com.tw>
Subject: Re: [PATCH 2/2] mtd: spi-nor: macronix: Add support for Macronix NOR
 Flash
In-Reply-To: <41c4d4ac-5f71-40b1-86b9-ae8ee33db538@linaro.org>
References: <20250207081846.362919-1-linchengming884@gmail.com>
 <20250207081846.362919-3-linchengming884@gmail.com>
 <41c4d4ac-5f71-40b1-86b9-ae8ee33db538@linaro.org>
Message-ID: <23d2dd5b30cf25090ef947f9bb984d95@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_012402_216403_5C9C77EA 
X-CRM114-Status: UNSURE (   6.59  )
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

> On 2/7/25 8:18 AM, Cheng Ming Lin wrote:
>> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>> 
>> Due to incorrect values in the 4-BAIT table for these two flash IDs,
>> it is necessary to add these two flash IDs with fixups.
>> 
>> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
> 
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

It would be nice to have some kind of references of the part
numbers in the commit message/subject ;)

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
