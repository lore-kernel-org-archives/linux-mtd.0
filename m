Return-Path: <SRS0=nuHD=DC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11FB9C4363D
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 04:22:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5D3220888
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 04:22:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IzWDPNYA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="linujbdF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5D3220888
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MzP+rLGUaPXFPY0+iEruDAODTkhQN+XozXIHCpWSzKI=; b=IzWDPNYA7LJ1TunZVxrIMRmMA
	3DAVPRJKmaTgppp8vlqyvK2vlr6a4/ncGNIt7ObDVbTDtj+AOpssy8eJQZwILNj8aEv/V8d/JSv5S
	lTW29TTPnQH9nv2feidfBT0v5xlUk/uunnBQN3TI60Zq85V3E5yXZgOnapNxgX6gjjrTemkbtkVqe
	dbQVIYjyYXN+LPLGXRAHL21oLFi/KSeRXdaj3DTawoSog47KWpkSqMxU/q+n02o9ZGARW/zwrBNQj
	1RSTkWERW4auMubq8bEnpD1dqnzlmUyxTKCx7BIzmxAfVztI9TGP9mCHaxBT48FiT9/uVa/Pr9Pyt
	PURgUbqqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLfEx-0004d5-AY; Fri, 25 Sep 2020 04:21:47 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLfEu-0004cK-D0
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2020 04:21:45 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08P4LK0O092644;
 Thu, 24 Sep 2020 23:21:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601007680;
 bh=9SifCwElBwvcn4Om8He06UDzfh65tOYD13ogczUrHzs=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=linujbdFDLAGzmv/VdyoPJVYuapz6AVWMbfJFsRJi6KCThUktCoS3sftKqDnDf4LO
 sydAL5HavxBaCfgxuZKhkJSW9g56Zk93sIKl0WYogsu8kMbqFXMpr+BPpcfcYX+BDs
 Shtrp0eCww3fpH7PZ2FXJxA6VOpdhrdDWnv/PDFo=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08P4LK8F060733
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 24 Sep 2020 23:21:20 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 24
 Sep 2020 23:21:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 24 Sep 2020 23:21:20 -0500
Received: from [10.250.235.166] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08P4LEEL109221;
 Thu, 24 Sep 2020 23:21:15 -0500
Subject: Re: [PATCH] mtd: spi-nor: controllers: intel-spi: Add support for
 command line partitions
To: Mika Westerberg <mika.westerberg@linux.intel.com>, "Ronald G. Minnich"
 <rminnich@gmail.com>
References: <20200417152613.176554-1-rminnich@google.com>
 <20200417160736.GE2586@lahna.fi.intel.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <1887c783-7a80-a71c-949f-c07c83c2d0fe@ti.com>
Date: Fri, 25 Sep 2020 09:51:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200417160736.GE2586@lahna.fi.intel.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_002144_594102_58C9E0E9 
X-CRM114-Status: GOOD (  15.27  )
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 Jethro Beekman <jethro@fortanix.com>, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 "Ronald G. Minnich" <rminnich@google.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 4/17/20 9:37 PM, Mika Westerberg wrote:
> On Fri, Apr 17, 2020 at 08:26:11AM -0700, Ronald G. Minnich wrote:
>> On Intel platforms, the usable SPI area is located several
>> MiB in from the start, to leave room for descriptors and
>> the Management Engine binary. Further, not all the remaining
>> space can be used, as the last 16 MiB contains firmware.
>>
>> To make the SPI usable for mtdblock and other devices,
>> it is necessary to enable command line partitions so the
>> middle usable region can be specified.
>>
>> Add a part_probes array which includes only "cmdelineparts",
>> and change to mtd_device_parse_register to use this part_probes.
>>
>> Signed-off-by: Ronald G. Minnich <rminnich@google.com>
> 
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 

scripts/checkpatch.pl --strict complains:

CHECK: Alignment should match open parenthesis
#46: FILE: drivers/mtd/spi-nor/controllers/intel-spi.c:956:
+	ret = mtd_device_parse_register(&ispi->nor.mtd, part_probes,
+				       NULL, &part, 1);

WARNING: Missing Signed-off-by: line by nominal patch author '"Ronald G. Minnich" <rminnich@gmail.com>'

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
