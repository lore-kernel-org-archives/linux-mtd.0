Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3D1C9832A
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2026 06:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8VWU2NKI4O9AEiiYkSZEpqPsziGqldJ+im3ESO1Mvb0=; b=tosRe1aVw6zqXY
	n3b7hRerK8e/wm/s03p+FhZU9Y544z1YX/dzuG8e38r+MciTYh9NW19Y3G2MH1owJJofn+jPHJTim
	MC8toMm4HMWfVojDMTacUQ+s6JyvcEIC4Oc9KoMVNn1zLdHwfcr9P3HwgTcbEQGtefkHqc7eVO6vy
	9j9o0p+xW0RYxtJ4aHVXDFNE3cDUroO5+4NguMj/4e6A10C1tuAoJuTk+LDwr/PZUqjsiJZxRVIh9
	gVJuy1qeOShJsaKnqJmaQPJAsJR2xQN5cIaGLHdtk0o8muTEOTq5MBYFc+DCFxsEOYJ7kRuJHlSUE
	W+E7ygj7DJv+ZsDkKaeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRTJ-00000002VEc-1BeH;
	Tue, 29 Sep 2026 06:37:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRTF-00000002VC5-2Pcm
	for linux-mtd@bombadil.infradead.org;
	Tue, 29 Sep 2026 06:37:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=/pWq2Ra5ZjTS1UiErN6wNfvfcfBgUeSE6Q2qpHAUJSA=; b=IHsOAClmSjduy61n9x5lTulsDf
	HrGS+G2iEGhg8lI+otQebbS8VQhkvCvnWuletfeMzJ1vn2P++YASr7FZvn2JAgYLqf+ZcEwwMfChJ
	rfsP4WNb4nJyPet9oUJEDiVXpaH1AaEQZXzeG8d+4Soi8VhklP5czMLtSzpDOZl6U7MXxYpNqRzKX
	q72yZkfSfADxh+bp30lO9FGvT56OD8Ka2DGeu0jAfxB8qQktEX/6mww1Bv4Hj46GXijKzC0ThUyv+
	3rsbXTtkoD5O+tO71Ynk1CTEH3moJKoZq6U/bh3FVsg9nuqIVaeJPuhG2h57t7/leRfsXd+qJY51H
	dPpXxnkg==;
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRTC-0000000BGTs-2cMy
	for linux-mtd@lists.infradead.org;
	Tue, 29 Sep 2026 06:37:44 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T46QdA3284093;
	Tue, 29 Sep 2026 01:37:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=/pWq2Ra5ZjTS1UiErN6wNfvfcfBgUeSE6Q2qpHAUJ
	SA=; b=NGYXoh6D7qWUDBw1lOyoDZjgWilkhGYCSbykx4KWEozqDj1s/mp/IfvGu
	1orxSX2ghu8I8QTHk0mUDURzOelMRaYTsFBHvMrzSPEoQu5GfvNe+TsnskSQjvp+
	NJ9bPNPwWhP8uufPfPZrmMdnG1frnXDLpY5NWy92im+Qr2bCiV/8Jc6ZepkX07S1
	KhQK6nAmhKu+FtaAcJ7Id+oMHecjwfwDDsJNcR6QclOAahLromZ+mOLuclawI6X/
	XVQXkYuiv/TplUYSj1kCPOq2uegXOAl6W3vcbCxNa/Vd7OMed7SLczeVd040D3ja
	jTD/qi4/dAwI7LC8w/enZUXdjWdZQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012026.outbound.protection.outlook.com [40.93.195.26])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h03ad9q5k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 01:37:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RD70XMgU8kGROQbc4w8oJ8hqGs31VXlu0QTiFkqGwiAud1Py2HJhv3ici3qcfc09+DaPeUdihyLeFnTJuOUWVSH1vdo3/YzwL52G83tEJk6gT54MCB6/pTfpqhzIIHnHLbyvjNQj4PQehI/71oZ2i5BWrBJuMkmv5m2k6sW8O+T9MVY3LKQFfZP2Vz4mG8YpZEOYtUPFqC2XvrrXg3V+ofN53FmN78U2hEQwTL6gPXEM8iFwTrUhGIjHDYImKAGDOrCz65TUqpGobiX/tpR+vXNRWamAwWae00gd+2tKoMTSSZ4V4e0KLKVC16jfY8rXWD9xhSQqDWYxffO07IptZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pWq2Ra5ZjTS1UiErN6wNfvfcfBgUeSE6Q2qpHAUJSA=;
 b=MO0lB+HIgLOM5qCEziOObLgX+9FCicT8TJv0vFetKtrnhoG2xpzRvOtOF8PgnL2ExU5KKN4aPhecPo0LgNaQyar281wYObIM9eJXTmIcAVPhjg+qwbgh19lRjxfkwldYwUg/PFlxtrZL+oFlNGcsMFh1ni59W07fRG8kMA7XOasXA2q8ideY64YvemoBhknfT3/VuU8ph3t5PpCf8O02XHn2DL0iLW2cUcWqKSnBQ2SSNFgAESqCTTjBIFXzt0Qe5/mQMZsXsk2N7NeAwRFjpWQDpNiTA230Rjzp69smEvctL+W7UcfCM84hsEXsCqp2NjQTxzoJtXok+Dqy76jWSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pWq2Ra5ZjTS1UiErN6wNfvfcfBgUeSE6Q2qpHAUJSA=;
 b=H4JG029j/GVVeP006yNiufBT9giIwfDK7w0JlgnKAvXAeL/iCi4ZIXdRhwVDi2x63C0IAGdXbfFe99xiJAjZhJzyMyVdRz7vnZUWHBpvxd2RGqr9+COpkgXFEkPjoLo8q+JXrU4fussUcFShiMr0NXZezGId1ivKktH2nzOwKIU=
Received: from SJ0PR13CA0194.namprd13.prod.outlook.com (2603:10b6:a03:2c3::19)
 by DS4PPF5F7E4AFD5.namprd10.prod.outlook.com (2603:10b6:f:fc00::d21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Tue, 29 Sep
 2026 06:37:34 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::18) by SJ0PR13CA0194.outlook.office365.com
 (2603:10b6:a03:2c3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Tue,
 29 Sep 2026 06:37:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 06:37:34 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 01:37:27 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 01:37:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 01:37:27 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68T6ZZnJ1395904;
	Tue, 29 Sep 2026 01:37:22 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
        <takahiro.kuwano@infineon.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <praneeth@ti.com>, <sebin.francis@ti.com>, <u-kumar1@ti.com>,
        <a-dutta@ti.com>, <s-k6@ti.com>
Subject: [PATCH v10 19/19] mtd: spi-nor: reset max_read_op frequency for security register reads
Date: Tue, 29 Sep 2026 12:05:29 +0530
Message-ID: <20260929063529.1235417-20-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929063529.1235417-1-s-k6@ti.com>
References: <20260929063529.1235417-1-s-k6@ti.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|DS4PPF5F7E4AFD5:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e3b7e9d-54f4-4df5-3601-08df1df42538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|36860700016|7416014|1800799024|376014|921020|56012099006|22082099003|18002099003|10067099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: k4NJKQcrPLwE3VLZ+k1eBZnUHK/xDdRGZmkv2I1jFkJVmY72Epl6oQUuhWTQr9MXqgt7KrKD7cZdU6XadgmDGR8IIJSMNL8AIuqnKAlrjKVzpa46IiB2q77+44KCtMkIisR/2KlycMsmnEFpz+N/jsonqHxamRP0ZemljtNcW+rz7ZNRAoEBn4tl2OpcrsZ13+hadjY+PvnAWOCeC3h6NKhduyEVxCORVUDMxghC7fhOjXPwznD1BCt73GFSXgfK5uNpeha8IQzoRW5r98Gq9GDK3fBnfRq3ApjpKdc1QLR+JkHafcwJaaL/ZA2aAWaUDiW+xezc/D+mGwDL8jMU37i2yK5lVI1yrCVBa6YzFLbHZTaWS56BecmHcGltMdM6Su/DK8CMIIQOOmJE6RGq/IvkA7tM+9Hl1z1SQciZTlC2S1Wm/UCBlr9yEPi+iYuFofpn8j8QCi/H24lY/mtpNn6+bO9DoKIT755sdHd+f3+fohP/EAP6lORtWXECOjcwHWC9TNGdMvhnSm0nP6ZvINMWssp0ImKJkn7GAJ+VDclnIK+AXedvGm0EWf4ok2T1G7ppILN1BKxGYU6/QtjpgM0J8dDj5rFJ4GPBwPxWBpDPBmyVpyyVndRmzdo2/XlGrmBVkd+2P/6DOO5JUUzxPl5wo+Te4JbExhpcyW052ele5JGGDFgCy8hI8qnL/KheTcnXWp0cVDH8uFlSaOeHzw/A9d1zoukCrw9FgiIOTyGyTnylxbzh+Wr7dnUpw5xX
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(7416014)(1800799024)(376014)(921020)(56012099006)(22082099003)(18002099003)(10067099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Byt/AcpnNeN1n94sYCKGTbQR/6kWn0jPjH+3vYdtcBHhEk5dv8uJ/oqfgjDG1Nu929sH1rzPXZUSzkDQSRqggxDvkimymOk+enr84qo+IfOfGpcbQobRJdqN2COS80FRMKTvnA47NxhS0PEKzs8yazVPB9H6CIpisOblGeTUyYM3u+7MPdo3cA/C1g43rRMiJhSPySjEXpLum9IfHhwrZ+UnUR+m1RVs91VG5QG1a9zKxOAyTt+mSLiC4v93ZDrw8zaNhJu5BzeYogRpd56mlb/niczaTacyZ/vIUmMIFQLrcW4cGSyKsDDJPzXEAdgxAxW4sAKdVWuuo7Uk/M+EskwKlUf+OryGY35xlfRuhvU8RfrTRV2hIHVubNJfE8yAhCZSARj4bh3mPMjG4YjUrk8XbBPjLyTNtK84LChzCINioVeJmXCbAHH2y9BUWczB
X-Exchange-RoutingPolicyChecked: REe4CMUY9sqzZ6vVjZuTsJBYKhoK3AfP6x+QUkOB2bVkLc6jltymYemWLIbAXbp/Ry4HiEigPx19WnLoRdGUv7h+VKYqgdBF6bmin7u9MG9I1Uf+jmw22c0kKE4+1vpb0sZrXbxizVMtX0TZxtY9q3Y6ICd6ZbJEzOHK+r7k5br63BJyuKF2Obs3NaDKJuLjxoFs96Q2ZcPlxUPdjeTQW1/PUQlzdsZxhjGmCtVFqpXqNP8ltYrG2EviOwqYGwwFaN33ham5PIShb5s9XHXoAqPtr0WPRZun3tMBUIlUzikWAc4qFM8MkExyO8wjUvhycWE0ZS6wxq48Hn9vKicgXA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 06:37:34.2262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e3b7e9d-54f4-4df5-3601-08df1df42538
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF5F7E4AFD5
X-Authority-Analysis: v=2.4 cv=c94+0h9l c=1 sm=1 tr=0 ts=6abb5cb0 cx=c_pps
 a=d2CTHFLGvf7JoJ8RUfZBgg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=lYk-SqIzvLeQdPIeDaAA:9
X-Proofpoint-ORIG-GUID: c1JK45aCMSWfAiiRwBCeG3BSuwk8icBJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNiBTYWx0ZWRfX/hzwZxDZUWRu
 QHXlY6b3TFHG0bdHQd+Aa0eiwhojpBKqhulGQSJFhYnWIXpxPfi3l3TLfcjbzPwcBPAWJEcLoDO
 FhzkvEzkm3tgaDNZq1ptKo9LNp6/rOwB+imIS1VmWDgFWsngJy/ZydiYyede4vK8bT0pxO97opA
 BGC5n+ZrWLPM4thpyCoyHC7sD1FCncjzHG8nqo116i/rSux9LZuiDzbM3DVnPH2slFbxRKrfXuF
 NiLNeFOS4xfIrKEQe0/aZt9t7EGFoHFSJNbpd5dmFMpe/lmAeU7cfHMYtT+qNewkXBjDG1z62/e
 6eDg/65LHk6uUghRYN6CGiIRdo1aH5G+gna2OgNrrXA/abWQnpsw/v3qKfChj2LhQePOmDzB8B2
 KsdMHzEP5btk4c5gNBnruGkBcsob0u4ZWsKK22OsVqWPC8AHS2Q7ZgLX+wu8rO0aIDYde4OUSFE
 EtDp9SfldOzcluDhlsQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNiBTYWx0ZWRfX+X1J5+r4A6KG
 R5ZqoLggpNAj/cSc5AnHwFYZKdnLTOdGmR9L4qCJTYWUAclRHp+SRkgzCVnjnznXx1K7NzhmRjC
 Z6deDL0qJJJ7TCSnN+SuqtO4nMLIdyA=
X-Proofpoint-GUID: c1JK45aCMSWfAiiRwBCeG3BSuwk8icBJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_073742_945478_7703CBC9 
X-CRM114-Status: GOOD (  11.52  )
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

spi_nor_otp_read_secr() temporarily overrides read_opcode, read_dummy,
and read_proto to issue the RSECR command in 1-1-1 mode, then restores
them afterwards. spi_nor_spimem_get_read_op() already refuses to
propagate the PHY-calibrated frequency onto an op whose protocol shape
no longer matches what was tuned, which covers this case: RSECR's
single-wire SDR shape never matches a tuned high-bandwidth protocol.

Reset max_read_op.max_freq around this call anyway, following the same
save/override/restore pattern already used for the other overridden
fields in this function. This keeps the security-register path's
safety self-evident at the call site, independent of the shape check
in spi_nor_spimem_get_read_op(), and keeps it correct even if that
check is later changed.

Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---
 drivers/mtd/spi-nor/otp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
index bb9a801b3ceb..9a25953f5ea0 100644
--- a/drivers/mtd/spi-nor/otp.c
+++ b/drivers/mtd/spi-nor/otp.c
@@ -39,6 +39,7 @@ int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf)
 	u8 addr_nbytes, read_opcode, read_dummy;
 	struct spi_mem_dirmap_desc *rdesc;
 	enum spi_nor_protocol read_proto;
+	unsigned int max_read_op_freq;
 	int ret;
 
 	read_opcode = nor->read_opcode;
@@ -46,11 +47,14 @@ int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf)
 	read_dummy = nor->read_dummy;
 	read_proto = nor->read_proto;
 	rdesc = nor->dirmap.rdesc;
+	max_read_op_freq = nor->max_read_op.max_freq;
 
 	nor->read_opcode = SPINOR_OP_RSECR;
 	nor->read_dummy = 8;
 	nor->read_proto = SNOR_PROTO_1_1_1;
 	nor->dirmap.rdesc = NULL;
+	/* Security register uses an untuned 1-1-1 protocol; force base rate. */
+	nor->max_read_op.max_freq = 0;
 
 	ret = spi_nor_read_data(nor, addr, len, buf);
 
@@ -59,6 +63,7 @@ int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf)
 	nor->read_dummy = read_dummy;
 	nor->read_proto = read_proto;
 	nor->dirmap.rdesc = rdesc;
+	nor->max_read_op.max_freq = max_read_op_freq;
 
 	return ret;
 }
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
