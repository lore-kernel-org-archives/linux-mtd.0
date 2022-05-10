Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71399C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 10 May 2022 11:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0FZMpozbisDTIr15lqEVy4WBWfoNkKebOxboHkgello=; b=krBoeGEUOuUxEa
	WSQDZJnHZqXG+0AdptKwwGbugYOJ3ctXDmrVXW+XtXxfZ/G/fV7GPrul3+5zslCXRxAf6RyAgjhyG
	CmFtYsr2oc2A1pweqfdUrp+TthjpmpBRnWv8YUrFS+Yg8F5LRArzCh9ZWWOJDDRaGAt2vhtPkjQUX
	0lwC+K9rxTxeSwe1F4HYyG4IZRnW3op8008RiRNuFwlRaVB8/NJgpY/PFHS4ODuSJjEdnU9kfmOzi
	BAqjEsDdR4JrIrpUYjRusWzmczZeDVVbhZiOj8AfYT9P9JhgglyUo1CUYGhu8p4XFaaVxNsQ2Zpmm
	kdgbgt8eXS8HgrW98OkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noNtf-001Ugg-6F; Tue, 10 May 2022 11:19:19 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noNtZ-001Ucd-OC
 for linux-mtd@lists.infradead.org; Tue, 10 May 2022 11:19:16 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24ABJ5la110146;
 Tue, 10 May 2022 06:19:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1652181545;
 bh=lC0RDnDUnP5kh8MN1ZaspSyd0ftJ3P86EuroyzVIWr0=;
 h=From:To:Subject:Date:In-Reply-To:References;
 b=bvS3gdzfU5e+YNvXcsiHgpeTMEgQecoy42na4nS6dDiJ5cG+E2qqgIEud9vyuCc6Z
 30ASPZfOIzvYExdnH+vI28zHdnb9ChZuLOfjID0SsZfBCz64oF2sKmmEfjGxlUHChm
 6KLHqN1PLp28xrFmMC9SSVHLLK9wc/X+xiEo6TIo=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24ABJ5Hb094079
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 May 2022 06:19:05 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 10
 May 2022 06:19:04 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 10 May 2022 06:19:04 -0500
Received: from pratyush-4F-325.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24ABJ3fo127309;
 Tue, 10 May 2022 06:19:03 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>, "Leon
 M. George" <leon@georgemail.eu>
Subject: Re: [PATCH] mtd: spi-nor: support eon en25qh256a variant
Date: Tue, 10 May 2022 16:49:00 +0530
Message-ID: <165218141900.322959.17025957600891420524.b4-ty@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220502233310.791565-2-leon@georgemail.eu>
References: <20220502115227.2435850-1-michael@walle.cc>
 <20220502233310.791565-2-leon@georgemail.eu>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_041913_907669_2E51108E 
X-CRM114-Status: UNSURE (   9.63  )
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

On Tue, 3 May 2022 01:33:10 +0200, Leon M. George wrote:
> This patch allows accessing the upper 16m on the A variant (EN25QH256A) of
> the EN25QH256 that shares same JEDEC ID.
> 
> Without this patch, addr_with is detected to be '4' but the read_opcode is
> a plain READ (supporting only 3 byte addresses).
> Setting PARSE_SFDP is enough to detect the read_opcode READ_4B on the A
> variant. READ_4B is not available on the no-A variant.
> 
> [...]

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next, thanks!
[1/1] mtd: spi-nor: support eon en25qh256a variant
      https://git.kernel.org/mtd/c/cdbc44dbb2

--
Regards,
Pratyush Yadav
Texas Instruments Inc.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
