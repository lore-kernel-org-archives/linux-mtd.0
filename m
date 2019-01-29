Return-Path: <SRS0=oh1H=QF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55FA4C169C4
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 16:07:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 203C32184D
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 16:07:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MCRIh1Fq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="tcGGDp2c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="cl54ZJA5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 203C32184D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4NZyHCJurkDQYAYHLbvmNJ9TVXBYk57cMEX5NAxt7ZU=; b=MCRIh1FqHVx1eI
	cVmsNHf/SzXpA6Zi6sQvKNsvKavlgM2y/H/0TiaWyBRFI3aNWZYJZoBfAI/sz6ymcTi3zrnXxfLoQ
	ZAPba9jKyeUwNkbKuB5o3azGsOuH/TMhiqbWDz4ZZWGM3GFWaIBqwQ3t6jWWHMovrGb8ovrcB+gAM
	e+p7tCFxWpaVCxvYp+bF3fgvjUC3e/JYGS2Sgwdhg5wijVCFMDhDwjfcNaI9Ih0MZzuz5LmtYCdWi
	aHZQlK7QJC7al/DGXXJDbCS9nfPCVf96doLoPGashO0kX2Iyp/bZudQU95p9XgsPVnVeRw85LUFSj
	2Q2W2s1xmbOqQVrc3L7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goVvJ-0002Fv-14; Tue, 29 Jan 2019 16:07:41 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goVvF-0002FS-H2
 for linux-mtd@lists.infradead.org; Tue, 29 Jan 2019 16:07:39 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0TG3mAm011814; Tue, 29 Jan 2019 08:07:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=Vt12rXjwXt6eopKa1JJzvQ5IjqVmvQS633vSDjDhzkM=;
 b=tcGGDp2cumZllmM9VEfnJdKYxiQCQO1Tycu10ojnEQD5Y4x/Ubv4Bhfr3+yIyaflC6B6
 BQd/GuyNYkFtdLayvzcIHn814rMscPFK3fXNwdt8xN3YOM/Dtyejx2JjP77g6BobI4ID
 rj/CPuvP8Jda9SgpnSJzTjn+GoYCRY/WOLx/J+iG4G9Br6FSMDObGOtDETkKJzCE/bxC
 yCEfF7X9alUf55MBgTgcPyQ1DNt48H8NL5RzHJL/nXiQHxtD6SJwKvaRQdqHy2AXx1H1
 7U+Z0H9d44y5wwzNvgwpYCqxeQjqxyueuqQfpBeuDsS1RDCZYEkIvKKTcJBeSY/xthED Lw== 
Authentication-Results: cadence.com; spf=pass smtp.mailfrom=piotrs@cadence.com
Received: from nam03-co1-obe.outbound.protection.outlook.com
 (mail-co1nam03lp2055.outbound.protection.outlook.com [104.47.40.55])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2qa817496m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jan 2019 08:07:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vt12rXjwXt6eopKa1JJzvQ5IjqVmvQS633vSDjDhzkM=;
 b=cl54ZJA5PX6rDZwp5xRlnJkQS4AyP2zNM9M1g0JPjenxpkxkXhujUDqk9gaeySsykYdD9zQ13sBlA/4PNThF/FXEYn0nS12ZWq4MquI7Lsh3K08iBz40cQO6bSJeikW8u59gkVPR+4BmN6TcjDDtO/4cOZ/exRcIKmOVov5dfZA=
Received: from CY1PR07CA0013.namprd07.prod.outlook.com
 (2a01:111:e400:c60a::23) by CY4PR07MB3094.namprd07.prod.outlook.com
 (2603:10b6:903:ce::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1558.21; Tue, 29 Jan
 2019 16:07:01 +0000
Received: from CO1NAM05FT004.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::207) by CY1PR07CA0013.outlook.office365.com
 (2a01:111:e400:c60a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1558.16 via Frontend
 Transport; Tue, 29 Jan 2019 16:07:01 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 CO1NAM05FT004.mail.protection.outlook.com (10.152.96.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1580.2 via Frontend Transport; Tue, 29 Jan 2019 16:07:01 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x0TG6vIG030565
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 29 Jan 2019 08:06:58 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 29 Jan 2019 17:06:55 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 29 Jan 2019 17:06:55 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x0TG6tab006232;
 Tue, 29 Jan 2019 16:06:55 GMT
Received: (from piotrs@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x0TG6luY005847;
 Tue, 29 Jan 2019 16:06:47 GMT
From: Piotr Sroka <piotrs@cadence.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] mtd: nand: Add Cadence NAND controller driver 
Date: Tue, 29 Jan 2019 16:03:37 +0000
Message-ID: <20190129160337.24350-1-piotrs@cadence.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(396003)(346002)(136003)(2980300002)(199004)(189003)(36092001)(39060400002)(106466001)(2351001)(54906003)(7416002)(426003)(8676002)(50466002)(48376002)(107886003)(305945005)(87636003)(356004)(186003)(6666004)(246002)(105596002)(26826003)(6916009)(7636002)(51416003)(26005)(336012)(478600001)(2616005)(50226002)(8936002)(42186006)(486006)(36756003)(16586007)(476003)(316002)(86362001)(4743002)(1076003)(47776003)(4326008)(2906002)(126002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR07MB3094; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; CO1NAM05FT004;
 1:U8a6W2ppdEfJZagWEqNiZxrkSMWRSCKKMDVPpl9is+3w4bmMNloA7tGlJ+8dMfX3gLsN3B2ZV2MjmZVW9L3qw2QNVqlZJAjjqa719LZx/oQDdGcjG6pWU0IcBzizVviMFIABoQ+6mMThOaaZcYruYQ==
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6e6ea92-4bbb-490c-2ff1-08d68603cdce
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060);
 SRVR:CY4PR07MB3094; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR07MB3094;
 3:qix5S4ddq8ucPkGJEmg7WRLbOpW4c0XXDNu3FdxcRyvdjk4Bxr7N6ap+iWapWis8Hzsdfx1CNDFBBbt2EiXwzT00HomfW//TbWRmcolIwXUs9j12hEOjga0SpQ3uqeUHZobVPyhHHnBJfymBzOziTGagdnzJAeE8CkMNeRhzyTkG71J/32UQO8GT7tbbF+uCVaRdsfIK5oEVWfHcv8Pam0HC4TkCbh/Pk3YYWZnKWQBwYuqXpMo2YGcA5jdwemrx2TDD8o6iiHG9iBbUM1u4iL+W/eGWxUm+Tfc+Bhy+GfBJazLdie/Lz4TxJRPuOAyFA9kbP8ZkDNQhKDfrMhCKLIVMEHKNj5TF+bM6jOjj+1ZQXx+wnwwU9VRrvrelygJ5;
 25:aJRlcc0fz4LVFrY2GPx+43mLZk0LSU4xQVJtkSMm4vVJrJ7hdGrGf0suGJlX94i12FcR902ZQybBimMBQzs/37HynIbkwZp9yIQiNekIiFDdpIhNz+cFk9WJnHKVaUGtb3OQ6qUNq4dZOOpshW1xGRjVFv33rZeR2yJ9yXudJIHbiteduaJ7ZtddoiBA66Zy9SXgH2KQ+pcTp00sZGxYd4whibGRbmqyTNoIkFvryG4+QkicTbBneR9EpdJqIlJEOXvDZf6nSNf1HDFvH+FgMTsZH/b3VySrf8RLzdpXDhODeu/gpOh0vw97A28+sG4XipHYSfm1jZcmAhMl9+/p3Q==
X-MS-TrafficTypeDiagnostic: CY4PR07MB3094:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR07MB3094;
 31:ImI68aN2FtefZ3vOfyPOEInVDzfkNNZ3ueHK7UmHU8XpTIXJ2s7mSK0GdyRtzWJEMG8ZX+iT1LlLtmYUeSfl64zcGHDEJooyitwG/UIJaaqVQdgeeWFQzUahAp0OScgPSieNtYp1t238hsy+CQrkj0Xqjs+G57MWwayhkMAxLql0HZpxUcnN+3lGffgt/gNiuS/jAxvBSzL6psaRpPyxJJKDOgT5M4xzB7D8Iow7Nq4=;
 20:aB4AVuXsdztEVPlTHi02paRAsb4bHC0wd0Nn0b/Nr/eRHL2fcEYWrjoWQN4HsQneBqxxgzfLYHgTx1QCUJL9ryDVWvhWL4FAHR2MD0HJa2pWPasd1rNKTfYiEesGM1ymrlLJkqXYW613IApImGvMBCYJsC40O67wmxrjnJnti+mr6mpaaD8TMZzApCkMY2u+TjFB5HfEklDZ4owUpKSozYej/Xtzkal8nK926N7XzNETQawR5814j6u0d0cBnue4erZvqM2RVTCTbI18apZELr0MLJv78XU8R9dAXUzkiDLm8PrtzNM6zMV9VZPKbcOzHtRlBqPI2hUXk2vwzKw6HlCCIQnaXV03rfKLhNLXAjAiJIHJA/jU5V/lHy0niyPfV1kfzRI5x+40+9fQLXMu5Crsrxt8hiEjMnz1iPGkYpSRtYuMRUowzhsJUd4hhyCdZ5Xg+RF052vqgxraeRyKLE/k8iAt22F+Sa1LWQUCk4UYrWGZMoDMO4xqJQ8svG3A
X-Microsoft-Antispam-PRVS: <CY4PR07MB309430E401A897167AD6DE82DD970@CY4PR07MB3094.namprd07.prod.outlook.com>
X-Microsoft-Exchange-Diagnostics: 1; CY4PR07MB3094;
 4:I37zHph4KbNE1ZgDOT3esRf9ELgeoJdefgVjmEczp5OnrJMy3m99zBiSx4MMbih++gxyvTDrZlTs0Owkmoa7hikMXnjj6D94GhKfgXx5nvSNYvQp3gXZ1dY8yp4oZMvP3dd45urPwuX9M5TyvQm7cWVnxBopMPGB0fCilYaGqWRFq9qzAGmoDlfrb7I3yllWUcFQBUBerSbLE/tBo2yOuBEzfd7v4cDmNiObyiWaEGKjaA4c9mgoA89Rrxoy26ujJf0DdbjaWaZ7JYl/Y7KUl+CWVxbdFo1cEzvdCjDPIvDs0r0MJ49RfrHncloSSJj1
X-Forefront-PRVS: 093290AD39
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR07MB3094;
 23:ArWOhHCmxMjnwyG0lD2wQrIf0TSsJTxpJYKj56Fue?=
 =?us-ascii?Q?oZKbVUddtYa+mnG2rjguEbyDozh4CSkkOvJZs+hg574D6DPsP2Vu0DdwH8eO?=
 =?us-ascii?Q?0DN/LhkklDx4amE0c0oUBimlR483C18XosxK4+dVg/ZQYxrGMN6aiZQkgt5/?=
 =?us-ascii?Q?qPWDrAemmtlegi+QKVlgwau4SOGiBT/GnTDGclf54wwDN+D5SWE+Eo42JQAF?=
 =?us-ascii?Q?TZDOnWVPgNjJFybMxx6GJQZv32Sm/mg9ranm735LNor6Oii7j6oi6LDcXUMt?=
 =?us-ascii?Q?ByJaccOmAJ18Y17O4VrH3ZnSEsRCRoLjZ9XPrHx4VeFriDWVsCka7x9uoJCQ?=
 =?us-ascii?Q?JVzDSc5aP3NDtYfDkuwMCdCYhNnyRTP/K95QxvT2vkA4Q+R/7HIZZfho7Ckq?=
 =?us-ascii?Q?KoWtn/WGDrXBY2TqcbKfVTzblQIFFt2iKN+/4dvEHotJVwN+OFS7JmkaSHxk?=
 =?us-ascii?Q?vhtNGqDsobtJeOZN3agsMQsX7fXDDnk1Ck2xNEkJPl+ZFiWJh+6Lubuf+lt4?=
 =?us-ascii?Q?AmJ0Cg6fgTZTlv0uWmKdJYRg28idCp2bXw2RBHF5uGdzvLl6A2KfuvjrGZCg?=
 =?us-ascii?Q?Rr6pGTOeDjL5h044IwlfwQiE7vS00Up22O0j7/Ydk09PXm8pPSIRPQPtUHcd?=
 =?us-ascii?Q?tSeoA4alfaYSSRNQgeR0xLyBPYrrJ0YDQov7b1wOFByuzm7O5EppKxfa8isI?=
 =?us-ascii?Q?1DehVMWuNo6wszD4bYVCVbTiZda93hcuRyLyhsmDLwT7/k2aTE9d3vdxTIRC?=
 =?us-ascii?Q?FGIk8mNucwoPIMnY2Qf+uZh+nYTsaxV6w5Q989S1NI2ZLVX+cim5vnRughUz?=
 =?us-ascii?Q?0vQ6ArRcfksIDNmJSlsiMq5hprLNQ8lVvk1gEokHZAGlQA7tsEvEfwtBConI?=
 =?us-ascii?Q?LqiyKgnFLKEodFPc0S/2E0+LPRTLdyfMr2g82Bukjdy6yxbe/h/sY7ickO21?=
 =?us-ascii?Q?s1MMuz0VGnlaWxVvRWMqloKNoE0wRNX7P0Y4WKjzLiJXOkY/VpALqUhOKKfK?=
 =?us-ascii?Q?lzIV4sjtPT+5cBDCjXv+s8oMPTWmVxg2pXmKH/XkAsNz0RhyFlTUuhY02Puv?=
 =?us-ascii?Q?/uJA7qIRoGCFDWVDqJKUrdc1Of9L9+tmY8/FNdRCuKzKAehBA=3D=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: hKdrMVTX6tzBvnQhluvjkxPUHBiucz8wflOu2u6XDflVB3xy5uUNyRA+uEQ/OtnpMQKMyf+DLzGhcXjO6Pu+UDDR/GWhySlekAQVpC5fhpWfqLv1n9dpTvLFiGPmHuSv/FmeDslj1cyTCDOtj0s+d0j6ijmJ4y/lCe40IzG3qIvDpEMvBMS794tgT7qYYEyNvQ7zjkH6KWPSNVrH6U/XFDD5DIjhAqMwbFZ92vBVqBKYL3n0IplJFDnr/cVqElXAx4Wpy2RtMDSR9DUK+FdIAXAFoX9mcduzW1d9rH/Lce6fxgbYdDvngGAHDCOMnGOKRkEXT6Gkev29d6Ku2ACmA5yNCsQyZK6KaLLmy703o2Qvd+dhLgsKRBM6jLryeTotuRbqJy0K39Vhmq8l82x/1t37WaRIFt90mUcAl/97TMk=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR07MB3094;
 6:5DT8577anFwI4AHa7hQMdw+VK4Kz6oDtrHIzGgqFmkmWUl9Ue3NvW/gxOwdfPHBQhrlh2twPDaqia1UHSQltlRzcRbVwku2uDQ0ywG7tksQm2ENTVixvVTHdO+b+COGfdKpfp9GfPcEwMXexfFi+ZDYfuUhlz5B0MA8sPg9bz+qYq7Go3jv+FuN6rUgCSDyLpmcCPkigaYdW6rXSk2Y7lPL0kW57DPc48PcjjDO7WW99tVyfDsfXspoNytfWs5MHQJjiOKaQ2+FseMJiq9PsXiUb7Z3gtk0UrgcuKoifZqcg7Gi5AHLHZDm7YtLI/Ydd72l0YJn7LiZ4k11KBfBmyF9gVTziPVGVNhFJxHa3eC5k3/6jkKuIKnpZYdU+BG2Lyj1q5SUuxh+wFZ2krfHxt5mDC8ZSMERp5njp7Jkh41dvk4ux460BocXT/O84f7TZuCMRSpefACTPaGy37cMA5A==;
 5:DYXrmkIePFs4CXMnD4XWp3AaPJHCEmY593kI6gzkadmfviUgB8pTWfMkY8o6VWZwfGFOTigHrS6KUke3PJCXEcT+ovIMRThuqbbRUiUsCYOySTNox277yjUFMkgSHehWEiwm2qejApJrRoLcbKP6umBJq71p3ML4qFRn1wN9AmF70TCFHPjlae5mH9W3cUFC1twmOz3bUEvVwkKiKqw9jQ==;
 7:JPeHQAea2mGPtxCSMzt89aHHdz6MTznAxnvHOrbYlryDYDurAIRZWddp+2agTtCqmKpJeQSluvtwvUWEOLNsSrfd/b8sZyIS5CLidaGPnJpiwCmmbNz8/fJiw5jslf3LlbBIWhh68z+VJto+AnoQRQ==
X-Microsoft-Exchange-Diagnostics: 1; CY4PR07MB3094;
 20:lQOEbXzwx5AWGpUoiXQjjrPUgwHD7W6dc+2q1rc4/SYAd8rtci4T9fh91XLCQ3bBGFQ/8H+r9UWxWfEcPKOvAvWE0KshL99AI5a0XMlASwdkGcv1BbYUQ0kBS4Uk65CsIdFBGsom9vjgmSNMuIlejZNUaUWPg9f5tYSALdHn69NCiLSXRFho1GckEeRFDT5rN8x6YO4kzIDpYrKK2zC07+GTLFPPi+dZe7aWt8XBfrUN4BW8+EeE5+GbFiG1ev56
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2019 16:07:01.1076 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e6ea92-4bbb-490c-2ff1-08d68603cdce
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR07MB3094
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-29_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901290121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_080737_922955_81063B0D 
X-CRM114-Status: GOOD (  14.89  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Boris Brezillon <bbrezillon@kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Richard Weinberger <richard@nod.at>, Stefan Agner <stefan@agner.ch>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Burton <paul.burton@mips.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Dmitry Osipenko <digetx@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Piotr Sroka <piotrs@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Driver for Cadence HPNFC NAND flash controller.

HW DMA interface
Page write and page read operations are executed in Command DMA mode.
Commands are defined by DMA descriptors.
In CDMA mode controller own DMA engine is used (Master DMA mode).
Other operations defined by nand_op_instr are executed in "Generic" mode.
In that mode data can be transferred only in by Slave DMA interface.
Slave DMA interface can be connected directly to AXI or to an external
DMA engine.

HW ECC support
Cadence NAND controller supports HW BCH correction.
 ECC is transparent from SW point of view. It means that ECC codes
are calculated and written to flash. In read operation ECC codes 
are removed from user data and correction is made if necessary.

Controller data layout with ECC enabled:
 -------------------------------------------------------------------------
|Sec 1 | ECC | Sec 2 | ECC ...... | Sec n | OOB (32B) | ECC | unused data |
 -------------------------------------------------------------------------

Last sector is extended by a out-bound data. Tha maximum size of
"extra data" is 32 bytes. The oob data are protected by ECC. If we need to 
read only oob data the whole last sector must be read. It is because 
oob data are part of last sector. Reading oob function always reads 
whole sector and writing oob function always writes whole last sector.
Written data are interleaved with the ECC therefore part of the 
last sector is located on oob area and the BBM is overwritten.

SKIP BYTES feature
To protect BBM the "skip byte" HW feature is used. 
Write page function copies BBM value from first byte of oob data to 
BBM offset defined by manufacturer. Read page functions always takes 
BBM from flash manufacturer offset. It causes that for not written 
pages the proper value of BBM marker is used.

ECC size calculation
Information about supported ECC steps and ECC strengths are read 
from controller registers. ECC sector size and ECC strength can be
configurable. Size of ECC depends on maximum supported sector size 
it not depends on selected sector size. Therefore there is a separate
function for calculating ECC size for each of possible 
sector size/step size.


Piotr Sroka (2):
  Add new Cadence NAND driver to MTD subsystem
  dt-bindings: nand: Add Cadence NAND driver

 .../devicetree/bindings/mtd/cadence-nand.txt       |   35 +
 drivers/mtd/nand/raw/Kconfig                       |    8 +
 drivers/mtd/nand/raw/Makefile                      |    1 +
 drivers/mtd/nand/raw/cadence_nand.c                | 2655 ++++++++++++++++++++
 drivers/mtd/nand/raw/cadence_nand.h                |  631 +++++
 5 files changed, 3330 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/cadence-nand.txt
 create mode 100644 drivers/mtd/nand/raw/cadence_nand.c
 create mode 100644 drivers/mtd/nand/raw/cadence_nand.h

-- 
2.15.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
