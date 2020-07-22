Return-Path: <SRS0=7+w2=BB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C7DBC433E4
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 07:14:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 475D7206F5
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 07:14:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ALwp9p+z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="kGlDyt8Q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="fb6snm4D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 475D7206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=4q34yTo3D03R+ngrM6EJmOgz09GWT0NTsE1m8nqLZYk=; b=ALwp9p+z7zDoDVCKPTwT0cS5J
	NzfBqrMB/i87TkmW6MUqU601Lw7bMdjvYYEuI0l0APVpXz4Qb3knSbzuoAThK2R79cvqOtZKwS1JF
	gECfvlgeOzkLbY7fe6jwcffL23iZHGMvKE/yNPLEJkJB7T4eKy+AfiYSLdYUEquVWFaWFI3g6J0Oa
	Ll5uJ28dBmCbf+sx4UerDXvbu42p1uFIzN1OrzOd1oK1h1LJbCvWidDTMJjslhmlU21EXE2bg/4gA
	z6u9gLyOCs9ITbH9G4xIPjZyPQQjNabc4wYugPpc8O5qHKCCspVKW8llL8zMSJpqoAo/3ApRn/yR8
	onBrnvwUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy8xK-0004c3-37; Wed, 22 Jul 2020 07:14:22 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy8xG-0004Zo-JU
 for linux-mtd@lists.infradead.org; Wed, 22 Jul 2020 07:14:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1595402059; x=1626938059;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=eDgXJDrRcHBdx/h+ukaTHEZJ1bIcCGUbvV+Qo/Lb7u8=;
 b=kGlDyt8QPsz2MXrdfwEFUN/628TcsaDY4aOqxkksekETIQe2NAIHi9Sv
 w9bZDiAM2Q53zSEbDTMvS1E3Qq/HgJnBGrPCoBaawyOa3Aicfr09snDoH
 jU85AhxoAzmqNUpyAhB6D4GsVLU47v8/eTbly5nzPLFqjpYEtE4V4ay5x
 +Bovym+8JwTpih2JT722S8s++x+B/Mu8RY1LkhRvrj81wXF5+e17eNo4q
 UAuBUHy+iw/u8Nq8N5xvjKhJ8eqHrCj0Gw2qU0tF2g1xwZiGDwlkGaDtw
 /q9uljEN/lLvXVz1kM1DkdGuS6h+otrath02IV3XE6igDLqRlvC0pbpE5 g==;
IronPort-SDR: wHJ0sUf5fKcvjCD5KELUHIpZWn534zNWdK/RdtaRiz1HpW9fNPYLc4k8C4dqSOcfwS/VkCC3rx
 Sk/DCgaT2zjtuKphqdg/47ePdrawLXPmVN2QMtMo7E0n8aRVX39Q9GoXFOciL0NnbEnGthc+oL
 wKE8O+fmKJh/ArDe+3CyV970ETjHHfpr7HhppoSlYWcT+6B4L74A6J91BUPCZjsV+IQa9ZmuOt
 HXgR1QxLxdU3LtzIxWgZq9O38VJ9mu1kIuMuQbPMcgkwutxKcStu83NVlPH/mucXJPrT+HCdyA
 TL8=
X-IronPort-AV: E=Sophos;i="5.75,381,1589212800"; d="scan'208";a="143183356"
Received: from mail-mw2nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.102])
 by ob1.hgst.iphmx.com with ESMTP; 22 Jul 2020 15:13:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nHoUfvDb/kH0zR6mxIRvNX8FNQPu9uGYgHKnoRdnMOBY6xGiervqOLb7pqlqs4sOYAm0IAKucRJKiYCKF+AtNJoTEa+LBec/WeO0IHg4etpuih579978R6SPb+WzU19Oo+HpBE6wPz9ObYIpLXyE8ju1V2Wh56IqI3kgqXsvMHc2/P0GfSbfLUaBQhMuAe/LF6iqwGFIh4f3e9NYmNGFqDMOk3hTyzvCzeI6dbRHF9E1qGEbdTJuLzjkURe1Q1WrMSH14rPq5iToCspKc0X6jIhgjgjxVm0pFX+Um4nqw52iiyruKz2BcUR91fjfcFkRPEAMoU0icnG9rliPsaTTig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poiwM82pTnOPiJnHxVcFkqqb2XVkaMdwQOlgju+7S0g=;
 b=et0WO/inY40469u+0eXd6/sKGwXMBWQjpBcH1bRYyYdAAjqsnFAvc5J9zAkvv2eFurie54/v3jeg9gglA1T4E2B3bRVRyccL/TNCGHRiJOFqzSHDd6JSHTZdGO1tgKBHOjAeNXVJ+xuxwN0rlMWryGDg/s4+ocByHOeMBEtNPbmTjU5d/Bb1IYXwpsjxNPZAF6L20VIApca8PBc6xi3YT8Kt7PQGaa0KPJy6TAKcKR50VIU6hb83IHuG/Rsighle0oaYAz7h9YmJfGWgQXN5x1ulJbTqXXRD02EEylTR3UEYpEN3z9YlE/k1CVhbtS9jvzEYyAFLmArfT7elvt3+iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poiwM82pTnOPiJnHxVcFkqqb2XVkaMdwQOlgju+7S0g=;
 b=fb6snm4DA8NLZm2oGpMp7J/pm7U2fsnXO6PhYWFCFyVRMrh4KmYwDa9mImLx30Ku8pISeP92XEpKj9pvTA/e5uWUSC75GEKjgviQcA7HLvtTafGxQYc/BTaJeuseq+lE0ne5eq4E+N03ryf9wqb6RSyAR98yw+Q4IWKCPCKmNuY=
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 (2603:10b6:803:47::21) by SN6PR04MB4862.namprd04.prod.outlook.com
 (2603:10b6:805:90::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.24; Wed, 22 Jul
 2020 07:13:55 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::1447:186c:326e:30b2]) by SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::1447:186c:326e:30b2%7]) with mapi id 15.20.3195.026; Wed, 22 Jul 2020
 07:13:55 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 06/14] block: lift setting the readahead size into the
 block layer
Thread-Topic: [PATCH 06/14] block: lift setting the readahead size into the
 block layer
Thread-Index: AQHWX/E8oA9T0pQ4oE+KEOpJvS2fxw==
Date: Wed, 22 Jul 2020 07:13:54 +0000
Message-ID: <SN4PR0401MB3598470B14C754768A2D8F389B790@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200722062552.212200-1-hch@lst.de>
 <20200722062552.212200-7-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d8ce3f04-9052-4911-3702-08d82e0ecb78
x-ms-traffictypediagnostic: SN6PR04MB4862:
x-microsoft-antispam-prvs: <SN6PR04MB4862C0DAFB1B8540DFF957779B790@SN6PR04MB4862.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oImQpW7CKR7N7nwIN1ti/wtbBp/l+aSnH3vWZaECMFtX24P/1CMnzbX29If187tW5gzPOp/Abd9iDRIChfVwCh0ocv3+uQnJ/vgQxvyw4DtEr5Ri8DnHfK21NP/3blMOzvye4EnCY1CI86qK3DwYS24zAffmZ/Zb4d5H83UZqKo7CNUzdPXa6cGsXGeH3nYtgrG3mMbbeD+wZDGBx6eHnIwTyKovexz8a+Nw+UHRh/EeeXs8IkfTGH1iBTTfhyleJni37gTbf4HHSYtqRyLlmr8N11xP2cG+oij6V4aHXQpr+fGkjiCcwy7EUvOQj/FX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(4744005)(5660300002)(86362001)(54906003)(110136005)(55016002)(316002)(52536014)(7416002)(8936002)(76116006)(91956017)(66476007)(6506007)(66556008)(8676002)(33656002)(64756008)(66446008)(71200400001)(53546011)(478600001)(26005)(7696005)(66946007)(4326008)(186003)(2906002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: AxmEmfIEtMB/QNBNkjYO0i5tOMkxYrACo7fUJCxutjk9dK51+hUTxS9xhs0KRXjsEwHrTutRbj39rO+6WDkKMYq4tuInYXF8qvsqGG5GRkyN0uIbObp7IahQoADuB+q64e1MaWz5hJ0fLB3J2Kk+bOxcR48VpSd/SfoN0XkedZIx+CfIopPeb+EyZZFUC5vQyDARXICGh6pZVelsLXAQAD4D1BDAd7kbhYQhwwBLedQau5lz5wbiFpmdw+J8dKqMu5aJ4GgSSLl5Tshyh/De/0OlpzL50/MDQBrc5fRuIcX6On4KBc7jN47jlT2YTS9NTKD4Y47mm2WvQ6Z+QtXysI5wayIIKhG2Q/XsFZgVyZgX/YTpLLGNAx2YkSVd+oP9dZy3PRjAsShbIS1FHWBvgOjyw7NVnkZU5Ol3uANJ3yXjPI7N3lvifIXJ5o1FJlza03143dIiZEvXJrtLhFL5ao2iK06hxls/+WUNUCudWmkqKo3LNstoM9dsACcPbBeb
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ce3f04-9052-4911-3702-08d82e0ecb78
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 07:13:54.9928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wocQapUT1WYCqJh62OVuMi6iUe/l+yc5vIOJHS23u+JQnUgO7kjh9b2aj7QsttihnkJ8Otno8w8Ezb9/1OKaCEZwclMpba2Nbu1PcZUT0dk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4862
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_031418_808433_321EC0E2 
X-CRM114-Status: UNSURE (   9.77  )
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
Cc: "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Song Liu <song@kernel.org>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 22/07/2020 08:27, Christoph Hellwig wrote:
> +	q->backing_dev_info->ra_pages =
> +		max(queue_io_opt(q) * 2 / PAGE_SIZE, VM_READAHEAD_PAGES);

Dumb question, wouldn't a '>> PAGE_SHIFT' be better instead of a potentially 
costly division?

Or aren't we caring at all as it's a) not in the fast-path and b) compilers 
can optimize it to a shift?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
