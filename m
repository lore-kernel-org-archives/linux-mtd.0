Return-Path: <SRS0=g+sZ=5J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 876DFC10DCE
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 05:37:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57DE520663
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 05:37:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cceZ9qeo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="MrJiT2Cg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57DE520663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I9F2V+wY/6dePgEmAJIizrt/DVcBpwsBPCYzZWOm340=; b=cceZ9qeoy5jTpR
	dAdVmsi8ONskQGEKliNU1D0xjhP67GCrD9iFW3PUWQU8upLXUEMFfg5nA3jQrUEVCv39Biu48x+nx
	DIq9XMXy10mmiRR75lsqcNxhZZ4ZYSW6eqrwAyOI5hl1/0q2ktQQGozs2TaQ9nWzP9jq8vul2M6YJ
	NAcPqrs83lsd0FBbFwtu6pP3juWSX9hwZ6PKy0LGSbTZE/+2ptA8MpHMpUzo0mBsT18d+sl/rqIOL
	yK+cwp9Hj4TZgGb+JBmcdISwF4m9dv/OwlEzYtSoJiH1iGzuHtvsDbjlJLOgybBvhmRscPeLtxEQL
	farmw/pmMPm0MzP4wJ3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGcFq-0005SH-0Z; Tue, 24 Mar 2020 05:37:34 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGcFj-0005RN-DH
 for linux-mtd@lists.infradead.org; Tue, 24 Mar 2020 05:37:31 +0000
IronPort-SDR: RtvErJeWH09L51gecMJWK0a72WAvx2zhnzvh9K4WeCAdToqsgdHJJSjhIDHGQ0naN2VQojMwm4
 DKjcSxbwgRc8CT4PgZ0qpTolaq61zNdeRzXabEqV0kFmrJJ8tir19bgBosxze5zcSsxVH6kdCo
 RqJ/anjrzx4HyNg0yxMcCJ8q81tYyx7pPDRPqr4IAmgEHKNkrLGM0RyapSc//2FQbkgZ/d2BnA
 bvhdPLyKwo0uQnuOo/a1EK60SSI66O0Yfq2j12asJkJu6jpzGOroqcllkD2zWTaIh19WW8TGtf
 91s=
X-IronPort-AV: E=Sophos;i="5.72,299,1580799600"; d="scan'208";a="68166874"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Mar 2020 22:37:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Mar 2020 22:37:21 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 23 Mar 2020 22:37:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzaZtOwyb5f0OS/TYeUqzGYifGYHpO2yphiSbjUpeZ2lqyHxoUGeazWuwIs/YOM9Ef3xFc7hM9jn9YqP+PidGcjtQ0rwf1A2vuOtj4YdQlzJ4UJaVu2OnZg874MOUTKeCgDVuT7O76+KvDHCGonh1ipEijcXoif/fEHuA8KxR/eB6X2K6ZIcUAsfrGfSSUJYPTIbsJ5ilNZCyjHke+WbZRZ42uJJMy+EUHmQDjbPbJ7hmkxmKw0pueYG88kelAYMqkCmATGarSpMzaRS88luf0yN9PUAv3ps6WkoRVZ8Kia/RtrQ6htORMYm4Ht2R4jWa/VQa19IxBMoEotYQDk4kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMg1Xa7SmM8WX69ScVDbGnHIi9GsgkqETgykNABMhNQ=;
 b=iIROv8hS++KGE02j1T48sXY81mqZ7MbhPOVCf3KPX4RGYnpAK6Y65bzu0wJHiKKGPcI6sjHyTo5ymf+o0Y4yUgbIuIqUAhpUcg4ZV8aUrIHAj6EFfpIpD0T75R350I8kmlIPigfMtiOn01XVpIfvoLf+KX34R7JjueZiWRiq0kkhQQvveJ+6DdSlETF5FVL5EjzsWO2gNAPbaaPS16dG54qnXofMx6/RmVw7iFrBeAbHnL38ZBU6sJKtd+Pb54JvAMDos1YwYptU2mnr0trN33+5TrmDn/3A01ffg3ICg4IQ37YlVEh8qbqTw/jffVhEfeZDGiJAO6g3Ff3Eb4bjkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMg1Xa7SmM8WX69ScVDbGnHIi9GsgkqETgykNABMhNQ=;
 b=MrJiT2CgCB7gHOhkVBO78fqrdXLb5T+ts++EUqK9J3jqr1n29pHN92MzLAAUX77tAbhwblogJ1gdSwLWESlmO16IYtaHP0/xPlyywg519uH8ypridAjVxLXjk9l+QGqIL/hloMg9CsvdtKM9cCCMzG67DYbNsx/UVvDKgzFEAg0=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (52.132.254.205) by
 BY5PR11MB4056.namprd11.prod.outlook.com (10.255.162.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Tue, 24 Mar 2020 05:37:18 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 05:37:18 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v3 1/5] mtd: spi-nor: Fix gap in SR block protection
 locking
Thread-Topic: [PATCH v3 1/5] mtd: spi-nor: Fix gap in SR block protection
 locking
Thread-Index: AQHWAPTc+rZUxlHsAUikj/5G7+sVPw==
Date: Tue, 24 Mar 2020 05:37:18 +0000
Message-ID: <4319745.Gq7p4phFZr@192.168.0.120>
References: <20200323092430.1466234-1-tudor.ambarus@microchip.com>
 <3123463.3oovMYBsBI@192.168.0.120>
 <c107f1c352fc975519531ffb54849e35@walle.cc>
In-Reply-To: <c107f1c352fc975519531ffb54849e35@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3f054a2-e39a-42bf-3731-08d7cfb56ae0
x-ms-traffictypediagnostic: BY5PR11MB4056:
x-microsoft-antispam-prvs: <BY5PR11MB4056476E7619356A4D97C136F0F10@BY5PR11MB4056.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 03524FBD26
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(136003)(39860400002)(366004)(396003)(14286002)(91956017)(76116006)(66476007)(5660300002)(54906003)(66946007)(478600001)(2906002)(71200400001)(316002)(4326008)(66556008)(64756008)(66446008)(26005)(6506007)(53546011)(8936002)(186003)(6512007)(8676002)(81156014)(9686003)(81166006)(6916009)(86362001)(6486002)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4056;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: abnqUQAIRf7cC+TsJoPQE5lN4ssj3EcDlIBptZHIrciQptLZL8L6a3PSLenssZxua9F4YuNku8gHuln+vleOTojccQsjY930lcQxVkJ56w1+OygAGbB1/VME5MMHKzJoaFVyfI7QJK7NmGGIxBWuLRJ4A0Z3pVwoIqvBXC4r65JPQihTtlusxQaY39cSwcrVUKE983KWfwHvSosMHuNYYV6dolA5gQzUqP4ddEBZ98uQLJyy9HDHIHYFA90Z131OyF5cIGx+vCGqDxQyHW+rndXCb6FP3jCGKEwtGU/0/BKT7+RwwVsKUdhtl3tfgL/g24HEHfr/mfzTUtLCaBqTYVlnCRl20dJvZSlAvJlaFqD5pjYrwkmCU02/2NcMvJpQuMmQ+Guw3JvMYa9AlYmMH+wETYox6nvAgcj4hDUDZrqpiO8Nc+8iZWzeV94EhNVKKziDs2XEFfysXGfp4XW9NHgTC5PQDKiB/vbk4Hba11NPj8SR5uzPolddfZpv9YtN
x-ms-exchange-antispam-messagedata: I0r9gN69cBgp+3WDA4347wEp1SnajnGtXvcgglvmmFK+QeQ1LixT8NpIFlCHJQ999wnpDiUoz+aViukPtU22/uCrUANzCiT2Nw8/qWGjz2UTRD2DFRliq3kR7IZSUe0UTIfYo9Dumn3iDwvSpIwfvg==
x-ms-exchange-transport-forked: True
Content-ID: <52B42C78C6B5AB43B32E51121CC98FFD@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f054a2-e39a-42bf-3731-08d7cfb56ae0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2020 05:37:18.4154 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gdbR/4VkR26XZkx03bZ0jPaAO7mdeKovPRtaKh80wXD93GPoK9wpQFEPGBYryEAzJiEsH0/TPg7ywoDIA9IHaJkapk6G6rBY1v245qggVNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_223727_570252_FB502A60 
X-CRM114-Status: GOOD (  19.66  )
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com, js07.lee@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tuesday, March 24, 2020 12:35:30 AM EET Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> Am 2020-03-23 22:30, schrieb Tudor.Ambarus@microchip.com:
> > On Monday, March 23, 2020 11:14:05 PM EET Michael Walle wrote:
> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know
> >> the
> >> content is safe
> >> 
> >> Am 2020-03-23 21:26, schrieb Tudor.Ambarus@microchip.com:
> >> > On Monday, March 23, 2020 9:54:38 PM EET Michael Walle wrote:
> >> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know
> >> >> the
> >> >> content is safe
> >> >> 
> >> >> Am 2020-03-23 20:20, schrieb Tudor.Ambarus@microchip.com:
> >> >> > On Monday, March 23, 2020 8:27:13 PM EET Michael Walle wrote:
> >> >> >> EXTERNAL EMAIL: Do not click links or open attachments unless you
> >> >> >> know
> >> >> >> the
> >> >> >> content is safe
> >> >> >> 
> >> >> >> Hi,
> >> >> >> 
> >> >> >> Am 2020-03-23 10:24, schrieb Tudor.Ambarus@microchip.com:
> >> >> >> > From: Tudor Ambarus <tudor.ambarus@microchip.com>
> >> >> >> > 
> >> >> >> > Fix the gap for the SR block protection, the BP bits were set
> >> >> >> > with
> >> >> >> > a +1 value than actually needed. This patch does not change the
> >> >> >> > behavior of the locking operations, just fixes the protected
> >> >> >> > areas.
> >> >> >> 
> >> >> >> So instead of rounding up, it does round down now?
> >> >> > 
> >> >> > No. Why do you say that it rounds up? The behavior is not changed,
> >> >> > the
> >> >> > patch
> >> >> > merely fix the protected area, which was wrong before. The round
> >> >> > down
> >> >> > is
> >> >> > present before this patch.
> >> >> 
> >> >> TBH I don't understand what this patch should do. Could you give an
> >> >> example?
> >> > 
> >> > sure, let me try to be more explicit.
> >> > 
> >> >> >> > On a 16Mbit flash with 64KByte erase sector, the following
> >> >> >> > changed
> >> >> 
> >> >> >> > for the lock operation:
> >> >> 16MBit is a bad example, because it is broken anyway, isn't it? We use
> >> >> a
> >> > 
> >> > it's not.
> >> 
> >> If I'm not mistaken this falls into the same category like the new
> >> 4bits
> >> BP
> >> flashes, because there are more slots free than needed. Ie. the last
> >> one
> >> "protect all" is either 110b or 111b and thus don't work with the old
> >> formula. This was actually my reason why there is no new formula for
> >> the
> >> 4 bits BP flashes; but the current one is not working with flashes
> >> <32Mbit.
> >> See the old long thread.

You're right, I was trying to fix a dead horse. 16Mbit BP0:2 flashes are fixed 
with the generic formula. I'm going to respin without this patch.

Thanks!


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
