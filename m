Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEDED711C8
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Nov 2024 16:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aiyAP2JsgRdeLI08IOZDEBstLSZWE8DzDCsAymBcWFo=; b=lnxNJ3rZZNHSNl
	vfdDZAX7i95XTTR08QbnPpwaI2FxEyDCUtkCgKaLktDC2VFsn46GHxPt1koL9V1TYPdfo7Tks3Pye
	Sg+MjfD6Gq9SuMZ2mxDWxARBcvTIe9rwa2H0Jvo5r8xXql1JkrbfmTMxQYNHkz3QKGme2pPC5E+PC
	jUG5RUCXi335QWONSVpyPE26opoz8CwTJO3F4o6StEnuJ5/6Pj3F00S5AhFXqVxx55vVHHodK9KCn
	0ZaJNDO56EaNaMg3tH4bVY5FEksBcCJD25hXiaw5ubjbAbmstUwunTo6WfdWnJ56NUV97vvij3dcZ
	n4RhsB4BlMwkowQAIxFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDnnd-0000000FqBS-1ebx;
	Wed, 20 Nov 2024 16:43:29 +0000
Received: from mail-mw2nam10on2060c.outbound.protection.outlook.com ([2a01:111:f403:2412::60c] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDnnb-0000000FqA9-0kif
	for linux-mtd@lists.infradead.org;
	Wed, 20 Nov 2024 16:43:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLG1vIt+QORtti3zgah0WBgeTvPm/Yw+yUjEY+I3OuL0N0P+buKAt37jcfPwbdRraWnZNz4j4vy1MPj9PkYVWgnBOytoqTTLb9vsQh9nnsu7p8gUxh3mWjHkS8PvrERib0QUqIJ4moO8tJLrgjbVo5t80WWpVS9P5RMB9S19eVZdmEtYNE4oVqGxP5MVAk/adMTrQdsQSeAeVJ26WCsNqPCrsdovkAdmqCmB2+xVVdg0cXagYgZg4CAwHYOmuQ2Y+5qvk/4gJRGlB7qMbZwgaIeIGc5K0QyRfEKVlS1HC9fbVM76OjgtLP9auRjtxzTuSiJCxFPJM50l59bRyNsvhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVGkJGwggnxCrMqOZPWd4+AtT0DrC1GiPgqeeteLb7w=;
 b=i7o0adecjdMXD/ZdmTd/PTjuu8nU2ynkqqRHWMCHc0zH3dgl/Vr3jGzQMW4UG2k/QW/cxjULV41t5aKc+xKh6eRhjE19wNFvscffhzXC0lhpMMd4HFGf1tcfA3KArxmwuONXv6kolizbbPSZErr7W/vfDymoIN5pQOpwmpfCHQueDkkw/qxbuY+4C8rieOVEQfSwMXUZ7M8j4HDW2e5q2K73HFoZLsR56clHD6GLbMVYP+HsvFs2uStrC9cz6k5cBBlGRo7/pdKFPojwPzDtlxw/GVW7aoXYn2VtGNyLM6fc/OVxXk+CHoBqmCmpOl26mJCfYfO1q6ivBCVRmpntzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVGkJGwggnxCrMqOZPWd4+AtT0DrC1GiPgqeeteLb7w=;
 b=NLLRfxl6/Bp2j8CnV/QWzJhM987syZTkIjAsQAjWgh9yNaVPbRZLf+BMmQbknR3UM+4BTlG9NJfnbxtpWvQqfE7fPe32jz3/7S3qv9FtzBiGOyJN/tLELAZRSTbcf9K4L+QUNREJongCN8SguVh3d8v5ZxrjiFzDPODAHhjKtpa9gfespdaEsy4YevdsVQfp/fVMY+YmYTctfNkn1AOmEUVO78bQl8PbyjpP364zSpggP4YyhjQMHJAhcLcMX2bo8qcedw9IGXDtH/mMtdjQcaY7JW+n9a8z6gVK+ywevMhu4A4BUUf5X1uthErUClrCLfmnqh7WRC5XRYilEMfrzQ==
Received: from BN0PR08MB6951.namprd08.prod.outlook.com (2603:10b6:408:128::14)
 by BN0PR08MB7279.namprd08.prod.outlook.com (2603:10b6:408:14a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.14; Wed, 20 Nov
 2024 16:43:17 +0000
Received: from BN0PR08MB6951.namprd08.prod.outlook.com
 ([fe80::9ea8:ab2e:4ce1:2d36]) by BN0PR08MB6951.namprd08.prod.outlook.com
 ([fe80::9ea8:ab2e:4ce1:2d36%3]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 16:43:17 +0000
From: "Anthony Pighin (Nokia)" <anthony.pighin@nokia.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: fsl_ifc_read_byte16: beyond end of buffer on ONFI redundant parameter
Thread-Topic: fsl_ifc_read_byte16: beyond end of buffer on ONFI redundant
 parameter
Thread-Index: Ads7afueNCrVhsT1SwGJkpfGvdmLmA==
Date: Wed, 20 Nov 2024 16:43:17 +0000
Message-ID: <BN0PR08MB69519A7EA893AC56D83A496D83212@BN0PR08MB6951.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR08MB6951:EE_|BN0PR08MB7279:EE_
x-ms-office365-filtering-correlation-id: 8d8fe4cb-c18b-42b8-55e9-08dd09826f67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?fQ9GUHt5nyiQMDJ6mhjez2VTUmIYO/Xljl39liO5W6yuHXQJ8U5E0jTUOssj?=
 =?us-ascii?Q?lHTKY1JU3b2wvA66JtplxV6fsBFVqLPj2UpGZbwp0sS8rrARLwX69AVMH4Yx?=
 =?us-ascii?Q?udurNYwwAI09avDRkCXTSPV6wFvVtPZjuTRopW6c8yJvJahxa8nQjmCsJkdv?=
 =?us-ascii?Q?TLqtWna7Dpvg1iQqyJslbDcU8oPgyKWKhsbQHWZIboQPS0zhuhPYriztItMX?=
 =?us-ascii?Q?mbVYbdix/gZoeZ6VgfS0DMH3dz1Ymy7T/tpqzVeif+I5kE+tI4LKMBMrCFJ1?=
 =?us-ascii?Q?p2nTr1BHE2p+XspgJ0VA4RLTDVXHUVp+VA5N63nqg9mHEDB4K5oQZv9vEBVS?=
 =?us-ascii?Q?4u6/3XvN0n5JO+IAyZbKjsGlEBKcTDm7cMWiWLqbGvbMIMwM48QF/W6xreOQ?=
 =?us-ascii?Q?c0WNZqv6geALI/HQT7y95NSxxUUgqAejocCKV759ubnRlEJuKjG7LpI1AVfj?=
 =?us-ascii?Q?rJBRX9oe9RxCs2ftbgSo9jSebX0Ai2z2qL2Q1/SQ1Xbp80gx/lhimeYU1rLv?=
 =?us-ascii?Q?nu17WP4eNySdZM7e4m45BpitR8vi3r1c9ZgmwvQOcA7k+fqNQKKcYeUfUc5D?=
 =?us-ascii?Q?E16y4XiKSCYSPxpnYwESR+7105sKi62K8XSF5TiRbrrR54/Z1Ti7DYC6yfaL?=
 =?us-ascii?Q?t0RnUBoyuVtkGuhCg4fyvctAFgqUSRPsysoGCn1SjagVc6j0P+yis59v1XSn?=
 =?us-ascii?Q?kW6acY6LxNhcGicDT3Lagpo7JY27Iq69mRLhHKVTbm8k3t8ziVdohNOso2Rp?=
 =?us-ascii?Q?jxegwmjzvE4raYoJQmgJbX8JbrJOXldxphnvPYFFXjqHg17SbKqibDdBv3Wl?=
 =?us-ascii?Q?aLSstc840qfRN/cjM34JEtPFYa63vrnpMPFy8IrQXwIZRGq/R0m0Clc76sDr?=
 =?us-ascii?Q?bFXrL1nxhnvTqTxk0ATFdicqKFcBlkooriJI4TIblldGeTOJkgHE6r7Keqy7?=
 =?us-ascii?Q?mhaKkp4z/HuwsPEoVQOw+ySimq/aAdm/XMfFfTYQFgiFP7CJ7UUI4VslezEu?=
 =?us-ascii?Q?25W6bIMPWlLvFRam4h3UvHrb872cBFiFQmx0PUQvRdIU52vZJtQhmVT40quW?=
 =?us-ascii?Q?8eAmWZmPUGNCwLRMASJ+LP7n3uIX/BWjMz/Z1afaAOARL7Q694kdr/XXrmoA?=
 =?us-ascii?Q?gI0TOBbAxTHZ17i1G46OxVQZ1ZvD/u44T2QGSpNAYOcpq9fz7CtIzzdleV1G?=
 =?us-ascii?Q?k18VVbMowc8B2lXA/U5CnQFqJs7T9iMKRhx45ysMYsUnppdJxGV3cv0I8QiW?=
 =?us-ascii?Q?bsq3KQjB1gi+/MEOLCVMruEnkOOvr+YoQLD2KMC+t1x2k9+IGbS+vwHulzVm?=
 =?us-ascii?Q?ornZggNtJCdkC5jPcpYi+kwEAruCnl/+19MYhWrfqczAdSrN+1NONYfLirLw?=
 =?us-ascii?Q?Opgfxuc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR08MB6951.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?s3WohX03voXyhTm5l7fkW8lRhJQJEoLHkCALy0pHyCO5fpXkee9qy4r/Npoc?=
 =?us-ascii?Q?RjNuVow3GgFXc4h/ON/vbPlz06hKM+RYM1ufneC63SZVh/DC+A1tQLpz1sIS?=
 =?us-ascii?Q?v6xybrixzA6/dJoL0VDJfMlfn78Ci3DsXwDvMpfdxujOZilzzBqz53lOsHXm?=
 =?us-ascii?Q?39bS3i6FMZ16SD2V/BUTOOqBtzM5jX2jurFgRxvaR9eDVj+VNCYLFNQi9R57?=
 =?us-ascii?Q?qjv4mN97pTMdeNz1yRBcrHq1GRmCQsW8SZRaVV/NBvo2ED06kSBZZQRPPD4B?=
 =?us-ascii?Q?R45Gjcm+JDT/rY57wyhaTYvFccocxiILv/rcPBk/j6KQisoGEnh2XF+lFZ2H?=
 =?us-ascii?Q?XRdKv7aNOSyxBnwuWfkGOYCtzjTEon3DXP7RIyI3CY1De/RT6LPYkO1NoQfO?=
 =?us-ascii?Q?cBrFv1dYVR8zhaX9FzgmPqsFaLzgIAs14HhT5KmZ8SaQFl0G/UErlii64+Ml?=
 =?us-ascii?Q?2Ct7PAUA3cciGMRGnEBjA7h316Vki0YYqQiwSRBvd3UWVQSkpuvIiCIyD0j5?=
 =?us-ascii?Q?YBrgWAGagrbFBRaYblwmmnIi/m6c7D/Gll60qv7ihYFFu6YwcfvHhbwwrM1C?=
 =?us-ascii?Q?H5/ES7YIuAvm0xZdTWkFmG0pB3H/JdATcN2mwywAQo1Riiuu/R5xW651rnZD?=
 =?us-ascii?Q?TfbVzmxjAJN2Igwo4aIl5Y3MJLY4UzWv/pY4iGZinH8xD5fe180yBJrAtdhd?=
 =?us-ascii?Q?fhteltZEZvB51UD2pwca8SJbV1LMwm4lOCcAFb/Jmytg0JW2tgiroAUJ9iZP?=
 =?us-ascii?Q?AaZk3BhzHArugccY08+VmyvFE8JRIC7LTZ4onVdDwWWynwzAgsaUKbuIIGwk?=
 =?us-ascii?Q?zjrS8RA+sPr/hysMs4wuH8w1/AYP4fK+fMo+MDAit8vJmuQMLnIgadz0hFCC?=
 =?us-ascii?Q?cdzn1EcJyJAjXGy7AOhE6o0i5Mn1iFQvpDqhLV6LrtAYMkAZ7+KPArTrk5DX?=
 =?us-ascii?Q?Ct6nP3O3AqFQUd+AWDDz1I8bbiz9U4wdynYoqcLpbTDApfZVbF1JfLuHuKN5?=
 =?us-ascii?Q?ApaJPD7X6WtR7HJyIz4irkjNe8I2R/8CzhABXtVOfRKfaZB2QzqsUn5UFNz0?=
 =?us-ascii?Q?QKv4+JDTZ9QuQJMDPFu61owV9MRkH14R6i+NYvs1cFL4ZRizDBKUBvBdsO/F?=
 =?us-ascii?Q?MgTGM+iII6wBKok+2YzV3jmqSDkFmRRVVWioRB/fniAPOJ2AcVlXEWVsLTyl?=
 =?us-ascii?Q?3729wEXdZV4+VDhDokZX8O7/FVCTaae3rPFSI7rDWjZW8lm3QVbwf0KtXON3?=
 =?us-ascii?Q?qyRSdRgE+runWTVtj0Q8DYw3u/bhnc9FlwpzKymXGjYrzu/1/ju0z1RZ694Z?=
 =?us-ascii?Q?59mcImlrGjhcYRAekhatmqPglbUSGNH8df9AoYVZ3EoJ0v+3npMOlO8DBYD8?=
 =?us-ascii?Q?O7tBrJwl6gPmd/MK99ohQojbfWDMLYLZctvPEkkHY6wl0K4/celXe47Tw+pB?=
 =?us-ascii?Q?BNk/USZ1fV75bgcW96X+5YOWliUAv7uYco21CvqCNtEWAQAw7l3AZAXn1Bx2?=
 =?us-ascii?Q?MhIAMK/SEiknZxFEBJNI1Bh4jJbbLchagEOuBGsaPHjhuWTpSCBio+WpQRms?=
 =?us-ascii?Q?+qtcy8RCphO8B9eLBPuKfF2WKSIXVWOLcXRzhpL5?=
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR08MB6951.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8fe4cb-c18b-42b8-55e9-08dd09826f67
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2024 16:43:17.5356
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Li9sPqGdQWzNSX33KN+W314i7Z0jYJMrpg0oqdfZVEjLfr7Q/IzIuiPB/kgNFr9tdSP86IdMD4/NrGelwMUQKfTu0CA1mBI00e4Kw3WIXug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR08MB7279
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_084327_214993_6959DAD6 
X-CRM114-Status: UNSURE (   7.58  )
X-CRM114-Notice: Please train this message.
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

commit a75bbe71a278 corrected the reading of all ONFI redundant parameter page copies:
    mtd: rawnand: fsl_ifc: fix FSL NAND driver to read all ONFI parameter pages

However, it does not appear to handle 16-bit NAND parts correctly
(i.e. Micron MT29F4G16ABBDAH4).

If the primary parameters page is incorrect, there is the following:
 [    5.196463] fsl,ifc-nand 60000000.nand: fsl_ifc_read_byte16: beyond end of buffer
 [    5.203966] fsl,ifc-nand 60000000.nand: fsl_ifc_read_byte16: beyond end of buffer
 [    5.211468] fsl,ifc-nand 60000000.nand: fsl_ifc_read_byte16: beyond end of buffer
    ...
 [    6.133237] Could not find a valid ONFI parameter page, trying bit-wise majority to recover it
 [    6.141916] ONFI parameter recovery failed, aborting

I have made the following change, which appears to remedy the issue:

--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -349,6 +349,9 @@ static void fsl_ifc_cmdfunc(struct nand_chip *chip, unsigned int command,
                         &ifc->ifc_nand.nand_fcr0);
               ifc_out32(column, &ifc->ifc_nand.row3);

+              if (ifc_in32(&ctrl->gregs->cspr_cs[priv->bank].cspr)
+                  & CSPR_PORT_SIZE_16)
+                      len *= 2;
               ifc_out32(len, &ifc->ifc_nand.nand_fbcr);
               ifc_nand_ctrl->read_bytes = len;

However, that only addresses the NAND_CMD_PARAM and NAND_CMD_READID commands.
I believe there is a more general issue with 16-bit NAND support in fsl_ifc_nand.

Anthony


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
