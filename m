Return-Path: <SRS0=dr6A=FL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44129C4361B
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 17:54:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00DA1235F7
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 17:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00DA1235F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ny/KYI/WV04pHSwG63UYWyztGOip7CSGzBe2xc4a0EI=; b=SRW7d7cnjOaVwp1MepkqtjaUI
	ndXRDmejfmPkjp4wW0/U5uAE81red3WgEL890VECUZltUwLHeU0T+N6Hc1sn4KQoWvB58XDs9I1T+
	UnQmi9UNL0CR+dcN0sHn7zW83EyXPdXNLjwyAMhWqNcpz/tui0wq+XCAJT6cvWibuDgD23Qw8U8BH
	rWi1wjZYpXkEYSlIwLPGM9ocpSMVQpove1eEv225L070nk/Ly/tFWg6VMNnHBEfw66b1gCReyyRrO
	SSsevO9ModjmXqWKa9sG6M3B7EQtuKNopWCDZBW1j+rJcSivC3sqrCPgb6qjf4+TnZZOuPkiyftir
	JpD7Qe/3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmKhT-0004lq-3f; Mon, 07 Dec 2020 17:53:27 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmKhQ-0004l6-9y
 for linux-mtd@lists.infradead.org; Mon, 07 Dec 2020 17:53:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607363604; x=1638899604;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=0WnQwzs1tLDOpdgeznR3/bUP4OC3R29j9s0qLx9gaL0=;
 b=q4ZRJ/1jIopIJMbPQA9F/XADGe1I39ecWtVFTcuJvJKM5kipJFU/ylDd
 R2KbOmSqpjxYl/l1iNiWo5OL3D9olVGafUC3d3qaflKhIrOreJEzDhlGU
 khBkznLeth5w0aub+GMRYzThZa7HXivD52+WjnrJ6/L6XZ5IpmxbAyP5p
 Dzt6U+IFus1R/Asw93CJciaKJaVwKYQzRDrilqnR141tkFJu/+v8W3x01
 Zf/tLtTViDxClreUkwMjQnMLMSB8f0fGf8xH+fZEYGD3ozWlG5q5zNqwG
 sarqJFlhKlz/MpF/9KAt6btTzeDtq7P3GFxu/V/g70cpPadoTeWiKjeya w==;
IronPort-SDR: ov3G13+bst8Pwr4g+C6csPtsp65UyIvVfVwjuMxRk/nVnbXDLas6dtmup5vF3ojDYgICrQp7rb
 6uIgLjxo9+5fpqgFSO+kUqONqRm94WHHiZdJBRmUNUVIxqHKkhdRiBp/HFNRwzUok/7GE5gNXf
 Yli3HHMVx9IsxoTR16hm5DsgQzqKChwoydtQNh24oz4zfYssAjct99qRD9bxEW5aUeVciaagcD
 v3wnZk8uN5+sSelvaWzh58RPTvQPyt4JWUzc0CKX3Cz/tqBrxknncJEWcl08xDPQMi3ybjDbo2
 rXI=
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; d="scan'208";a="98904693"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Dec 2020 10:53:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 7 Dec 2020 10:53:21 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Mon, 7 Dec 2020 10:53:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hzSZjMA7wlKFJv71HiplDkz4T2KVpTXAeQZaQY/9M7ptLkZTSW/J3UH8mA7dqfwuhC8iFgjELfkPQdSpjnoUPpjljLVu7KMU7vwZMzikSfzIppB68/8rwyRzUml1LvrJI6OD/NCeU2l+dqA9VY1ZBai95LWxWHd6Ztmn7iwUDw9nk+4V0QnJZRxGo2m81Pz9R5aye6m0Wh9Bc6MXXyaf3WYZJhJO4eYQZkHrZfk1pp4hPQc4hjHAd5D5EF2CWhJfyiL2ZVUY4v0AICi48jlWP4ma5rrTpy5fEkv7yvjaSAfIkuGHQDQsjnqOJSCGxetxIaJBsFC+4C1/puiXaSGCmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WnQwzs1tLDOpdgeznR3/bUP4OC3R29j9s0qLx9gaL0=;
 b=loUIASUU1Gp8uqZ2oaIJkvWViWUTuba620CXWDbYu0yNLa+72UkU4TLwrB1LamS/eCS3sMxk+M+7qVNNMhVoeDVYf+6L4d8YQNQaInKj8vAvXNv5buhncT4SnYsUdDitBSfUVn/sthgAhLQY7m6qPO1CkbgrJyYHjjElEuBBTuXzwchbgB+LjeFsFtLhS7YytSqz7b8cCv9aiRwzt0utthTOw8Ih1fsWtmLh3+vK0Gz8vjkBUs7R0blnRFBBBpcqoZIrWWHw83zd7sh26losZSKlCG4zbD+eLgitL82ye+A++9BRp4VkzFdVfcA3/QgazAkEOdG184WvQbvZJrR/SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WnQwzs1tLDOpdgeznR3/bUP4OC3R29j9s0qLx9gaL0=;
 b=BR0d4ayWWtT4JLThZ7oMD2z13N1ArvSkBMAnc4AquTtAdj7pX1MQ1/QFnKLncaGn37bVH0PZVPCI153Mf6ShVKJfAPm0AL3ttlnyAmHEZKkxC+zE3QdM3t9VM+REOidlP0zZlMCvZ2HM4mY8/KR/3Dec0TUOl0aL3QsWoW+mtu4=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5179.namprd11.prod.outlook.com (2603:10b6:806:112::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Mon, 7 Dec
 2020 17:53:20 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761%7]) with mapi id 15.20.3632.023; Mon, 7 Dec 2020
 17:53:20 +0000
From: <Tudor.Ambarus@microchip.com>
To: <liew.s.piaw@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: macronix: enable 4-bit BP support for
 MX25L6405D
Thread-Topic: [PATCH] mtd: spi-nor: macronix: enable 4-bit BP support for
 MX25L6405D
Thread-Index: AQHWzMHZEY+/a+emnUGLxSUCRz+Y5Q==
Date: Mon, 7 Dec 2020 17:53:20 +0000
Message-ID: <cc1a8c52-6319-2d37-8df8-f6205bdbfb37@microchip.com>
References: <20201207024612.1318-1-liew.s.piaw@gmail.com>
In-Reply-To: <20201207024612.1318-1-liew.s.piaw@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [5.13.1.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6733071c-8d00-4d5d-2ccb-08d89ad8fc06
x-ms-traffictypediagnostic: SA2PR11MB5179:
x-microsoft-antispam-prvs: <SA2PR11MB5179B6F653833CD190906270F0CE0@SA2PR11MB5179.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qg+7+RUEXQEEB+eqh2+Ity/GVtIqKlvNIBAEFH6AwVtu/AFKzz9akpP755oACBjq5tET9BGAQgxCyziKEJebVjVMSA1CP0fMisJh/EHnUHiP6PF9tER9CWQAGImFcHlcvvI5iZjAaYRwGGd7MhEICnBy3+TWBxmzTiMpoYepGkwkWf4KrOv1EWowq/iExf9O3IGw6rtD+7OTyTPTv+NXbn6DO06PBaPweTi0UI1/Qe6G7n78JS/LYq1nN5PPOkFGpKaSES7SKsIen85Kdnr4uZvVWfU82q++cwO6ru/n1KBXzuxWs9hVVy1gQCuToCo9hWRYIOviDDvkqIQHvpUQXjSGrFbfTLob4viCURjIq1CwNlVxWdPs9Bl+zn3388Pz0Ouh9ycL4d8zG93EZwzqcWTXHOLD6rSPc+jeg/mV5NPE6Q4GEqrIwMYOlWnFOL3NHJ32in2X87Lf0gif7VGrwAnw4razUidoQzlLdFANSHk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(136003)(396003)(346002)(376002)(66446008)(6512007)(36756003)(66574015)(8936002)(76116006)(2616005)(8676002)(2906002)(4326008)(66476007)(66556008)(66946007)(6486002)(31696002)(6916009)(478600001)(966005)(26005)(64756008)(5660300002)(186003)(6506007)(83380400001)(53546011)(316002)(86362001)(54906003)(71200400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?MllwWjRoZWNqNmtjdjdhR3FjcUh1ZTZBc0g5c1AzZ3g1dlhmTkY0V0NFdml0?=
 =?utf-8?B?Z1Q3UWk4azA5bFJWTDJlOHF0TlVVWk1RV2dMY2x1R29DcVI0TGN4K2w4M0Vm?=
 =?utf-8?B?Ulg2WmtBMjcwTDJCRktGMysxblMwYTNpMURNcERkaXhyRzJqR0NTMXVwdVlq?=
 =?utf-8?B?bWhqQWpEbG53NDNLMEFCL1IvNVBaOWl3Q1hCQ3FNT1ZPY0QwcEMzRC9tb1RO?=
 =?utf-8?B?VXVzVHFOc1VMTXJnNGw5QXVYb01xQVZJOVN5Q0tGaGhmblJySkJnaXJ6alRu?=
 =?utf-8?B?aGpBRGE1ZTdiYjlidkJsM0wrdC84bGlvSVhOdG9KYzJnT2ZrNEZyWkMyZ2pE?=
 =?utf-8?B?ck9sWDJSaHFySHI4SENFYlJKM0Joc0FBazVKVVlGRzNPSVl4Zk5JWTBCemtE?=
 =?utf-8?B?ODQzMTlVRWRkSFdZekZyemxmWVJLRDlJQmhIRGY5cnN6Mm4vZ1RiZXBEQWNK?=
 =?utf-8?B?R0dCWWxvdDRodHg0TDd1M1h2SHFpUE1DS2kwM1Jrdkk0SUl6QVRTcWttck1u?=
 =?utf-8?B?Yk4wZW8vRjRxL2g1bTF2eHZ3MHZTanhkaDZlcjNCd09NbWtTSzBSMDJNOFZo?=
 =?utf-8?B?RlZwdmMxUEZWRmhSbE5VRGJmRlhVc1pIQzBENFZzTVFqc2JJbUNBeVluQk1w?=
 =?utf-8?B?VU9CR3RwK2phUUVjYnpKanVNZTRFUGRWcGMxUGtSMmZjRTlBeHk2RG1ia05W?=
 =?utf-8?B?RkxnRjJ2U2tOV0hkUWVWc1JKRE5zU215M2xNWTBPenJiQ2ZWVkFEbEtXSDRO?=
 =?utf-8?B?emNzZDdlSVlqVFVSZ2FuTkpXUnhTSENXa09IMm56WHhpQWk5dW1lOTJVNjFy?=
 =?utf-8?B?UEFoU2RFUWVRTXRoQkFnUWlGQ2hGZ2VJWlo0ditldk9iazJvUDF3ZTFyWnds?=
 =?utf-8?B?aW5TUC92dm1sWUE1b2tjU2JIWWpRanl2SzFhV0tKLzRxblArMTZsaTFYTTc4?=
 =?utf-8?B?S2EyTTljUnNrdi9pUWwyUlBaWXFnVnhVZEt1b3dkWGt3YmJMbkNIeE9jLzR1?=
 =?utf-8?B?RU84dWZianZ0alRvNG5HSG05RzlBK3pPbnlnVE5ZVUNnbGZENFgvZWpEWEF4?=
 =?utf-8?B?M1pxd3NHL1VLQ3B2V1J2anN0UmlOQUkrUkZRUk1qeE5TNkZPY1BnMnRSclhU?=
 =?utf-8?B?TFJXdXk0N3RmVTFpVndLVkwyNVF5TUZTSEVtV0Y5MWp1QVcxdTVWeHMzbExG?=
 =?utf-8?B?OG5CRTlvcE5mTlBuV3ZCcHJhWGF5VFdyWlJRNmNPK0xJSkFRZGtrRG9jWkwy?=
 =?utf-8?B?ckMxV0pWeVlhL0QrbEh1M202RVhzSTU4dUhCSEp0ZGF1SjJmWXRpaGRUa1FI?=
 =?utf-8?Q?lZkKiURGqz+cU=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <FEC4BFBB2FBF8E49910DFAD2E67CD68A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6733071c-8d00-4d5d-2ccb-08d89ad8fc06
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2020 17:53:20.3577 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lx5DBlMW9m/gb6VD4EV3sk4Z5F87ri+GhbV3ebCyXqO+BTupr5EzkfLGqJxH0gT/veTP0EY/qCrT7a5H2hJCv8zmT9u07lf/dSG6whotfdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_125324_487623_DF38A7BE 
X-CRM114-Status: GOOD (  16.78  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Sieng,

On 12/7/20 4:46 AM, Sieng Piaw Liew wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Enable 4-bit Block Protect support for MX256405D and its variants using
> the same ID.
> 
> Tested on Innacom W3400V6 router with MX25L6406E chip.

:) What kind of tests did you exactly make?

> https://github.com/openwrt/openwrt/pull/3501
> 
> Signed-off-by: Sieng Piaw Liew <liew.s.piaw@gmail.com>
> ---
>  drivers/mtd/spi-nor/macronix.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 9203abaac229..7aa8b1ee9daa 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -42,7 +42,8 @@ static const struct flash_info macronix_parts[] = {
>         { "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
>         { "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
>         { "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
> -       { "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
> +       { "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128,
> +                             SECT_4K | SPI_NOR_4BIT_BP) },

I assume this won't work because it misses the SPI_NOR_HAS_LOCK flag.

Cheers,
ta

>         { "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4, SECT_4K) },
>         { "mx25u3235f",  INFO(0xc22536, 0, 64 * 1024,  64,
>                               SECT_4K | SPI_NOR_DUAL_READ |
> --
> 2.17.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
