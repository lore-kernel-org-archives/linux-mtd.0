Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25092C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 08:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dtsmdmQqghBXnVQKbswudBAI4F3BkWjzsYiM+kmSsM8=; b=PSmmVaGUXDUe4A
	Q55OTP6CBs7Cm1RYvm8P049GSQYxtrEo8WhOWmIdWhcqy1VKzPSBjLf45QIqcwckOnoD1BQVPj0Hm
	8pdIPI2IUKdl/Px9eA/+GkHnqliFxttyqKESMEntJ8a7gUKMxihtpDFfy7O+/3zj89GxMG2YtHha6
	oB+1VkkscksTG1+lqOltmb2KCebGhFWV9wp6xu2M6Q4qtWp5Ihhp+Vj0CUo4tcmKbU3PumH20/yxe
	PTq9wADF35Rrgh54fKLorqTdibPpEfjjfuVwsEKiDZyr3bXwQ1dU38dm0kFZP116Clciw9tWOockF
	vBThsGEs0sAMEe9sqr0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOyFH-00Fhst-6d; Tue, 01 Mar 2022 08:52:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOyFD-00FhqU-JI; Tue, 01 Mar 2022 08:52:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646124751; x=1677660751;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=vp8NZng2nDwN0Kqvboy0AEnXydXHojHTcuWNRL7KQBY=;
 b=k+FxHp+n/3VKdMAqSeOSCTdqSE/FTfS+3pNCHz7JV7rM7Yyu6cKuoliG
 VCE8I1iOXMKfrYJpphJlDxP7ShYqa6mfSC154Uryv2V5V/5+Eo28AJ19X
 2EdMtZUIU2KrfQwJ96brer0snPOhS5jIoV5uMdrFMB0M/RAZTH19lx1VB
 UaDtDOxAQA3QfiMVRZYbJ4xzwp89LSIERcdLBDDx758cJC44LJt/bFWos
 jlniKp7iydtxFVIsfLpU3YNxU3QHA2fkdVTXhHSi8vxSc+GqeBpOfiYAa
 IX0djN6P0lZnCibIQTGZ7pAj9PFtXNIHeyTZZo3X5awsoAxB+ynqU11CN Q==;
X-IronPort-AV: E=Sophos;i="5.90,145,1643698800"; d="scan'208";a="164007658"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Mar 2022 01:52:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 1 Mar 2022 01:52:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 1 Mar 2022 01:52:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HvryRkhJQPVgqR3mc+eWzZqaSoGZ6bc5ixUZ4lJDMlTTOIl7QfPNQ0VXgM4uHdoYEBHToXF3rksdyzaMMEQgl6n4k/X/wQSfsbZVLLGxKS70tQkIHqTXsxgfpDlMBObcGiW1vcw8Tf6t7CT8XlAs2cNrvZsJtYO9UB9RCHOHh7KW5Hl5YuTA1XhV+1wEDjmUYvy95j/2W3WNzhc8oz4HRYR5KlFMxlEuNDHTjh8gTX4/E5F1rgc1dq8CXQdvPV57s3UzHGhQgueRWCJFF4Xcjnp0DRkgFph0j61hfCzQ9EVsFK1SsMARsz9dtJ4woO8Cr+kod/iaGSLAy0T5koB4og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vp8NZng2nDwN0Kqvboy0AEnXydXHojHTcuWNRL7KQBY=;
 b=ewJKkdjxqm1FY5wWwMG1rAmWsxu892ZGq9sh+8pWEMsb0TTjaXlQKAweSYahaoLPNMf9cKs6YnbYw/RHp2W1P+x3KU2QHfJ0FmUAxzspjKzVmq1nOhvWpHS3GKjgUE8RSpZR858cLoN+bQDRC8dKMKmTuEs2wk1lVrkbirLXcKQLEbpPVtLY+KocNqsLgrD9XgpB4ndl2ivKAi3yQqu6Z4H6PJBLN0fqVafnLBBQzmBx7VRYawXS7MdSbVmyiuXyz8zMQwMhU9GiP8omL1cQhlr6sNKlBcGGv/3xaJcnNTSJIx7jWBKub/E27vVLffSAP/kznOVov1+3VWTFttM73w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vp8NZng2nDwN0Kqvboy0AEnXydXHojHTcuWNRL7KQBY=;
 b=tqJzU3M+yRDy/nw2GyIX1hYugrIWokxngcu+uQteYdSU8sFF1CzDvJcwot+nRIyka/ID47oXwLraAsOY+KThIXDherXm+WVtW8YlIUQrmUaaKwi0VkVYumyjlvmgber7Nm9/xUTZcZA7QJKbSojebu2PDE4SFGHZNTQYQekoMUk=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BN6PR1101MB2146.namprd11.prod.outlook.com (2603:10b6:405:50::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Tue, 1 Mar
 2022 08:52:23 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%5]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 08:52:23 +0000
From: <Tudor.Ambarus@microchip.com>
To: <heiko.thiery@gmail.com>
Subject: Re: [PATCH v4 4/6] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L12805D and MX25L12835F
Thread-Topic: [PATCH v4 4/6] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L12805D and MX25L12835F
Thread-Index: AQHYLUmqA/4C+WXIw0qT+xRO0Nmy0w==
Date: Tue, 1 Mar 2022 08:52:23 +0000
Message-ID: <eda3476b-4724-f957-291e-4232942416af@microchip.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
 <20220228134505.203270-5-tudor.ambarus@microchip.com>
 <CAEyMn7Ynym+kMX6Mkj45UHw7LFXKRVMSHa31+NjmQYpD7es7rQ@mail.gmail.com>
In-Reply-To: <CAEyMn7Ynym+kMX6Mkj45UHw7LFXKRVMSHa31+NjmQYpD7es7rQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e46b9c2d-7435-4556-854b-08d9fb60cd79
x-ms-traffictypediagnostic: BN6PR1101MB2146:EE_
x-microsoft-antispam-prvs: <BN6PR1101MB21463CDCFE08A6D9027723C0F0029@BN6PR1101MB2146.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dDUDcFDsXzHiJeZX0zdot4+JqGj9En7KtQC60yyiUCjYj42V1GTdAuwx93yN/VhOKNO7ps1icLCgOEvwuyRrNJ4v66+lJ/TXfo19GkdrGR4XOMqf7jyCTNRQpDcqqRL81rjiP7hxMayUuuAq39LFLjyiRN4Py7iy6oPTaHq5nOT41wkATU9krnYYFuLE5x+/8m2MK5vgyCs+JzJaVnDknt6z57d0W7IKVu7jKTovbADDQ9/FjMwM1AU2vzPeP1dA3iXmmkKuiZ6KB+rC6I/p0ztjVX+iuZ3N0KUdEidRgu9azLgXi/jYlDtlyjWuqrPE+jzAZGYWucXHoCOMstO4woSmuGivjXGyHv2EivrV+Rc1ErFl26HB5S2X2LlOozbsjWFQ9iAx/yN/1PCFoJKXKkx5/v2SprSetZB9BuLmsC2XyI+7cBWa+xW4Qux2lskLdLsT7WY70myFmc+GtXJtC/ZVLawGxZJMEPcpvmf+CxMUXQxtEYhgGdo3i0uaf/I8tV30hcIH9j3PG4IIHnIEGkonxF4j125ZXlhMkxCodKZXxQ2JYgvUcCvwwIup1KW3teFrfN7yRTvTGe432E0wvpZV5/kcxpQCOr577xUWO7W60NlxJI7ZAUc23AakcJVVpQavcEJZwtEyOT2XGWShbvEIL6Vn5OUbuYSPLRfW6Ro5ISmsaJLHh6JKHEuPsv+9WnhW31eKVxAILh3UCG8HIuyDeLZsxwUSO/jyU4sOC27fMKkN0FMzvHDD+K1ATwQzp0PTaaXIgdQ/+MuQYQNJDw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(2906002)(6506007)(2616005)(107886003)(6512007)(8936002)(53546011)(36756003)(5660300002)(66476007)(7416002)(71200400001)(64756008)(66446008)(8676002)(4326008)(66556008)(76116006)(31696002)(91956017)(86362001)(186003)(26005)(6916009)(66946007)(31686004)(38070700005)(6486002)(38100700002)(83380400001)(122000001)(508600001)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WnlreDE1UVpwWU5sd0I0dHNILzl4S1BDVjhoZTcrckdRdUdscmh3R3ZibWxz?=
 =?utf-8?B?WUhZd1lzSFk3RFBsbVlzUk1pbnlJb0psNTBINlFLNUt5ZEVDUGY2VmlwdlRP?=
 =?utf-8?B?bmRlT3FISWkyYzlFSkxvdTBZSlpsdmRmN2dIdjdmb3FPZk96SXJwQS9TN2k2?=
 =?utf-8?B?VFJ0S2hGWm5PMW5ITlZhUkozMkh2ZlMvQkYwVjFXQUU3b2s0cTRmYTVrTCtx?=
 =?utf-8?B?WU1Xb1pkZEpCL0ZjRGd1ZVRDUGdwdHQ2SEdpRWhDNVpmT2JuTWdoN3RkTURS?=
 =?utf-8?B?TGcxNVhoTm15b1lxOWJINlY3Q29IWlpzT2ZnTDJJbkltSGlWQjBzL3ovbG5j?=
 =?utf-8?B?U2o4cGJxUC9JWk5FMWI3M2dmeHY5SExuQVdQQmJiWmtxNWhOaDdobU9VUHBk?=
 =?utf-8?B?VGhBdmVzQWJvc2lmUzE2SVBtVEhkZFJVSFBZUlNTRXNxd2RQcjNUSmF6eHNH?=
 =?utf-8?B?OFRoRUxjOUxSNXd5TnE0MmhGbGd6UUJrbXdia1BZVkE2eW1HcFlOTjZTU3dX?=
 =?utf-8?B?Mis1ZWNOdXNNVHZYbVpKOEJFTXRiandKaVFoSzZsYXlJYWtJUUM5am14b0s2?=
 =?utf-8?B?RkxWaGF1Mi95OEc2Y3R6Mlo0M2JSQVY4MjFtdXY3QWdrY1JhNFVPR0h6QnZG?=
 =?utf-8?B?OE1YYm9ZK1RQcllaYjNOOEZlaDlzTlRTMHZGempyYituOXpoL2V5cURweHdM?=
 =?utf-8?B?MThIbVZZVlRCaWtva1JKOHBGK3VtdDNMQjJRVjhNdVkwWDgvL2pnZGNvbHI3?=
 =?utf-8?B?WUdCY09TeW9qZjdRY1JuMFdyNXQ5ZkZLUjZDd2JXejBQODRteE1qS3VucXND?=
 =?utf-8?B?RHhpUDl4UzJrcVdidjc3Rk0rS0l2eU9qSDZpOTFST2JCZEl5VGdvUlQzM1Fl?=
 =?utf-8?B?RHM3MHBHMnZPQmF6bVljOC9mNmRJNW9jOXQ3VXZaUjAxUnEzdXk3UWpiSTFm?=
 =?utf-8?B?Y24yNG14ZU1aR3JHSmh4L2t2RnZzUWZmRnpEaVEzVXFEcHpsWnpDNlhyQXNH?=
 =?utf-8?B?R3lpM1lkRWg2eGhTSkFyR0pURnR3TElUdjNzUVZRc1Fmbi9TNUZmYk1DblFX?=
 =?utf-8?B?eXQ0MWRvRHFYY1ljc0tpclRNZXNvSmJYaCt0T1k1NXpCSkpxT2FsMDhDSGg2?=
 =?utf-8?B?SkxKNDlnbVFCQVo4OWpsczNXdkNnNGM3SEJmZWUwRlZiSmx1dEhmbzd3SVRa?=
 =?utf-8?B?S01TMXJkS3hPamJBNW1qcVN0aitqN0JzRlNRYlJaaUZzTTE4bmhhSkkzREZ1?=
 =?utf-8?B?ajlBSmRQMXhGSFZJbEJuV0VWQjRSZEpZeTVWdG5nbjJDcldscy9LUXRVK0Vq?=
 =?utf-8?B?MWRCekNYQ1htTkNDSHI4aXAwRkVHYk1uSmk1WGtqcmYrQlNRZUpkcGtvRFh0?=
 =?utf-8?B?WUgreVVDazBLakZ4VUJYUnZrRkduMzQyb0JNS25zdXdHRnFPZ0VJcUUxYk1D?=
 =?utf-8?B?dDBUaExYWThoaVFxdTV6MHlqc1J6MG5qZWlCcHBuY1FTM2tPdjhsSGkyWGhh?=
 =?utf-8?B?K08zWENRMGNCK2FIaFFObnlueU9oZ0pvR2Zrd1UrbS81ZXJpM1MwY3lSS3py?=
 =?utf-8?B?L3lMSUY4bktMT0kvSHRzWDRFL2tLZGtvZW5yUmgrdUdVaTU4VFdXNGpEbXZ5?=
 =?utf-8?B?OFRkTWRMUEdxdE1CV3N5aFh0UVp3dzVYZ0JYTnV1M3pGR1MxdU1WTzlMSUIv?=
 =?utf-8?B?bENXN0hEM1VybTBxWTc1MG5JMzNSemZDVWZPUDNBYlRNNFlQaTZsVU5rdC83?=
 =?utf-8?B?c3daV1Zyd3BTbTdPTURRM1ZHRDBtUHJIbTVVdFVvUEhCMVUzQ25xcFpUNTdr?=
 =?utf-8?B?VTBCMG1Fa1UySjBENmNMNnlpSFNxVTJaazdhS3lFdkdnNVYyV1Z3bjhTT2tk?=
 =?utf-8?B?YXl1eTV0MnFMSDBrUFB6N0o3d24rSEtua1dLU3NLU1hzemZkQzRwSU1meS9M?=
 =?utf-8?B?amwxd0NyTFRDL1RERC9hdHdZQjQxV0tFQldObEpjN3VRVnJjNENkRUpBN08w?=
 =?utf-8?B?R1VXMlpMNENFSFMrOGpreFBDdmhSb0tFRmx6Z3FjWUp0NUk5Q1p4Nlp1VWRQ?=
 =?utf-8?B?dXRNSkZ5Umt3QlJlNmI2TFhzcm5wMzU0bzluWnNPaTdPN3FKWjNiYXNkaldx?=
 =?utf-8?B?b1FnNy9IQ01CQy9nL0xjd0NtZVhuVkIrQndGODhQb0ZBUStLTC9uaWlMU3ZN?=
 =?utf-8?B?OFlpTDVjREFIZDZLRE83N3dNQzRRbHFUWCtacW9RMDVUcU8zbTFWWVc2Mjl1?=
 =?utf-8?B?N3Y3R2VTcGNuYmtIYXlkdEFORDBRPT0=?=
Content-ID: <12810827C88E4644AE5EF55DB1622C5B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e46b9c2d-7435-4556-854b-08d9fb60cd79
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 08:52:23.1110 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 32HVmBXkKjrfFTgsmoW3sHQim9XpVAEW9QVz+hh6SrtRQjrLWLcoZ8z7EXLg201d+JvjRHkOhqivQyKROfqUEoohG8LRi+pwl3bF0U96tHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_005231_699027_51333F2B 
X-CRM114-Status: GOOD (  25.48  )
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
Cc: sr@denx.de, vigneshr@ti.com, jaimeliao@mxic.com.tw, richard@nod.at,
 esben@geanix.com, linux@rasmusvillemoes.dk, knaerzche@gmail.com,
 Nicolas.Ferre@microchip.com, michael@walle.cc, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, macromorgan@hotmail.com,
 miquel.raynal@bootlin.com, zhengxunli@mxic.com.tw, p.yadav@ti.com,
 mail@david-bauer.net, code@reto-schneider.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 3/1/22 09:55, Heiko Thiery wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Tudor,

Hi!

> 
> Am Mo., 28. Feb. 2022 um 14:45 Uhr schrieb Tudor Ambarus
> <tudor.ambarus@microchip.com>:
>>
>> Macronix has a bad habbit of reusing flash IDs. While MX25L12835F supports
>> RDSFDP opcode, MX25L12805D does not. Given that it is unlikely that RDSFDP
>> will cause any problems for the old MX25L12805D, differentiate between the
>> two flashes by parsing SFDP.
>>
>> cc: Heiko Thiery <heiko.thiery@gmail.com>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> Acked-by: Pratyush Yadav <p.yadav@ti.com>
>> ---
>> # cat /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0
>> .0/spi-nor/sfdp | xxd -p
>> 53464450000101ff00000109300000ffc2000104600000ffffffffffffff
>> ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
>> 083b04bbfeffffffffff00ffffff44eb0c200f5210d800ffffffffffffff
>> ffffffffffff003600279df9c06485cbffffffffffff
>>
>>  drivers/mtd/spi-nor/macronix.c | 23 ++++++++++++++++++++++-
>>  1 file changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
>> index 2754bbef3d2e..45c2f2c50e56 100644
>> --- a/drivers/mtd/spi-nor/macronix.c
>> +++ b/drivers/mtd/spi-nor/macronix.c
>> @@ -26,6 +26,24 @@ static const struct spi_nor_fixups mx25l3205d_fixups = {
>>         .post_bfpt = mx25l3205d_post_bfpt_fixups,
>>  };
>>
>> +static int mx25l12805d_post_bfpt_fixups(struct spi_nor *nor,
>> +                               const struct sfdp_parameter_header *bfpt_header,
>> +                               const struct sfdp_bfpt *bfpt)
>> +{
>> +       /*
>> +        * Macronix has a bad habit of reusing flash IDs: MX25L12835F collides
>> +        * with MX25L12805D. MX25L12835F defines SFDP tables, while the older
>> +        * variant does not.
>> +        */
>> +       nor->name = "mx25l12835f";
>> +
>> +       return 0;
>> +}
>> +
>> +static const struct spi_nor_fixups mx25l12805d_fixups = {
>> +       .post_bfpt = mx25l12805d_post_bfpt_fixups,
>> +};
>> +
>>  static int
>>  mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
>>                             const struct sfdp_parameter_header *bfpt_header,
>> @@ -82,8 +100,11 @@ static const struct flash_info macronix_nor_parts[] = {
>>         { "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128)
>>                 NO_SFDP_FLAGS(SECT_4K) },
>>         { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256)
>> +               /* ID collision with mx25l12835f. */
>> +               PARSE_SFDP
>>                 FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP)
>> -               NO_SFDP_FLAGS(SECT_4K) },
>> +               NO_SFDP_FLAGS(SECT_4K)
>> +               .fixups = &mx25l12805d_fixups },
>>         { "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256) },
>>         { "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32)
>>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>> --
>> 2.25.1
>>
> 
> I tried this patch and saw that the flash is no longer detected. I did

Thanks! No longer detected? ReadID fails? What do you get on the console?

> some debugging and see now that the correct function to set the quad
> mode (spi_nor_sr1_bit6_quad_enable) is not called. Instead the
> spi_nor_sr2_bit1_quad_enable() is invoked. Further debbuging showed me
> that the macronix specific fixup is not called.
> 

ok, this bit is clear

> For the flash that does support SFDP parsing the
> spi_nor_manufacturer_init_params() is not called. Is that expected to
> be?

Yes, I would like to get rid of the default_init() hooks for new code.
I'm addressing it right now. Would be good if you can help testing it.
Will add you in to:

Cheers,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
