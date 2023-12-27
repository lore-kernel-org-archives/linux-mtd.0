Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F42BC46CD4
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Dec 2023 14:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:Subject:From:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SURjIc5Us7k2VfUK/72gYV3WWV0ZG6KNWNfsEklzKp8=; b=Nx6ysK8fnQE5bN
	krlUxR7nNUcCS1pXea132F54gGYVWvm+daHRbHvCazvtq8ZT4Jf4M00Uc8Ek2U0mRjR3L9r1qmBCI
	nsIygKNwVrpWixrkGyZFRvQCuXDNlxBdXV60EAYOyfSDF5JFPt4vxW41VrB+K8Zq/KvmYWfPF6R7U
	TkTtgCk6jrJ7wWdkKZfn9jM3Ncs36RU9KrvEVGj47U2d9NQpaimTjpXg6Ggb4gSvHw11+cLyawIrG
	R+s5VFCayPJ5VXvSTn9wC0ZpbesWle5Bv8RPx2Rp/88HXNHeMZLo0NTtVV41uo+W5/hF3aBcHFMrJ
	tXQIKZ/G3IVksbxJPY9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIV8D-00EqQt-3D;
	Wed, 27 Dec 2023 14:43:38 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIV88-00EqPZ-3C
	for linux-mtd@lists.infradead.org;
	Wed, 27 Dec 2023 14:43:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1703688187; x=1704292987; i=markus.elfring@web.de;
	bh=qJhNb+kflSF1W8E0uefEQKaq7Lmn3gr9mOpVQlydGAM=;
	h=X-UI-Sender-Class:Date:To:From:Subject:Cc;
	b=fImLcrjOQv1M2gBUJ9+AmQ7HgWVkmqfCT+qA2E0bzmefyQ1fc0RDrY6btGR6wAmj
	 XQDgLCeEAbUZ0XjZ3yrMtCWIxn8grVwBpOzEs+OZwzVcycVJV5pwjC247+913WwlR
	 GjW9CNOvKox5pkXuyOP7QloxefEqcNj0GiNaiRwrAoigKZVfEwTWnY/vjPrru0hs1
	 WZF29NqLX2V+D6dnH4ADubzW9BhoVDErIaZpZZ7SB5rVy3Dlt6AFB9Q7HFSKViH1v
	 4jN4TlQwZgSEbblJkRnwHfL8XnDNzylPZ1bXseUINk99OmoGgvb/DcT4GNYvfzWS3
	 UezFww1+5QauPMe2fA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MSIJA-1rgk433024-00T993; Wed, 27
 Dec 2023 15:43:07 +0100
Message-ID: <74183091-4c8d-4c92-b3f9-cebaacb41efd@web.de>
Date: Wed, 27 Dec 2023 15:43:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH 0/3] mtd: ssfdc: Adjustments for ssfdcr_add_mtd()
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
X-Provags-ID: V03:K1:HyvYsn29WwCEI9xxdv9RQGBTPB/DqqDr8z3qCvI7bVdjZ4jHkC3
 G/wKAnFyAhII39qmEr7wJVgY8mbhx2o8NQUlZg9VZTJ+8K/W7J1cjSj15ih7EUUP8/Ef9Bw
 EJ5lrihMreoB6jRMk86Qwdu4o5BtYc4+6Rbdb79usx+U3HWsK1bKfI2khRJh/NB0dezmFc1
 SunLP6mSJ4DVppCx803NA==
UI-OutboundReport: notjunk:1;M01:P0:1fr8eEQ0tJU=;pBK/5erE819ePtx/PcpEJfmbBdC
 200Muo8GOIF0KMNeeBy/acJwSq4RAVKjmjqpewB5sjoLYfJ1mGaBiZfd7xHIrLKCrii8bve9z
 GQjPWrJzv5mAKEqkiq5E1w8G7K+GTF3224TeasdccPY7Op9SGXYa3wHIF2DRWPHrtjux6p5eI
 D8OUupxkvGkA7cJKTiBJyLvYy+gAfT5f7uALSKJPDeaISaAPP1YSf5dlC/k9/uZBKmeCaV58j
 hh0dlhV3SwyNlNVdFQM6oO3Nzq6+w0uIH2rbAJbEidGIzRsnHjZVXieMCGWuEZo3qW7Wv1DLB
 tFVG29Ch422AIH8ar4RdY3k0MdHuY8f7CgVY+YV18h+4O5iCqkqZolIB/zImNtbUuk93I7r/Z
 DxPUKEocaCFK3yzQ5ytc8gmua8vD6bkgccjrNEXTI4UUlhEHQ8YV82F0WZh+WnFdX+x0RrleA
 MZOUonFJnmXsVY6dLcz80YCMKB4mKkPqUCaxtxEODQjgyhLnNv/zEbsqWGHE0dzmvmfXEjXzh
 /LUd3+ngayatFTYSfrzp9vXZ+gvpnFZyRJQ1YSS7kC8lTAJFkXh3qGcYlexO24FfSb4arFyKA
 gPJKpJW29MA4uWygLgjZnXL1EbVpTtrpFo2+TfjvoLD90uKF8o89DZDTZlTPU14+L+uE6R+Fv
 T756oa1ZqbIBUtlB6wmpYBDb028VvNGjWxzjMiu2KZMKYhS50rnllD79BnPiJK6BmpYDDffTm
 dKrhlOAwjdKImggd5MDPQAgAl+L5HdDy+dI0IZ7fkJPMeMftMK9ReJFnlw8hGPiB2MPYyS9Pl
 adWtq6/Pedqu65yG7Soll2sVODuh0HyPR+MIu/u2+vUroJv8cNGi0g4vja8KI6uNaxZpAGd8h
 f7NG7z7DFxmzgV+XsCasXFSdVTeft9xP1Zw7xVdI7mNbTwixjpeUcWDT+SRE0JBzzkW3BPpw9
 +HKOPw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_064333_481752_20D825AE 
X-CRM114-Status: UNSURE (   4.77  )
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 27 Dec 2023 15:38:42 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  One function call less after error detection
  Fix indentation
  Improve a size determination

 drivers/mtd/ssfdc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

--
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
