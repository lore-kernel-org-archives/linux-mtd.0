Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E9D105A583
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2026 11:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Q9UMv+irZEJ7OemhBP9iAafyIL8EgFyUkL9FSmsgsg=; b=WjErE8qvnbvCrW
	e3hKI0ux3BdjFh+EJpn1ErGB6LrRxm6J1iXqTOyQBnZPtuEQBpQR5WRVSE/WAtBlfrovPVtU1tV3e
	1EhZCAMswYpvs2qkJIRHOCMOIHllGBJkGfH9J1s1gTpWWFj7Q6jnqP9niooaSyvM4aeIgDOz5TvU2
	6cZAl8a99iRW7BAKFpk3Z43liKjgJfMoC5OkTDKnd6BkoUjaMf33iJYsxMDjODFnmslVYpGw0zn3M
	9Gg3+0gD+zadGZNtwWXU39BF+Znv19I2tA7u6uqjEzf70RekO+oD9pBCAJYzL1TT6QmMTwwKVGPfb
	bl4U4Q2zHn0Jh3Vd9WQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eEf-0000000DwoJ-0Jp6;
	Thu, 12 Mar 2026 11:29:49 +0000
Received: from mail-japanwestazlp170100003.outbound.protection.outlook.com ([2a01:111:f403:c407::3] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eEc-0000000Dwnn-0Jmx
	for linux-mtd@lists.infradead.org;
	Thu, 12 Mar 2026 11:29:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LIf5O0qtQjzHpr7pCCwSNDXgze/yPyBcuZ0BCEsQCvsJcSFjX3wCic7LvfHbJtFfpJ06HKpcc9K9BthxsVPgG4wLyIrL7s/TLkUDQWrTRH4+XCS8fuGDarnnonWImEayL4uuJ1/eDVg8XxXE2yEYq2bJPHB5dQl2WsEmpxiiyAxz/LWRCMEABZ8HwTuXIpamrdaRXDmtj1Epc1BMxZZgZHn11a3PNuenbrsmsEwGIY1hIBgoYqHToY/iFZKp++fDdSLUN+j/PXK2RfknNWUITAp5J/caSOHKGJtN2WjE4wqRwnCYqSONUf1amofBWAF/AWw5B7CPjXeZHdjeqlziJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wq7uwu2KGM7X/5/PXCdl9q/ziQif9/5qHSuJnNLAOHY=;
 b=gJo7o2VJAIuM6vlLbOWAA0Kwi0s0tVQ6DOfpVDyI//RMN/Recv4zt3x6peQPXtnpU46OhxjRnyHzURzK13vLcx6e6uJl9hs9CQ7b80KTOZB/YGlqvpKafjW3qGi4SauqHuqW/7SPqpDyOEQj/P/LDBPEIGWurYmyGmOje4/pppN8jp2rmuva6rFmlQgfhcRErcUb2FY46TWF/CAHAH5M/CNAWglt40SaLhmvLk7d1+GjXrEs7PGgqZeKzV9InoiuSpWo2g7oMO9XKL9QrClFCalxpJhbcZeIzdaaSSGB4DOFpsSkyxh/uY+mwH05z0HaajmGvKcqgwUCHiDarp112A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wq7uwu2KGM7X/5/PXCdl9q/ziQif9/5qHSuJnNLAOHY=;
 b=j0B+opCVSZzzj9watQmEK0/SKj9DHFPcDJMJ5QVEgSWCqiEfLYAK1Uu6oPkva3uPTFuQzj7QGeicYIGWgtv43Gr95gSGaFKB7JlSR7buW3mWby9YPkX1Bpfb+ZChQW7YbFP+JF53xgcgcet1RbTyZg76X/MzIqO2ssSAyqYZJdE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB7243.jpnprd01.prod.outlook.com (2603:1096:400:f0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 11:29:35 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9700.015; Thu, 12 Mar 2026
 11:29:33 +0000
Date: Thu, 12 Mar 2026 12:29:27 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Kees Cook <kees@kernel.org>,
	Weigang He <geoffreyhe2@gmail.com>,
	Daniel Palmer <daniel@thingy.jp>, Benjamin Krill <ben@codiert.org>,
	David Woodhouse <David.Woodhouse@intel.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: parsers: ofpart: call of_node_put() only in
 ofpart_fail path
Message-ID: <abKjlwKu-UntV5Fu@tom-desktop>
References: <20260311153957.1984446-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260311153957.1984446-2-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Disposition: inline
In-Reply-To: <20260311153957.1984446-2-cosmin-gabriel.tanislav.xa@renesas.com>
X-ClientProxiedBy: FR0P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::21) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d68ab7-c822-4798-c2ad-08de802aa21e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: Q3IJ9HnsVYYSsoRm1YO19G/h5W7487OOYX17tWa0zY5GYnGnXSR4/QkMPa6tywaDk+30sR0/UJiUdueWK7gYHvyo1Bslivh9KTb/gLu9QdXcVcgpsqlSG7+jD9V1UHMj0/oYMqEgQoO4ju26YNTbyB4xYrLztBGyXz5itYt8xmLi9DlGSCfnvL4G6Q7dEpMsZC6EiJJJWeVD7I44PqulzensdLn89XyhDJwsV1/JxFD+av923GD+wgR/4I6qaGY5gpiiEfH1OROqI+9Ltue3P6+PbkmOedYz//1P2RGFLx69jsJBFSr/fpmSewbjdwLK4q2rfskWTeOJh2jsE4aFBzd/Dak0uX8yqFyUcGiDlCIQFIdBfgESa/Fjy+UbU4ErJzDzPsQs5voBQdv+ayNSSo+mO59memNFK8oKJY1FbXSSzpp1P6TiiVYarJ9b6lBjUMn+/vnlWl2sgeFzZbYj2PFR5JvM4h80M8xI6Hp/ELdbqZ7JbBOV6v16mLOdyPIWegfP0UwrwfnCgTxI4ei+Y0p3AT1Bv21qE0B5oZ2w2fVmFr1EcRfaID1wiWNQ6RnN14EIwjqOtMMO04TP3OS+SLf+PRbJcdTvUQNZJ2Bfx5GyNeyNmHmxKeqJgw848iOgWtJqic3r5ypFK4X062QnF512tHfn4d6m7zbcUa3Ft1hVwXVl7xcvhpPYTVFs0IW328LgiqqWkBSL/lvxsjUrE2rvCCYxSPH9bWfj+09C3Qt1O90GzLjLu7mo47ZNV9Prr1T/iDmwf6hTCTdUXJDeGEcOryEiQ9QVi8AlO438kEM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9r5mxI4BUAGrCxK8NtrtB/m/KnieAlVwmBMUlIgPVmwP96znX7treCFQ++0Z?=
 =?us-ascii?Q?6ezbO1konYwMugoOlgvdxbQ+bb0EfBRHvjFi+oJ3zBGnWTPpflV6XxcD39lD?=
 =?us-ascii?Q?btgtAgRWohMHJtwzQVlhHIYtUL1bLWCqKm5/D+dEYQBsb1blUrQmILkbcwFo?=
 =?us-ascii?Q?mse/fgScx7VvNXfFfdkteiNCJToyuUCGXSu54jD5mTSJTNmxnbwq18IMaaa3?=
 =?us-ascii?Q?VrIpryRMx+61Mcd9OLJbZL9msWMltJPll1bhOzxMwxdgEGbtISefF4IQEskC?=
 =?us-ascii?Q?mOdWx8cxSjFPSrd0qNoTJA1mqetPhuM1UmsuwF7mLiN1w2x4cFuYC78LafJm?=
 =?us-ascii?Q?t6W4JJvwL1B7dyEw6+U5NCENIgPaDrpOf8gv3njTU+vAgBl56+KyV+mobIDC?=
 =?us-ascii?Q?N9Jep9qVKkFy3Jcq2Te3BgLoygilfy3OjLgW7LLWTCdAvpAW7QnBc9zNKON2?=
 =?us-ascii?Q?E8Axfqfw1SzVRMd6F9v19dCKtv0o6USjoXItLGixvK+0mH5QD5A0y0Nc9jwF?=
 =?us-ascii?Q?XtJ9kQESTZCHYLDbmqw0qAD682l3H7mfjZXOjzuuXMQXPQHcrOUdB2KBjoCH?=
 =?us-ascii?Q?ixPDYcvu5V0Sj6wru08ee0Nq5VThqjA1H10z9zrzOTu1NFgTYix9TkZ/C806?=
 =?us-ascii?Q?sQZKex63adVIqltaEHPpDOjO4qDMlk1lSEFciPVq4gDvQKqflwheX3zUQWHY?=
 =?us-ascii?Q?mQBcZ5H5yt2BCteMASDg/myUJUeZremU0O54uGXYwABLPDSkgb7k9iqekG+v?=
 =?us-ascii?Q?n9s7FtP1qxlw2WQ2M3dZseCHqyfsIeseHYGR6UOe0vqVfzXtn0GvwFrRAV8E?=
 =?us-ascii?Q?i/gf/xnuX3EMM5CJG3TfKSrHudm9O4wgbqCVy35c2U/eI0Ne/CJzCM8M2wOg?=
 =?us-ascii?Q?VNnVAVZtOzpeaRDT6dwDls9gITpDOwlbjOZF3empV8JQXGc8dbDG2m29D+V9?=
 =?us-ascii?Q?WsWL6g/AVwpHMtk+3bjRG1GwYzv/sOtz7sCwPk8mG6sIsyGKgSFh8DFsiylE?=
 =?us-ascii?Q?BPJ+hbZL8MDmLOywm+Ph7yOeF1d7opJ5fO5WZOLgzWjG4YwLi4f6oU6vVD7q?=
 =?us-ascii?Q?yp6EiP/vgr4g0Ps7j/8lBA4OU1m8zldxxaP7flzuSbMdKxRGARr+M6HQUsKl?=
 =?us-ascii?Q?RzwvN17/jgwQGMvvhOdh2cTt2hiGphWBaRuQLcFGSsaP+0u+TAaD7SW1AE2z?=
 =?us-ascii?Q?jVFcwUzxN9g+BpvYYr2CO3dIYZCPQQFgGG/3LDT3Z8G6DPdRMzM6JON+Ler+?=
 =?us-ascii?Q?Pf9VEjqmOYe/vlfyWxPnLctli5fny6yNSt4brhtKDVyp3onrCuJc37R3e7qf?=
 =?us-ascii?Q?KkYEX8fVf6LG1XDaKTl6LtYh/hNEbfW5N/39WQHlrleo51Pn5oM+QChi4qvh?=
 =?us-ascii?Q?q91w+EdYn5ioPDM0gnqgFsFmvpssrR5DtefbxniJmn8aFl3apSOUZAzDRaOJ?=
 =?us-ascii?Q?fKoSHrFl9XCq8CUrEGsj4Uzd8xhCE8jIVRHInsgkGM6N8gNQHtgZ4ny5o+pN?=
 =?us-ascii?Q?YvZzImePF9w3q0vEL+nWJ4bS6ghlRK+Z4YJWw6gAALv5afz9+OiYqjxwEyOm?=
 =?us-ascii?Q?0gbVmc9/p19bZEuTnxmj6UlB3D4xcR0aDxEKh1a2FvOUqgYWFtv0M470XBz/?=
 =?us-ascii?Q?nZSrM9+airM5pbPpWg+nPNWcPgymZtFs564n9aiJ2UTEi2ReKGCI3sE0h80+?=
 =?us-ascii?Q?g5ya4NaNIMOolHh4CKKDsRH5Ilp20mhOEC+KiymetktP2UNO0yUz3usyifHe?=
 =?us-ascii?Q?MjXmA3lXUZD3awImBa508FtfIp4qMb8FVUwVDOtAmaGgLpOEsf/S?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d68ab7-c822-4798-c2ad-08de802aa21e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 11:29:33.3511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKNxJdsGLjw+y0v2OyNaY9juZBdeAUG5sueuBSBCZM5j8XhGrJGsj8anupRAWrzqBDl/IIevgxCkJq/8KVWMR2KZPb6OSVT1GoQoLZwZzZVvxrwInRYMS1+EtUDl1Zn4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7243
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_042946_115908_8D909919 
X-CRM114-Status: GOOD (  18.34  )
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

On Wed, Mar 11, 2026 at 05:39:56PM +0200, Cosmin Tanislav wrote:
> ofpart_none can only be reached after the for_each_child_of_node() loop
> finishes. for_each_child_of_node() correctly calls of_node_put() for all
> device nodes it iterates over as long as we don't break or jump out of
> the loop.
> 
> Calling of_node_put() inside the ofpart_none path will wrongly decrement
> the ref count of the last node in the for_each_child_of_node() loop.
> 
> Move the call to of_node_put() under the ofpart_fail label to fix this.
> 

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> Fixes: ebd5a74db74e ("mtd: ofpart: Check availability of reg property instead of name property")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>  drivers/mtd/parsers/ofpart_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/parsers/ofpart_core.c b/drivers/mtd/parsers/ofpart_core.c
> index 0029bda165bd..181ae9616b2e 100644
> --- a/drivers/mtd/parsers/ofpart_core.c
> +++ b/drivers/mtd/parsers/ofpart_core.c
> @@ -195,11 +195,11 @@ static int parse_fixed_partitions(struct mtd_info *master,
>  ofpart_fail:
>  	pr_err("%s: error parsing ofpart partition %pOF (%pOF)\n",
>  	       master->name, pp, mtd_node);
> +	of_node_put(pp);
>  	ret = -EINVAL;
>  ofpart_none:
>  	if (dedicated)
>  		of_node_put(ofpart_node);
> -	of_node_put(pp);
>  	kfree(parts);
>  	return ret;
>  }
> -- 
> 2.53.0
> 

Kind Regards,
Tommaso

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
