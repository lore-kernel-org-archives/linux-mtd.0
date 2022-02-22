Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766D6C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Feb 2022 22:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Ik1s1mq5JpSkbZkkzE/IMvEYDtou6hSjshTs3gt6+s=; b=CtvxiA4VUFceBz
	K/x4ZAXZjU+1IrpWpfSUwZX/KZ/bQcNrEmAj4SPJSDutfEhxcnsxfj6fBqrSoL1RYf4BjhyJOIOYV
	f8PBPY3YBDDZH7dH3DR0BYJdP+d3Tl6H7gRGP8bRkCW/vlkIyHIMUD9UGX5/qS65cDOtHeyPW4qKU
	qal4GK+67ITme0wAMK89GHPSGLgWmgMwhmh/s57eRtz2o9N4rxz/oWTot0qL8BQUpdL2WfhftrTCw
	uTbxkmna4blIxjR6YXUIixwM7m8S91GGLRJJU51oavXeI8ERP1gZfa8MXZqUqiTW3N6Hbe+crdjj3
	D+kMAzSw1qAMp6t9M17w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMdFD-00Biz5-OU; Tue, 22 Feb 2022 22:02:51 +0000
Received: from mail-vi1eur04on060a.outbound.protection.outlook.com
 ([2a01:111:f400:fe0e::60a]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMdFA-00BixH-Qv
 for linux-mtd@lists.infradead.org; Tue, 22 Feb 2022 22:02:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGCxQJkTB5lP3wpN032UwWI7YbOchQhHBPmOIWm8QE+oBr9LRMFW1dp+H9GFAGXcI4sdmTeKwiYU+E7zkbtylnDqTX5EE8U1F172zlGxFlkRifcIV9v7iKoakPSApviBBkhJUH8zQbvABrNMqgFQyeuSxbyCY1Ve6D9fkus2RQHubXjkh2zG7dgXAE6W/fobFG16eTxrUnwrY/7QAuFpqHRCJpSt251XkQy7pXW8y4iOXMJWRFx/Xi8kG53q+1v/UwlNh2Hkcj5DMvF1efI5Qw+s9yek5L8cGkMSa8aQgIINdeAaYphzSJPMGT0fzhwXhSMlJRVitzcsvdAiw9HYYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/opfujz8lEaVusYPUNC+899koktfRVeLLXIB7oq7sY=;
 b=FHWQN12kW5h2Fj3fQkv4Vjdw6G0dIxtQ+uRf+m2VxrbL4E9zOR6AthUVj9yL/2xVUvQ012Aae1nyxFtgLPC7ExFKnoGJIwuPt3fGEW+RcqEdUGKLqlS9nnslZT93h9Y7GwcGJrDS161ulG57G0Henyp1JPF1S6GY0V0H6wXkr2uyHStatieGAjFWOTGDW3RptSJu/A+3oNmnkaP4eRshs5GNtYcJZK6wY/PesglbB/gMqtxtoSt6jrxQqTG3Spyg/JlO9gZFdG950c3xZj9TYMZr3lSSCeMNRhDLk8L+XlF/wjBqeM3+Hl3+U/aOxGUF8tX1gipw1q2EVGeiAY/ZHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/opfujz8lEaVusYPUNC+899koktfRVeLLXIB7oq7sY=;
 b=ogCgHRoFHSpsRuJtrqyhdZNFE+dKGaZhFZ2gGWnUKUxOu3xnr6b3Y8hpuAG0yL4IhGbr4evPqgkUsTaSk7YZqumpGDbEW/NOAkEgRXOakp3+RVZChTD5UMVZHIQmh6/R0JHTDs4ih+tqcnyvZAwuXQoyXyvMIU2PofzxHyfAxho=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by AM0PR04MB6466.eurprd04.prod.outlook.com (2603:10a6:208:172::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Tue, 22 Feb
 2022 22:02:42 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::2911:de67:4045:3f28]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::2911:de67:4045:3f28%6]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 22:02:42 +0000
Date: Tue, 22 Feb 2022 16:02:35 -0600
From: Han Xu <han.xu@nxp.com>
To: Daniel =?iso-8859-1?Q?Gl=F6ckner?= <dg@emlix.com>
Cc: linux-mtd@lists.infradead.org,
 Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: Make NAND_BBT_NO_OOB_BBM configurable or let the gpmi driver
 decide?
Message-ID: <20220222220235.pyvhaiieimf7uv74@umbrella>
References: <79beb2ef-7336-f067-5418-3fe62aa928d2@emlix.com>
Content-Disposition: inline
In-Reply-To: <79beb2ef-7336-f067-5418-3fe62aa928d2@emlix.com>
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: SA9PR13CA0121.namprd13.prod.outlook.com
 (2603:10b6:806:27::6) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30320d99-7152-4804-a871-08d9f64f0c86
X-MS-TrafficTypeDiagnostic: AM0PR04MB6466:EE_
X-Microsoft-Antispam-PRVS: <AM0PR04MB6466FDFB129AB2F7FEC156B2973B9@AM0PR04MB6466.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SUNKS3T2hsch+SGdnOAd4Cpn2IG1TRJ+vptUGrzGPy9PgSlXrKDQXw6wHtUrNYWBvSD5vrRyYSt4x3I75kox7YdjNWNS/mwZdNlOmzdpHxOYDAqwhM2Kf29vAW2+kRxqjBUwkL/BIdFVmO3HblcR4xe8FFODdMVKUxdQCmhiM5aZGjudMEkrQCtOkg+R8GiIS8F4WVvPxL86O3iJytDvk4ErAuzslQthMcz5kzJKILvKPpiIXAKooCWfq/4cv241COqZ29uL1MVFwTLlJ5UJataMskP4fnU9ic4A3t2MH2MrR1oSMQxBvlMpNV2cUoIkHKE5DZoOiuaeafLeEECDQt2tWjHJkZZCs+WVfl7YhdyGzsyF0L3rWbpHUoQUadFxbPftXojrCiBNr9egGI9XCuFf88sjRhmoJgmBgqv7oUke51jHci+iiJsTmd4IuUmPMXix6CfnEbQY4vHEsKwSMUJ2N1I/xcWSJdM4qejaLoHya7c6sfm4kznzBYFdd5/eg3Z7B26hsgqNAmn5VxTum5uXc+8O4IK1z6S3d2A0gn5zL/v2QHUZEOjn2355ARFfctjb6aZ4eA+SNMSkttjFlUPGBPxhrJbFDby0mK+EfYuL6sr2FkaqPpVPzGdMc4bAJ9QfYadCeDJWrYClkHivVwkgNtPe32HOIcjgxQyWWT9Bgnmp8ZcoMjAPc2eLrlLx+QI2MAQEdViOz64QlN/MKUK5nZLqCJwgGffSmRn9JMfOSh/yjSEYiB8RsLuZwRl7ggrtSvgK3YSCh0cGXHA/hcFe3hWKtpKnYACJQHppT7M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8774.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(4636009)(366004)(38350700002)(2906002)(38100700002)(44832011)(8936002)(5660300002)(83380400001)(54906003)(6916009)(66476007)(508600001)(6486002)(966005)(86362001)(8676002)(4326008)(186003)(26005)(9686003)(45080400002)(316002)(6506007)(1076003)(33716001)(52116002)(66946007)(66556008)(6666004)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6KM7BsOLIaj3nzDq9JjTGBC301ArBlnBjT2idRNA32UIYxXUZ3erkMJHph?=
 =?iso-8859-1?Q?P1IKCxJ8BbX/q7BspGMs5ifxgeYjJGnS6Vb44pg3poD5j/qxT06Y1BmIsH?=
 =?iso-8859-1?Q?Geiv4CqFKhLc5DTbTXjFrtqEh6MVvBPBzNf9A8gcj+QSXBWvnrfM5Xt6NV?=
 =?iso-8859-1?Q?Djdzx9X+t92mOZ7bWe9IIf3C5N1Dfqw75zM01WXC7cU35Wj0w3zknfiDB9?=
 =?iso-8859-1?Q?9aCqrjgx+7oc1O2ZaPsiiqIfeuq646iNgAqLtbiKhGoZBYmZtgs6ynHG67?=
 =?iso-8859-1?Q?QKe2HbZe/S4TyeCFi9OGD8eXZma7EsWIiwSBG+xH0C6NhdDjKaqvI7dDWs?=
 =?iso-8859-1?Q?2vSTxOt8K9ZumQyeLANibwbQI6wTFMJgFcSWPUmOvznhu+iU7WgYMwAHn8?=
 =?iso-8859-1?Q?K2F/NwN/ZvszUzH5Xr30QK7rZvR2iPQPWAZd6T+L2pf+QKaRc4WB6WsYR4?=
 =?iso-8859-1?Q?BEEfFQpCfk6oQw8Do4jQf3Fku1hMaBhmORpHuMd90kHICmfNz5eKTIfWFK?=
 =?iso-8859-1?Q?R4x6LdiLUSeLrPuvVOf0aa9BE0xCJ8Z7HGZdCgKHub8YIx7BeqoGtyfyD9?=
 =?iso-8859-1?Q?dHuzoCEmE4FI4cFivcbTfZx2J4fcZZZcu6xkqdlvKae0ozj8KtwBcLNxyS?=
 =?iso-8859-1?Q?H49g7mLspsGxohvs/jeYjD4IHeJhqMekjMuQMeuHMubElrZO+/2elwjLX9?=
 =?iso-8859-1?Q?JW7o8FbR/d1lsiWmZ3i8MFgewzqhF0ldnXItUJ0rxmqRsw6R24CF8GgyhN?=
 =?iso-8859-1?Q?qS0lem8NZyOa9YYpJISg0Qu5wnSy9B4gUkaV2OAKAA+F7F0LbOulj2GFyQ?=
 =?iso-8859-1?Q?eA2/+0RaANvyvlcQPNfZtQd11dzB1OB1kFttrPdp4971bd6W9zmhEIWNn3?=
 =?iso-8859-1?Q?ZVYoccHE7Lm2Vwu3ULW+ogAoUXoU8uWbBz/P3uVVOS789wKJgSM0jhXRoD?=
 =?iso-8859-1?Q?JNLjOsPufG8UdsxCpa9dnjmB05Ra2g2k9PFodCGI+0D0wHO2czface9TEM?=
 =?iso-8859-1?Q?UNaLqpVELeEfzesXfrcebKjxXZ/uE994z7o/h8I63QFdxaGHVNUQCTbb+v?=
 =?iso-8859-1?Q?sGwAnHG/dwX1j5JjM2TaTsezLeNssfEKqiwoh6pLlzOb+m73+4a3Yr3RDr?=
 =?iso-8859-1?Q?xbwWMAyctzS4pf9gJnI+iovOGym+l6qJmS8CsXTCqFBjUGVKHWTigor69i?=
 =?iso-8859-1?Q?CZZmxhMHwQoJlzE/VOXS+8f60bf0eyINhBMC8LzHGWlTJzSdXlGvPMbO1m?=
 =?iso-8859-1?Q?0wUXbxR/e2wzY0l0ee9uiJW8ZVOJBeIbKARL3+QyrVw8uyjd51ik/zxrXz?=
 =?iso-8859-1?Q?ScLsm7DC2FeAsL3HPTCmTRR5QzSo3m4S5Ml/V7zYwH51BPeIL0AaQCPerp?=
 =?iso-8859-1?Q?9Iz33Z2NT8qG6Xn+CqSM4ulNggkVjWKyOQjwc0WgxW0sm0WV12482ocqOb?=
 =?iso-8859-1?Q?FTPn271zk5DvsOQlRZD/HI9Uaeuwj75v/CakkFKPKs/B4RagpBRu5PimA0?=
 =?iso-8859-1?Q?BVNOBiXysI2PbmmxSj3FvC0ZH9lweyYYbzNEFE71vGEOvuDc6gds4HYlu3?=
 =?iso-8859-1?Q?/upP5az3JQNqJ9d+XqDSTWYObFMzljK/Apf+y20c+b4XggoSqEw7GbvNTQ?=
 =?iso-8859-1?Q?MkvAMHPzhD8gY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30320d99-7152-4804-a871-08d9f64f0c86
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 22:02:42.5292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DJRBfRKnmbQEpHPEHVWbImf/hfTuvXCvn486CeGWP35t0r7772K6ZALTBkNo/rXF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6466
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_140248_918208_6D22BB80 
X-CRM114-Status: GOOD (  20.94  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 22/02/21 08:00PM, Daniel Gl=F6ckner wrote:
> Hi,
> =

> we are using UBI on a NAND flash with BBT and have recently observed
> bad blocks where nand_markbad_bbm returns an error. Since that error is
> returned by nand_block_markbad_lowlevel even when marking the block in
> the BBT succeeds, UBI goes into read-only mode. We would therefore like
> to set NAND_BBT_NO_OOB_BBM.

Could you please describe more details about what kind of error, how to
reproduce it and on which kernel version?

> =

> Unfortunately there is no device tree property for this flag. Also we
> internally disagree if this should be configurable on our platform at
> all. We are using an i.MX6 that needs to relocate the bad block marker
> to a different byte within the page because of its ECC layout.
> =

> In 2014 Lothar already submitted a patch to add a nand-no-oob-bbm device
> tree property that got rejected:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
work.kernel.org%2Fproject%2Flinux-arm-kernel%2Fpatch%2F1402579245-13377-5-g=
it-send-email-LW%40KARO-electronics.de%2F&amp;data=3D04%7C01%7Chan.xu%40nxp=
.com%7Cda5e4832940349710a3008d9f56c78ac%7C686ea1d3bc2b4c6fa92cd99c5c301635%=
7C0%7C0%7C637810668500447823%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
JQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DzyQ%2B3Ilnr=
estiToyJjPvOsZ9cn3Dfdr%2Fcn8dW30bTaQ%3D&amp;reserved=3D0
> Brian suggested back then to tie this behavior to the non-standard
> fsl,no-blockmark-swap property because the marker becomes completely
> useless when it stays at the same position as data bytes in good blocks.
> =

> So which solution would have the highest chance of being accepted as a
> patch? Introducing a device tree property for NAND_BBT_NO_OOB_BBM, using
> fsl,no-blockmark-swap, or setting NAND_BBT_NO_OOB_BBM for all boards
> inside the i.MX gpmi driver when there is a BBT? Or maybe renaming
> fsl,no-blockmark-swap to nand-no-oob-bbm (with a transition phase)?
> =

> Best regards,
> =

>   Daniel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
