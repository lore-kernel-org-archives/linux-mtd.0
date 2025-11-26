Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDC8D1038B
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Nov 2025 08:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o9R8sU+aZxmEe+ocGtrtit7BFHTEfnBfU7HhcItTEpI=; b=cIqA3yR74kDW6a
	sjT7XmlZUePIggSJOG+MMOO/poCMezOrK/VVzuRLRciuPYTgOd0ov4L1p2HVVU/xn4W29mEVsyEBs
	+nmQDch7fyQgsU+yZN+gPvjYr9ArNybMRt1/81oEOFjmx7W9r9wwgOv9eSN6jctI9aPhn6kLOtXhj
	7VUgKTzaY96H2LK8yxbTx3cYRyBd/faXq7uH6X0cZQyDFitaH0XvWzY+Lq/qQZG4phFwBwuLwJul4
	h6z5ELYG40M5Ae2UsMlQaSIAau5NYfnGnagmekwK+RKOA1l7KzM1yMMB47jgLyBHKwj48HE3x8yb9
	ISUmoW4+9go59NzLG5Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOAXx-0000000EZSi-3BuI;
	Wed, 26 Nov 2025 08:06:41 +0000
Received: from mail-westusazon11012044.outbound.protection.outlook.com ([52.101.43.44] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOAXv-0000000EZSJ-2wXd
	for linux-mtd@lists.infradead.org;
	Wed, 26 Nov 2025 08:06:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KoLSVfsROenynqvKOJwRUs1e723yhyUStVzI3s8dNlZ9jn3EpFlCXKVqJAup8mcBgURnUZf7LufRfRHJJlwJ+7289hXfaxLZTLrKbfXrwWfufU2srxLUeqwQ5EyFwM4vrggCYEDpM9CsLj9hSbs+0GRTnEuxnN/VgrE9Fv6B5Zv7J9lxNwjetoSmXkMD0+tw5gFm4bporpgYLZcXXEz3NfSq99KtrBYzFMdSYmL8uC1Jt1Bd+b/S2iDVd7/BYY+BczTWiG3At8KpyRsZNw7m6usZxeq306mxCQDhZ9KKh+eIx17f8uksGdGW1w1psSWkS59Ahw+vrbv8X3MyB1Zmrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YQ6NmaUoe863Y8nHDInUPjBSoutBpOs3IM2U9InnNA=;
 b=gsVNuCMEjJcFlbZy8xdBPo1gJwkvK951S1KH9tk7eh7hnVHxodjOxrwxVLe2blLv50zEI/gtFNJ4KDergj2lHvA5ELOGQI2AhnOq4F/fnm0H6b7p0stDcmMGMZwExcU3+zO9oJY2kRR1cM89cwG5csCUSniBnfz/B8N3gwUxEof1e4CliL1qB/xn3eQqSWMplstmQbB4eiPE6tJFiarmsGNgdpDSx2VeHZ1f+uNeuIM/DOUBBwwYypTS+WG3EaBPlFT40uSNhMfd0vqypAyT1MKkCnAI/Lx0gLs3QtZ72OwgWPqQyi2VXSDegnCaE5gTYDiLA8Oq/vD5BeCPyRIDNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YQ6NmaUoe863Y8nHDInUPjBSoutBpOs3IM2U9InnNA=;
 b=Q+HdWc+5QqoQqCuBBRefRYap6gHoz77qiTAnO3ADeKsLDj9VqOM1XmF4jCQXqLsqFmfldvhC3BRjY3C8ijV68XnQCqiyLKdJyj6IUlceyZsd9FGdTDRHe+decyaGdg5a7JvlolI0Zi3hHr8SKXsW+iNpSReH6LBwm2lt5+dgFeh3D3UMT0NyvDovGwWrzpdCOZ0cjJnSaxbF1wHTLw/Ox/EQ9ZL7q5QDpnmBg50XBguAq2AGR8m+JI02KcXakXw1LhXGlTqoFwC6XsB0ofniCbTHRs7EtvslNdsraCPX8BxQYjWES/YUz6jm8sibtTxoGfeqiMuS1TYa6yWa+CiTAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from MN2PR03MB4927.namprd03.prod.outlook.com (2603:10b6:208:1a8::8)
 by SJ0PR03MB6581.namprd03.prod.outlook.com (2603:10b6:a03:393::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 08:06:34 +0000
Received: from MN2PR03MB4927.namprd03.prod.outlook.com
 ([fe80::bfcb:80f5:254c:c419]) by MN2PR03MB4927.namprd03.prod.outlook.com
 ([fe80::bfcb:80f5:254c:c419%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 08:06:33 +0000
From: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Niravkumar L Rabara <niravkumar.l.rabara@intel.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Khairul Anuar Romli <khairul.anuar.romli@altera.com>
Subject: [PATCH v3 0/3] Add dma-coherent property
Date: Wed, 26 Nov 2025 16:06:21 +0800
Message-ID: <cover.1764143105.git.khairul.anuar.romli@altera.com>
X-Mailer: git-send-email 2.43.7
X-ClientProxiedBy: SJ0PR05CA0202.namprd05.prod.outlook.com
 (2603:10b6:a03:330::27) To MN2PR03MB4927.namprd03.prod.outlook.com
 (2603:10b6:208:1a8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR03MB4927:EE_|SJ0PR03MB6581:EE_
X-MS-Office365-Filtering-Correlation-Id: cab4027a-1cd9-4b0a-9d76-08de2cc2b613
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlRtMkRBRHo2a21YWWZGT3BRNkl5ODZQNEdWbjhCcjNaZnRQbXBnMXNSSUI0?=
 =?utf-8?B?bDlvb0FnWEZEeFBtUU9XVDQ1VHZjQTVNZFpKOHZ0aHVYOFBSU2NrM3JjZndj?=
 =?utf-8?B?NnM0RUlzZGpodi9pcFJlMHZmeEVuaCtTUGUyQUZiZmg3cXBmL3FXQ0hZUlBq?=
 =?utf-8?B?VWxyK01hbk9XMVoyV1FuMmh5Wml0NTBNVU1KbTJKLzFBc3U5RFIvM2lIMStP?=
 =?utf-8?B?eWlteTZYeFFnVzhMVmFaY0hUazNJK0UxR1RCeTlZNUo0UERiNm1kenlndG1U?=
 =?utf-8?B?UnZhc1NnM3JtbnVDNjg1RmVYVEZ5OGVUc3dQL20yaVZBR0RYbVNMNFdiVE1C?=
 =?utf-8?B?N1Z0Q0dCMTR6WTREaG8xOXk5QVd4cFIzTnQ0SlA1V2Y4amYvUGd6SFhGVC92?=
 =?utf-8?B?MzhJL0RuTEpnNUErZDlCa1hjellOT1VmVTZZY2dFNFlEdmRiWEJVT0pGeXdN?=
 =?utf-8?B?bUR2YVl5ejRZbWRScWE2L3d4QTZobFRSNUNLbVZNUmhlYXNEd09oV3lhYXJF?=
 =?utf-8?B?MytXS2ZkTXZqMHJsa3Q2VlB1TzEwOVlMMEtDbG43ZzNWNTNFSitRTTN6Z0la?=
 =?utf-8?B?bWI0czcrWllzSndaMWV0bTZUekVXRUVnYlJ0WTRHYXFNb1Zia1E2dEwwVXZU?=
 =?utf-8?B?aDlmN3dMSDNLaCttNlRMOWZLSnNuMHRoZXdta0tPb3FqQ0xQdEZseEVMczRv?=
 =?utf-8?B?aDZQTFhEekYxelpFVlVwUHc0bExiSWFjcmgyNGRPMWU4VS9JS2JDbGIyeER2?=
 =?utf-8?B?bjNvaGR3OVFSVG5MOUpMOXY2SnlhdUV6TDVNc3cxbnlMOG85VVVjdHgrcXdU?=
 =?utf-8?B?SW02UTQ4ckg4UXZqTFk1bE5pbUdvbDlaTnZyRDFvZ2ROUWNuTHJja1FCVWN0?=
 =?utf-8?B?S3FCZVU0K0JQdm82L1k2a0Z4SWdMZHlzN3VVcmdYQVo0MHVrY1l1dU5uRG1M?=
 =?utf-8?B?WEZPWGJHUzZ4eXdWbGFWOENKM3VZdHRrOUJzbmIxeGRhN29mTm9UcVJ1NFBU?=
 =?utf-8?B?SURsZkg2ZVlCSHluRXNyL3dEcUEvVHhSQXlhd2tkRlpndU1ucEVkUWh1M1Fl?=
 =?utf-8?B?Y0tvUmZIOVdPVUNkZE5aajFlLzVhR2pZRHpoOXdpbXlKaG9zWHBXcTRPNkg5?=
 =?utf-8?B?UmNrOWdaN1FuYjY5eFBaTDdxcmJTVGxoNUovYkYvOGVjaXg0NWR1MWU4ZGgv?=
 =?utf-8?B?S1lSUEtDNVArclZITFVwRloyV3hZR2pURDNQZTlmWXQxSWFmUDY3dG5Pd055?=
 =?utf-8?B?UDcxdnhwTFpSYWZsL0xYcHloemQ2YUhZNDN4V2gyV2dJekk0eHdWZnpYRlRj?=
 =?utf-8?B?NjlvVVlJYVJ1SENTM0xkOHFkTWVranhnMk9DdXl2KzN4aW5KY1ArQ0p6TjI3?=
 =?utf-8?B?VHdaQ1RVeWtaOGtFczROUGI4bnJlQUxpWnU3dVUwNXhLbnZzK2wwbXpPWU5l?=
 =?utf-8?B?Vi9DVVNGdlpaQjkrNmdhN00vN0xHTlIxdXJ5empyVE9XMEo0MVVOS1dPMlhB?=
 =?utf-8?B?bjZ2TlNwdjNONERQS0dUNHpKYXZKT1pKUGVjSW1SOVptelYvMGhVZWxTekRk?=
 =?utf-8?B?S2JSZmJCV1JaZGlMRU1Hb3U4Tk82WUw1eGpkN3BZQW1FOFZzTmpsdE0waG16?=
 =?utf-8?B?VnR5aGkwTUNEZUpSTUZqdzdIU2MzTHpyR3libTFIZGUvei9nQnZCZHp3SkJm?=
 =?utf-8?B?cUpuUUROZmQzYzh6Sld6cGlrclVIWjdDL2VnTEFJNjA2K3pIQkdrMVVwcTdY?=
 =?utf-8?B?U3ljb3dlSkt4YW1XQ0RpVTkyd2liNVJYVGZmOTh0TXhhZ2dxVXgyS3l3dFF4?=
 =?utf-8?B?amFrT3lvZUZ1K0VwQXZsbjh1ZEwrNVExbkZVSStpVmZCYmMvSUhUY1FxZXR5?=
 =?utf-8?B?VWJQaklxK2d0YVRuMGZOTDhCUUVmVkp2dlRNWGFETC8xRmVETkYwa0FUVzhh?=
 =?utf-8?B?SE5semY0SzRtY1NQc0NiRmNZcUNUNnprM1lNc2dFZ2RtQVE4UVZkZkNzVXE4?=
 =?utf-8?B?ZjQwelB0YU8yaUp4NzhUV3RLTlF4UmM1dlVjclRwUnh2eUpoWjNOOVF0a25W?=
 =?utf-8?Q?SgSWnI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB4927.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2s3TFk4QVY0cE1HYUJTbzl3VVNaWEtvL2ZjSHR4VU1TdTFVSzJWNTJCYVhU?=
 =?utf-8?B?djRDTjR4RFkrWm1rNGI0VzZIbFFhbGZVVU0yanZsUUxtSk8yLzY2Yi9nWWZv?=
 =?utf-8?B?MkFQTnBtck9hL3ovZ0xGTXpOa1FNKzJLemVWbGd1a2ZILzd4MnAwZDl6VEhL?=
 =?utf-8?B?TzQyZldHZCtDV0hBQVZYVHR1VEQxdGlXQm5mUWRrdXprYkZWTkJJRUtaWVg3?=
 =?utf-8?B?M1Y3N1hZSDIzcDFYVEtaYW5CSExBMHhzaGgzN3JmNDJHZHhGSTBwWXdZejNv?=
 =?utf-8?B?RFk5cTN2RFZFUGpwamRhVDFkOUM0aHlkaWZ0R0ZPOEl5K1BpbFZrNnJYcXoy?=
 =?utf-8?B?Rkc5UTZxTEZ4ZU9JaE5tUjdGTzVlaE9CK3BHNTc5SnRGZXljdGlZSlJZMzF4?=
 =?utf-8?B?L09uZEs2SXQ4ZktXQnBiWUdMWkxnQVl3STZSYWNkRWxlOFJKV00rcEVTcURX?=
 =?utf-8?B?SGtsZE5mYkQ4NElDM0dsM2svVGw1ZHZHZGd6cFl3bFhjTEp1ek9NeDZEdWhh?=
 =?utf-8?B?NE8wQlF5a0Y4dEpKck4yVzBkcHZvVVg0bUlqWHlYRWd5TnlzazJPNi9acHZh?=
 =?utf-8?B?ck9mbFNvQlRSZGEzS2tHbExrMjh5TlNOc3QzUHhRS2k1eW4wYnI3UlgyMWpX?=
 =?utf-8?B?QVFiU1I5TXFKZ2gxQTRPNnkvWTRsNUE3NHpZVGJ6NW5yTUFSN3FUOWc3MGNa?=
 =?utf-8?B?VUZlK1FxZWZxSCt2TGUvSDhoNFZpWEw3R3BZSVhVVVF0Wmk1NVBrdFhueTdB?=
 =?utf-8?B?eGcrRm9VMHlXazFOdE1zeVpEVnJyMDM1SGN5T0ZqOEQ0SmkvV2pjMWlsQk9W?=
 =?utf-8?B?ZmVCL2NEVGIzM2VsSFp4OUFlbmpiWmJHaW9Cb0VyL00ycFFhdEJkVkRydGh0?=
 =?utf-8?B?Znc3UnkxUmdBVW9KdWJ6cTJsd2VjOWFTQkk1UnA4WUl2SVFiL0I2OXUyQXY1?=
 =?utf-8?B?Q2djY0pMaFhFOHk1dHJyLy9IaFg1VWhobHV3RTZMRFVTcGU4dURYWmJDV3RU?=
 =?utf-8?B?NVZaYWFzL2xkR0hxUi9nM2hUM2xjWWZCOGlqOUxtSmF5b2pKTitOMFFqaVFs?=
 =?utf-8?B?dXZpamhOcGx4VDlTMEgvREUrM3lna0ovMEVhQUxaVjdyaWJqQnRDYXBCN2dX?=
 =?utf-8?B?bjZQaFM5U21LTzUwQmF3ZWdQM1RVMDZVY1dzSjhGaEpZVmJoOG9QKzZZbnZz?=
 =?utf-8?B?Ukc5enEvakQyNG5FR0RrQlgzS3JTWVIwaVN0cE1wdUp2alRnV0xyc3VJRlJQ?=
 =?utf-8?B?OU1TVklrcWhtWDVxM3l3NDBDTEN6STk5RW8wakhMWW43dWdBQ1V6aVRqdDRo?=
 =?utf-8?B?cnlKNXZNbjhyZzBBd21qU3Z6RUJzaEg3U002TCs2OWxkaU1nM1BDUytiUnox?=
 =?utf-8?B?VVBUYkZ2YlNGbCtlYW1Vc0lVSGIwbGlUQ05YWlBDZytWWldrTUFVQVNBV1Bx?=
 =?utf-8?B?RGQxU0RIYkNQSStuaElpdWtVU04ySVh3dnZOMGJ0QUZaV2NRZXBsYi96Mkxx?=
 =?utf-8?B?T2M5WEZmNXNvZWMwSFdyOS9XcmhqbEdOWnh0WFRuTHA0UFpIMGErMy9pdHVH?=
 =?utf-8?B?L3JuVWVEWE1zOG82Zmt2ZHJuV0JNNmpLSGVsODFReUx2VW1nQUc2Y3MzeWZO?=
 =?utf-8?B?QkVxTzU0WW82aVJQNHdmamV0eGtyQmNkaFlIMEF3SXRWYVdhYnBzYzRQUU1X?=
 =?utf-8?B?dWdqQk5IVHNBQVJacVZqWUo4QmtrbittZ0FyMmRlMW9KNzZobWZZaUg5c3U0?=
 =?utf-8?B?Y1IyanRodFJNcjJHZlJ1ZzVUckxJbE1jdnEwZ09PSjhDYk9mSXdjV0drUHIr?=
 =?utf-8?B?SVpicm5KMXFNcWY1WjRpRGJad0Z5WVdEbFRGWUhnZklFZnFockl4ZVJzbTlX?=
 =?utf-8?B?TjBGSVM0RUpMLzJUc3VDZmx1M3l2Y2h1cHMwS1hmbzNYcDlySUVFUXJaYmQv?=
 =?utf-8?B?Nk1lYm9NNVhmSEl2T25OZXlnUGdrYUZoTEJPZjZhZG04dHYrMFYxT3NvTm4v?=
 =?utf-8?B?VDVpc3A3NVNTU2FmalVwbE91ZXBkUHZUYVBTeVExUWdIckxuamhVTU0yWmJM?=
 =?utf-8?B?ZEg5dHZaSm83UDUzemhkemtTNkdrSXo0d0RpTU9iRDZ3VUt6dEJ3SHVodjVw?=
 =?utf-8?B?bm01UDRwZXlQT3ZvUEoybVROVGFTNlhZdFo0Z2xmMk5YZHV6ZmVVN2IrQ1c3?=
 =?utf-8?B?WFE9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cab4027a-1cd9-4b0a-9d76-08de2cc2b613
X-MS-Exchange-CrossTenant-AuthSource: MN2PR03MB4927.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 08:06:33.4318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: thtqTTbxtNMjMjUYkaP6VQsGNZi2l1ErLHLG0CVHypvhr+z6yjttvOTHJ7akjXDg+7V5K/ydovciyYnXr9ENKm1rF0dcsW6thQo3Z+DVl54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6581
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_000639_743040_3BC5B3E6 
X-CRM114-Status: GOOD (  10.09  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBkbWEtY29oZXJlbnQgcHJvcGVydHkgZm9yIHRoZSBBZ2ls
ZXg1IHBsYXRmb3JtIGJ5OgoKLSBVcGRhdGluZyB0aGUgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9y
OgogIC0gQ2FkZW5jZSBIUCBOQU5EIGNvbnRyb2xsZXIgKGBjZG5zLGhwLW5mY2ApCiAgLSBTeW5v
cHN5cyBEZXNpZ25XYXJlIEFYSSBETUEgY29udHJvbGxlciAoYHNucHMsZHctYXhpLWRtYWNgKQog
IHRvIGFjY2VwdCB0aGUgYGRtYS1jb2hlcmVudGAgcHJvcGVydHkuCgotIEFkZGluZyB0aGUgZG1h
LWNvaGVyZW50IHByb3BlcnR5IHRvIHRoZSBBZ2lsZXg1IGRldmljZSB0cmVlIGFuZCB3aXJpbmcg
dXAKICB0aGUgcHJvcGVydHkgdG8gdGhlIHN1cHBvcnRlZCBwZXJpcGhlcmFsczoKICAtIE5BTkQg
Y29udHJvbGxlcgogIC0gRE1BIGNvbnRyb2xsZXIKClRoaXMgZG1hLWNvaGVyZW50IGFkZGl0aW9u
IGFsaWducyB0aGUgQWdpbGV4NSBwbGF0Zm9ybSB3aXRoIEFSTeKAmXMKYXJjaGl0ZWN0dXJhbCBy
ZXF1aXJlbWVudHMgZm9yIGNvaGVyZW50IGludGVyY29ubmVjdHMuCgotLS0KTm90ZXM6ClRoaXMg
cGF0Y2ggc2VyaWVzIGlzIGFwcGxpZWQgYW5kIHZhbGlkYXRlZCBvbiBzb2NmcGdhIGR0cyBtYWlu
dGFpbmVyJ3MKYnJhbmNoCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L2Rpbmd1eWVuL2xpbnV4LmdpdC9sb2cvP2g9c29jZnBnYV9kdHNfZm9yX3Y2LjE5CgpU
aGlzIGNoYW5nZXMgaXMgdmFsaWRhdGVkIG9uOgoJLSBpbnRlbC9zb2NmcGdhX2FnaWxleDVfc29j
ZGsuZHRiCgktIHNucHMsZHctYXhpLWRtYWMueWFtbAoJLSBzbnBzLGR3LWF4aS1kbWFjLnlhbWwg
aW50ZWwvc29jZnBnYV9hZ2lsZXg1X3NvY2RrLmR0YiAKCS0gY2RucyxocC1uZmMueWFtbCAKCS0g
Y2RucyxocC1uZmMueWFtbCBpbnRlbC9zb2NmcGdhX2FnaWxleDVfc29jZGsuZHRiIAotLS0KS2hh
aXJ1bCBBbnVhciBSb21saSAoMyk6CiAgZHQtYmluZGluZ3M6IG10ZDogY2RucyxocC1uZmM6IEFk
ZCBkbWEtY29oZXJlbnQgcHJvcGVydHkKICBkdC1iaW5kaW5nczogZG1hOiBzbnBzLGR3LWF4aS1k
bWFjOiBhZGQgZG1hLWNvaGVyZW50IHByb3BlcnR5CiAgYXJtNjQ6IGR0czogc29jZnBnYTogYWdp
bGV4NTogQWRkIGRtYS1jb2hlcmVudCBwcm9wZXJ0eQoKIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kbWEvc25wcyxkdy1heGktZG1hYy55YW1sIHwgMiArKwogRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9jZG5zLGhwLW5mYy55YW1sICAgICAgfCAyICsrCiBh
cmNoL2FybTY0L2Jvb3QvZHRzL2ludGVsL3NvY2ZwZ2FfYWdpbGV4NS5kdHNpICAgICAgICAgICAg
ICB8IDMgKysrCiAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKLS0gCjIuNDMuNwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
