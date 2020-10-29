Return-Path: <SRS0=x3fM=EE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE78FC4363A
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 06:26:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E061721655
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 06:26:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LUJRIZ0F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aIR24+4m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E061721655
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qDrFVOfpiA+mcML5Eu05VggSL7Vm2dDMpTD34QnvrnI=; b=LUJRIZ0FwCmQ534+CY/Jcnczb
	yQlFzCxHyX1hCZRwXJS1oNsxFSZzY9XlX8n2kzWgtY2XOL8JNMhcafQwenjVEm59qlYWB5fFHyf96
	rhGXUzqeFmaGjULh8p/Pv/UgfRKDFs21YOxivfzUfO4L7CtiFG27AVe7GwDFJ5o7OafD97Ve423B4
	QZwOtYdgrjsHfbSQQkjkczpob81LgveYYiYUptiQ8rMN6O+kr2SavzmAtrfmdn26gLV2bhLj46MBE
	mP4zERexfRpI1Oa/zKIArZPpV7A+JPL7hxTR3VFs1Cls6Ab9UyjBB1QjImJHFlUQOhpfmdLt/rwJN
	CZiz7ywUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY1O4-0001AN-7e; Thu, 29 Oct 2020 06:26:16 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY1O1-00019x-7p
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2020 06:26:14 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09T6Q5x0017737;
 Thu, 29 Oct 2020 01:26:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1603952765;
 bh=CdQ+oU4HVKo45/dvLJIgcfgX/8sXcvjXvY6BZKA2ODw=;
 h=From:Subject:To:CC:References:Date:In-Reply-To;
 b=aIR24+4m66gqNqdxfq9RpZ7rb+/UfY11nKTnmDb3OKFi9KtKNlLrv0AtKkNlZtmTx
 fOEloGc3GRmGIQQxHd80drwH+937FEZPpS923DzWGrHa+0VqrjpdixYnyRxgXmP6Ts
 dHhAbib1Nn8KQ2WozqQUTQRqCCyJVKAweHhdewIw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09T6Q5so116259
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 29 Oct 2020 01:26:05 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 29
 Oct 2020 01:26:05 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 29 Oct 2020 01:26:05 -0500
Received: from [10.250.233.179] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09T6Q2KF067937;
 Thu, 29 Oct 2020 01:26:02 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v16 00/15] mtd: spi-nor: add xSPI Octal DTR support
To: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>, "Yadav,
 Pratyush" <p.yadav@ti.com>
References: <20201005153138.6437-1-p.yadav@ti.com>
 <d0d702c1-761b-1480-c74d-135193b33c26@microchip.com>
 <20201028124920.pot77v4phkqiswhr@ti.com>
 <d9d96eda-4cb6-fe68-7469-e73dc7ba2fda@microchip.com>
Message-ID: <b7a18f2a-edd6-25e1-2f30-1a4427e67018@ti.com>
Date: Thu, 29 Oct 2020 11:56:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d9d96eda-4cb6-fe68-7469-e73dc7ba2fda@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_022613_424547_C659279E 
X-CRM114-Status: GOOD (  25.77  )
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
Cc: "richard@nod.at" <richard@nod.at>, "Nori, Sekhar" <nsekhar@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 10/28/20 8:51 PM, Tudor.Ambarus@microchip.com wrote:
> On 10/28/20 2:49 PM, Pratyush Yadav wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Hi Tudor,
>>
>> On 28/10/20 07:53AM, Tudor.Ambarus@microchip.com wrote:
>>> Hi, Pratyush,
>>>
>>> On 10/5/20 6:31 PM, Pratyush Yadav wrote:
>>>> Tested on Micron MT35X and S28HS flashes for Octal DTR.
>>>
>>> Do these flashes define the "Command Sequences to Change to
>>> Octal DDR (8D-8D-8D) mode" table? Can't we use that table
>>> instead of defining our own octal dtr enable functions?
>>
>> The Micron flash does not have this table. The Cypress flash does. The
>> problem is that one of the samples of the Cypress flash I tested on had
>> incorrect data in that table which meant the sequence would fail. The
>> newer samples of the flash have the correct data.
> 
> Can we differentiate the Cypress flashes? Do you remember what
> was the incorrect data?
> 
>>
>> I don't know how many of those faulty flashes are out there in the wild.
>> IMO, to be on the safe side spi_nor_cypress_octal_dtr_enable() needs to
>> be implemented. So from the point of view of this series there is no
>> need to parse the Octal DDR enable table.
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
> 

There is no standard way of doing this and I recommend against it.
Each cmd seq has 0 to 7 Bytes. So the sequence maybe:
1 cmd byte-3 addr bytes- 3 data bytes 
or 
1 cmd byte-0 address bytes-6 data bytes 

We could just assume first byte to be command and rest to be data bytes always,
but one problem maybe that controller may not support data length to be so long
when address phase is absent. Eg.: Cadence OSPI controller supports only upto 8 bytes
length transfers in absence of address phase but other controllers may
limit the length further?

One more drawback of using "Command Sequences to Change to Octal DDR (8D-8D-8D) 
mode" table is that it not only switches flash to 8D mode 
but also configures flash to be in:

- 50 ohm I/O driver strength (Driver Type 0, mandatory for xSPI devices) 

- 20 dummy cycles for Read Fast commands

- Operation at 100MHz (or higher, if supported)

Note that 20 dummy cycles may not be enough for flashes to 
operate at 166/200MHz or higher and thus requiring flash specific fixups.

So, I am beginning to doubt if parsing "Command Sequences to Change to Octal DDR (8D-8D-8D) mode"
table is worth it. Not to mention we still need flash specific code to "verify" 
that mode switch is indeed successful.


Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
