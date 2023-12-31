Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494BFC3DA6E
	for <linux-mtd@archiver.kernel.org>; Sun, 31 Dec 2023 13:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R+QZu3dF+lpxw8qfSBFOrox53Uw+4ykjCylNTMoqUMs=; b=WnVdKLtCN5L7dn
	4dbXnKPd7t4jiMmcRCNDoNVl5xfMHPhEHaya/D0xOvwV0AuKttH+MCKqP8kswn5j1jD+MjILuHeEk
	BHo2jnlNuCbx0zuqGa6eFEre1fq04YKE6e3y2TEt2uv0FHE8W58kpZVsRZx061roSkbCNtrXOpk0B
	1cI4GWiSNvno814g8G/wcVXRt0hsJFYPNTMiEOWlIhgH4AAs22Q2znNyoQE0ITy7leFJG9IozizpL
	Z6mc1HiyW0yZKMgBdPKFhNaVNP4nQCYgF6baz3AFpbvJl2KEPOfZBTX5nenX132Niu/Su5MZmiRdo
	AVm6yQs0E2bJ4al12L2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJvge-004dzi-2y;
	Sun, 31 Dec 2023 13:17:04 +0000
Received: from mail-dm6nam11on2062b.outbound.protection.outlook.com ([2a01:111:f400:7eaa::62b] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJvgb-004dzL-05
	for linux-mtd@lists.infradead.org;
	Sun, 31 Dec 2023 13:17:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLb4yT4AfQHQJi56/5Mwg1a3qaEc1ln9IWr2budaJR6oal/ME4OiQ1k+bxMo1FQiJqs2IkxfHgINvJowWQNvHBrGvHkaK6kuOcwLyrDjN8kI3OZh5QM18k0qsFCu/5gU9TaVJIMAn1ZBkNoSaGmHfdTis9bZOvmKBNKXEGbcmJ39CFEu13e6LBFYtiDiU3WLvJaBngJnYBGEtt5xkp97fNJeYlFaRQcmgL0sMFgTAm0CzV+wg7oEi0DomSLZH7zHO7r6wJmfIJg6ZzJmBLfPFeHChYUv04UKQRUIVwZs+uYg6sUvv7tZf2waJO/aATCnICatFhgEkjDf2mtnJ7dEAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zV5UmNIP/6eiIpqzpiEjb60dO4ItuVBY8YVe+EPuHGY=;
 b=d0s0XdHSszh6sm5CSPHMZeB7N/rbny7X5RneVGYi2qNsd/Pl6KGOvYdm25mYzUgARBmSqzlwdA66t2OM8bUmFCsv5mxEyKVD3/puLm6mbVnOmJ6FcYI6008DD6loWUkfFRnPazgE60us1k+9VqMfREf0QJt4aq8VzJKuiNt4uRGNzjYmjbWdvcUf2B+tLG+s6H4L73BiG/4PessI7nmMg1UDSbcAYD0XztBUMKT31ZYxiuZ4sINQ9m5ZZ6SCr/93rPs/uRsE/xMUF6QXl3eULSaqCGs5XkhF3afbgUQed7tXSMiC+yK3dNQ5imeNVCXJWmG8PCI+rbTQITfVS4GdQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zV5UmNIP/6eiIpqzpiEjb60dO4ItuVBY8YVe+EPuHGY=;
 b=pTOhUEM8lrmXJfwwc7phDK8+QqNzczTubDWrPN8hncalYUVw7cyUCN/gA/QD1hzuODYUxXnk3NK8DANlB+G+U5APkHfLucWTQi1AzxXa2qIoqsekgDAvF//JIXywnMMU2bHUpPlsxsKBgD4I/aueKGDbX4FCZeJHPQVCtpz7kT/Cysa3P4+6UTqOGPkts2hhcsfySz+pfcey7lokIcWJjqeMtR/MU0FrdSxFVfn5VSIbqrpuiSxJC6GCiXJdhQQFUSO7HRuSTJuRgGlcFBbF8Y2UmF1NmGhx4VgiQSvScYCvNZXePhBf39Yez/VQiupS+Y+xjusMJ+ZKH3lXaheZhw==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by LV3PR10MB7982.namprd10.prod.outlook.com (2603:10b6:408:21a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.23; Sun, 31 Dec
 2023 13:16:48 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea%7]) with mapi id 15.20.7135.023; Sun, 31 Dec 2023
 13:16:48 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: Manojkiran Eda <manojkiran.eda@gmail.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Subject: Re: mtd0 device is missing in /sys/class/mtd
Thread-Topic: mtd0 device is missing in /sys/class/mtd
Thread-Index: AQHaOayJT5JagnkjiEuJiDRpeevbk7DDY6ey
Date: Sun, 31 Dec 2023 13:16:47 +0000
Message-ID: <PH0PR10MB4615E28208969294E93F10F2F463A@PH0PR10MB4615.namprd10.prod.outlook.com>
References: <5AF66848-442A-460B-BAD8-31818FDC9DAC@gmail.com>
In-Reply-To: <5AF66848-442A-460B-BAD8-31818FDC9DAC@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|LV3PR10MB7982:EE_
x-ms-office365-filtering-correlation-id: 7600d478-50ac-4ce4-44cf-08dc0a02be46
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kLKSgzce1BcxbV/WVLK0SJ1xLvd7896agjcNuUm5/CroXkyLy8iqAHP1XtUETWzNAFKP/1KWp1ZmYSL6OMtQjxfPYx+C4kBGXPy3dcdrMNsFPQOAp9bovPaWzvMaHb5NDdEVSVLuAhOVeq1N9/TLl1Qhvg3wWJgeHGJ1s9S9ffrsqeSUS4+ZragTJA92TEMfm5SR1dqk9vXKgVgOMc3X5JWFqmVlBvRuX9E7Fr2SWizoIcTYsNgpSoC/ABezhik9qP7akINZu7QZbcKf+xTOkCN6JI0fWEMJsQGvc5UFtk3R8+ZcnjVPIa+tAPdrVRobBno2wmTBkoxXcU0OElUZVqBjN0mTHgO3nQhN5FaXnnXLHeb+CTfovJ/mZdUOnGng4+Yl5t205Y1yR+K70OMa9OYb4hH3LFemNXIFR4GsqLTxipq16sHy5dX55SRcX38EDDWdwXJkvnX3BNVcykSQ0GY4bQqmHnKCa64UYMjaFwSJT3swLK9SjAfxdevYzFFl+lCQad2qQ45RL8A5DepACejpenHiiYVjYDJfrU1AlswV6g7awSUZ9fQzq2u+RtYN0Zv1XSSiPoCdZwpqadGbjq0ujoCePLH8nP3YJD1IaZDvw5XswrqcafxK4RildsdO
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(136003)(376002)(366004)(39850400004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(55016003)(26005)(83380400001)(86362001)(38070700009)(38100700002)(33656002)(52536014)(5660300002)(53546011)(9686003)(6506007)(7696005)(71200400001)(76116006)(8936002)(91956017)(8676002)(66946007)(316002)(110136005)(66556008)(66476007)(66446008)(64756008)(122000001)(2906002)(41300700001)(966005)(478600001)(45080400002)(473944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?J21C2SJG49VrCtRXXtJ/N2K2PLtmcrREAWOiQwARNRbiPCUrrren04rz?=
 =?Windows-1252?Q?PF6BMWdNfq5MnkhzK01iBehsU/WgM8RZ0bghAlBoNNqLF9ZUNnZ9VI2J?=
 =?Windows-1252?Q?WDpxGNEoB4A21DCJdm9KL43swEILna/WR5nthNJmxD1dBSh43dWVeqW+?=
 =?Windows-1252?Q?fE1UrZnguO7Se3Pt3sLzXQgBjqDIAFbHNkvMPVkD/xm+7SGhKGSoAIe7?=
 =?Windows-1252?Q?80Rhf3BWu89ZCxzNq5wtUXPmvTmmalFEkkPMkNlyr5uSPZK0CICCtueD?=
 =?Windows-1252?Q?8j7vFDL0ofCsflN9/PUXi88OcLLgXDAS8K6mJsvUSL3jLPuaHA2NJr7q?=
 =?Windows-1252?Q?rrJSMYL3O05awIXl/L1dFMYKLcaQtCUXeWVAR1gOT6qt1RmKKbZzhib6?=
 =?Windows-1252?Q?+uLoP69XKPR6h2rHJjE/fScRkNfH6N0DEeEk0YzIvy5gPL2dgryE4YfH?=
 =?Windows-1252?Q?85RbO/I4LT36nnlLvCtYx3p+d+D83E/0IKiU0WeKJc7WsUkfR/giYKQe?=
 =?Windows-1252?Q?UCDrc29YHkB1N54BO7ul9GVt95psCpzoBatdJ0lz6pmywIMbW+zhg/Tk?=
 =?Windows-1252?Q?7M8TO0d0NRnhHn95QOcKTlapBs0rZ6iYdzrmCLyFftvzg/J9v27kcoqZ?=
 =?Windows-1252?Q?gJ/M9iF4cG1ODjzyTusLKfNT8Ylmquceu1CmtC4wIb1KYDJP3/OICnAp?=
 =?Windows-1252?Q?+7NaNQonVfuyIigJhoKfW4LliRxLVsUp6ill6JoGmg7wUU5Iox8J+xp4?=
 =?Windows-1252?Q?0Sh9ecWiP7vml7aPbOUq8vGhD2qyzVUPPMGZhaXVM3TwEdQEB6XeWVdg?=
 =?Windows-1252?Q?VOHFyHEF2+UYem9u1yRzVMFMPJJSvP15hHppKBPukmY+2qrJ/wMlc+xg?=
 =?Windows-1252?Q?ihsQE4yOE+jIZQO9Hlai37z7Vs/5BFD3cM0epkajdi99o10JBs2mK28L?=
 =?Windows-1252?Q?OzYLkApNd6y18KZ2tJO2N9v/q2cU0X0HaXaWtuZYafZlwVIXmnqCgkcU?=
 =?Windows-1252?Q?/TScsrdss80rNHlvk7WMqigZOsu1kcx93Uep2CqYRlzKkXciBcGK8v8z?=
 =?Windows-1252?Q?+QXKmrGQgpX2sm64wqJye454EPdgphvGzJ736GHEZFPshRPpDwamJ8jy?=
 =?Windows-1252?Q?iBZVKN4I1YUN0ztF6Ji1LPPkH3kI7UuIV1EAdWpH4EewqZaW9yo4uAeN?=
 =?Windows-1252?Q?k/1k82tgoC4f4v2HcrrhkqR0Tf8dVCw6hx3PMbvTrr2tLCV3SrEpk150?=
 =?Windows-1252?Q?ECfLSBvXUyyUbISBiiBmOIfHraSNSv2yfbfzkHHzTakiPk1QQGcO3qz8?=
 =?Windows-1252?Q?C/pO+kZq/lrybp7wSp20RHJsFjS86fdU2Vusopg7a/0SMlnJQh7yAH8E?=
 =?Windows-1252?Q?nvYcur/44Gmn4JxqJm1FFY6AlC2XpEyoNGpesmfYdFaXoQJ4Gb5K3AD2?=
 =?Windows-1252?Q?DFMFO2zj7jgeUx8TVMvpw7YaGrpbziOXDNG+Tx46cqOWhQq6vGZkI8L2?=
 =?Windows-1252?Q?oz3Fq4jX3Cm0cUsWoX/3DtjLG5Ma60AhWTE/GG2FyBypslZsOXI4HH51?=
 =?Windows-1252?Q?/sw3S+8M2CMPTXFvPwihVv8zKWgbex6s8QNyIiREwbfJ7BfS+KNDYHh0?=
 =?Windows-1252?Q?NHdhH9uRDjzuAUrD4wbNx0ODekLa9kv/+OmgNM15NkO3I/Y3S4kDoM96?=
 =?Windows-1252?Q?vkCjE4H0Mf8H9MMu1ih8sBUzCflV65HQ?=
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7600d478-50ac-4ce4-44cf-08dc0a02be46
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2023 13:16:47.8205
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YcP169ow0DppmmYJGyP1LpZtNOKF0wTGrCHBwyKEbr98aTuFg5o41QZI01ITt59amgn3ChE7blGaCXK8K3+lXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7982
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231231_051701_142038_910779F3 
X-CRM114-Status: GOOD (  14.40  )
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Try adding MTD_PARTITIONED_MASTER to your kernel config

________________________________________
From: linux-mtd <linux-mtd-bounces@lists.infradead.org> on behalf of Manojk=
iran Eda <manojkiran.eda@gmail.com>
Sent: 28 December 2023 17:38
To: linux-mtd@lists.infradead.org
Subject: mtd0 device is missing in /sys/class/mtd

Hi All,

I was as beginner in linux device driver development, and recently I was wo=
rking on a device driver for espi protocol and was stuck with a problem.

I have an mtd device driver through which one could access the NOR flash co=
nnected to the other end of  espi bus. The driver seems to have probed succ=
essfully , I see an entry for my mtd device in /proc/mtd but , I dont see a=
n entry for my mtd device in the /sys/class/mtd.

Here are few logs of interest :

root@mybox:~# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 04000000 00001000 "aspeed-espi-flash=94 <<<<<=97=97 This is my mtd de=
vice
mtd1: 04000000 00010000 "bmc"
mtd2: 000e0000 00010000 "u-boot"
mtd3: 00020000 00010000 "u-boot-env"
mtd4: 00900000 00010000 "kernel"
mtd5: 02000000 00010000 "rofs"
mtd6: 01600000 00010000 "rwfs"
mtd7: 04000000 00010000 "alt-bmc"
mtd8: 000e0000 00010000 "alt-u-boot"
mtd9: 00020000 00010000 "alt-u-boot-env"
mtd10: 00900000 00010000 "alt-kernel"
mtd11: 02000000 00010000 "alt-rofs"
mtd12: 01600000 00010000 "alt-rwfs=94


root@mybox:/sys/class/mtd# ls
mtd1     mtd10ro  mtd11ro  mtd12ro  mtd2     mtd3     mtd4     mtd5     mtd=
6     mtd7     mtd8     mtd9
mtd10    mtd11    mtd12    mtd1ro   mtd2ro   mtd3ro   mtd4ro   mtd5ro   mtd=
6ro   mtd7ro   mtd8ro   mtd9ro

I was expecting mtd0 to be present in the /sys/class/mtd, but its not there.

Looking at dmesg:

root@mybox:/sys/class/mtd# dmesg | grep -ie mtd -A5 -ie espi
[    0.685006] Entered the aspeed_espi_ctrl_probe function
[    0.690990] device matched :  1
[    0.699225] espi alloc started
[    0.704726] espi read from device tree, flash size :  67108864
[    0.712416] espi flash enabled
[    0.716572] espi flash channel is ready
[    0.720940] espi flash allocation completed
[    0.725259] aspeed-espi-ctrl 1e6ee000.espi-ctrl: module loaded
--
[    0.962764] 5 fixed-partitions partitions found on MTD device bmc
[    0.969675] Creating 5 MTD partitions on "bmc":
[    0.974776] 0x000000000000-0x0000000e0000 : "u-boot"
[    0.981982] 0x0000000e0000-0x000000100000 : "u-boot-env"
[    0.989557] 0x000000100000-0x000000a00000 : "kernel"
[    0.996772] 0x000000a00000-0x000002a00000 : "rofs"
[    1.003759] 0x000002a00000-0x000004000000 : "rwfs"
--
[    1.048304] 5 fixed-partitions partitions found on MTD device alt-bmc
[    1.055563] Creating 5 MTD partitions on "alt-bmc":
[    1.061096] 0x000000000000-0x0000000e0000 : "alt-u-boot"
[    1.068672] 0x0000000e0000-0x000000100000 : "alt-u-boot-env"
[    1.076607] 0x000000100000-0x000000a00000 : "alt-kernel"
[    1.084211] 0x000000a00000-0x000002a00000 : "alt-rofs"
[    1.091594] 0x000002a00000-0x000004000000 : "alt-rwfs=94

and the mtd devices listed in /sys/class/mtd from mtd1 through mtd12 are ba=
sically from the partitions list above.

root@mybox:/sys/class/mtd# for dir in *; do cat $dir/name; done
bmc
alt-kernel
alt-rofs
alt-rwfs
u-boot
u-boot-env
kernel
rofs
rwfs
alt-bmc
alt-u-boot
alt-u-boot-env

Does anyone know what could be the possible reason for the problem ? Any hi=
nts/help would be appreciated.

Thanks,
Manoj


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
