Return-Path: <SRS0=nCGj=XU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF3AC432C2
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2019 16:47:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3162E205F4
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2019 16:47:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VXyJylfY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="IgvJAIW/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="sSh68e04"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3162E205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YvWROdaXqavxe07vJIhFfaUScJzoCIc2hSqcsVkRoLM=; b=VXyJylfYVntznLRLG6bWyF8BT
	+Nr/t3G6fzunXVnI9tZ63WwbjxV22utv/86kzNCOjKO+Ep+pyYg0gyCkkp8ceI4Zl34m46mdLttWd
	8oSSNfQNFZr5Bj9uN3/Tbr+X5bLTB/wUyq06jzfNwNvFJnWen5OZeVDXP/ulwHFGkHDGCdpk0FZTA
	GTGWf+2vY1eDcD2Jwy24PjS5wbRbGaLsuiUp4qlD6T8d7Q5fmM95RY/QWyvir7XC4HuC77C+4N8TT
	9+rgI5UJ+jw/YbbPonCcdVkbUVgkw/KX+qXa5v4MlTJWnCDJ6lW7wqlqmwuNDE3UKUzv4jyGHd32e
	GjF2weJgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDARf-0003J6-5g; Wed, 25 Sep 2019 16:47:15 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDARc-0003In-7i
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2019 16:47:13 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8PGg6iU014672; Wed, 25 Sep 2019 09:46:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=proofpoint;
 bh=W7iPXpQQFbCPlTfgTRN0ObN0+UO/awUO/AEHp8O+RqQ=;
 b=IgvJAIW/A8IuXHVToOFTs6dnucoy3kIhhmcK8gS40nCqsqAZhl9RWGsSlxzGwh3pMe30
 4KWClPnOb3a4rojDat5PN1i8mRF4PcTnPMF754OqrWyADUxPHS0kdh94ivM0LnoK4Wnd
 1sUUL4umSVJbxqD/7ASVKYifpdxU0BnHE0hYJyvE75+ZmrPDvbHamU+UV2Z2t07sM13u
 YdiE71JbJA5WwXn1WJSdmNn0ItRw6sHPGSNe4FUTHfsT5SawFLKxCCectRuzaaxHGTzA
 YU3bOSoAuVIskXC/oRUU2KcOgdy4BF6OpuNQdYd9+Ibt+EDdrQLIciSS9ruydaOKKmnZ UA== 
Received: from nam01-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam01lp2058.outbound.protection.outlook.com [104.47.33.58])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2v5ge0gk47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 25 Sep 2019 09:46:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ct6GGnoeT3PsjcY4+X9unYzjT7f+1gIvqdSbvtPbQFlNKjCQCsAhqKbbsphFerrh/e+juuMBbVK1dwmaqA5J40X3J7pAfN3wJ6FEePXwCuQUaxkhjdTYS9LBnBfEtlI5fGSCGX0vkAC6m4dS8X+K6ekHFyfmGcIaBEiq+pIaWVLDwZ+i8uqATrBFa/zsupQqBf2XaMMn6P/rx6kbuPsBB+i6Fsh7094kWMjWs/PwFCpT39btOWaONwMqa2Oy/jjY2dDhdSvnGZH7+Zib+THz2dX71a3f0GlNTRIFtpL9+0Sj++VjlUCdksCab7DjxRChD9a+mEMxt/uf3VpU1JuNpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7iPXpQQFbCPlTfgTRN0ObN0+UO/awUO/AEHp8O+RqQ=;
 b=kaYowqihZlpbWr+TK/gTRf9eGa2J5pF9w+oyz6EzYhfsyi9Mq0wBV7dhmF6gYm5DgPsuf8gdoMsOgb4279ynKZNtKs/5HYYOwPe8J/C8TJW6Wzopqj5Y2gm7lvxXFuEeIXxtzjEa1gxC6U1+OzpeTzBk/oQvT0pNWwEFPDOjz+j3F9WqiUb5RHwFQmPnvmBqA9t2/4WInGNYeTElJAF2b1eV7/OcGwM+6Sq7xJtHncALDs+hpM1Sgn0bwzcpOvplObxhTpMSVjdWDCU/cqOOXR3tRpTXlgMIcdW6RFCrkoH8Nz+sQzQVTsQqoGWnngN5vqRm6jf6h2KO0UBX2GbWyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 158.140.1.28) smtp.rcpttodomain=ti.com smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7iPXpQQFbCPlTfgTRN0ObN0+UO/awUO/AEHp8O+RqQ=;
 b=sSh68e04XrbNbMoCjC6B4GU2ou09bpViVECWZgd6bW5EVtJxkEBBADwdSoNKK4CSdkJbsA9Jgn5nv6XbAN23LsokFbFQYzTuqK4/kkTls8cSVeWTDJGR8xjT5MYHMBWrzvL/BAZQkyTy3Kd/UpBZa2Hb8bss9LFlrsqzlgty0dw=
Received: from BYAPR07CA0062.namprd07.prod.outlook.com (2603:10b6:a03:60::39)
 by SN6SPR01MB0039.namprd07.prod.outlook.com (2603:10b6:805:dc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.25; Wed, 25 Sep
 2019 16:46:38 +0000
Received: from BY2NAM05FT052.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::209) by BYAPR07CA0062.outlook.office365.com
 (2603:10b6:a03:60::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.18 via Frontend
 Transport; Wed, 25 Sep 2019 16:46:37 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 BY2NAM05FT052.mail.protection.outlook.com (10.152.100.189) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.12 via Frontend Transport; Wed, 25 Sep 2019 16:46:37 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id x8PGkXIj005644
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 25 Sep 2019 09:46:33 -0700
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 25 Sep 2019 09:46:29 -0700
Date: Wed, 25 Sep 2019 17:46:18 +0100
From: Piotr Sroka <piotrs@cadence.com>
To: Kazuhiro Kasai <kasai.kazuhiro@socionext.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, David
 Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, "Paul E. McKenney"
 <paulmck@linux.ibm.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Paul Cercueil <paul@crapouillou.net>, Arnd Bergmann <arnd@arndb.de>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Liang Yang <liang.yang@amlogic.com>, Anders Roxell
 <anders.roxell@linaro.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [v8 0/2] mtd: rawnand: Add Cadence NAND controller driver
Message-ID: <20190925164616.GA14994@global.cadence.com>
References: <20190925155325.7035-1-piotrs@cadence.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925155325.7035-1-piotrs@cadence.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj7.global.cadence.com (158.140.32.114) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(396003)(39860400002)(36092001)(189003)(199004)(186003)(55016002)(76176011)(2201001)(16586007)(7696005)(58126008)(16526019)(2486003)(23676004)(26005)(110136005)(3846002)(6116002)(7636002)(7416002)(2906002)(246002)(1076003)(33656002)(50466002)(4744005)(316002)(386003)(7736002)(6666004)(478600001)(305945005)(5660300002)(86362001)(956004)(66066001)(476003)(6286002)(70206006)(486006)(8936002)(229853002)(356004)(53416004)(11346002)(336012)(76130400001)(8676002)(126002)(446003)(47776003)(70586007)(26826003)(6246003)(426003)(921003)(1121003)(2101003)(83996005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6SPR01MB0039; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fd4e6e0-7015-4f93-c5d0-08d741d7eedd
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:SN6SPR01MB0039; 
X-MS-TrafficTypeDiagnostic: SN6SPR01MB0039:
X-Microsoft-Antispam-PRVS: <SN6SPR01MB003919E66A0E648421287D65DD870@SN6SPR01MB0039.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 01713B2841
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: zsvQtH9gsnSymr/lC1ypk4rDtyb72YakPgHNihfNEIxJ07pGD1kFBON00nLEgr9jQNJlhamPfuLsakqUVlnzSKp8AMAREc/TKjHHoTIG9GnkgCgtok3G94bpCmNvPFwyOUanTG5Ml14roLt92HQTzzdbIykmuXK4wDb9QiWgnYbwO0MN5APQwNQjy8XB5rTedng6pvcTQjP2scXkAjv8be3nPy+qU+eFcdWr43+CwtTBp4ovGJTqB9zzyyeJKRVCkRPmspUvnur9hTCsuzHUOcYBoWXCNQVDlGF89PYeVbWDG35qT+HQsgQ1yWHcOmcYvmBuCB46/4Fvz0wOluxlRi1KUYc7pwXUxao0sjvLzdHA40S72BlcN0G2k8W3BzUSyzPN6DzSVCaZWwS+zeMuBvnSmMds8F+SNinAs8YPK4c=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2019 16:46:37.6969 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd4e6e0-7015-4f93-c5d0-08d741d7eedd
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6SPR01MB0039
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-25_07:2019-09-25,2019-09-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 malwarescore=0
 impostorscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=581
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1909250151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190925_094712_293915_081EB1EC 
X-CRM114-Status: UNSURE (   7.90  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The 09/25/2019 16:52, Piotr Sroka wrote:
>Driver for Cadence HPNFC NAND flash controller.
>
>HW DMA interface
>Page write and page read operations are executed in Command DMA mode.
>Commands are defined by DMA descriptors.
>In CDMA mode controller own DMA engine is used (Master DMA mode).
>Other operations defined by nand_op_instr are executed in "Generic" mode.
>In that mode data can be transferred only in by Slave DMA interface.
>Slave DMA interface can be connected directly to AXI or to an external
>DMA engine.

Please ignore that email. 

Thanks
Piotr

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
