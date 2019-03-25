Return-Path: <SRS0=pM9p=R4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD921C43381
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 13:52:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8AA920830
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 13:52:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hA0T6iYW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=infinera.com header.i=@infinera.com header.b="kWYCqOf0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8AA920830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=infinera.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BKZcFcb0F5qZRFcd/3V4dOKxf3dV4f54wWXoeI/WTds=; b=hA0T6iYWEN1oQ2
	3xxjC/eXdvo/ixOwSqs1SsdQkPHRPY8K43ARbCcmdHJjRU1Vm69Mf9q0zr2D+d7U9agbRxrRF8XrC
	mNRscTk/yOow9rxx+UlvqonKeBJm2mjFSSHX94XgItBdv5ywUtB6D2xrW/Ur8lWZikiIQfzy08Zju
	yW7T388RcnBOV+iinHdHoMvEcj1T19st6GfDzNKdl8kb1gJimYOSBi50Hcebak6IV0fcmLn/cnIJS
	1ym3fQrubFb3mSueMZFi+BbXLgNSbi1Gcpg+fADrwiz3C2jsl3jFkKc2YiMDW9hFMrWkw2trJeEun
	oCIqmrXOVvAEH+bqi7Bw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8Q1F-00055t-0b; Mon, 25 Mar 2019 13:52:05 +0000
Received: from mail-eopbgr770071.outbound.protection.outlook.com
 ([40.107.77.71] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8Q17-00054h-Ld; Mon, 25 Mar 2019 13:52:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8FU2S7YYltHz9HsPo84oGk4cXe4V/5/+ZVDotP0voI=;
 b=kWYCqOf0ZxYWJ0M14HFEwxksNcSDtZjKyF7S8w3uT/sA0sT+q5KXXWbWiNW0ulTrEUrHZrQiAGFGLkMwdSP18oL43WLDL98EiRbeZ5EFSUc7ZudHmVc6par+JyUQrzHxZXRB2tuadtNKJsu7tc2tb5HIut/tRzIBZSm/972hadE=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (20.179.78.205) by
 BN8PR10MB3651.namprd10.prod.outlook.com (20.179.96.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.18; Mon, 25 Mar 2019 13:51:49 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::18aa:cf18:b8d3:d77f]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::18aa:cf18:b8d3:d77f%5]) with mapi id 15.20.1730.019; Mon, 25 Mar 2019
 13:51:48 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "richard@nod.at" <richard@nod.at>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: Re: [RFC PATCH v2 1/5] mtd: cfi_cmdset_0002: Add support for polling
 status register
Thread-Topic: [RFC PATCH v2 1/5] mtd: cfi_cmdset_0002: Add support for polling
 status register
Thread-Index: AQHU4A390EDhLD8/jkyjBXiay9/acKYWYsWAgAXxyICAAA8cAA==
Date: Mon, 25 Mar 2019 13:51:48 +0000
Message-ID: <107cd92703919f97f4cf2d9cd279b091bc90518e.camel@infinera.com>
References: <20190321174548.9288-1-vigneshr@ti.com>
 <20190321174548.9288-2-vigneshr@ti.com>
 <f92362a0678b07d22ccc0f271fe3483dc77364a9.camel@infinera.com>
 <b1961c49-6795-89e7-e154-6270bf43d49c@ti.com>
In-Reply-To: <b1961c49-6795-89e7-e154-6270bf43d49c@ti.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Joakim.Tjernlund@infinera.com; 
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2c53933-9980-48bb-5bc1-08d6b1290707
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:BN8PR10MB3651; 
x-ms-traffictypediagnostic: BN8PR10MB3651:
x-microsoft-antispam-prvs: <BN8PR10MB365154BC0F48FF0C067D97A8F45E0@BN8PR10MB3651.namprd10.prod.outlook.com>
x-forefront-prvs: 0987ACA2E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(366004)(346002)(136003)(39860400002)(189003)(199004)(7416002)(6116002)(81156014)(2201001)(3846002)(72206003)(105586002)(81166006)(446003)(11346002)(229853002)(8676002)(6436002)(53936002)(2616005)(476003)(68736007)(86362001)(478600001)(316002)(6486002)(6512007)(7736002)(305945005)(93886005)(110136005)(6246003)(54906003)(118296001)(2906002)(6506007)(5660300002)(26005)(2501003)(102836004)(14454004)(53546011)(186003)(97736004)(8936002)(71190400001)(4326008)(99286004)(486006)(25786009)(66066001)(106356001)(36756003)(256004)(71200400001)(5024004)(14444005)(76176011)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR10MB3651;
 H:BN8PR10MB3540.namprd10.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: infinera.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ENUq5H3XmT/P845IrZLZzKX601g3OeglZ1e6uqwUjQ1/dvHlgGbSFyvoMHvcsDLSuyTuuCpa4thEzIiOA2iSHr9/o/W2bx2bey6u5PssfURWSaCLwWSNEION6CQm3QgBVZo/sCzjFVmcpSwD6cT/Jtdl7LT2PtpSGBGHBN3Hk5MLxonHaANk5HdcdRwd6Xn0ep98EFB5EeFyOF8ifaRlzfEWbS700BggkbU9voVPj40IQkplOIofNdFRkZK7Po3k/p8tg2cugre2MRLFD9lx5rYQvHT1cWZej0D8+ekWEVp/nL/wgMbkGDQtxEykTPA3JjMiHmTElDRBIjZqxWzeTOlID2zlcoyNKOOchS8CCpZQ939Tn+IM+X56R9Q1LnxX7POFe9KBIojIo4b4Sxml3XOmk9DuayIFnWfr37gsWtQ=
Content-ID: <64F643BA9BD1D64099EF7B7EE1AC61D6@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c53933-9980-48bb-5bc1-08d6b1290707
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2019 13:51:48.8271 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3651
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_065157_800956_7104B7AB 
X-CRM114-Status: GOOD (  27.54  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "sergei.shtylyov@cogentembedded.com" <sergei.shtylyov@cogentembedded.com>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "nsekhar@ti.com" <nsekhar@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "masonccyang@mxic.com.tw" <masonccyang@mxic.com.tw>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2019-03-25 at 18:27 +0530, Vignesh Raghavendra wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> Hi,
> 
> On 21/03/19 11:41 PM, Joakim Tjernlund wrote:
> > On Thu, 2019-03-21 at 23:15 +0530, Vignesh Raghavendra wrote:
> > > HyperFlash devices are compliant with CFI AMD/Fujitsu Extended Command
> > > Set(0x0002) for flash operations, therefore drivers/mtd/chips/cfi_cmdset_0002.c
> > > can be use as is. But these devices do not support DQ polling method of
> > > determining chip ready/good status. These flashes provide Status
> > > Register whose bits can be polled to know status of flash operation.
> > > 
> > > Cypress HyperFlash datasheet here[1], talks about CFI Amd/Fujitsu
> > > Extended Query version 1.5. Bit 0 of "Software Features supported" field
> > > of CFI Primary Vendor-Specific Extended Query table indicates
> > > presence/absence of status register and Bit 1 indicates whether or not
> > > DQ polling is supported. Using these bits, its possible to determine
> > > whether flash supports DQ polling or need to use Status Register.
> > > 
> > > Add support for polling status register to know device ready/status of
> > > erase/write operations when DQ polling is not supported.
> > 
> > Isn't this new Status scheme just a copy of Intels(cmdset_0001)?
> 
> Yes, but with one difference: At the end of program/erase operation,
> device directly enters status register mode and  starts reflecting
> status register content at any address.
> The device remains in the read status register state until another
> command is written to the device. Therefore there is notion of device is
> in "status register read mode" (FL_STATUS) state

That seems to vary and long time ago RMK added this:
		/* If the flash has finished erasing, then 'erase suspend'
		 * appears to make some (28F320) flash devices switch to
		 * 'read' mode.  Make sure that we switch to 'read status'
		 * mode so we get the right data. --rmk
		 */
		map_write(map, CMD(0x70), chip->in_progress_block_addr);

> 
> But in case of cfi_cmdset_0002, once program/erase operation is
> complete, device returns to previous address space overlay from which
> operation was started from (mostly read mode)

I hope you can do the same as Intel here, issue an explicit Status CMD or you will be in trouble.

Also, I think you need to use the various map_word_xxx as in:
status = map_read(map, chip->in_progress_block_addr);
if (map_word_andequal(map, status, status_OK, status_OK))
	break;
otherwise you will break interleaved setups(like two 8-bit flashes in parallel to
form one 16 bit bus). Maybe this is not supported for CMDSET 0002 ?

 Jocke

> 
> In order to enter status register overlay mode, Read Status command is
> to be written to addr_unlock1(0x555) address. The overlay is in effect
> for one read access, specifically the next read access that follows the
> Status Register Read command
> Therefore code around FL_STATUS state in cfi_cmdset_0001 is not
> applicable to cfi_cmdset_0002 as is.
> 
> 
> > If so I think the new status impl. in 0002 should borrow from 0001 as this is a
> > hardened and battle tested impl.
> > 
> 
> In case of cfi_cmdset_0001.c, program/erase is followed by
> inval_cache_and_wait_for_operation() to poll ready bit and based on
> status register value, success or the error handling is done.
> 
> Most of the code corresponding to inval_cache_and_wait_for_operation()
> is already in cfi_cmdset_0002.c. So, whats missing in this patch is
> handling and reporting of errors as reflected in status register after
> write/erase failures. I will add that in the next version.
> 
> But, I don't see much to borrow apart from error handling sequence.
> Please, let me know if I missed something.
> 
> > I know other modern 0002 chips supports both old and new impl. of Status and I world
> > guess that we will see more chips with new Status only.
> > 
> 
> Agreed. Newer devices would mostly be CFI 1.5.
> 
> --
> Regards
> Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
