Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4339FC54751
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Aug 2024 08:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KU7g9hz/SEdTwYjRN36xaCgp4KuHWtIx0sjSCmIak4c=; b=HZO+qE5fOEaBzi
	14KW+PyAZDQnRB/BZtmKaLumKVpmn6VSpvTkeE5Y4UuTcvGABf5XNzkBCZZ1i9T4lGcnWK3VBtyb8
	+kcy/TXnSIlvcj4TBwulbasxnkyTap1dkkQb0u1yL1PjAnt6lBep4RJGlmJJWrtkqFgCjshG2Nkm8
	huydzb3eZmoJ7c8xGf5spxJG97VLO1c2kGAJ/7GysTREh3sE3sLUDJzcZvpF0VrzBdWxDLvQUcBEQ
	4J2yVZN46PJ4YwdXYgt3zyUTz1zfsrUHKJmkNtTlHWoy+eQ8gjnMAXyNgtvWEFua3MFqwtHws9x9a
	wtIRoBlAntX+nAeEkUnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjEWd-0000000Eco1-2j1X;
	Wed, 28 Aug 2024 08:59:35 +0000
Received: from mail-psaapc01on20610.outbound.protection.outlook.com ([2a01:111:f400:feae::610] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjEWa-0000000EcnC-3356
	for linux-mtd@lists.infradead.org;
	Wed, 28 Aug 2024 08:59:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQSXHCAThAoeiX0NWLJABEuHgdZx0mEFvi5rnAHdvweo4el3tZ7cOqpErakjKrazptesQ1FVvboiRrfypbpu2oWOf1Yo0a7riHrkufUSHMuOILFMZHi4KgURMEDx3iSrdAJLLor9r4zW9fou6eRJPxcUm4C40DXGHv4dPoFbBp0SAKO9oSGhBQdWW5+VmWHMtYCHdbhun1Uoog9uu1YNwoZxgNQN73LdGhtRBvD3j2w29cUVJQAUmHc7HIT5yC/NPEYNYGO1ecZ4FGnVLrhLGGfZAa5Hf5t6evnvKxLfhT8tA81PqywS5Ldf/LpvdJ0AK2qLL/RyKvpJIypDVp3vsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GyPuHtCeHPPob4AeXTne6noBaERXBTyLdNcNPKJwGAg=;
 b=twAl+p/IA9WftkrRkPaBN4fBSNOFV3PUZKSLM91clb33IYprBJjsDw/xi72iIFW3HPHbQR9rlKCpuRC10Ps3pwgeDYg3MFFfSqqtcfYsUWtRM+wQ2zzkMGREo5APkOmVKksCwqSR4zgEBax2CGlTJr7lzEMXAj/ef6m/wDsK6pV6lGCWZhtq1M2PbomBwawmnu95PCRyR2aev2NL9Nknwdu8+3Djhi84T+kHwyxLinwsn0ill/7RmEPT8iyd+Wqmy45nvVm3xxtF1vINFJkhCELq2cOWde7jfE5orhPdL4TMBqCosUphSgVefg1l8tsB2zQnqJR+6mLZS+UgQ54KBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyPuHtCeHPPob4AeXTne6noBaERXBTyLdNcNPKJwGAg=;
 b=AHaHmkvDCrDOuddjjxfM0vAThPe66WJtCv5iGNPJmQlkPm4CCPVvxT52bljnQo07mHqP8tYJ/aO9Qg41COiY3QjAeht6vOrojbUD91ERa55uto4gHuMY2fdj+wHQyuBISvuyf4gWNrz96M1iywQkfTteTfAVss1alXpPdOKNFuPe43fQ4F+W4ugG4n77upDEkwbHPwFEJdg19t2SOnkKw9x8wwH1ZZmQ+Bg9Lu1T1wCfn+3g5tAPiq2MTDu2vdUYzU4D0r1oQBWF14rlW0KdA4PGxBJSN0CN+iFCZYe9JnDG3wwiTTsunlcoahsXdcClD5DOL/SAMlwMZXrp+VYAeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
 by KL1PR0601MB5864.apcprd06.prod.outlook.com (2603:1096:820:9d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Wed, 28 Aug
 2024 08:59:20 +0000
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce]) by SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce%3]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 08:59:19 +0000
From: Shen Lichuan <shenlichuan@vivo.com>
To: richard@nod.at
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	chengzhihao1@huawei.com,
	opensource.kernel@vivo.com,
	Shen Lichuan <shenlichuan@vivo.com>
Subject: [PATCH v1] ubifs: Convert to use ERR_CAST()
Date: Wed, 28 Aug 2024 16:59:08 +0800
Message-Id: <20240828085908.35695-1-shenlichuan@vivo.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: SG2PR02CA0118.apcprd02.prod.outlook.com
 (2603:1096:4:92::34) To SEZPR06MB5899.apcprd06.prod.outlook.com
 (2603:1096:101:e3::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5899:EE_|KL1PR0601MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: f91ce179-ff78-4e9f-47fc-08dcc73fb3bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xFtlB/CdurUqnqD2dUXWkCQ+UYhaW/rdeDwiE8wjqzdhWLe6R36NMusDToiC?=
 =?us-ascii?Q?qf+SLWQGF4ajznlfiqosanmCEFvkW/dnhPf9LwT24cJsvgWsC+zlIJSOJY1x?=
 =?us-ascii?Q?Tckg++EQsm4njE8pnzYJbYi/hekvdmf2wj4/unpBrRhALu3Maia2QA4vctYL?=
 =?us-ascii?Q?s3Qi8u3waAkbx5k4lKIp7q0aG6BKuI0TuaqqMLMBVK8hiptiTGqLpBVg7144?=
 =?us-ascii?Q?nTGuRVNvOy6EHocuTfTFRhxUCHQ5AEoDuIkmp16/+PnrhZ2q8UTnbKjSc2hc?=
 =?us-ascii?Q?ysgILiTHRwFMVvUbtR6dPJ85trOwK7nP2ANuJaH/ikcunir9lmz9vK6QB6xb?=
 =?us-ascii?Q?jJwnaR+1qBjOA6Uy80nq4biQl358k4f4qNRm2cvuGiTBctUUSTuHnVjODgJw?=
 =?us-ascii?Q?d/hJQfQvF2K3z+OWGG4/GGu6qZnc7pr1P+Jp1QZXP8RaTJ8CmtaUoRujOr2k?=
 =?us-ascii?Q?PhtiJSoXHTLIYzyFytp5MVn7DKWSF0FyOK9BelDstsYjGOrlCMoN5WK8dggO?=
 =?us-ascii?Q?IRmYgKhcGM0mfFgDxNL+2norYiM5N03JWR9iTHBJ5vKSX57wgHdvDb5yCCvM?=
 =?us-ascii?Q?my8XOhB0bzkZ69ty6M8xjmEvFQPpefY3F9iSAI7IOKqw9rSBp61Bx5Tn/39R?=
 =?us-ascii?Q?/1TijOJ81YYGzuY9A0YjdcFvKQMbQR/oz0gllcNe6zbq8f38JC7uHv3kb3r+?=
 =?us-ascii?Q?0mXc5/607OyfiCFDNTCU8DvGmMJa1FQMNUVQa2llsSRh5oXVrSuPx0Fm/d9u?=
 =?us-ascii?Q?Otq0jdEmBl68NNmi4VmGbHpG7+SMhkwfg6RQ22xOeQ9b2bBr8LTr/4kdOFk4?=
 =?us-ascii?Q?4P+xf9erE5hHON4vYpHm+KnH5KzLhwI/pxgfIK5BGLevBX+tRHHvTuZ7kil0?=
 =?us-ascii?Q?SZlHCSOqcE/rAU515jIfmrt3t+Yu+gYIz7KoojMbe6dy81W2o6AmeU6v5BJt?=
 =?us-ascii?Q?dCaZipw0alZ2wB/Cx1Z7EMdevA6ANmRjcNASYpznHPQT+89p/h8CaELzJ4hN?=
 =?us-ascii?Q?RhU0o69Pv3mcVTLdf1kozPj6WAO6DStx5VoTCA5e4lhx1+pZ6CK2MPQ4J+Xp?=
 =?us-ascii?Q?hXPtP9loc39mRPE19CWIoDGYL21uRwM6/kgcYCUm9s13itJbxVylcMHhSkeg?=
 =?us-ascii?Q?LDi3Tnl6MkinyrBc0Tf/KnnaL+LsHbZArvDfecrjkp1sfX87wAce/MeJM8cC?=
 =?us-ascii?Q?mDpTwe3H1IALAa2LnkFuR8+RKp4KxeN52DR9/wbBSIVnRFXgGmfnSPACkqb7?=
 =?us-ascii?Q?IjV3bI8t/zsNPGuJYowBH4OhfgNhlYqKyeb1KeoTTPZZ/aN+o6i6gOBZUFgi?=
 =?us-ascii?Q?VuBGRhAhkFxJBxvwiDXyEcxRcVZPfa5XGvHk6kYN7UGIizHMZZz/VkZnjLlb?=
 =?us-ascii?Q?7Oe8SdCgEGTdfFIQCOlmSOEroBNaYYT4wLGuJZD+KAe0tMziNg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5899.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t+ZE2q4g0JQLVkW6QI74mRVKHPDtgQ+YW5lUfmgMBwEAXpYYhobdpaQAxqnI?=
 =?us-ascii?Q?llJlv7iCoUks7/cIbWuw/QImJUPcolhXEqoj6OXMAutP3F7p7weJhlILakuZ?=
 =?us-ascii?Q?58qI/Ioz88xI5dXWpeYRg8vZpNl8We1kQE9O7r+gi4VyLsmj8RrJdMKjA6Ok?=
 =?us-ascii?Q?RKbc/S7IwPh+HKxYX/lZr/6k+UD/KJ6i2bC6nQeMnDxt/pEBBq7495hW6Ogq?=
 =?us-ascii?Q?mEtjRO47Shh/RzOa5IXAxkyOkD3a4RAsRyOgqqsymDEgDYfkLlorwOPXD7/V?=
 =?us-ascii?Q?BzPaS7CciMxc5xascWjisjjs04uNRbqCSKZA3ZDVelFY/b5/qfhDbGIzvyjg?=
 =?us-ascii?Q?HeOFnTA5QPCXhpdeA48Ke1Ix0PgOlDSztM3MzRwlZC1k7rA+XkbIjH8efJCV?=
 =?us-ascii?Q?pjpknsTQcA4jMzx6MWbKKWe7ZTZtD8P8spjDPc/id+eK9oKzKInB0qLLqvIJ?=
 =?us-ascii?Q?63jzNHscxSY8R8/hzANGWhE8aNxqYqPVIshKXmDzKHLs9ld/eE4sbFYS94sQ?=
 =?us-ascii?Q?TKkC3logi6E7Pa5LBce7Ld8k3NTmqS+0eEg7cRQmVs7Gbn2wrYWpmm8iigXy?=
 =?us-ascii?Q?wl/cb/Z5egiQkcNzKCkNSXzaeqeeBtM3p7lsE0cZn0CpQswNNNGWq13p1gBt?=
 =?us-ascii?Q?U5AYWsxjQynG6om9Wc6qd6tsI0Wl+0bhcbEGJoyB7VYNP/F9qf2uu3xshEjx?=
 =?us-ascii?Q?u8Zzgtpq7+JYDD6Lud5MBkyMiBhJd01aYHhah7ZHTxqUzLG/1Y5/JMwi11+U?=
 =?us-ascii?Q?8DQWkv+bkYyAvVUi+kng7Hnuyb0zoorpHKdD2aGMfT/sb8zNJgAUTTGMNBMu?=
 =?us-ascii?Q?UCe0jBUL1LPijA+WAIg8i8sg9TrUe/ez/5UMLgRcTCFl1Cl7cULFQbPc9qet?=
 =?us-ascii?Q?WTRLT7uItLbw9aohi7WDHgb+1veYaZhS/sBzfTiPU5E50umIl4GrhsZZNS3i?=
 =?us-ascii?Q?Zzw1rMFUiIk2YG8MFYewSH6cqtlEkxGBwL+JRiLhAZeY828SfVwQ81BXRGTu?=
 =?us-ascii?Q?PSppw1k6B5u2a+EIZe/rpxzGQo+nNSTC6MRviArUywJqS6wkiQ16QdeexlHl?=
 =?us-ascii?Q?4LqC7hEy8RXX6ieU566pSX/eyTILGhzgfTxouBFOujkTAHG7uSH8SU9sL9Hr?=
 =?us-ascii?Q?eOOXBxg+Ow0H6t4ImYTSVR587jSzaR3jJChbdte49m9LD6T/bKclwirb4Ofh?=
 =?us-ascii?Q?G2RP4EpKhHB7FIxl7PztjZRIvlGyoh64bpsKjP3B+adLslxgqt0fw3J66wBA?=
 =?us-ascii?Q?JKuRmH992c8uN1rrJk7OP3+YVPRhhX9cyBp3h84RLvevwnvnVqKGmhhGbpUD?=
 =?us-ascii?Q?k/uSrzf7SfYwhNYeMhosqr/GJlKDFObPjhuDolPomzvGmqB0MHlmesEldDR0?=
 =?us-ascii?Q?r+Ed3Ox/EKGECyrKuJSjS8yJLoomqlNzZrH0poIddyObDBFawYOGaXEDrUjR?=
 =?us-ascii?Q?x7rAPT8xCtlk/Rm5bC80kTrBWNoo/RI5jaQxOmwDaMDdhSgjawIEYrZp0Jie?=
 =?us-ascii?Q?fr9kQIy6jaX/8l97rdYXqKCu6eDAMn1froLlEuX2k1vRRhBVt/11Mt3E1tF1?=
 =?us-ascii?Q?H7iO91dqRq1KkkXal2014HldYsgB66IlclkAMyr5?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f91ce179-ff78-4e9f-47fc-08dcc73fb3bb
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5899.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 08:59:19.4723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: opCK+SfJAkS2ff39otjZx/Y8HgBkB3dyGgbkdNVzJ8ojb0q5vmjXMWlAP1USU0BXM5lCLL6G/+5jVpARrlG5SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5864
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_015932_792034_92F98D84 
X-CRM114-Status: GOOD (  10.35  )
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

As opposed to open-code, using the ERR_CAST macro clearly indicates that
this is a pointer to an error value and a type conversion was performed.

Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
---
 fs/ubifs/lpt_commit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index 07351fdce722..aa8837e6247c 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -577,7 +577,7 @@ static struct ubifs_pnode *next_pnode_to_dirty(struct ubifs_info *c,
 	/* Go right */
 	nnode = ubifs_get_nnode(c, nnode, iip);
 	if (IS_ERR(nnode))
-		return (void *)nnode;
+		return ERR_CAST(nnode);
 
 	/* Go down to level 1 */
 	while (nnode->level > 1) {
@@ -594,7 +594,7 @@ static struct ubifs_pnode *next_pnode_to_dirty(struct ubifs_info *c,
 		}
 		nnode = ubifs_get_nnode(c, nnode, iip);
 		if (IS_ERR(nnode))
-			return (void *)nnode;
+			return ERR_CAST(nnode);
 	}
 
 	for (iip = 0; iip < UBIFS_LPT_FANOUT; iip++)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
