Return-Path: <SRS0=0HiW=ED=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB8EC4363A
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 20:03:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A052B247D4
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 20:03:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h/L5UpjV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nAcmELvF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A052B247D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gEm8+4ndZE9XMyHtmchi8zC3NoGLTh58AsXVSKhgOKM=; b=h/L5UpjVXZf1dNFiAwJzDNITh
	H9OLbrFOB0eM/TQskEDSxmz3NZrbs6eKIJRInRXPRgj5ydH6BtVTcHYjQkiC8ip8LVEMt8IP+EvFS
	l5fCjtfjMbf23yueFzb8GX3bvu/hDVGa5cry0ddpjsmYwAKb2Q5pYG1V2Z0u6Q6wn3f5FDqc72bCN
	a387ORTHn/iuqwGC0NtLHPRVWmptW+Kjfx2kTYmcq9J6/rWFm4xkzDxzzOY6A9QU0NIZiPelxksV1
	EWEHXPsK2kixn0Ch3CbW0SoJBHHzA+fIdfzWaqjV33ySIOCs0No9AkJUE91/3oDRExaHVxc5oqSq7
	4jK825l2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXreT-0003hh-8n; Wed, 28 Oct 2020 20:02:33 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXreR-0003hI-2k
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2020 20:02:32 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09SK2OQ2015527;
 Wed, 28 Oct 2020 15:02:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1603915344;
 bh=o3y/Ko52UWOP2r6NyGzju3m7wUK+9F50IDH+1PbV1+I=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=nAcmELvF+vjrrNcZ81hM8wmF68PPe10VPfwKmZrWz/XYSRMnDLoDoh+hs9UOG/+zE
 nTszN8+SY4GsULIBwZLVpNvyG2lpwFP3nWiIKYALcy9SIjP+SVepLE3ggIDUdcllia
 IAvXSYIvF3WiAzhyBLCUC7oIC1JhpS6BjjY0mUxM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09SK2OT3092998
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 28 Oct 2020 15:02:24 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 28
 Oct 2020 15:02:23 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 28 Oct 2020 15:02:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09SK2Mgs047010;
 Wed, 28 Oct 2020 15:02:23 -0500
Date: Thu, 29 Oct 2020 01:32:22 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v16 00/15] mtd: spi-nor: add xSPI Octal DTR support
Message-ID: <20201028200220.eskcgrf2bqzzijz5@ti.com>
References: <20201005153138.6437-1-p.yadav@ti.com>
 <d0d702c1-761b-1480-c74d-135193b33c26@microchip.com>
 <20201028124920.pot77v4phkqiswhr@ti.com>
 <d9d96eda-4cb6-fe68-7469-e73dc7ba2fda@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d9d96eda-4cb6-fe68-7469-e73dc7ba2fda@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_160231_458896_C25A7D53 
X-CRM114-Status: GOOD (  34.37  )
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

On 28/10/20 03:21PM, Tudor.Ambarus@microchip.com wrote:
> On 10/28/20 2:49 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Hi Tudor,
> > 
> > On 28/10/20 07:53AM, Tudor.Ambarus@microchip.com wrote:
> >> Hi, Pratyush,
> >>
> >> On 10/5/20 6:31 PM, Pratyush Yadav wrote:
> >>> Tested on Micron MT35X and S28HS flashes for Octal DTR.
> >>
> >> Do these flashes define the "Command Sequences to Change to
> >> Octal DDR (8D-8D-8D) mode" table? Can't we use that table
> >> instead of defining our own octal dtr enable functions?
> > 
> > The Micron flash does not have this table. The Cypress flash does. The
> > problem is that one of the samples of the Cypress flash I tested on had
> > incorrect data in that table which meant the sequence would fail. The
> > newer samples of the flash have the correct data.
> 
> Can we differentiate the Cypress flashes?

No way I know of.

> Do you remember what was the incorrect data?

The address width for the write register command was 4 bytes when the 
flash uses 3 bytes by default.
 
> > 
> > I don't know how many of those faulty flashes are out there in the wild.
> > IMO, to be on the safe side spi_nor_cypress_octal_dtr_enable() needs to
> > be implemented. So from the point of view of this series there is no
> > need to parse the Octal DDR enable table.
> 
> Meh, we cover manufacturer's mistakes. On the long run, our aim should be
> to follow the SFDP standard and if a flash implements it wrong, to either
> fix it via a fixup hook (if the fix is minimal), or to skip the faulty
> table.
> 
> Regarding "Command Sequences to Change to Octal DDR (8D-8D-8D) mode"
> table. Have you looked over
> https://patchwork.ozlabs.org/project/linux-mtd/patch/1590737775-4798-4-git-send-email-masonccyang@mxic.com.tw/
> ?
> Is there a standard way to determine the offsets of opcode, addr and
> data in the cmd seq?

To be honest the spec does not say much about how the data should be 
interpreted so I am not sure either. My understanding is that those are 
effectively data bytes to send out on the bus.

One way to implement such a function, would be to put the first byte as 
the command opcode and the rest as data [0], with no address and dummy 
cycles. So no matter the address length, the controller should send out 
the bytes in sequence and then the flash can interpret them according to 
the address width it expects.

The downside is that someone debugging this on the controller's end 
might get confused seeing an opcode that expects an address phase but 
SPI NOR not sending one.

The other way would be to use the first byte as opcode, the next 
nor->addr_width bytes as address and the remaining as data, with no 
dummy cycles. This would fail if the 8D enable command does not use 
nor->addr_width address bytes [1].

I don't know which of the two is better but I think both are better than 
the switch-case hackery in Mason's patch which has to assume either the 
address width or the data length and leaves no way to play around with 
them in fixup hooks. If you have any better ideas I'm all ears.

[0] AFAIK many controllers can't have 0 command bytes.
[1] I'm not sure how common that would be though.
 
> Cheers,
> ta
> > 
> >> I see that Mason used this table for a macronix flash:
> >> https://patchwork.ozlabs.org/project/linux-mtd/patch/1590737775-4798-4-git-send-email-masonccyang@mxic.com.tw/
> >> https://patchwork.ozlabs.org/project/linux-mtd/patch/1590737775-4798-8-git-send-email-masonccyang@mxic.com.tw/
> >>
> >> Cheers,
> >> ta
> > 
> > --
> > Regards,
> > Pratyush Yadav
> > Texas Instruments India
> > 
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
