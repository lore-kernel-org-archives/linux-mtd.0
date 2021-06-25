Return-Path: <SRS0=mYMn=LT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDA9C2B9F4
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jun 2021 06:32:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3713D611C1
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jun 2021 06:32:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3713D611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Iq/hZsfd1S6BUTqKu4rRSZyxDBAhTFf7LiaKYec/Yro=; b=MJRYeObbl1L0Aw7BLv334E6SwA
	a6HuvqNLn/x6o6mSvuUUWQxnv7dpCg28UipkWofp+iywFz1siiIl4FM12AQuCNcRS4DcXsJnkNr6g
	MPL4X+9KT05YVDhwiD63VXK6MAwJce0WC6LWgbxTkx3bYHiGGhAMdAGkgoY4s0FCNMq3YlUR5DTy6
	L6uur4Qbtsy4sHyU7BuEVrgUrcVdNBBz2WWWATwsd+lElG1Aw0oMuOt9rd70s/YEVT3xuwh50GIzE
	2bB7tnFUcEe/nS2EtSuLDhb1AtWz1D7onUcCOLtT/1tpfzzo7TF6wb0N0mfGbx4twKZExFTPgpuHB
	XuSczxxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwfNQ-00HQOH-V3; Fri, 25 Jun 2021 06:31:45 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwfNN-00HQLx-WA
 for linux-mtd@lists.infradead.org; Fri, 25 Jun 2021 06:31:43 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15P6VXs1100539;
 Fri, 25 Jun 2021 01:31:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1624602693;
 bh=nIb0WAxWfPh4HwNLmik0VjYZO7xYgo3wOzkskF+b6B0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=XOunwywFsX5jgYA0OuEiqzs/M8v8qA2UVmwQllcpvq97V3Xijf/Pb6Tgzpvs+3Qcv
 InCtHZzZZHb0K3SpmvjXFfhYjnjMlOS9OGUIMh087pSGhSiEKwFlWFMCk8kStttceJ
 YGMzyciNeQxrGKhuQ59gi9GE05gePD7GBZ5urDw8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15P6VXBx093726
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 25 Jun 2021 01:31:33 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 25
 Jun 2021 01:31:32 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 25 Jun 2021 01:31:32 -0500
Received: from [10.250.234.148] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15P6VT3C089567;
 Fri, 25 Jun 2021 01:31:30 -0500
Subject: Re: [GIT PULL] mtd: nand: Changes for 5.14
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, Tudor Ambarus
 <Tudor.Ambarus@microchip.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>
References: <20210623120125.1f02792e@xps13>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <c02e435b-6c6e-ec6d-b912-e7bb997baa03@ti.com>
Date: Fri, 25 Jun 2021 12:01:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210623120125.1f02792e@xps13>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_233142_200013_8761CC63 
X-CRM114-Status: GOOD (  16.44  )
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

Hi Miquel,

On 6/23/21 3:31 PM, Miquel Raynal wrote:
> Hi Richard,
> 
> This is the NAND PR for 5.14.
> 
> This PR includes patches from the memory bus tree after merge of an
> immutable branch provided by Krzysztof Kozlowski; I hope this is the
> right way to handle such situation.
> 
> There is also a known conflict with the devicetree tree which is trivial
> to resolve:
> 
> 	9b358af7c818 ("dt-bindings: mux: Convert mux controller
> 	bindings to schema") -> Updates all the files referencing the mux-controller.txt
> 	binding as the file name changed (s/txt/yaml/).


> 
> 	6947ad674944 ("dt-bindings: mtd: Convert ti, am654-hbmc.txt to
> 	YAML schema")
> 	-> Converts one of these files to yaml, the reference to
> 	mux-controller.{txt,yaml} being dropped during the conversion.
> 
> It is then only needed to just take the ti,am654-hbmc yaml conversion
> as it is.

This commit is in mtd/next and not in nand/next. So this PR should not
result in conflict on ti,am654-hbmc.txt.

[...]

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
