Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8C3C48260
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Feb 2024 15:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ci/By1G1q3U+qH0Z1VmdEEr5E2GVztfFgosZ4Yd4f9M=; b=jen8deyqSA6Ozv
	yE5dwh903PIcr2TcFHpYqnkkEOcv9lfSHzVoPwI06JzxbO1T1K39RSJOCrqX0L6ho+mhOcNVkLxxh
	gMUHzNj7Crb2HcHMKqG5RYJFw0wYqh4ELggHIm0yWDS1Kad/m5y1hVpokQoH8W6RHpWOTfYeABBCK
	uHnQyw1HXO4HbOAjcief8GwuWwAkI1szbAnPBQ+fUsk9EjoqJjyU/BFwvG+Qy+7/8oOb5gxkbsSDR
	0tLQi63cLRGwj3P4m6tdzb0q0aKy5xI2jq80zbwZuZWH2rxFz3ciPEgjBAYeKuupMME88Ay0jnqbZ
	GG4Y8ShoqYdXjkTda2uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb0U6-00000002tNz-31ay;
	Fri, 16 Feb 2024 15:50:42 +0000
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb0U3-00000002tN2-44f5
	for linux-mtd@lists.infradead.org;
	Fri, 16 Feb 2024 15:50:41 +0000
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41GCV1d1022857;
	Fri, 16 Feb 2024 07:50:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=Fz1mmHP6PNMiRHcSIf
	o7YqfnDex8FRt5DmFx9F37Qdg=; b=cWMWYK+bC0SO5CIP/Gc3vegyM9Kyb0p/ld
	WDnfkghPuyVka3n/LTansOpvffHbDtxbGONCDw1XbsZcP28lfVjcqZMfPovH/9O3
	jE/Vnb++CQTZakKD4wSdwfLmkwVko/bzvtiLyORRfLOJRgafVmnaL7XSjgVVaE8O
	mi0ECnKM6ZaRHZDVALMiNoMP5IWOqZHMG2sl0GTNPnUlbfGDDmUEMElU1xKHvSmZ
	YeC4v3Wbzk9HGNsfNxAHIEsuek3Svf1j+LEfgeRn0iMOdtJoCW1Kjfw+Tz934KXN
	fhfstlHQtb/y4neZIJWXLZ7adBztEGaDxCyTmFHBUSZMntTGEBqQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w69hm5tpg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 07:50:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7VUsDfsYxX0W6eeSDqUo81DGuW2tJ08EeBhALAaTgG3fwjoaiN3zZaPeB9lzRPlNp7AjSqLZ4hBuKqmAFmAwopmVsheWCL13p2Brwlxyy3Oi8lf83IIBXcILIsxHljWzRo5MgUeqXE9bTI+8LiUfFcrZbJ1SoBDDr93LClhckFF6pguuDGLT9Fr4YVOdFsyNA7dXBFkHpMm5stshSM2RhgNifDdchY0IhPOE86vZqm/eEosCKVf8i8S/MAZiwZxdObXQjLplNGVKciTUuDKZ7lj+y2KDnfNw3bsC/sWN1/Xgptwa+aOHz9ac8ElcXKTrFXsb56q4zbqn97kkxhS+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fz1mmHP6PNMiRHcSIfo7YqfnDex8FRt5DmFx9F37Qdg=;
 b=MGDPCKDRmdReTC/jjsYN/IIlHmwc6UlH8jDoMNeIDKe3RzowyR8cLdA75qk9XfE6ezKih0ip3hX3IUhkFxX8RYLx6nQKf6dJddcSIgTV/6mSUJ/ZxrAt3QkjsB02nkkUOWUHyJcmBugliNXhwFu81s+MyGDhMQraKDqLHIddWGJ9Q2OzLPMxcMKRlZHKIkfdJlvEMGgYqSs5XvbStiNPcfDmN/6mUp272MusH1N/mkO1c82nIa01CbRtu/Mee+FBbDJ6IMdzMhxd3QL8BwYX5bW5B8gmHcReyr+L7qrs3R0MDBwS+moBHqItDY9VwEN/aibKre5YOn1MRUf10o3kFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5617.namprd11.prod.outlook.com (2603:10b6:5:35c::14)
 by CY8PR11MB7339.namprd11.prod.outlook.com (2603:10b6:930:9f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Fri, 16 Feb
 2024 15:50:33 +0000
Received: from CO6PR11MB5617.namprd11.prod.outlook.com
 ([fe80::82ac:34d4:b2f9:9402]) by CO6PR11MB5617.namprd11.prod.outlook.com
 ([fe80::82ac:34d4:b2f9:9402%7]) with mapi id 15.20.7292.029; Fri, 16 Feb 2024
 15:50:33 +0000
From: Marcel Hamer <marcel.hamer@windriver.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, Marcel Hamer <marcel.hamer@windriver.com>
Subject: [PATCH] mtd: fix minor comment typo for struct mtd_master
Date: Fri, 16 Feb 2024 16:50:22 +0100
Message-Id: <20240216155022.79371-1-marcel.hamer@windriver.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: ZR2P278CA0074.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::8) To CO6PR11MB5617.namprd11.prod.outlook.com
 (2603:10b6:5:35c::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5617:EE_|CY8PR11MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: e640de19-795d-44a9-ed81-08dc2f07023c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KwS0Bv+5llrZvUgYSv698xzfjajgD9R2y3iVe5mq4EE7/Fm/yaY7fcL9mBzK0JWi41z//fe5kBjdx583a/KDTkLOxcZDFVxQwfZCPlqI1KjuY/zlONOTQF5hZY53xaZ6OPrljIaZi0nwXMm6EgYZFPn4ngSRxD8akw6iecrKpLb81k6o5BZL1XhXhFW/uo1uGhgloXy+mSk3yPwIy4Q1rQMyJa1YthDcCi6YE9m2aaHyM4I2Wlfq6dl4+Uq7/xbUJNdhxRZFB7ppYrG2h1Pg4/BMduXRSCzxBaVJNLlC0xDasYJ9VSd5oFXV0BUUUIxLHwkuwDS3u690zye+yrk4EN5+sufKRcUYhsaYAzyTIQQxPwNZuOfkwTQ8RQ/quN0qWMkFY/OhvYgowIuaSo5Vp7+oSipJLHg4XLYrGzfaH9zZXvr9N2VzITQgVqghkOXj5JpE39kAxosukN25gBQLP0A99252MWYfkaoYJ/Y3iq41X3Y2U3hJQVJoaR9kMmO6j8/ABpDQm8OEiECx3Ek/EseDxSSSNaH/hpInQB/C9GWu7A2R6nDkyIc0ocwPuN9J
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5617.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(366004)(396003)(346002)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(4326008)(2616005)(107886003)(41300700001)(1076003)(83380400001)(66556008)(66476007)(66946007)(8676002)(8936002)(478600001)(6512007)(110136005)(316002)(6666004)(6486002)(6506007)(38100700002)(36756003)(86362001)(4744005)(2906002)(44832011)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QAVe9rp+9K6UjFD4XHa3zWOpBIb5v1s9Vr5JMusncTgRQVNEF15Bg5LlwRKM?=
 =?us-ascii?Q?iYYn720azGWm4SnPNX8KeTwL1IlUxU0u2qo8bokNBsMZcB/mvO0YPlkMuqrL?=
 =?us-ascii?Q?vmA7YSQ2E09iJuIj+lrhZQT6rJ+Bh6odXh4cGtmIcD85+2YTW8mTeteTZ/oZ?=
 =?us-ascii?Q?NI7ceqAH5lpbEe+DUSjLgbM5oC+CldEIoE6ltIq8aLvHCfx1DmOMVY4ElmtK?=
 =?us-ascii?Q?LKE1QgM0mYPyANFQBa1h3bSaIjzwmZTxr6iTv5hSJBPVCXIqpY0s3pojuVqg?=
 =?us-ascii?Q?FtQVXsEx2xcIRS2064I2KJrmeXk6b1S1MyUxZh+3jPPAjG9Lg2jS/QhKXWEn?=
 =?us-ascii?Q?g2lNy2OxfprZkIUuSqYzs8oSloSDpa+boQvA8Sj9xm+8iSygvDQ7jXhnmam6?=
 =?us-ascii?Q?y9nZn7/MsHjCK2Kq0SDYTqyCx8wsTADxS8N/j4xcm7q0Ak/HJuFZigFCcQiZ?=
 =?us-ascii?Q?qbit6M3ra000dWY/MD6+rHW278MDmqQRNxXKBAbkr3949ckbB+LloGhMeTjT?=
 =?us-ascii?Q?f+8eXDtZzaozhjnM5bHPZnOxMdEwy8KUxmPO2rTdtM2PaZVZ5uKCmylGQKgl?=
 =?us-ascii?Q?tyuOKjI7XOYqx5G/ZsFfA0sqsZUpdJTymQnn+yoxfw/FjA81G3GaZCAXx5bs?=
 =?us-ascii?Q?FTXc6txiKPgCWFki986cw4yEIKR6K7S1EJMff2IqnN8c3nYHikRranerdkZ8?=
 =?us-ascii?Q?WHdxKUL5kBrWxMbDh3jzDDK6KTQo73h/T43ymcd5TsSc3lBPK4Tbn13iqzSZ?=
 =?us-ascii?Q?yxOp4WKUz4HbtXr7Keu8e/lh/FHl6v+scQb3hZtYpUTI5jVKlZykDDd+PEd6?=
 =?us-ascii?Q?lRym4+SephDIFl1yWvKZcgjnwGGKOn7Qon5lmBXQ1PFUmE0zUVJdycFJ2JrB?=
 =?us-ascii?Q?k1jZTR7Y5cmLqXdfY71C+whvUp1HubuuGXfAFN/srm0R0uBRPDPCdR/vrScb?=
 =?us-ascii?Q?/sj4ONoMDpTkfk/2AtfIFpZRSZbqQR5Rg+Do31Clkwz36hBu7w1jnAhu3TpO?=
 =?us-ascii?Q?Ot5aIfj/uCxvnv1z3y632uV2NOLa4mg2y+Q3edco3a9HAb+oz1w/T5qvCXT6?=
 =?us-ascii?Q?JNXKwIYO67wvhgdZN/B38I+Czbozvxu78JnqWKVY4Kn4aywkWYeJkQpiHIUb?=
 =?us-ascii?Q?ABTx3OSHg1kohVL0IysJySnxm2prOMMQv6BU43bjlT1sZPoZ5cft/5p5k2q7?=
 =?us-ascii?Q?F/sUYr09+zxjnYu+l2yLYy7KrH4wqhQ5YUEkYAOHfDgVP1Pmk208Cy5g/6cS?=
 =?us-ascii?Q?yb5KIlcNHCWERzQmy5VpW5pvpzD+/P8OCXOk7Cagb8Ly/IMLWMqzBIaeahma?=
 =?us-ascii?Q?GxWaNINlY3Xp3T/jMpfVkKmfgB+w8PL9VHcPdjdie2gYs6SPEPKulDSoVa3P?=
 =?us-ascii?Q?8UuT/dI+3ErVGtXkse11qxUnVvNBGj1w/ZEz6HunooM0oCvzsj2ehzmVWHlh?=
 =?us-ascii?Q?1TE186pAt8e2AAiKowRMvd7wizQMlyPwykG03Ldh/sFO8/An1nADIzR6UYhV?=
 =?us-ascii?Q?4pNTsqK7YwaSALUVLeAYqH6XRq47l5llWUrj49PfcEwLzA2RxraB778Ab40f?=
 =?us-ascii?Q?7osLDNYnZr7QVYv+PAntf1ObFTj/tp6yp6WZfg+HpUhlzHSbHqudph1jieH6?=
 =?us-ascii?Q?8S0My6URCvpK6u2j7lGtpClkkjC+szxOmo5nBKqu1WHPkFKcTEEswDzmPeX3?=
 =?us-ascii?Q?KlquLw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e640de19-795d-44a9-ed81-08dc2f07023c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5617.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 15:50:32.9163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nFJWnrIJPPK7aOUXNQ8SJ2rzl7rwOjyLtcL0ZeTusZoMqM8s0EGIedo8J9chqgPyV2JJx7YH4OtCDrWn1A1UAsdNHKf+xrx8B+C0AMpHuh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7339
X-Proofpoint-ORIG-GUID: bXPmxMHzaW-o3kFqSJnDU3Ww1Q3CT917
X-Proofpoint-GUID: bXPmxMHzaW-o3kFqSJnDU3Ww1Q3CT917
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_15,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=838 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402160127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_075040_093508_71BD2F4F 
X-CRM114-Status: GOOD (  13.19  )
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

Minor typo in the suspend description.

Signed-off-by: Marcel Hamer <marcel.hamer@windriver.com>
---
 include/linux/mtd/mtd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 914a9f974baaa..8d10d9d2e8300 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -223,7 +223,7 @@ struct mtd_part {
  * @partitions_lock: lock protecting accesses to the partition list. Protects
  *		     not only the master partition list, but also all
  *		     sub-partitions.
- * @suspended: et to 1 when the device is suspended, 0 otherwise
+ * @suspended: set to 1 when the device is suspended, 0 otherwise
  *
  * This struct is embedded in mtd_info and contains master-specific
  * properties/fields. The master is the root MTD device from the MTD partition
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
