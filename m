Return-Path: <SRS0=g+G+=7N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F3DC433DF
	for <linux-mtd@archiver.kernel.org>; Sun, 31 May 2020 06:05:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 378A320707
	for <linux-mtd@archiver.kernel.org>; Sun, 31 May 2020 06:05:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ockdLIz8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="UnuejYsm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="eSEWuwxJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 378A320707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hNP47LeefmDiFwY18dgYjBCVABMZQajH4BKnT7vsZPE=; b=ockdLIz8VAx+Bo
	hjvSbyi73VeNey89MbQq2U2cxMys7Z7F5Z3MxSrIRN2QG4dfBFcbNb+mjP4GTrJBzxpt5SbeSZNGW
	yI1ICfs1VDmkY7y+LcEpnEO2mnfTII3e6QYOHuIEFWxZ0Z7Zs2ihfuHjfL0wUMpCoDUTVcQ/SbWxH
	tXPYTIg2ber2X/LwGzk6k8eaikYw3zyWUtjGJX5JWToHM1nSyOrMNGxUdHbqyH615Lghgp632T3O4
	j9GjzmWKhdB0IT21BZxhSHMGHV2htD3IuRfK+ZxGt7aWj9gH0jmC8Fb/8m2wGmwS7IM60C9+ULOtB
	DLdQBOFQ+t9SDsgyKZoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfH6D-0004OG-Pz; Sun, 31 May 2020 06:05:33 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfH66-0004Mj-UA
 for linux-mtd@lists.infradead.org; Sun, 31 May 2020 06:05:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1590905126; x=1622441126;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=AYFeQ2K3ydH3cNZoW29Nr9yfRxwzJ4U3xF+FBO0TAmc=;
 b=UnuejYsmD8uyYL0fSNq3D3Wxe1b6gKf8AdPLlYW5H+Y5Ui3FXSI7sFg5
 g3w1fzMynDDg8aV769/imtGe2etcYfBJQqOVN9KFWVMGIzqsLP7l4QGjy
 dOzDjV0x+h99XVV7S6ZE9wN6Zjq6t4sphAoGj8jE+5/s/a/muH8FxfF7q
 jRLM5Pxp+JSdmgvvSsZglK5PNl1GvAmaEz494NKK2TjVLKJSjNmOUhUFR
 KPUQ6Z2wDQz7K7stFCA68sFnfpqMx0bw/Yg7wa9bnx33KZ0FJZ2AaIzsY
 b2u9lx0n8ts5E9It9Drx0XqPtWqKLTOecCAvpRuxcoWASy7qKIFND/UpL w==;
IronPort-SDR: QpNJbXEy4yX19uC5A7VJzQc5MKmZ/O8dvwyqPzaD0LR20FPf2K2BmBNNyRicpldbgJB0YUFPfP
 u26j8rJMnGhslwTwLqyOmaEU5VduX6BkaCSTOHjPCmvH5LpcdNMsXDRtAO5gJ0sK2tVK8FLLxr
 VKiUTuQgA+ynqGpAiu9nPJCgfeINr8bPrQPfYiYGgYn/Y1N0EoBdK7pNWk8tW5yel93FKCMY/8
 sQYUgnc2vu+V3DgKkLA4nhJJJvWx7P65uOPUmeZ3fAwn+GT+sTF87SaCevjLqzGgZ/9/WHIFEE
 a8g=
X-IronPort-AV: E=Sophos;i="5.73,455,1583218800"; d="scan'208";a="76883032"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 May 2020 23:05:20 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 30 May 2020 23:05:23 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sat, 30 May 2020 23:05:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBUp5h4MzGH0HqV4uqPAp2Qgf9HjEnaXVd5awmtH0VtduSFJeH3SNaigJ7GxSXHSwxXF9KhXLQ16XMMqDCjhtfRc3cHike+0GFfHuFg/jeC8MmNCokVS9OYBoX15JXGJdRRHEGrwKycuL6qcsXKSF3BzPPH3fizAE5LTvHg/VXSb8elUkeQD77ddFeoicdKbtdku24OpHYWRhf9XkC6ID8N6/57gbGyoLR9ZCf60z6Ya37YKKnQDR4fPVszPXOUCOD/YmYmgB0TMqqI/CM6G008wCimov/xPwBKKJhpQ7bTDJbrLPahKYi3jaXIe92NLX4Qza3qBJ1qJv0770va7oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcQ1hGTot9qFRDMlYFXhZJnwFSJtYgC/5d325K21Vek=;
 b=GqtfeWVaQeWU8ITkoNmoFfWjKS9fJrWGg4Q/6tYVsmQD34RFbWZxLQmCfQrhhHR9RPD5ZoB+w0iH37Z/WAZnLL48i/9RGMNZGJG6USv5lpu54c7qGr7sxIgERpgWp3443mMtvzlpNUBZbnzsnbrVaKB2CYqGsY00gQotGJA2TqEihyteOF77ebo0dacHcaww17T+j2VN0/doiyQSsHdScc0vDxtbpxyUUDlB7wS9ezEod4Um4bIoJPgARtja9tzJoFJ5qw6qfaSF8KBd9VS9VFiRr3aSTds6Uiom7CFlPirRzwuz/cnz9jHnZCwXtrl0RQYC7AjWFPow7AbPZ2lOoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcQ1hGTot9qFRDMlYFXhZJnwFSJtYgC/5d325K21Vek=;
 b=eSEWuwxJ9o7xCOWMcJFaQul9aRy5FFjrF+zbq6f6Axn0hiJ4aSowhFRwBg5knRidtkLaCFwP6Zfp1IZbNGLFPWz1aOdQtvp5OQO7vN6qCN9m6A1gcXjjpG7iT1Zk01GGpoMIHHQ2fbn2MPJD7UBa7zp6AqYh2O2rYkuEIKiAdcw=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4257.namprd11.prod.outlook.com (2603:10b6:a03:1ca::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.21; Sun, 31 May
 2020 06:05:15 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.3045.022; Sun, 31 May 2020
 06:05:15 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mantas@8devices.com>
Subject: Re: [PATCH] mtd: spi-nor: fix 4-byte opcode support for w25q256
Thread-Topic: [PATCH] mtd: spi-nor: fix 4-byte opcode support for w25q256
Thread-Index: AQHWNxFyeCOFTav6rUeke0dD3DMEOg==
Date: Sun, 31 May 2020 06:05:15 +0000
Message-ID: <8831196.QsUNxFFoTD@192.168.0.120>
References: <1586958510-24012-1-git-send-email-mantas@8devices.com>
In-Reply-To: <1586958510-24012-1-git-send-email-mantas@8devices.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: 8devices.com; dkim=none (message not signed)
 header.d=none; 8devices.com; dmarc=none action=none header.from=microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38d710a9-4b0b-4537-0cb1-08d805289674
x-ms-traffictypediagnostic: BY5PR11MB4257:
x-microsoft-antispam-prvs: <BY5PR11MB4257D3A62460A5E08E624A8CF08D0@BY5PR11MB4257.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:773;
x-forefront-prvs: 0420213CCD
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C1qaW1fS9bn75emRgb6WMaGZEyBzRIuyLPVtyeuz04CTaPZqbhswiax6qU5Yu2sJRr1E+ZJ6Ao2F7UicYr4Mo7dLWsBRejJ/MkJVM2glwXYJqYI2teqyH6XUavPoi2hl/+Z3cbqAJyPxEHHYiDep9lfbtBroVnw7tOC8uZt7uNsBZXYBunfDaWt6f6ScyY5XG6D7qnD/EDFAQhCyHt3j2vxuIjaCS/FLjsA63bN6KLhjXkaO+F50hSJmzn7djZeyu3D13K9Ony1FeLGiNNQLMv8MTVX1ES2o+GWG1s5w44A+Jzva5bWyBuj9PiWhLAo81gX9DQ/3sPuX8LwTOmX/4zUaAlri+YBIPlu7Q7Bgs44sPqSd5dh5rNEy5MJ1/Rkw
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(346002)(376002)(136003)(39850400004)(366004)(66476007)(64756008)(66556008)(66446008)(76116006)(66946007)(2906002)(6916009)(4326008)(83380400001)(14286002)(4744005)(91956017)(86362001)(5660300002)(6486002)(8676002)(6512007)(9686003)(186003)(316002)(26005)(54906003)(53546011)(6506007)(71200400001)(8936002)(478600001)(138113003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 9bkAcyr6olBL34zZgrSL/2cFf/0PqzOiqrovVS85rtzVKcWZUIQyLF8Oj1InbqBZHOxSZqisExEg37A85X5aLJIsji3mzKPekD9XJDF0pDCoTX3bcGT3CxJpOqWWlInvr/O1snOxHE7i3SGvKvNvRHKKzUqG94tZjSlO6PuT20clrpj2sQcjbEc0S3dhQL0Bwph+F0p1NJDm99lW9K+cpXhra1X8FXDGiPfog2OD0jaLvr6qnVFMJd/qJC71ZmLsnbnV1vOHHE9ZVOWOuti71E6rRnRK3MBaCgmUedsJC/cV0e/qStXxXW4kMNZigPxFSAJQm8qG6V1l9QpVRj4Xn2/dbJx6XN8/WV9kW/gxmdzijbHshOTIy6Qj+F9kU7UYcDtKbgtY0m3AcVYgyjFWIhGHSgfhDter+RpteloCgUFytNOzbGVRltSpSNjgkMQ+JkCIpw5ys9UyXlHM6og+X20ulnO+mUScPytV/6apPCQ=
x-ms-exchange-transport-forked: True
Content-ID: <68C345D1EFB94D4BB9AAFF4D78A4C685@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d710a9-4b0b-4537-0cb1-08d805289674
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2020 06:05:15.2374 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EJ4ad+xpV/wb06NpgGcieEuh+dUDRllE5BmHe3U92D2zyHne4zQkKqxeBcWxROKeIGZtw8G6Jq/Fs1EB/a6jLmF/aiG2ya0dFmTVA+osd2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4257
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200530_230527_084684_4409646B 
X-CRM114-Status: UNSURE (   7.82  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, robimarko@gmail.com,
 gch981213@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wednesday, April 15, 2020 4:48:30 PM EEST Mantas Pucka wrote:
> There are 2 different chips (w25q256fv and w25q256jv) that share
> the same JEDEC ID. Only w25q256jv fully supports 4-byte opcodes.
> Use SFDP header version to differentiate between them.
> 
> Signed-off-by: Mantas Pucka <mantas@8devices.com>
> ---
>  drivers/mtd/spi-nor/sfdp.c    |  4 ----
>  drivers/mtd/spi-nor/sfdp.h    |  6 ++++++
>  drivers/mtd/spi-nor/winbond.c | 30 ++++++++++++++++++++++++++++--
>  3 files changed, 34 insertions(+), 6 deletions(-)

Added Fixes tag, plus other minor cosmetic changes. Applied, thanks.



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
