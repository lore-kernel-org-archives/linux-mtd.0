Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D71C433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Jul 2022 15:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OxWfQHntQMIzkIGNtMiyDEKwuAcxoIdxxZgZ1wNSEVs=; b=fPPG55NGECSnPN
	Yre/Xuo5McVecvs46957EiaioBeUUsjXiGSzuQYLooyoU8mXMbbK9Xt6yYsIGmokoFhWQmb3LyoIp
	dUY0nrC8rVvi1j4BhqJ7a4QyanCbi9R17tK8bbwWZ+PxMsNwLXI6DShFChdD9dgBDpAd9A7MHS3Ko
	tt5k6AMgb6OqAhlRAG1MDwJQGYaDetpayUFO1JvOOkGCYP/Y9za+zmxMGrSOcoLKXw9YGnsS/UjvL
	tRcBxd24iSFU/qzj427WCUrXUM0Muj3cHiILnVjIHChTyHYbzwVSIwA2gBvdxBMDHG8rs7zlMBjJ5
	lADebjxBUZ7DwlJZDNag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAZ52-00CJCg-Br; Sun, 10 Jul 2022 15:42:44 +0000
Received: from mail-dm6nam10on2075.outbound.protection.outlook.com ([40.107.93.75] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAZ4z-00CJBF-0M
	for linux-mtd@lists.infradead.org; Sun, 10 Jul 2022 15:42:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqaM2bobXn6ttI020yY0Dwg4cqNNkt0gh4XaelSEw+8fZHrUKk3FDV5xiyjhNEF7RNZ6qmJ7JQigqRuRliZvBBHd6ge6hUfZHncSnpQbhm6fbylsnnBm6Aywh3RRlv9MY+3D25U5Wa/vUlEb+XG4ozy+rghZeyZ9U6qIH7Rf1ACj7uVOftIiJKILb60Ly3waRks2OtkkuGwujsb783fInPin+em1FeJqpXeoTRREFcPissl8KaoDfYSYfoAzC4HFgaFJKmbkerRyX8KqPINsJN/Y+JOEtXp02X0fj48oUdFeKmAhcLdrHkK/Zf/YuiNOIbRXG1egbTSnRUP24Tn/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+MMx4yr+DC3QbVAKOVmeQ0oSovXzaC1/7hwvfVu530=;
 b=PLiBwkl0bnDTDHmvW65v8Uf0pEGVDYkVrI7FgtN1HPwBrfr1V1UzOqjg6ctDd9ddpXrly5ke5wR0DBC33xo5UYLeVhcsYRyWNBdpid1NqIKD95ZYbSOeYBQ6dhMu6ienjd3AdctdcMr5F3H3OJF7BDDfzbo/d9n0bYJKgljKzjBwZE2JxlUuAvbcOhT/34V/SjXBKNdVe0EDC24wtqqsiMABDQ77vgkD0WAd+cDrvYHcu1Sq+9oGuM1hUtYoen5patRhg8/I8eOvLiiPEZlq7v+mmz7381UtBOYiOE//tCggAwiNmfvojPV/dQXY2vtqvOZdr229i3/TUhctsrAA1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+MMx4yr+DC3QbVAKOVmeQ0oSovXzaC1/7hwvfVu530=;
 b=WQKpeQia71gXEjg+hiIcHcqEAJsQKVjPNR0SKHDGlQ42rPC/LREq/Xl/MiX7vevGHsybZc3fR6VRO+8E4taK9qqdfKbVEbKottwt0UhGfLkij5H+r2w36FJMt4ebvtM6STLEI60d8tRo8hjBURsXi4hxrcbzc1Pn6ZQnclG0vzE=
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by PH0PR10MB5594.namprd10.prod.outlook.com (2603:10b6:510:f6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Sun, 10 Jul
 2022 15:42:36 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::88b4:c67c:e2e2:7dbe]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::88b4:c67c:e2e2:7dbe%8]) with mapi id 15.20.5417.026; Sun, 10 Jul 2022
 15:42:36 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "david.oberhollenzer@sigma-star.at" <david.oberhollenzer@sigma-star.at>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: mtd:<myname> mount syntax unique to jffs2 ?
Thread-Topic: mtd:<myname> mount syntax unique to jffs2 ?
Thread-Index: AQHYkhGwK/2xwm/gQEK75xrq4FBaB613vUqAgAAF7IA=
Date: Sun, 10 Jul 2022 15:42:36 +0000
Message-ID: <3704ab379ae6b0f6dd31ca32d865b624812107af.camel@infinera.com>
References: <e4e609da8c962c5c1b5d53137e9d112affb582cd.camel@infinera.com>
	 <09179d86-d304-7ef2-bd80-3aa7a97a87a7@sigma-star.at>
In-Reply-To: <09179d86-d304-7ef2-bd80-3aa7a97a87a7@sigma-star.at>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.3 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 374a281f-96fc-467e-d8ac-08da628ad003
x-ms-traffictypediagnostic: PH0PR10MB5594:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  LoNvUT3tgief3W1Z7RTyoUD+0cRhGC92VCgEj/8grE+hNmtzYJi2yN58wLVL2YVexX3/okDCjxE/htGowYh35Df0/kcf5J5ABT4vz0nEzZ8OhOBnsCVhmHL/iI7RAKaX2sM4nQ1L+5YQMGFIgZyK+wmG7ljSr644UUa9VVSVwCymnq/YaKO6nohcygoPDvhZti7x+JblUonOFMGFecDR0b9L0gygGEa2Tp2hziLkrxJiGXnQiMKb6Iq1xjezJ5rzOQy5FVHZGzBTI0HAEKz9oGJTvCP85ZX+tNfLz32Ix1qbwM677VGrjPJTPCryZMeBDcIJv8/aYKqMagDjJ9e7UmC/aosKYotM0rGd6Yo9kbf3YDj9i0YknwvfOT6sZgr3J5f11cgR11+5UndRDQ8lO45RBPrtwJEt8P87TEv98RmDNdS9FWeTXoGZkFsGLAr2AxFu7e+xinJzIq8wHvgNAlYmM7HIBbsxVYXTplGfzjZq3+Bf4ef8Nyw7/4Ir06XMc/RBeHZg1rs7GH8pA84ND4wEesQ5K/teSjFkuyNQB0KQt72xfk76ESv37bsjfw4W8wt6x1x78eFHpxX+TUfP7KX4Em9k+pzfbPAh5//OEwq69W+2pK7zlJ1R7ff7iNCfGmb6jm6fT+0Tgg7QR1o2BgT9Wjrj2XUgF037rXQa918vLYwqiQXuhQk4pMolvmDOAVVzeGnpOG88eANt5CatGx1JxkQVpwHCaxUpTictXE8Iq5Waf2/spOrzaxOND0//6sEVGcSH+zYXZ+yQELjqgFytWMOqsu2ZxNp4NJCJMhIxJZYFNQl90X/V7yriR3XT
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(396003)(39850400004)(136003)(376002)(6506007)(71200400001)(2906002)(41300700001)(83380400001)(2616005)(6512007)(26005)(53546011)(186003)(36756003)(38100700002)(66446008)(38070700005)(64756008)(91956017)(478600001)(86362001)(66476007)(76116006)(8936002)(122000001)(316002)(8676002)(110136005)(66556008)(6486002)(66946007)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dGVTY1JaUVRCbTlaU1RGTTk0Zm10ZkkxWnVlbktkY2ZTOHJNRnBDbzlzVWE4?=
 =?utf-8?B?cDcyQUFOTDRuaG1kK2l3UWVrR2xkVjFteEpSNzdYTTN5S1FMd1o0TEZrSHQ2?=
 =?utf-8?B?VVUyOWhlYlh5aU1WajRqbXZyRm5GdjZQajRLb2NMOGsxZUxHTWxvMjcwMkhl?=
 =?utf-8?B?ZmQ4TVBWOUN6WVQvaXdSUUp0V0JLYWN1Y0NBd25MbEpaMjJOamRVVzBjRWJz?=
 =?utf-8?B?WmdOaXFVcm9oaGZnMGk4dzVqWmdxOWpkYXN2MlJMTTVPSjl3QnNxbnFUVCtn?=
 =?utf-8?B?R09ldlI5N295OE9kYUtVS3pSNjJKLzgrSTFBa0U4b0VSUGxCdXlmN0NiY2cv?=
 =?utf-8?B?KzhCTkhBQW5aZVRpTzdZbnhlL0ZIZ3Q5cjV0K0dxcDZRdVl0bmZsTmJrbFRw?=
 =?utf-8?B?ZVgzMTQ5VW56NmVFNEgvczZEcWM1L05HMXB3SE9keU1SUlB5ZTZ2SmVkWnpz?=
 =?utf-8?B?b2k4SFdvVTUxb203Qm1QbUlLRTdScitSL3JBNzJTcW5CSlpvVmRPemppQjMr?=
 =?utf-8?B?clhlbDM2Y29GNDRnbDRkdWViak9WL1MrTzBLYVg4eHhkQk1STVoyU0hPS3dI?=
 =?utf-8?B?aDdVdlQxSTRtdnpNK1FpQllvdUFDTEZMYjF5OVZ3ei9YQnROaEN0YkhXWWlq?=
 =?utf-8?B?ZjBoQ05OSEVpejFMdWtVU2JvSWFqWXI2OCtSOVkrdjlZaDgwdnJUQ3YyREhW?=
 =?utf-8?B?WG80MHh4SjRTNmVBSU5pcnk3V2JlLzFwNEFlaGdDcWlvS3IxZDVReWMyT09S?=
 =?utf-8?B?a2U4WVM3aEVpZGMySHRtZVVDNzNjTE92OWdEWjRsNlNWYW8rUkJzTm1NS2M2?=
 =?utf-8?B?M2h0bnNGQWFQdENVbmtWOU5EeGl5dnRlT2RZdUFDSGNvYm9nUUNEOTRGdnVW?=
 =?utf-8?B?R0pBSit5RW15QTM2TzlFZjEzQW1xRzd5YzJuRDMreWJidEVVN0dVZlMvQWtv?=
 =?utf-8?B?TlpLSTBGNW0wK1BOSWtja1J4aGlKZTdMVnlzWEQ2a0JmU2V4WkprT3k1bmJ3?=
 =?utf-8?B?YnJ0cWxCYW1wcWVtVW03emRrU1dObXp1cHM3SDNxVVFkbk4rdmZDdEhwZFMy?=
 =?utf-8?B?MVVxMUM3dVBzVVRycWY3WVRtK2ZuK0RQM1hmNXM0aUNCLzVwdzBKNVRsL0li?=
 =?utf-8?B?UXpoN1VWSGRad2REWitudkw5MHBlKzBpWDZiWUxpVzBuMXFnNXlFbGduNzU1?=
 =?utf-8?B?cEFVWUlIT21KL21GZWxFUVdRL255QVl4eTZEU1IrMTRMYXNZTzgxa0Q5ZUlM?=
 =?utf-8?B?V0dPKzhnM0haVk9FTVRYeXp4YXlpQmlIOHY4QWQ4c29QaTRMc29WdDlsYWNU?=
 =?utf-8?B?Zkl0YUZpdVRjTTFMb2RXd3VlVnZGRUlBQWt1OHVzdXkzMzlxMkNPRUNZUTVs?=
 =?utf-8?B?S28wUlI3TkZGaGZjTzhlRmVrY0J0SkYrSlV5KytuZ0lFbzhkZ1gvRktrYWd0?=
 =?utf-8?B?ZkRUdTRlbDV1V3B1NjF0NHBjRVdGa21ndXlmb0ZUN1dWWE4xOWxUUGVVT0hv?=
 =?utf-8?B?UW1FWnVsNllEekdkRVhRT1daRmZ0N2tvRDFwVVorK0JKNWNjWWNNMVdRbElU?=
 =?utf-8?B?U3FWbkZGZjV1TExWSGhHZDkzMTA5d20wWm84aGhTMVVncHJiT0tSclM2eXFJ?=
 =?utf-8?B?UCtWcnlucEJlN2RORXhCNEVBNCtkdUw1bzVzVWxCRWpDbUx2dFdBK2ZiMU9h?=
 =?utf-8?B?b0dRVVdleEYvaHdDeWNjd3JDaGZ1dGp6bisxTWFOZ3hzajFlNlk0ZVNUNzhl?=
 =?utf-8?B?czJvVDlpT2k1NWp3NUliR083aDNTZ0hZcXR0U1g3c2UwWEh6SUhHcHVwUHVw?=
 =?utf-8?B?bEx2RmtuNS9ubkVnMHlOYnNYT21sUlJoVXFvS1NFTkRHeDFTc3RHdHdTVkJJ?=
 =?utf-8?B?TlU0UVpTNGoxSXowZTRweUJDTmxpa1pyaXdicjgyN0hRVVhYVTFsLy9JWStz?=
 =?utf-8?B?ZlIybllXaUhsWHBkY0t0bkN1Z0RWcVFiSUUyN0ovRWFydEE0SnNueWpQRDQr?=
 =?utf-8?B?M1JYQUFlRk9OMUcwNW1USXFIbUNQTDd0YlQ5aCtENWx2WDB1bmhEVWI0TGNr?=
 =?utf-8?B?ZEMzMnBxTW1KRmJ2MTh3TlNHemFsdVJlUGRRSUkxR0hUT1U1a2xIelhwNkJ0?=
 =?utf-8?Q?xqcWJ6q4mvXRfoHyffUcxN6We?=
Content-ID: <710DC2B1FBB1434781DF95E3359FCB74@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 374a281f-96fc-467e-d8ac-08da628ad003
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2022 15:42:36.0799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CKVGNpyiVCl/7R8mPfNqwv+5nFlghaPss2EH84xcNpskl3saMnNh80bOoXH+BvyY8gIuJFnOjEtvFpkzMxlr6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5594
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_084241_375427_D8943544 
X-CRM114-Status: GOOD (  20.96  )
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

On Sun, 2022-07-10 at 17:21 +0200, David Oberhollenzer wrote:
> Hi Joakim,
> 
> On 7/7/22 16:56, Joakim Tjernlund wrote:
> > Why does "mtd:myrootfs" work to mount jffs2 rootfs but not squashfs?
> > What does squashfs need to support the same ?
> > 
> 

Thanks for replying.

> squashfs can only mount block devices and does not support
> raw mtd partitions or ubi volumes directly.
> 
> There is an "mtdblock" driver, which provides a read-only
> block device on top of an mtd partition. Squashfs can then
> be mounted from that.

I known about the mtdblock driver but here I really wanted to use the
symbolic names mtd provides as the mtdblock number may change in our system.

Is adding mtd name support to squshfs an option ? 

> 
> However, what you probably want is the "ubiblock" driver,
> which emulates a read-only block device on top of an ubi
> volume.

We are using SPI NOR flash and I think bit flipping is rare here ? 

> 
> Using ubi underneath takes care of bit-flip handling and
> wear leveling, which is still an issue with nand flash,
> even when used in a read-only fashion.
> 
> Greetings,
> 
> David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
