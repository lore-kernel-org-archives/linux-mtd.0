Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AD6C88E64
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 13:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Subject:Date:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hRF+7lJnQ6mLV/kB/fcSxMTesypbKLtnX3aDNG/1Lb4=; b=i9cx3VykEGtKyKky+lOP8rKlTA
	zigvyDSp81oYkmA3BYHmncPZnbwEOPp/aA9tTqSz0jo0mJqy0aj11FoYM8Wftg2byvV8O7sV5dCM1
	0o7uVTSZ7kcpx5G+9VytrkrOA6rQNuoct+i505s89U3X90kN3wawt+DSpkiYJQ4MBwBVrUdnDCDGy
	lsJFWMthRJgFjr0rMOqlwIXAlAsDjQn3ETeq0x0vK6kZ9fEQt5ZgeIu9CfwKUqe13FsdyiRRNUIJY
	2j3nOquqMPj1c90TjB9Ol76J9GC8xra+mvX3Q86bJgzQPvZBq5jgv9KbF79ur/0xKHuw9ao7AF6zA
	ftx1J+uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66w1-00000003oiT-1SQP;
	Mon, 14 Sep 2026 13:41:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66w0-00000003ohj-0biq
	for linux-mtd@bombadil.infradead.org;
	Mon, 14 Sep 2026 13:41:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GfiJH+emoJVO4blUtjRwWoav610loCCD1foFPiZ0npU=; b=WaJKgPIFejt1xqHIBOQwPktQel
	R10V09zw7cjvqCzr2Ou3kMKj+Mk22LSMhDpwY+pYLxY3C7Dvrio8uq+5+stl0lLv+TPs45x1Y4VY9
	6nXYtuOE9Tu4JXDVmeQhV/gug75fUCHfw2leVIiIfEKyHzXu0y3+8lcKkqt+PFpNWH0Cj+OwYz+TO
	tfPiDncgPV2Ty57+MJ+a+QQrrnCRQ+x5udIwTljsp+TEMRyd9cNoybRe+DZ9i/rfXHHpteEY6jSvR
	A1jxxxpE2OwgtVfZpRNVjQUIBsMwtSLanlzSjgQlcsUpboQMYqfl7UUOIg4pAXhrvkpDfCyabdozd
	WN/4Ixjg==;
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x66vu-00000005fwh-2w5W
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 13:41:22 +0000
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED3udo4060757;
	Mon, 14 Sep 2026 09:40:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=GfiJH
	+emoJVO4blUtjRwWoav610loCCD1foFPiZ0npU=; b=cnne4ukXuD4Pqg2R7HtHo
	HT+0Lf34H2cbehWloQxAGTGb3MzBVap0tiwten8oPcErCglDg2UI5+3Txi8uxQun
	LIEEsOOWCx/Yy9o2P8cy81gskqZZIfKjmeBzX5E8d63fwCVTIm+Sz4/9Ts+n+zIR
	/KQiS4q1LVdA4uATdF6M0WVN5eSjNP6VYxs0AOdzjLQ6QzDPNXgR8pTKZfm/tJsw
	fcCbS3KuE7USmi+Ak8PZ3f34XbO6ZkpAHKpRgKGHd2RF0AxqSVOfs1lKUGc77A71
	hJYAjWCpisMp1D/e18tq992zJI1Nn8q7GASRZXcOnLgUCeMHAXN+CapdWyWyKHeS
	Q==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011031.outbound.protection.outlook.com [52.101.57.31])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gn0g86b90-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 09:40:51 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9lONY23l4MYSAZ8fUGYWRLGsvO6tyPz306L4YxLLzw5ptZ6dZVoc5G5kvnK/WLArVcZqJJBSvP7I+FJQGyzrIwNfji/45Sbqzu3ZFKsdKi2SpsZUaR87FRnAs+s/+CO8LfEIumhpeD2qAaHzdQswjPttmbnB2qwxcAf05wN6o1rQXczqrqZWIcdTlfdj9zpGxWS27t7Crgwb3aBoZnkga23YrWFAmPC8DjFcujDIsahmiwDMkVwG1TH+kcsMtdnaJCTIgYPP/4PO7IYsSUOLty3jUuOuOb3koek+5li4I7EQSyWi1EskSx4DmsQiP3PdMFHqXhMCgKxVxSHTRTH1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfiJH+emoJVO4blUtjRwWoav610loCCD1foFPiZ0npU=;
 b=UF/ZN7aa+C2q5TOlzBtHO251yE4xXblqn9poX8TqfiOd7+JTUS8x+rpsZnILavKhDU0OfJeN/opOer4qRZU7Spm5UMvtMbRFUw3qtEUJDFi1dnyQ54b0MfGrfGJd4ax9opwYnScz2HMJO9ZoUxW8hRsIQdelg7pZ/0aUfQGZo8JKfN+B+kQ+igitAqqvi58wmWmLcbXOeDCMdktURuepVDxBMLG2WZK0UwTocaKs+OceuQJgbW9Ifj19Vkv3fs5vX0Mkuvy7BeJz8FHyWqi64SnhYbsrNPChNnpbQvx1GjYM2Z1yYV5n5uahrfyxtqNCqcvfegyrLLs+BzR4EmeYnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by CH5PR03MB7862.namprd03.prod.outlook.com (2603:10b6:610:216::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 13:40:49 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 13:40:49 +0000
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Date: Mon, 14 Sep 2026 14:42:01 +0100
Subject: [PATCH v2 1/2] mtd: spi-nor: sfdp: get the 1-1-8 and 1-8-8 page
 programs from 4BAIT
Message-Id: <20260914-mtd-spi-nor-new-issi-chip-v2-1-3cd4d7e434b2@analog.com>
References: <20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com>
In-Reply-To: <20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
        Takahiro Kuwano <takahiro.kuwano@infineon.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789393320; l=1917;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=ttkDsrNOmQanp5kyAtwNWxF7lRaC7AO2J5ms/oyhmAc=;
 b=GL4nP4BH7PB6KY9CtMOki9gJ2bJJzc7zD3LIq1P91jF3DqEnXhm7OGDFwg3u2uRilXn9+AKQw
 ceOKBKFUfjhDYm7XTjSbnJNrKShzHj0HNqM/fHKQi6XkNfQZ0sjq9U4
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ClientProxiedBy: MR1P264CA0213.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::18) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|CH5PR03MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: f55c2d39-71cd-4269-af5b-08df1265c9cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|6133799003|3023799007|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: AQKtkcz5WP9zdqAzlq2FjMyvJ61l9lpiKSNPz09CabwbVnPaC+tdci5bN/bIifIdfgZc8nXeaBp1hryxn13nN1T5np5c15JBE9pfXYgXhWAf1gwUUTH0+P2H5dfsyZ9F7jzrfSAynqKpMuL0iHD/NGpm1pE9d+/Q8kniTc4cx8UGFTFx6QoFewpR5RTcHBoFUDv9TqWI5kPDknlN2y1Bd0KkTJ/Aqpo71ExDRR4EYiiZ9jDoM2d9vJQd0T/ffhy5LhTrvRyEEJyC/vy8iH4pDoNORQgdtY8pGAxgEx9w/hiwMCTC+UVJfxYZTY69Z2hsc6GVw/qTbG5fX5afmpRpWyXXH5PrGxB9chgYwnXPEZOtdtte68SbrlaNQvj/Q1dVCynTk8Ldw+mgi+n72ODy5JiPBrdGn/P/EiU66Sj/GmrUo5szxBDwkdYwZDR10zXbFn54QTLiphjimn5Qb1mMHk66Wl/smdpxb1YVGwo+DJ+NRvEbdHNK+USlvP57/EwbapmH6qQT3zi1SibWY8pLRB1++bDeFgFv/WOdOK+mSpbAMIEl1Nz8cXcT1UalGki6VmgoFSsR4qS518A4d94F03Ike603ARirdOJ3n5P2ergG5QUhR7THf7FG3ODZYwt6NUttH+fZEMRMotC67guplUiSjdb8wXhe5KU1PLVrXhc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHZGS3cySVpTR2NPK3ZHdzFyOGxnY2ttMTB4dCtibkNSczdLaTg0eCtmUEJ1?=
 =?utf-8?B?b2tWdW5tMTlDUm81bzNzbkNYeXZvOEVBU0lSN1pNQVFrOGVwZDlmNHRsWC84?=
 =?utf-8?B?cVpwMzA0bkhPWng3dHE1Q0orMVhmZTBoYisvb0JQRVlmUSsrWWtNeU5VQnRZ?=
 =?utf-8?B?dmlqbFJlbS9vSDdtUmJMTjkxSXpkR0Mza2FGdEl0L3pzdGRsN08yeEMvdkY3?=
 =?utf-8?B?QUwxMUF5RVd0Z0tRei96biswZTNqak9xSzNQa0M5cDZnN0wxbFNzQU1ROWNS?=
 =?utf-8?B?UHpqb0R2bHhzeXB6dUVRQW9FYnJkRmVFSGphYmsvbmlHUFhZRzVmY0FHamtG?=
 =?utf-8?B?N2t2aFp5NEwzUmR3T3drWnB4ZXlReWF0eU9RQkdkWXU4TDVBZ3V5ckZZMGZC?=
 =?utf-8?B?T0hVNmZ3Q2w0NzlEMm52UlpxcEc2VlJHeVpHQnpnWC95amsrUjZrQnlFTjhu?=
 =?utf-8?B?UGNkUDNwZ085cmVYRFVxbEFIM1ZBZGxybkZ4SWUrTG1qNEwwV0E2YStFczZz?=
 =?utf-8?B?Y25Ca2lZNW1MdmNNYjVBeDVDbmErU3BHTUpTYmo2a3htRXk5N2lZb21jdlYy?=
 =?utf-8?B?aWMvck1RWDVZbElodnVkUG1pbnJ4dEg5NDUvOWdCZ3ZrVWtZSlNRZ3psTVMw?=
 =?utf-8?B?VDVieHBIRUJlcjZrblQ4KzlDMHhsU2dCVXg2K2UzTlN0ZjJVYW9mQ2h3Ungw?=
 =?utf-8?B?ZTFETFVVZFR6QktpcUZXcHoyUnArSW00VTR1WDhBRFd3azRmUjRGdjhpeGpE?=
 =?utf-8?B?NFcvUkw2UDJjelBPd0VEMHRRd2xlV1ZGV2dCWHdzZFZTZ3ptdTdyRjA5Y0cz?=
 =?utf-8?B?ZlRPWmtRL0tBdzIzMThUZXJJaFpXYndVTTFncVAyS0Vrd3k0UURla0JYbDR3?=
 =?utf-8?B?VlcrZTRYSGdFd1NvM1U5RkY3Wi9WR0xLREhFZlhEa2EzbHBITE5DbGZoVks2?=
 =?utf-8?B?UnhxSTJHRHZRbEY5d1lWN25PU0pZQ3hMaVZSeGlPQ2FWM01nK2VtdTdLZEhM?=
 =?utf-8?B?RlFUZUJjZGVzOHQxYXNhWXF3WGtmY1huelRpMU80SVhnaWorcVlTSkRNWmtv?=
 =?utf-8?B?a0dvY3VSSHBzOGRKWEFYKy9NUXdOWFpTcVJTcVZ0RjgvakZySW5vN3YvamY1?=
 =?utf-8?B?N25PbDBDYVl3K3lGdDNNQWFMMDU3Y3B3dklTb2VIRGljVmFmemxTSWIvTDM0?=
 =?utf-8?B?SzhtY2Ntc2l0N2FUb0syc2cyMm9VTnVEMWkxUWUxbWxCL1p4cEdCTHlTczFH?=
 =?utf-8?B?ekZ4WlEzRzgwaDdQbVQxRndJQ3F2dVlVZm5VUWxrcjdiNmJPUVdNT0tCOGl0?=
 =?utf-8?B?eGd2cXFDdXMzWHZtSHNhR1AvL0Nya3dkbU9hSmpCai9GWFRObmxIS2xUSmVJ?=
 =?utf-8?B?WWptRjRuRWtIc1h1U3h2dVVWVEdHR2RQMkQzRG5HT2pjSGc0d2pWejVNVE1U?=
 =?utf-8?B?SGx0ZmVnVGc3bkJzM3RUeTN2anRaMHZWdEg5dFViVW9hQjZZQ0x1RVIwY2hB?=
 =?utf-8?B?N0d6YjJZN0d5WlJOZ2ZNVTMxVVl4cC9hMno2RlVXcTB5TmorL3FXcW9EMmFK?=
 =?utf-8?B?Z3pZK3dZUlMzL0VWd0RwV2VJOVgwNzRReHZUMGxER3QrRXRhZUFWTWFpbDNV?=
 =?utf-8?B?cEVhUUExWmdSY3ZabGFsTzJ3aWpzQ09MbWhPR1BsOUt1aUxFZWZla2EvNDk2?=
 =?utf-8?B?RHFRTU9LTnNESm5reEpsVXFDMGFaZHZkWm9TUkhxRVVJcU9ZQ2ZiaDZ6bXNk?=
 =?utf-8?B?UTZjQXB0eXNTYW5EZFY1ejJ5ZWRxUDFWc09XdkVxOExJMW5BU2x4R2w3ckpw?=
 =?utf-8?B?L3RoNGJ6Rmt2RjN5cXIrc3pheTNVZC95ZUNhMUlSQWh6TmRhdzYxYlJpWXU5?=
 =?utf-8?B?ckR1TXZTd20zN216NjBLdHl6REVVV256S0lqTlZqV25CWU9RZGRDTHJ3bjlT?=
 =?utf-8?B?UmQzdDV0Q3FmZWNuMkUwaVRhbkIvb1A4RDlzRDNjY0Y0SCs0V2R3eU9QNUQ0?=
 =?utf-8?B?YlM0ZXR2cTRpck55Z25aM0RnU3JNZjl1R3lVc2lzRmpWSVlHRTBDTndNLzdp?=
 =?utf-8?B?ekIydFQ1ZjM3YTB0MU5uUmg1QkRjMk1SaHlzWnhPU1R4eXVJWjVNOFVabHRm?=
 =?utf-8?B?WWQ5WkpiWEVFalhOU0lxOFZLU2k0OUVlWmhseXhqdzN6MmlPM3hiVVE3TUNX?=
 =?utf-8?B?N3hOQkVzVU9FZWRsRlUwT1FCMDFkWURkU3pLMW9VLzJkVkFXcytPcXJDMGky?=
 =?utf-8?B?Y1RVL2tYUklqYVhHNGxlc0pIN1RYakd5R1ltTWxvK0grSnY5YkxCN3J4a2oy?=
 =?utf-8?B?OUNFUmxRRnFFS3Y2S0lMbksvci9pV3htbWFGbElsckRSZW90dWIrdz09?=
X-Exchange-RoutingPolicyChecked: IWFwNMZ7Bio+w7WPKZPiJ0kyxP1lgsGUfF0b0wdYnBL/ptCNFCB3Wf6HAquVDHqAMsFKOjxhzw78yBY9Ptnt4Vkm4Tk/LwkPO2sDQoP7OO9mXlWUrfPzUXdPLpd5C0eyHcq0BnelEh7aeBzJNIZqMnfLXk9pBrNtvVJR9PXsdP7hM/9QXS2gUxj77UewWHNFjTh1cPKRpVmZvtE2z7IWjZ3aMC75VmX2p2r6ci9UTOgo+FspasHh9ZSgv93KNdjdShUFB1FCdw8727m/0nq7PuY/wKs7iPcS3yxBTdHkbvFM5UEXZoFncUaCHvy+s0LMC2Maafrpz5SDhnmmDM5djw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f55c2d39-71cd-4269-af5b-08df1265c9cb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 13:40:49.7240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZ0dGH2LQpKXRbPGraQov5d3T/8ri4iclwZfEyDseLYiphuWSC1k4JqD01sFY8QIK5LIScK86wcyZ2sQVa++RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7862
X-Proofpoint-GUID: _yhh5c-n6AKZrSC-T71DqyAIditKhIhx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5NSBTYWx0ZWRfXzlKYWuhsGh2p
 B+Hx8T4xKAcvheB5SCy/z0NsotriynA3o1bmIDGI+e6DWA4toin/l2ZX6tktMwE02H3v91J2u+X
 aeFJnFwJtUIwCRkwXKcgXmj8lpAjpZNq6QSdIw4HUJMVXB5winfV0Ts7+fgObYC6PkKmkpc6Bca
 FRFtMvTBXPCgva3gB1ddawNa4gdzxpzTo7iBYZ/FTjSMQAaanMxKdhqUmQHt/zilwO/mfOo9mfF
 Xo4uvY8C5evDYAW12U127lPs17Heb6T9AaPrbLWL/wCJHtZu2MRIrcw9SV+TQebWGuMcVKrNzSQ
 NMXsj6UZ5GpTMl5C0QL7R0zFC1t0K8CRIs6hbU9tqsaG+e+WSCZZJHjla/2AnQpowe5Uc+NdYJc
 ZUr6S6NwXgpl/0JTHDgD9MMg9nxnFABOLs1AeT2yW8H0l2oFVRvjaONqxIdNQoHi8KpY6i+RwFD
 BYY0fKNlr75dVn6U7Zw==
X-Authority-Analysis: v=2.4 cv=c8Q+0h9l c=1 sm=1 tr=0 ts=6aa7f963 cx=c_pps
 a=r1suf/lb2duQPz5POPReZg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ugNRTJOwpmtT476g4l8T:22
 a=gAnH3GRIAAAA:8 a=CnAg5zHkUThGRFuh-Q8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: _yhh5c-n6AKZrSC-T71DqyAIditKhIhx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5NSBTYWx0ZWRfX3fURTUk6cGrt
 fQXqcrAr89tzxQAXJ6ECM8HuZrhgLGHSNMQBuzaOEqXFxefvhPQ+dVTy9b0j4Q66jSrbLtLYn4E
 mbrtuUK0Xa7RboQRPsTzccP+ceA12ml5Tyzy14bAterwb6t0dSYM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140195
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_144119_363483_625C1A28 
X-CRM114-Status: GOOD (  14.01  )
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

Q29tbWl0IGFmMjc5MmFiZDQ1NSAoIm10ZDogc3BpLW5vcjogc2ZkcDogZ2V0IHRoZSAxLTEtOCBh
bmQgMS04LTgKcHJvdG9jb2wgZnJvbSBTRkRQIikgdGF1Z2h0IHRoZSBjb3JlIHRvIGRpc2NvdmVy
IG9jdGFsIHJlYWQgc3VwcG9ydApmcm9tIEJGUFQsIGJ1dCB0aGUgNC1CeXRlIEFkZHJlc3MgSW5z
dHJ1Y3Rpb24gVGFibGUgcGFyc2VyIHdhcyBuZXZlcgpleHRlbmRlZCBhY2NvcmRpbmdseS4KClBh
cnNlIHRoZSAxLTEtOCBhbmQgMS04LTggcGFnZSBwcm9ncmFtIGJpdHMgb2YgNEJBSVQgRFdPUkQx
IGFuZCBzZXQgdGhlCmNvcnJlc3BvbmRpbmcgNC1ieXRlIG9wY29kZXMsIHNvIHRoYXQgb2N0YWwg
d3JpdGVzIHN0YXkgYXZhaWxhYmxlIG9uY2UKdGhlIGZsYXNoIHN3aXRjaGVzIHRvIHRoZSA0LWJ5
dGUgYWRkcmVzcyBpbnN0cnVjdGlvbiBzZXQuCgpUaGlzIGlzIGluIHByZXBhcmF0aW9uIG9mIGFk
ZGluZyBzdXBwb3J0IGZvciB0aGUgSVNTSSBJUzI1V1gwMUcsIGEKMSBHYml0IG9jdGFsIGZsYXNo
IHdoaWNoIGlzIGJleW9uZCB0aGUgMy1ieXRlIGFkZHJlc3MgcmFuZ2UgYW5kCmFkdmVydGlzZXMg
NC1ieXRlIDEtMS04IGFuZCAxLTgtOCBwYWdlIHByb2dyYW0gaW5zdHJ1Y3Rpb25zLgoKU2lnbmVk
LW9mZi1ieTogTnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4KLS0tCiBkcml2ZXJzL210ZC9z
cGktbm9yL3NmZHAuYyB8IDEwICsrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9zZmRwLmMgYi9kcml2ZXJz
L210ZC9zcGktbm9yL3NmZHAuYwppbmRleCBjMjFhNjk1M2RiOTYuLjhlMzk4OTE4NDQzNSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9zZmRwLmMKKysrIGIvZHJpdmVycy9tdGQvc3Bp
LW5vci9zZmRwLmMKQEAgLTEwODEsNiArMTA4MSw4IEBAIHN0YXRpYyBpbnQgc3BpX25vcl9wYXJz
ZV80YmFpdChzdHJ1Y3Qgc3BpX25vciAqbm9yLAogCQl7IFNOT1JfSFdDQVBTX1BQLAkJQklUKDYp
IH0sCiAJCXsgU05PUl9IV0NBUFNfUFBfMV8xXzQsCQlCSVQoNykgfSwKIAkJeyBTTk9SX0hXQ0FQ
U19QUF8xXzRfNCwJCUJJVCg4KSB9LAorCQl7IFNOT1JfSFdDQVBTX1BQXzFfMV84LAkJQklUKDIz
KSB9LAorCQl7IFNOT1JfSFdDQVBTX1BQXzFfOF84LAkJQklUKDI0KSB9LAogCX07CiAJc3RhdGlj
IGNvbnN0IHN0cnVjdCBzZmRwXzRiYWl0IGVyYXNlc1tTTk9SX0VSQVNFX1RZUEVfTUFYXSA9IHsK
IAkJeyAwdSAvKiBub3QgdXNlZCAqLywJCUJJVCg5KSB9LApAQCAtMTIwNyw2ICsxMjA5LDE0IEBA
IHN0YXRpYyBpbnQgc3BpX25vcl9wYXJzZV80YmFpdChzdHJ1Y3Qgc3BpX25vciAqbm9yLAogCQlz
cGlfbm9yX3NldF9wcF9zZXR0aW5ncygmcGFyYW1zX3BwW1NOT1JfQ01EX1BQXzFfNF80XSwKIAkJ
CQkJU1BJTk9SX09QX1BQXzFfNF80XzRCLAogCQkJCQlTTk9SX1BST1RPXzFfNF80KTsKKwlpZiAo
cHBfaHdjYXBzICYgU05PUl9IV0NBUFNfUFBfMV8xXzgpCisJCXNwaV9ub3Jfc2V0X3BwX3NldHRp
bmdzKCZwYXJhbXNfcHBbU05PUl9DTURfUFBfMV8xXzhdLAorCQkJCQlTUElOT1JfT1BfUFBfMV8x
XzhfNEIsCisJCQkJCVNOT1JfUFJPVE9fMV8xXzgpOworCWlmIChwcF9od2NhcHMgJiBTTk9SX0hX
Q0FQU19QUF8xXzhfOCkKKwkJc3BpX25vcl9zZXRfcHBfc2V0dGluZ3MoJnBhcmFtc19wcFtTTk9S
X0NNRF9QUF8xXzhfOF0sCisJCQkJCVNQSU5PUl9PUF9QUF8xXzhfOF80QiwKKwkJCQkJU05PUl9Q
Uk9UT18xXzhfOCk7CiAKIAlmb3IgKGkgPSAwOyBpIDwgU05PUl9FUkFTRV9UWVBFX01BWDsgaSsr
KSB7CiAJCWlmIChlcmFzZV9tYXNrICYgQklUKGkpKQoKLS0gCjIuNTUuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
