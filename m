Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED362C47420
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 12:02:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87F6E20789
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 12:02:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zT6kI7vI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="d70DtajD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87F6E20789
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tcDlqOW8XtT2+uhcIKBlxJwp/mE7A9w7f7THfI20U8A=; b=zT6kI7vIyV75ULlzHZfa2qgWo
	Vw5o5WqY47arrDLJJiczT6UcRoE8CXuwbMwcAPcHPr2VfLUX9uXao0V5t4flmXx9bQ8G1BlWvIcNk
	Mw5lEExVyJM6RMMoia3rb59INZ/M6QPc+dkCfZvT1iZs4bQwMQkSiasN60ilA9AH0D+mrQ4ANy6s2
	dJeFkkMKOt41Ldb2BJMndHLysmox7nV+nDKeN26ErWbhny62cfFKRdYNsaOqYAd3NJa7hVt3y5QYo
	CxM9NhFCcqQBjVU/goOa6XuGY4YMsqwS6TMbwwmrYutOIQTP2PpRwaAgXAUKuWpzkpEVe6wADSJsS
	u9I11sRZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNanz-00088l-EB; Wed, 30 Sep 2020 12:01:55 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNanw-000889-W5
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 12:01:53 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08UC1kkP122719;
 Wed, 30 Sep 2020 07:01:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601467307;
 bh=ijASeq6JofIhavxF2Y+ilSi5sx3r4xhXEQ76xs3uqLQ=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=d70DtajD6CatDmGdv4ruVgina2guCNGalY4453DN3gIskqeibCQtLzUp+MiBy74gM
 4Ujf6Uej0nk+uZwY4KKtixp0xUaecTT7te1GCc8pCAIf7FmHSzMS2p28H10HTG0NZY
 +869TCrA42vjbsaj/n51IqcSY0RsAUN1y8gK3t/o=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08UC1ktf094672;
 Wed, 30 Sep 2020 07:01:46 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 30
 Sep 2020 07:01:46 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 30 Sep 2020 07:01:46 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08UC1jJ3075266;
 Wed, 30 Sep 2020 07:01:46 -0500
Date: Wed, 30 Sep 2020 17:31:45 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v13 00/15] mtd: spi-nor: add xSPI Octal DTR support
Message-ID: <20200930120143.w7tddcta7sekdzju@ti.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <1cd1b952-9126-516f-d8a7-91149a815ff0@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1cd1b952-9126-516f-d8a7-91149a815ff0@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_080153_152996_4AD4E5FD 
X-CRM114-Status: GOOD (  31.33  )
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
Cc: vigneshr@ti.com, richard@nod.at, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 30/09/20 09:57AM, Tudor.Ambarus@microchip.com wrote:
> On 9/16/20 3:44 PM, Pratyush Yadav wrote:
> > Hi,
> 
> Hello,
> 
> > 
> > This series adds support for Octal DTR flashes in the SPI NOR framework,
> > and then adds hooks for the Cypress Semper and Micron Xcella flashes to
> > allow running them in Octal DTR mode. This series assumes that the flash
> > is handed to the kernel in Legacy SPI mode.
> > 
> 
> I like this series. There are some comments that can be addressed, no big
> deal though.
> 
> I think that we shouldn't let the door open for users with flashes that
> enter in a X-X-X mode in a non-volatile way. Think of two flashes that have
> the same X-X-X mode enable sequence, but in which only the EN bit differs:
> for one the EN bit is volatile and for the other it is non-volatile. Users
> of the later flash that try to enable the X-X-X mode (using our code) will
> end up with the flash in a mode from which they can't recover. Thus my advice
> is to consider by default all the flashes, as X-X-X mode non-volatile flashes,
> and to not let them use the X-X-X mode enable methods. Flashes that can enter
> X-X-X modes in a volatile way, should discover this capability by parsing the
> optional SFDP SCCR Map. Those that don't define this table, should pass this
> capability as a flash_info flag when declaring the flash. With these, users
> should be conscious about the V or NV modes, and the risk to end up with
> flashes for which there is no software to recover is diminished. This is what
> I tried in RFC 1/3 and RFC 3/3. I think those 2 patches should be part of
> this series. 14/15 and 15/15 should be updated accordingly. RFC 2/3 has room
> for discussions because it provides access system-wise, while ideally would be
> to do it at flash granularity. I'll wait for your feedback on those.

FWIW, I took a quick look at the RFC patches and I agree that patches 
1/3 and 3/3 are good and I'll add them to my series. I don't like 2/3 
mainly because of the same concerns that Vignesh has: wearing down the 
NV bits. Also IMO we should avoid touching NV bits as much as we can 
because I had used some on the Cypress flash during development, and I 
ended up "bricking" the flash a few times (for example when I used the 
wrong dummy cycles by mistake or the controller driver did something 
wrong). Since I knew exactly which registers I was touching I could 
recover it but the process is quite painful.

> 
> > Tested on TI J721E EVM with 1-bit ECC on the Cypress flash.
> 
> As a tip, when introducing some big changes to the core, would be nice to be
> assured that things that worked previously are still working now.
> An erase-write-read-back test in Quad SPI would suffice. Probably you have
> already did that, but I haven't seen it mentioned.

Ok, I'll include them next time. I tested this series on the CQSPI and 
TI QSPI controllers on MT25Q, S25FL for regressions, and on MT35 and S28 
for Octal DTR.

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
