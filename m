Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564FEC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 11:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RbutmvelHblQZ+/TYxqFvYrUqNj76KXzg0WfOnyP20w=; b=WFwzrSNR+nf5XE
	pJ3ivExpWP0Pp61VhjiMx9Z9eYQL/u2dpwFtAlo776GTyNLP26kcNW+rjfonr2rTHzaQUJu2MZIyr
	Dg4W+HMpb5i1KgOfG4BBiyNTG0sDXhk+uh+BzFamVv3Mtk4qvU0hFdLPtZ8toqitJhYqX1TDW/1Bn
	ss0yqA4CWEog1OLAH7JBDWG7YykhUICSCpbvU2GZzdBS3pE1Br+4FMg+IiI1/JGHC0dyKKj2mSsRE
	zr4+0hrzL2GsoEqFeuYzcmsAg+sxb0Rh1wYzjCQvv8UtgYD21hM6wczuf+7Ie6CAqp9Gvm5neKjB4
	vBVWuCo/3EYl27luyZig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMpuF-00DtP9-7d; Wed, 23 Feb 2022 11:34:03 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMpuB-00DtMR-4c
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 11:34:00 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21NBXthm022843;
 Wed, 23 Feb 2022 05:33:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1645616035;
 bh=2LkD5YBwfGax8FSb4kF5KhkTV5+/YMmcx2pkuCKsJLo=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=jP5CLdeUMGw9+f4XVNX+SEVSn7pKUNJHsA18PijicYvP/NAHoORSU9V+7S42AtVc8
 XjfkoTbTxYORqK5pwhpyJugdJ1zBZlUCvwCrVi6Q75VjOC+e6kwnDujuRN3GJMZc/w
 6MvpvLWaREannCYyseDvt7jnozxhVtQBJpHbm6gg=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21NBXtau066939
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Feb 2022 05:33:55 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 23
 Feb 2022 05:33:55 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 23 Feb 2022 05:33:54 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21NBXse0048103;
 Wed, 23 Feb 2022 05:33:55 -0600
Date: Wed, 23 Feb 2022 17:03:53 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, <yaliang.wang@windriver.com>
Subject: Re: [PATCH v4 03/32] mtd: spi-nor: eon: unify function names
Message-ID: <20220223113353.zdxhfp3r4qhufzen@ti.com>
References: <20220221120809.1531502-1-michael@walle.cc>
 <20220221120809.1531502-4-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220221120809.1531502-4-michael@walle.cc>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_033359_287138_6664673C 
X-CRM114-Status: UNSURE (   9.02  )
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

On 21/02/22 01:07PM, Michael Walle wrote:
> To avoid name clashes unify all the function and static object names and
> use one of the following prefixes which should be sufficiently unique:
>  - <vendor>_nor_
>  - <flash_family>_nor_
>  - <flash_part>_
> 
> There are no functional changes.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

Acked-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
