Return-Path: <SRS0=AJHc=DO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3327C4363C
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2020 07:21:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F35A720797
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2020 07:21:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OHqoCIQn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DhADBKMt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F35A720797
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FBEPMNY3A6B1qypCUCv6ynbX9DEDIpIjOlcWrlF7tr0=; b=OHqoCIQn3hC2JyPR8KPlak3jJ
	GbV9MNHvepKWxmZCZOH+1kLEx6o+9K6coYzpQoX4WFPEQ1rrhKH3pxJDZ3gRR4qyPRTs2u/vlhGVf
	7GYTLx12HiceIelp7pBBMYkZ0pNHoqdK8lB79Akxl1ZFfcLYVwM0J607kF9rbkFEtsYxFBeCMGsq8
	ca1hfXEHB06rovX0FApdaf0c3iJj8iOtLrTKU7Hy4t515sI/Z+Kenf87yZk4kaWHUA4hMf5F/1pyS
	EuWKY5iYhgfjnGnfbIY0KXP/6FjYASFaG8kxvOgqLdwml+8x3vgb96J99+TuGlfsgPsnfUfUv9gUG
	FOPmMeqrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ3k6-000306-ST; Wed, 07 Oct 2020 07:20:06 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ3k4-0002zS-Kb
 for linux-mtd@lists.infradead.org; Wed, 07 Oct 2020 07:20:05 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0977JqNO085274;
 Wed, 7 Oct 2020 02:19:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1602055192;
 bh=SBv7MC6uFctQAcnLuy4O10EYCrxEuVl6++eAbV6bkCc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=DhADBKMtL6Vqq/1pysE4JbhHJTj1o5asRIFLn4M34zw7hn3pQLjL3Zk7+3LJV39iT
 jkbsP6R5I4N7vgCeg1bGDbr7ZyjaVoITaAmLFxUkXsTz1bcrZLsETr2vGbmECFanGM
 Yn4BEStVfyEp7XL6KxHAInOetop6Fgufaa1znzL4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0977JqKL075201
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 7 Oct 2020 02:19:52 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 7 Oct
 2020 02:19:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 7 Oct 2020 02:19:52 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0977Jnki105586;
 Wed, 7 Oct 2020 02:19:50 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <linux-mtd@lists.infradead.org>, Sergei Shtylyov
 <sergei.shtylyov@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v3] mtd: hyperbus: add Renesas RPC-IF driver
Date: Wed, 7 Oct 2020 12:48:23 +0530
Message-ID: <160205504640.5483.8165988766877057020.b4-ty@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <78abb851-2beb-fe7d-87e5-ce58ee877d35@gmail.com>
References: <78abb851-2beb-fe7d-87e5-ce58ee877d35@gmail.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_032004_792531_DFCDBA0D 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, 3 Oct 2020 23:23:20 +0300, Sergei Shtylyov wrote:
> Add the HyperFLash driver for the Renesas RPC-IF.  It's the "front end"
> driver using the "back end" APIs in the main driver to talk to the real
> hardware.

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git cfi/next, thanks!
[1/1] mtd: hyperbus: add Renesas RPC-IF driver
      https://git.kernel.org/mtd/c/5de15b610f

--
Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
