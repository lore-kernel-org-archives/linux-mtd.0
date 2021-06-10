Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C895CC47094
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 14:50:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FAEB613DE
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 14:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FAEB613DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=collins.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OmsHOWr1p39Nv/MId2D5BCAhqEXcsPNJPMqvgzz3G+Y=; b=Wkfr3HPPkIjfEU
	uzHGza4ChdozXuHyTYkAL8yWbIto/AYL14AjzebERBc9sGm6NpEDBtwCH2KtviWFLXb5seLMuydFw
	J8z1xwK5JlrsXIbWA/PaS0Y0vCn9TBysC+MgjG7kYUTfNCEV+AGO24zsnGdAk8aZYz50qS8YGzCCK
	8RFPAwbDJ+GBt5dYK9v2KeGRv/TkBfvs0UZqH+BGpXJ2YNMPTl2kXV0S0lew6ImeoTNPip6XAzYOe
	4E5vXZ0FJc4fOlK+nxvLYBD7w73Ruk3yWufo5ywKeErPqdZwMOnE/WZJxZivBk5QBmpjsvnA9MBot
	tSjr36/txSWjv9rqMl9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrM0X-001EjS-0e; Thu, 10 Jun 2021 14:50:09 +0000
Received: from mx0b-00105401.pphosted.com ([67.231.152.184]
 helo=mx0a-00105401.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrM0T-001Ed1-QD
 for linux-mtd@lists.infradead.org; Thu, 10 Jun 2021 14:50:07 +0000
Received: from pps.filterd (m0081755.ppops.net [127.0.0.1])
 by mx0b-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15AEjpeJ020873; Thu, 10 Jun 2021 14:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=uHv5oXAR3FCdrPd/3l0uZ6HyVgTJ2Ka9lQW6rYexWgE=;
 b=GoMEZgDTBMqU6AqJOYQbPpwZS+fLWVeJxxB/l8l/COJfeZX+SDUs9HI9mjya7+/MrQfD
 V3hZNhwQuhwCOHglKGX2BmkI8CXVj4GadRs8v2O8Q7QOiecCnbn+sMCD0qqYQUZrQZhC
 cFsYMHAcvTkNfX/Z5EL3TsRg7BFWhfeRHyn0Kg4E34tTxdugUTyIlSBdUxxz9kyce6D6
 VNLJDjrpXuvX7gmG0vfV7AI4YNHA4cIexh/x0RCf2JUoRIv+lqPwABviaAO30KkXaPFl
 zUKRvcvVS4EqPGumGhbaBMgcRFs3wdwQ0rqm4z1uNxQWehD56yOhkoS9TbE8iJZDyCJf qA== 
Received: from xnwpv37.utc.com ([167.17.239.17])
 by mx0b-00105401.pphosted.com with ESMTP id 392vnp35ge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Jun 2021 14:50:00 +0000
Received: from qusnwadw.utcapp.com (QUSNWADW.utcapp.com [10.161.48.87])
 by xnwpv37.utc.com (8.16.0.27/8.16.0.27) with ESMTPS id 15AEnxn5064286
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 10 Jun 2021 14:49:59 GMT
Received: from UUSALE0i.utcmail.com (UUSALE0i.utcmail.com [10.220.35.28])
 by qusnwadw.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 15AEnx6H000738
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 14:49:59 GMT
Received: from uusale2b.utcmail.com (10.220.63.21) by UUSALE0i.utcmail.com
 (10.220.35.28) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 10 Jun
 2021 10:49:59 -0400
Received: from uusale29.utcmail.com (10.220.63.19) by uusale2b.utcmail.com
 (10.220.63.21) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 10 Jun
 2021 10:49:58 -0400
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.177)
 by uusale29.utcmail.com (10.220.63.19) with Microsoft SMTP Server
 (TLS) id
 15.0.1497.2 via Frontend Transport; Thu, 10 Jun 2021 10:49:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=LHYEQxw+vusp7OeYl3aFm2Vxum48gVMqrAE+te6IlSj6UbX673g9e2pV0Uhgz7MdJHUOA9cwK5c/zDnkVZAiaAoweW7MZQ2xRQ1QGg6z1GkLLOx0vbf4jNiTke29Xp/eTx8LS1+ZvLH33Rwur0LN1wYEnFoodG70qdD2G++Moxvn19L/DY2a6YhOIM3kV+7wEcTC4Y8QQkorVltoxXQ9XhgX7mPsr3TT9c/He8FJs4+R8wjO18WR1VRThj6GWlaZS6Mwrrb26JtIZsx0ELmEd6uz2p5MNhuUevjL2FoWuNR1hKHXS7xl1hV+vMaSA5niNuffxqBLllzKiUm/xEdH7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHv5oXAR3FCdrPd/3l0uZ6HyVgTJ2Ka9lQW6rYexWgE=;
 b=J9yjevP7hvZ2IW7TjiW0wW+8lg0iE6bMmqqVIivCaw2v0NOyd4x6OVSBrQmuLJIUoSOpy51DxACYppNb07oaz7l6nczjMmw5W3B3zPm5K1r3Fh0zIopIlFVPLP622hPk+S5ND8jRB4If88Qq0dAxBLM8/yNb4DcdpjTRNMh/BLhD7E6HfnfJjGLh6OF9+DiMPKR3VSInMqB78xqnHuPqYr8a+or9vGd/Ha8oolGiOIgrSUayrUxPgBLg5mn+kcZy8hUovDy5VnvyLiUD1SwqQTliVczKqrGkYtJO7EU96/tjz477LL+PjtnDSienrCM81TX4No1506IEJ0Y/t+jAiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHv5oXAR3FCdrPd/3l0uZ6HyVgTJ2Ka9lQW6rYexWgE=;
 b=mFGiSlJjhnQxgH4m6pv9jg9sXZ9o1DuM467C0vGUYdoOgideOg5Xs41oKwS7IbR7R8x4EZcDFd7K+GRUbd36xVDuyzf3usnBCvC49kA7i3a0RlrPe14qiihYySj5wnLne5XlbhcmCEt5tQQxp76UdHED2sPRCvkTz2sDbxUdH2w=
Received: from CY1P110MB0200.NAMP110.PROD.OUTLOOK.COM (23.103.25.219) by
 CY1P110MB0438.NAMP110.PROD.OUTLOOK.COM (52.145.1.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.22; Thu, 10 Jun 2021 14:49:57 +0000
Received: from CY1P110MB0200.NAMP110.PROD.OUTLOOK.COM ([23.103.25.219]) by
 CY1P110MB0200.NAMP110.PROD.OUTLOOK.COM ([23.103.25.219]) with mapi id
 15.20.4195.030; Thu, 10 Jun 2021 14:49:57 +0000
From: "Barnett, Ryan J                            Collins"
 <Ryan.Barnett@collins.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <Tudor.Ambarus@microchip.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: RE: [External] [PATCH 5/5] mtd: rawnand: omap: Add larger page NAND
 chips support
Thread-Topic: [External] [PATCH 5/5] mtd: rawnand: omap: Add larger page NAND
 chips support
Thread-Index: AQHXXf90E4/88W0m80qViSvxoQTPTasNUmkw
Date: Thu, 10 Jun 2021 14:49:57 +0000
Message-ID: <CY1P110MB02004D959E5DEB1357C4F25B9D359@CY1P110MB0200.NAMP110.PROD.OUTLOOK.COM>
References: <20210610134906.3503303-1-miquel.raynal@bootlin.com>
 <20210610134906.3503303-6-miquel.raynal@bootlin.com>
In-Reply-To: <20210610134906.3503303-6-miquel.raynal@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=collins.com;
x-originating-ip: [50.82.176.206]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f730100-fccd-4513-a114-08d92c1f0452
x-ms-traffictypediagnostic: CY1P110MB0438:
x-microsoft-antispam-prvs: <CY1P110MB0438B1B21B979CEAF5708C379D359@CY1P110MB0438.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d5tZB5axQHNE3eyPZ8m8+//FbACugbQujH0ezFLzLLrHm3XhduvmKfumZs76rtNKYk8MZbF1z+nzlJGoNA/FUeURQR+znzBuMH2BdDcgC670bjmTZJWtIzFLWYb2Tt5EDjN766gqNb4xjnZuwsGbhe/yqbztcict7bc/VlRNuh9j+DdWuGq3EdnTMBCM76EFGxgp5hmS30Ck5VtRh4XLkavX/aS6DO6KwRWe/CrHFiWK7YU7Cw7ScxdzqeKekGkO+4r+qxQg0cfraMrp8ZNCfzZHmJF8MeakmyFX0uga7FQHXfghThBaIg009ZbEtjylsICuUnL3USwwr3KH9yGdNcECn6wPSdc1Y6uAJMihJV5pa67W0O/MjoqAiR9493WpwrhY1FnQT2OwwHBhfJXQQllzxJaLZDyNPlby3H9dtohsSd72Pg2L4QAXBVuDIVEtj6iL/PzMDfa6gUiRsqla9+KlKSnVnVjlNAdG9Fpf+In0yOGqHQ1p9EgGKF//ygP5qxAxCud1IaSs+XBhmheHYg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY1P110MB0200.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(346002)(396003)(39860400002)(376002)(366004)(136003)(122000001)(478600001)(38100700002)(8676002)(4744005)(8936002)(55016002)(186003)(66556008)(26005)(9686003)(5660300002)(64756008)(66446008)(66476007)(4326008)(7696005)(2906002)(66946007)(52536014)(33656002)(83380400001)(76116006)(6506007)(110136005)(86362001)(71200400001)(956004)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: XJzR9JM2/x2J/BwxTu3msoDf9Snv+Ia67f6sB8wjik7BGW38a/EJEyowC7iJG22mw5xs/JBm6cJ0c+Cx5ETC5kMAvnuzPh1LSV9qHJST2YLlPw+GuzrjhgrEeDHqLu4vQqZ05+tb5fS0AFlEwMdNwJ6Z7kWDN/Q5+vP3aTxzNmN9a86LMrozchUlOciX9XTD+8tuOdF5NYoTAWeMbQvgwufkVyt1Lz7U4L6Ck/plE9r7xOl7mtZIRiFq8lL1y0GVy7lfkLZkn0yzDLhwkhll96sYwHkHQEKy63XP4GZsq1TsWqb2ek9/QZVXCwZRUq7GOrMe5+xlDtrzDKuClSAqd600656MI+PQEq+w8aV1RZhHByiW7f17suHvsLq+9Cx5vvL9adU/vgzGmlgs03q/jOOvoBumuK1aa5Wes+cbpGCL7Z411sogGrwGnC6/hVgIAlNkBlt0GV+yW7ffTmNLgGcRxwfnNxlXnCHszLi7/FT/k/T25+IWmdz9DN+fGPUj+Vel6hHeVXphc+BWWrXJmwbZlh8LDjzCCmzrD6bI1N2nV8UNBmch5/tAVK4T0LfWcvsLEBiswCvIK07+BafOl0nQ90lwpQaWsNHBt2PSmcKccgycikdBdQi83T/JFbE+QkONCagxitDm8gal2/u8NqZ1wY5v2QMZFpQdodTZlZ4PbOmv9Na3QYiqUoobPHyj/ySaFbb3NOMYpgR1kvalFg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY1P110MB0200.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f730100-fccd-4513-a114-08d92c1f0452
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2021 14:49:57.5569 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1P110MB0438
X-PassedThroughOnPremises: Yes
X-OriginatorOrg: Collins.com
X-Proofpoint-ORIG-GUID: crWYVVi1YKVhYliarlW5qSxT2fwoVkAv
X-Proofpoint-GUID: crWYVVi1YKVhYliarlW5qSxT2fwoVkAv
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 phishscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 adultscore=0 clxscore=1011 suspectscore=0 spamscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106100095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_075006_135783_7F52C54E 
X-CRM114-Status: GOOD (  18.95  )
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


> From: Miquel Raynal <miquel.raynal@bootlin.com>
> Sent: Thursday, June 10, 2021 08:49
> 
> There is no reason to be limited to 4kiB page NAND chips just because this is
> the maximum length the ELM is able to handle in one go. Just call the ELM
> several times and it will process as many data as needed.
> 
> Here we introduce the concept of ECC page (which is at most 4kiB). The ELM
> will be sought as many times as there are ECC pages.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/omap2.c    | 179 ++++++++++++++++++++------------
>  drivers/mtd/nand/raw/omap_elm.c |   2 +-
>  2 files changed, 114 insertions(+), 67 deletions(-)

Tested the series on a TI Sitara Processor with a NAND device which has 8KiB page size.

Tested-by: Ryan Barnett <ryan.barnett@collins.com>
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
