Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D02C4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 14:16:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EEDC20796
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 14:16:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CXulhv1a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ybPTQofo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Ra2HgNeU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EEDC20796
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kEFSa5niuDSWsT2WfvV2G9L50b8Mct3hiCItVLtzACk=; b=CXulhv1aMURkz926iBy+OyRws
	QojEKGyWYCLjKfWZzQgdc0CsiArmEWT7l6FzKIW12FfeC2emdrfkJbGRPcnDpXKO6Pbk3ql3W1K9+
	uAp57u7rZFkyueNMScOHYLjn2gcHd3yuvE1fnsUs7om4DQ3Xid1vbhkR879eD3TFIxPzjHl6XBeCh
	kKV8/zhy9DPaVH4E44bFXlsdyOqaPeA1sGZ5A7Ka4D0DbeUIwbvYrb/UQ4ZHVw5PqBn5MnqJPQzAf
	9Maot6nRrMir4UmmPT2LjH8JPtAZsIbNGkpBoxqXhu98rvRkpmyiL27oYRWckZQUib/cYJCso1vak
	O1qL4tpYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNzMf-0002ZL-7H; Thu, 01 Oct 2020 14:15:21 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNzMa-0002Tw-5Y
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 14:15:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601561716; x=1633097716;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=kMNjzJjRj8LDl65NeVvuA4I20E1pUR9vPdaM1vX418Y=;
 b=ybPTQofosILq2ESFxsTnfMFKvSPoafI17xE+6UWCELr6UCHbOvWluj2S
 XIRppHYwfRLNod8iwUvY/o9uoPWDEGl2FkE7jY5L+64uvhMZt0oEuxOsd
 2t2Zwq8gwWiL1ST6HrfrVQKIUBsNp8n4LHkl3iDr8m0jRP2d0ys1I7NCi
 1ngQOD+ccmlSuf789eKxYrSuFnIr97/ppq1bO+fwa8aPXYwJ5tPf3roD+
 BVTM4vW+6D6cHPduzhpuxRQiI2Knf9uype/zYezHv8E87iyiF6zvC4s65
 YdpVt4L6RDo1KaNrV6ReMGk3sFl07JhGUHwxe70K2k6g0Wcaud90B4+8P w==;
IronPort-SDR: cuBMwyPTRth0BhZMy1z1+0BdRe6LDuuwK8r5SZQh0+nR+nmKiCehTOFWHRQewkLbR2dP2gzCGQ
 O87GM5IeAWyhhN/YqqGvweUw3iR/JAGVzMfOTCxgfMNjhqHIgJq84hgrIAaGcXXRTjgda672u4
 gbGj6GCUfs89Hm+xc+i7i13JBIvgMXjZ8rPAJQpMwV6nWdgvfqb5hy3h1pWAFGBApDkZxZvmYK
 oPNGgNriz36GKschUjHon59LY3+fxpDRSNPxqv5u8a9351ULhRoMnfXGaP2ls61XIgZocEK3zX
 mII=
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="28385796"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2020 07:15:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 1 Oct 2020 07:15:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Thu, 1 Oct 2020 07:14:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TaRQwNe9ALWuhcHRZ9Vx3jsR40NYwdpMo/GJa5EDmkIiFUFzvkTD7Epgkzd8rwNKwqFbkpP0GQKizDA+usX/IfYocKj1Jt2Xy6yT/CKP7Q7NoW6E76xtvmPdV0ldgaowe0ipb4ZINX9z0nFG1Cp3HFxiaf4kBhdkUPFzG8TvGOrsy/DJwTKri90kOgsFaMS5mLv+IjrjdE95FLTcIH7aWIBufzc/+CrAXnQW4guZ9EfY37cfDqMtW2KS5mhGrJEcdo3f193X/quhSlswIz7ccC1r14iGunQ6BW4yq3yUp0KeWlKLUuH+qcVR9SLcQqKBTsK/W9IUjF63qrSEszGttg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMNjzJjRj8LDl65NeVvuA4I20E1pUR9vPdaM1vX418Y=;
 b=Tttj9BtBg7LHeW6TkTq1kt1QVNf7a52/dsCp/dN3qLX9lQmMDq3KjNVs23fKDLnGsFP4i+otyI9RTvcJND0I8fjZOOqPhr0/CcaNkxMrQao7MOx7k4A2zFXDVkK/1xinAUd9d52L6Kct6Gl/ftI1XC+2gktiCE7apz6pUCW0qneUGE8Xrtb1LOD25b5ud+PmGYPXGvYHZxsiYCu+GVueQbPYLXSHAPc2oOHlmhb6SO0mTjEVz/gNtPWQUiIMusBtbrLr2h6GIl5Y+5ZxH2UG535WGb3OIUn4eqLLPK1JpJrNqO3ZuHdTQDYq11wuANoFOO/E5TPMyOztA/OTDGl7YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMNjzJjRj8LDl65NeVvuA4I20E1pUR9vPdaM1vX418Y=;
 b=Ra2HgNeUf03JF+vrFHI9DepcDgpiu0igQQl42pHE5E/CmePr9GgrhLAbmLuHUeIV8AbsPrHKwdl+hscaAiQbThLTjtYlqEZLzNew9dcb/6lFE086V990uG0bzEytDJ3BXElYpRDy7iwIG8/GM8FZ8hKuMUhIyIqmAUA4dhnErXI=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM6PR11MB4236.namprd11.prod.outlook.com (2603:10b6:5:1d9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36; Thu, 1 Oct
 2020 14:15:09 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 14:15:09 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <bert@biot.com>
Subject: Re: [PATCH] mtd: spi-nor: Fix 3-or-4 address byte mode logic
Thread-Topic: [PATCH] mtd: spi-nor: Fix 3-or-4 address byte mode logic
Thread-Index: AQHWl/1EX2rNJEczUkGjcv47/rFXbw==
Date: Thu, 1 Oct 2020 14:15:09 +0000
Message-ID: <b52a0d85-050e-1947-1a18-d2dd5aec4482@microchip.com>
References: <20200930235611.6355-1-bert@biot.com>
 <20201001063421.qcjdikj2tje3jn6k@ti.com>
In-Reply-To: <20201001063421.qcjdikj2tje3jn6k@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [5.13.51.157]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a493ca31-edda-4086-4e66-08d86614679a
x-ms-traffictypediagnostic: DM6PR11MB4236:
x-microsoft-antispam-prvs: <DM6PR11MB42360F6EF04E3E5460CA8485F0300@DM6PR11MB4236.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bR9UxmHoUrLJoe1KzVKl6Q63kfwIPA1jweQPh5DA0ehzIHxZ0/X0+bD3dw0uyRdnfXJIRgU7lQicF5prgA9N484ekVZfQhPrnu7rA6MHS7IcTllWD+aku1xL6xGMW8Tx2GMG80qDWgDBYqNublKPlcLAJeRP9guf7v77JabP/mEKpeL6K+OlOUIgNOMTsfRWOgEfN3UUdeCCFsx4uwukwfq2paN2Dimri8uc8ZN+u0BMjLRr9YtT39hmc6LhDXb/nMpAJoBFtAOHj0cLjOglw62Oc7y2RQfCS9LcTkn76U1xLszQ+er83daJzUPD+s8SRBhOV41B6Ze4GAw9UxdcbgF8DpPm2FkNoqJtGr/gYTHfrX+7i8ZovVr/kH70ZId4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(346002)(136003)(366004)(396003)(8676002)(110136005)(54906003)(316002)(76116006)(66946007)(91956017)(2616005)(83380400001)(66476007)(53546011)(26005)(66446008)(5660300002)(66556008)(186003)(6506007)(6512007)(64756008)(36756003)(6486002)(31686004)(71200400001)(8936002)(4326008)(478600001)(2906002)(86362001)(31696002)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ehSDz8pnj6DRpQB/fFK4fbknXFZ/OMWyw+9y+1SrzWvI7C05mQGTthDwu12a/iihipmx/wH6WcYyGn+MUYv2FomFRwX0O8I2PCnhsZgLATSgIIOxbesSj3YcVs+Krgy25uu26KiBCQVvp5kj8G4gFnWRHiaYuWVWUrfezhb6LoIYfYdQPmkzQ90DekTVguavUWpT1/jzMqg36kgl4fqEwBQgEeBF8A+fVY97iMYAUArRAgTEobvNmEvfzMu64BMr1g7SSpSaEWaeik9w8Qs6okb8mt7rPCAVHSPOYa7qcMmDMaX7i3xMgYLQyVHNqdy87APYzs2NVnnUZkjQWYsbk1oWyMQxA7RcODQlUSeHtHBcJVC5ViZp9x4PNIV10k1osWTFTcr/bQOx43w5XFDoYA2mD7viILIhXUHH78CfogUlbndbLUd3FZLUOSynRemyw83RQEORI8rilIB50UizPFNFuHdGZ8y67hPZNrvJ9aH8QkVmBo/ABb3vYXBH7qZB4pMh8Ih1NuST3OQj1E0Gl8x3ONEwBf2lbf2hr3Ax41Ty5lk5BGDM7uW3jVAkBFaSrLIyGaYizEWQhCakFew5XIwE41JTvTJiwt28rtsBb7pGMpMPAtJNJJQvtzR7qvgEN7QmhUnkPtURsRQGdduPsQ==
x-ms-exchange-transport-forked: True
Content-ID: <13B883D29CA17E42865A2061B6586621@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a493ca31-edda-4086-4e66-08d86614679a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 14:15:09.4770 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: COZm3QQ+sP9OW3GVnH6a4FhbNI6UIsX4Lk0vtBWRbYAou0tcJlWqaECaJ4CEM8RT42Vv3ntdPFYRIBGH4yWQ+FwRHOzN/ATns8keoOQGv5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4236
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_101516_369442_BCC9E6E2 
X-CRM114-Status: GOOD (  27.18  )
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

On 10/1/20 9:34 AM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi,
> 
> On 01/10/20 01:56AM, Bert Vermeulen wrote:
>> Flash chips that announce BFPT_DWORD1_ADDRESS_BYTES_3_OR_4 capability
>> get an addr_width of 3. This breaks when the flash chip is actually
>> larger than 16MB, since that requires a 4-byte address. The MX25L25635F
>> does exactly this, breaking anything over 16MB.
>>
>> spi-nor only enables 4-byte opcodes or 4-byte address mode if addr_width
>> is 4, so no 4-byte mode is ever enabled. The > 16MB check in
>> spi_nor_set_addr_width() only works if addr_width wasn't already set
>> by the SFDP, which it was.
>>
>> It could be fixed in a post_bfpt fixup for the MX25L25635F, but setting
>> addr_width to 4 when BFPT_DWORD1_ADDRESS_BYTES_3_OR_4 is found fixes the
>> problem for all such cases.
> 
> JESD216D.01 says: "01b: 3- or 4-Byte addressing (e.g., defaults to
> 3-Byte mode; enters 4-Byte mode on command)"
> 
> So using an address width of 4 here is not necessarily the right thing
> to do. This change would break SMPT parsing for all flashes that use
> 3-byte addressing by default because SMPT parsing can involve register
> reads/writes. One such device is the Cypress S28HS flash. In fact, this
> was what prompted me to write the patch [0].
> 
> Before that patch, how did MX25L25635F decide to use 4-byte addressing?
> Coming out of BFPT parsing addr_width would still be 0. My guess is that
> it would go into spi_nor_set_addr_width() with addr_width still 0 and
> then the check for (nor->mtd.size > 0x1000000) would set it to 4. Do I
> guess correctly?
> 
> In that case maybe we can do a better job of deciding what gets priority
> in the if-else chain. For example, giving addr_width from nor->info
> precedence over the one configured by SFDP can solve this problem. Then
> all you have to do is set the addr_width in the info struct, which is
> certainly easier than adding a fixup hook. There may be a more elegant
> solution to this but I haven't given it much thought.
> 

I do agree with Pratyush that we should follow the SFDP standard
and don't change it. So the change is not acceptable. The standard
is the "law". If manufacturers mess with it, and fill bits without
respecting the standard, then we have to fix it via the post sfdp
fixup hook. SFDP is above nor->info flags, don't change the order
of the ifs.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
