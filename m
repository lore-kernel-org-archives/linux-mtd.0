Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA26BC83000
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 08:37:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A9612053B
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 08:37:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kqxXqesG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="U6mG09mf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="ixsidYHB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A9612053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3uG0yhgdzzb7cOXQAX241uW7mrrAhhRHA77MDhkz3ok=; b=kqxXqesG9b3M1R
	WzhkzWsnnvwTu7onGfLoey7p7feJHsnLsrmK2wDqLZV+p2q1UR+Xl8CX3FpuODreEfTuVfpjnN07u
	tkboSToGj100YJolP/f6p4J1BnCo27zNwO4FYpsR3CwQO4RyDFIl4fU+ZSpSx/thTdB2bawJrEX+c
	sgB0RmybfTh97Pl36ZGDhPXnCDnlO2GlDrYpB0YYju8YKhDCGfbLPUgocyYi+2WT7LwSaisjNEIwM
	2AvY6JUpyuiDICLPRwJgM6+jhjVP01tYln6Zt5lSenYWaKUvZFsAH6pAo1XJzNy3J49LR+9e6WFS4
	4jpzuiQb+I2WH10MWzog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTLju-0000ja-0t; Tue, 28 Apr 2020 08:37:14 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTLjr-0000jC-4W
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 08:37:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1588063032; x=1619599032;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tb3KdwCuTaTmIrI0yufvsWUnPcUWHL2MvP/L6E3rLHg=;
 b=U6mG09mfVwlT/dpzqu3t6rQ2lG2ygEnnVUXJeznMGyjnmF/blpIlqctj
 Drbh4YQn1O+L4es5VOIP38c75lEDKyg4LJ0OueX1F5egH/KTvtINNdTc7
 PgHL9LribHyFKjJWJKzHG7CM4dKaLQcZViFdT6AGxfty7Ihc2UCsFifW7
 W6X4LsBcUjp55U69f9q2SImbXyedDqTmyEatqFiowyLgW/IFozp2UwFK9
 aMZNYNV6of9i4+qShB+QaAraWjn0+aJ7iylfxDPVdpdRxHOcQ8n4FvBf0
 EsMPBPxNKZv46AVt51mBbV0Nfr9Bur6vuJ1rvjvvfgjL3k+TaBlmq9MsX g==;
IronPort-SDR: 76H88pOO0Lz151g3O6XelN9YfVcXJTGI+xbF0lw/avYrMySgCZZ15fCzTR+kDs0aQTkgrCQUr3
 UA8f4rIwsxeuBgcSnougkMBHnH/QkFfDz48tnce9K5glKTUrh85nRdLuSacFG6Oa6JqawIHg+x
 z/CJu2FM8vdu7CK6z2YBvbrEAbd0BAaXHcSHSG2UCEnLidEw/7MVnH4yOtjAqw5rQcQPYYgQLD
 9EmqPLcqeJEvocEr+o5bmO+AptUlh+oFEmKveq8gG36KFs+CkfvWvKL2WFxpSZAfyYk8JHM/Qs
 sJY=
X-IronPort-AV: E=Sophos;i="5.73,327,1583218800"; d="scan'208";a="74070461"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Apr 2020 01:37:09 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 28 Apr 2020 01:37:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 28 Apr 2020 01:37:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVYDEv7TRNKn88H0+mN+oPaffCDNCBwsleXIU0pGmM0X+6Iwi4g2exFSRTtFVR075fR7Mk1hHH5za3rjlXi6zLZ2z751eP8wm9TG0lJzvDHL2SnVRItUMhy/Ui6SNAG4diiRpLX789vhPrR7gB/R3EPTXnZbqqE0tRGCVIvjXHF4Hm10pOsLtczhtfVLeu5DsnxUklS8HDYDJh83aykh2sMgmecISf05dsKf9YIrTfG/FH8cREHXm6BJ2UabUOK9yF9hhuRVJ+JYpt+IDSr8QQMYqPW18lFdzSaeVze18ivEh2pehcxg4rqe6AbddcHBLNH0EE+gTGT/I0wwTcf2DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avmZV6wjl+wfmkFyvkHC67hc+MX67BauCEeu4fDckSY=;
 b=Cnoo6otddm37E77ZEo0tj44JtqsSLaN08brO9jf7lZXjIngqyV4Ro/yIdHIT69kIztCM4T0p4+RBTYTIYvBEt+FsWVLG7rD7v4r9qMn5Yu/v+cTxvuNxilyrM6RQrXrhr51zODYcAnwmOxLSL4y5ASJYgFxe8W2H1Fd9yi7s35zCY5Hm4XqI3ysmJAw2f4EHAZdsmk8VWqiqiKd8/X7UQYMI6WrRM4xS/B0XXkbGem9Jda583WVN1LejWx7k5Q60nyvHiTrmLnMSnaDkKmYu0w6CNAE11596Pe5nHNzZ0hyshdiweW7fRzsud9zrxmfI9jMg6veZS/z+QzDNdMt6Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avmZV6wjl+wfmkFyvkHC67hc+MX67BauCEeu4fDckSY=;
 b=ixsidYHBnuBYO6BjGto1tK+LGiMY0uLjcLGJ5R2iefbt+LRu0CtsP8NV1J2eq5hOxW2mfDBYyKvFGPyCwMQrKq+iEo4rL5dt/BMyhgd7HZQW4qCVCMGhp544sq9NdYZVY6U7kp7lp9chv4YEIRqrBmq3H9sNnzU35zNHVjbZLTo=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4354.namprd11.prod.outlook.com (2603:10b6:a03:1cb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Tue, 28 Apr
 2020 08:37:04 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2937.023; Tue, 28 Apr 2020
 08:37:04 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 0/5] Fix typo ('struct spi-nor') in the kernel-doc comments
Thread-Topic: [PATCH 0/5] Fix typo ('struct spi-nor') in the kernel-doc
 comments
Thread-Index: AQHWHTgxVdKUshm5NE+jp+KX77Rfhw==
Date: Tue, 28 Apr 2020 08:37:04 +0000
Message-ID: <4274171.IVTDAm2yfP@192.168.0.120>
References: <255c50e1-f233-6cb1-f170-aa0c384ca8bd@cogentembedded.com>
In-Reply-To: <255c50e1-f233-6cb1-f170-aa0c384ca8bd@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: cogentembedded.com; dkim=none (message not signed)
 header.d=none;cogentembedded.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7013f6bf-0ad6-4f14-f1d0-08d7eb4f547e
x-ms-traffictypediagnostic: BY5PR11MB4354:
x-microsoft-antispam-prvs: <BY5PR11MB43543687B263B8F3061F79BAF0AC0@BY5PR11MB4354.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:843;
x-forefront-prvs: 0387D64A71
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(366004)(136003)(396003)(346002)(376002)(26005)(5660300002)(8676002)(478600001)(81156014)(14286002)(6486002)(9686003)(54906003)(4326008)(6512007)(71200400001)(6916009)(6506007)(53546011)(2906002)(4744005)(8936002)(86362001)(64756008)(66446008)(66556008)(66476007)(186003)(66946007)(316002)(76116006)(39026012);
 DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ggx4fQv1m2hdiuPL7mEryiA7iR7yAw5a6Ko65PAq9H5bfDGmyxeFDxX/aMHJz9Jc2UjEboEiAIXhz5cdgxZODCpxKua9ydX3hrWMfrzBtmhunOOviT+if3CrtiM3Ts9tQuAnMimzMfBlRl7ePU3ws9gRFJwCO3yFEtn00KqDtYe2bbo2LOsda5dJJYojMpLg/x68F5mGIwFOUHivhym8Bq4mhJFgTcK6GuSni8h4tlDWhWCkeD6U015mMd/vMFkyhSR0LBmjctGRDzrlb3Kl0Xlc34dslVbBW1pbNuCLoWUnzvfn+W25l+hqNNhaP6Euwhe0WZ099Mvi/a2TwSKF8/QC0JdWEiC23caMnGkZ+Wx035yE5jPrrgb/bbFrLEYqEQ+ykWVv525LY1L2sVixboHq8WvXrqDBSTy99jJWQa1hUuCyBEZfMXcIVnNOS6c4jROh/6qDRT5hUQmCFmDRo/eFVKrdk29nJF2ICbj7BSK6eMF9a6Ituuy3yTHSPCel
x-ms-exchange-antispam-messagedata: 16WoN3MKsqxW86o4lbXYaT6ncVbAPd6may2oeQw/Nd4sRaMVRJcLBl3MVGzvjBou+bQ838GjLQnKtMIeRWUHGrc2G8fuJPQmCS1WU/6uEtH+uZbNOfpO6NDfis0KJbwviPv0Og2lVoA+1giEFZHzVs8Lr7D8YAiLTQ+Zv7JXiAxz89Fm4IdZuOyLKQsyidFXAhokDzs2FiuegRog7IQ4gRImJ+SMyCmlb3n56qBL0L68qX2leuXEQUDZyK1c+217r/G+FholzzRmAXxfW+Uzy7jWDqC0iQ2sIRliEfoLTC7q4/ltr5v2AqfjuwLYV6EcQLszNf6OvLxwb318H95G51hmszM/JgWhnFwWehiNUV3cls21Y0vrJQTyTWZpUSR2n+8zgJZSMB739t2eyDij7MZ9ICmSq7f0OW80JOYLDSoMEzsNu8wBVVmZuLXC+oq95jEloEMq7lM0FdsbNmwTfDLaJPfYmsbAWB3sF6WXlktSJj1UZHa9PujAvmPfFKh8MFn0oeYf5YzwG5Mc+SlZ6pe3Njl/OGc2BSIR/42tSYY7eeYYHjQn8yEVGUOfX4NgXU6z15W4/PopjfWGEskbEjDsdA10D83NwZaC8P5V9TOfE7Hw33LE64Y6ww2qMJ+1vw6yv0+wcQSgL0f7i0fAGr60YTlSXTY+KM+esJsUWK802r8mO4j6VhPCTva3P0SrobejMclaSqtX86DvpZsiBLQ9x1xgmJ90xS9MKnCKG5rNFW0tyXVocGG2Noq4qQtGPv1ucJwUf1B+uFBXz4AZ9OAJfeNDASsI92jq4ZJIJvs=
x-ms-exchange-transport-forked: True
Content-ID: <A1859D5063C5114B9A39EF03089E5C1D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7013f6bf-0ad6-4f14-f1d0-08d7eb4f547e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2020 08:37:04.6495 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bpXo4VhlK/Bk2gV7OuCzCOlXUYbdopCwcIkDlo5XpTfadlfWgHRuqRwvADsexgMb6+ON6mLuerBpYl82mSt8CfyBXsWrhYBNEjdiRxpMgx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_013711_188026_6ECE5ACC 
X-CRM114-Status: UNSURE (   9.58  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tuesday, April 21, 2020 10:37:32 PM EEST Sergei Shtylyov wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> Hello!
> 
> Here's a set of 2 patches against the 'mtd/fixes' branch of the MTD
> 'linux.git' repo. I'm fixing a number of the kernel-doc comments to having
> 'struct spi-nor' instead of  'struct spi_nor'.  Instead of a single patch,
> I'm fixing the kernel-doc comment with several patches, each fixing its own
> broken commit -- this simplifies porting to the stable kernels (if that
> ever happens). :-)
> 
> [1/2] mtd: spi-nor: core: fix kernel-doc typo for
> spi_nor_manufacturer_init_params() [2/2] mtd: spi-nor: core: fix kernel-doc
> typo for spi_nor_[{info|sfdp}_]init_params()
> 

Applied, thanks.




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
