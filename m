Return-Path: <SRS0=0HiW=ED=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB8E2C4363A
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 07:54:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AE8F2220B
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 07:54:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qqYQ02O+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="G2B6RT56";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="NpuNzjWl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AE8F2220B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jIa+609EIlXwGLSR2hyTQkwAUX6Y+AsBwBH7ZM5GYc0=; b=qqYQ02O+x3q00hTLCIjBAWEtH
	ysfpdqPT8s9LzWhIWHemLMqN93UEc4Mpu6KoJVWf5FIXK1kNnI2SMBvbnTuhtzPsqZ/tMLNgVwT3M
	gIMKDvAvZCpz8UNGGXCp2sZo0zuHdVxFrVR6RyIAv+0Nrtif7j403+xraInxeQpbQmKScdEhB2E63
	qdsRpu8v5AXYtU2S0X92oB9pqwKdtPDwCFdW8tG1Cndpcva7zTnYcAE4X6Y6fBbTZqhJ3k5G6ALfm
	6SibiYrUGHYO81H8/7H+GK8A9fgO7csVtmey1bmLJjlTSZoDxEVDmg7YbfqifsaehgY5sNv+w4V0N
	XZKt1fIqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXgHG-0005LK-LY; Wed, 28 Oct 2020 07:53:50 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXgHA-0005Kv-Ss
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2020 07:53:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1603871624; x=1635407624;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=FzO3LfTGC0uIgiJSpK9cPhl0EM1NmOVohVWY9Y/ivHc=;
 b=G2B6RT56xjRGgGv3+sAUTH0i+2gX+jBWEkolxKqhv2nvg3+eqeOUSinc
 ijPkJKeB9dKsl27MeX8mRNW1OXuGvOvL24QLrBRlLeofTkQz9d0X/S3+1
 K5LF5zfWzB+t1XQWisEknwUjteCIyKAUhJ5uK1lv8sdNN51aiKzv8tE5V
 kSJv+/JHmO3Iu8RQzjb7MPDHXEzc/fHoAFldCGM/epQ7jVmjZhZwQPSUo
 B/Z9nob93DX8jKh/H4vmvt+/oY67qYQ8jXM92mMpVMzIhNSYWoBLK2Qq3
 jA2WNThUvVVh2Vnrtm5qhtT4+MXQH3qERQ84zuMX4fze/e52UE6GJysiW A==;
IronPort-SDR: 9AlDSvw2vTZJaL3WAXVFiTYuosjnsmYlVQ6M0GaTjeRcELiFkKCAAB38LFoKZfPMAtS8Hrg9mO
 sBQPM9GbVBolsZDEkcDQZDgiBpVa+sbr542WWAiKJlTr0q/AWEF+lFk2tzYvk64LyZ+vXSM1eR
 HF9IgJBj/I3MMw3/fteeDDfIEhzwrCbmswnrA369iEAi7+UFgp+PZDLYmuhuCo25H052R3NvOI
 OL7kybAHry1HfdNylXBuZXhfilJy2IohIT1Qhq0LJwaD20DGmBaHqrVu9p3w7q9rbJkc8JpUDo
 ik0=
X-IronPort-AV: E=Sophos;i="5.77,425,1596524400"; d="scan'208";a="31486630"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Oct 2020 00:53:42 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 28 Oct 2020 00:53:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 28 Oct 2020 00:53:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=avuYPMEL/57ICXmBrN5Z4o8XNLZovuxZU1GnaFDoFsacn4YYr6siTtv4LRpKsC6XG+epRtY78dejkyvZI39fm//0blT/v6PyAcuSTPvCxfyvXcVbOdtTBMpAc+BrW71zO3WzhUkw8uGTkb+h+yY5E1tNnsT5te7ZFVbNyS6eCDPBcAiPRCz3dptIkS9co9m2Gf3YPoA7LsHnFFOOT4HOsiCSdw8/a0+WMIz668Jvy/1skFkx9JHyEOF4NV1md7UBNDi0jQWWXOPNTH7CdXGbHuBGVSLgwltrVHd5v7lJzMFwK4wZZDsq7Y4a07oZwAXN4HI/VGRIMgViNE8qQJS0fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzO3LfTGC0uIgiJSpK9cPhl0EM1NmOVohVWY9Y/ivHc=;
 b=bQo1fH9bZbxtXIv/308vGrRwCcTVVqHI//GRYUN+E14s2UY+RRtQIBSYVkDbNisyEM9oGTHFn6/Y2Rh7izmm0h/RKnlUkuvldavUTcwCZtYxdq710U1mDQGFwoZ0bV//4CdSCxyjEfGAPbX56+2aUvGiBB3ZZcL/7hUdjtYVcI/S0NYg3A9St9Ia2zAj5EGP1sfCWARL+w2hgM9a4HpfRAQIK1LJ+3B1THg4SeuDf6VRrku0lpxwRnOghvCECXu6/cf5n8otMUducJREnfZci/AWFxs0Q1HQmtVaT0nikfL4cuA0GR6uP5gFqTKlea1qTF8qQAw7QrILGo0Zv/koBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzO3LfTGC0uIgiJSpK9cPhl0EM1NmOVohVWY9Y/ivHc=;
 b=NpuNzjWlk5IlxD9ECeoMMEVqeBbIIMOvPc18hWr/Hzt3lgGT+PQ7LkrrxvFeQ7ltHFE1KlWycMc+Qo81j2S2mlm1da8F4rj6TGGu160qxGpMMIUWXZTVtRGs0PRNX8ez4cmmkEJF6ESJuH9H2wC/XbtN9UfnOEFC10x+A2g67yM=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2736.namprd11.prod.outlook.com (2603:10b6:805:5a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 28 Oct
 2020 07:53:40 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::7c1b:6212:7f1e:5c6f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::7c1b:6212:7f1e:5c6f%3]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 07:53:40 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v16 00/15] mtd: spi-nor: add xSPI Octal DTR support
Thread-Topic: [PATCH v16 00/15] mtd: spi-nor: add xSPI Octal DTR support
Thread-Index: AQHWrP9znYtyl4SgskmwPX4NHXsKvg==
Date: Wed, 28 Oct 2020 07:53:40 +0000
Message-ID: <d0d702c1-761b-1480-c74d-135193b33c26@microchip.com>
References: <20201005153138.6437-1-p.yadav@ti.com>
In-Reply-To: <20201005153138.6437-1-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.127.107.112]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 62e9f024-c0ae-4e31-9e8b-08d87b1695e2
x-ms-traffictypediagnostic: SN6PR11MB2736:
x-microsoft-antispam-prvs: <SN6PR11MB2736ACA7D36F1CF92D809A5EF0170@SN6PR11MB2736.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 04FkmKCWwSUwVRkHcFXg75R9oYab9MMxlil0iHaEeSCt/RIfuJ/ebUHXfXat3VocBVXeNWeSmXGidL1Hqq+CgkYzkVPisHxyWmvPo7OOJ373Egw/Lap3KkwIF/3KqfxCKKeUDkQ3Cw/HuRq1M7ypFrcNqGQ7oh4E+CafZzfKaaCbORkR8SEKdNE3GrHhwBBWfRysPUw3WwJUS/YJuqk/OtpSN1GNE+umo8tkxDFbcJmTZe5uX5plZqQHPLjgqWiuXj33LZjTRlfgW6eCeTJDqSjmfR1taU2N7LdmG6tufoJAZZ+PU7kZd+Sry2Wwfndlwp881Dbxje4MZyAHx4/ZMvf8ZUot1bBNdoFo+nuXBgQETcs0/UOvLRlc2DLcoYmMnLe89iygi9COVGd+6Clmmgv4/fNSdwpDHonwULBpmUBllwsfCt3OkyoHhdUMnp7RemQ5NOx8u9fEo+CzzYEEQQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(396003)(136003)(39860400002)(366004)(8676002)(2616005)(76116006)(8936002)(66946007)(4326008)(6506007)(53546011)(26005)(71200400001)(66476007)(66556008)(64756008)(6486002)(66446008)(31686004)(31696002)(4744005)(6512007)(186003)(86362001)(5660300002)(36756003)(110136005)(54906003)(316002)(2906002)(478600001)(966005)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 4WfRXQDG57Io+YduLVZYbDTII7vwA17DskX4kNkrjYgp0yatmJfBfnHSrONGkjbOv7hWHYt2ujjya/uuVeE16OW8YTE8hBDSYUC1PdgpDbFzbY1MByFq2HiVtN93Z7hgBuJq3m8c5JFo1ZPOvsudFartekJTzoqcb5BpusEehsTOytWR0jxVJMlpw7i245rs7+QE36JhPM5Fzb4P4mJMc2bO0sYiqh6RBI1MWeJfE4JVU/0pXTU7A41256quq5ILUuwAPM3AaCy1GILaQzVTijhfUyOxil2wZYL5XPmv/YkEkctmVlNzBlEQoYcNeWHp/RNJTqxqxQMmG24n0HQQffZ7IHHxBT7bQF4fxLLD9uY9FoA1VJzYRh0ZEIjUiZkfnQKt7v8siw4QzsERap1ETEcXoTjB6lk8tc16HHihwGUH3p3zh81ryWlhe0/sy3naUVhRaDE+7mghdgcUmNCt9UE07BkN1TicQA2jHrH3QqyXGrKLutHGabiPEwU1kdBC9y0jviW0ncyneP3WG+Cm59X+6BvXcATl0EXiPmCdG0cz6/d2bg1Cm6XyxgtZTW9ao+ecjTRgAV2VB3c0UwfDX4kHpeKTihz18VVayd/ymeCRm05ZgFRDs7gNbKk9KhfRhMjD4kP4r39uqSxLmTU2rg==
x-ms-exchange-transport-forked: True
Content-ID: <0DBBE59EBC3ED743A274D976A5FCE311@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e9f024-c0ae-4e31-9e8b-08d87b1695e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 07:53:40.5685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dm4IZjSzygOhlFdXiRCFdST1ElbGmhWD0RO+wxOfwvyoSToKdBgMqU9WXKwtnXyWo2YEtoodsyrEnjY5nELxUXVXeCjLan/WeiZqJc80Z3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2736
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_035345_238092_BBCFE8DB 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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
Cc: boris.brezillon@collabora.com, nsekhar@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Pratyush,

On 10/5/20 6:31 PM, Pratyush Yadav wrote:
> Tested on Micron MT35X and S28HS flashes for Octal DTR. 

Do these flashes define the "Command Sequences to Change to
Octal DDR (8D-8D-8D) mode" table? Can't we use that table
instead of defining our own octal dtr enable functions?

I see that Mason used this table for a macronix flash:
https://patchwork.ozlabs.org/project/linux-mtd/patch/1590737775-4798-4-git-send-email-masonccyang@mxic.com.tw/
https://patchwork.ozlabs.org/project/linux-mtd/patch/1590737775-4798-8-git-send-email-masonccyang@mxic.com.tw/

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
