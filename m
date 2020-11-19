Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9DE2C2D0E4
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 08:38:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02F8A246CE
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 08:38:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VN3nHdYN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="U3Gze6K3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="bPiB4F9D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02F8A246CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=SnfU235bhmxTrNGMEOUeAjki3M6AFMdW5K9ZmrO8dyU=; b=VN3nHdYNikx1/iODFkcMpjGbh
	lBEDEjm2bHztbb8jf/rXETlTYJjvw/KuxtJhnGdb9NJoXk1DY9iwF4v94sAK87kgd+bEmn11v9bvB
	/w5xB+ATVbda1z8he+hSum6HW1Ggh+mqtb8t2N30DayNfdjrnNuG/NPg/xAQuRlcI8qiJ6tWt7WJM
	ZLnavx/D/zUeJ7GlDbpddbDQQVg1pqRPt7wfUPPNDGC7j+5+CiwKx5G2JZZR+FMYnQT/+fUMcnK7O
	qT9L+jYg4TUpI/6NLKwBsDW3Cn3VtuPVghPG+KnEHnfl6JDugcrlTPMpgNFm9lKhjMjIQgQcOe9L8
	16AlE3h3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kffS2-000833-5B; Thu, 19 Nov 2020 08:37:58 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kffRv-00080c-IG
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 08:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605775071; x=1637311071;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=U3Gze6K3JeijYkxMO8sA8OOR/OnWxNir7zRQiOP3Uskje9JUl4rK7USP
 qO0ZGnsvpbTGGQ3n/lflHlzvIF5Olp+yoKS/4tSAU9yTFmwCBSC8Yfajg
 zBNvDZBh+YaZFKeLb9zD/b/Un2Id5MV7G9D6vnIVkkeD+497RX2OvrNsJ
 1tVYo8KTnMaONsnBwXM1A7jnOVXxoGZURVeCUdU/RwJOPRUAW7dCAHlCC
 zBofwTcY+CGLmT1GD9XpEA0M1EcT+KJApXsbGnONmuZQVlahFPL17ABDI
 aMeNjlqJbTwQuKFE2DNA4JiZ7aZWW/xJU58J1QeucQjaOQ/CdxTS0bM1w w==;
IronPort-SDR: lVYgGj8s/O/AthUUtd8BLwr48Cp2/3Lts7OWFY8l46ecxGJgwGyTEv4SznvpWtoFXPDUmLq46S
 PKl5jTXr2yroQGCOoXR6GLg4IOuQiedGR7+8g2V0WPxkgoq3eA1YN5yrT/U9K/rctJ6WFRYtBp
 9HztdHo8FdhKqxpwXBk6Xg8h2iCjq6rhP0ekHhBdnbb7S7xjZR7U0qyVoAKGSgZk6pZC+Gnowr
 CSs2a4VuTwxteh6JjwZoA7HQJbsmboE1nAUyvDzzgs827uEa+OtkN9Vn/JyuVYzlqP4Q1sXIEO
 ShA=
X-IronPort-AV: E=Sophos;i="5.77,490,1596470400"; d="scan'208";a="157444431"
Received: from mail-bn7nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.107])
 by ob1.hgst.iphmx.com with ESMTP; 19 Nov 2020 16:37:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ujgyvc7VNxSZo67CkpxYYNrqHEw39XLyqABuVMn57Xms3D8MEMG7OJCR7whKIfywIxXBMF9UzqMylrXpdlESxBpBfPJyH95tSXYGHyEQLPj5yUXhTLveCxHHR+juORY/47vAyfXWQdPoc4vbXhDRyvSUan0syEyaWCaxDJ7D6AG5SgS+1P8U5Qs72CqkLCNs/UU+d6m4imVnByk8zVMJltz0vf5GXeW9WCKEW+naGhR0oYiLPYW4ya6AOM9CXNTNRh3Aj8KpgPwr7fBKpmderCFGHKNZLWAstT4DoJADoiPp+oMlNloW9IZaiEEi7J+XRlMCJoVHTmbfgIQQn0NEUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=lb9/qqyyw0VyU8A1/UfjT+9sid7dZvJ9IYQfI/ZqmOBPZlFfK2Nlh0UDxSKN3+HBcWiyYJse4n+RHOH+8p8yG6iIkzX9mYse/ZYpwo4a0hsDUPxOBnIaWwPVUl7p1GITQjjGyAR6TkV869JJ8iyOGXksisDNPQhoxBh0Y8Sk5pcgRTZlEql2eHdeW7wKDuq5mDunREE3GvS1MwErqvvKXvx40jKP8/aYGaTFhaSR4SssBJa7Yq+P4yq+ij7rOvQLuaWildAVQ+ecFhq2Vr4gTu0EfATP9AvGKBHvF1Vw5q8w3vgBGRTsyvDsIqhbFsY9z53rPDg9qyOCuN0NzIJt0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=bPiB4F9DiLgpTY5tg+wz7YwSGOEh2nJNYLDEhg5C+LCUobxhAzOv6tgU6Ve3ncGAJ8FBSQlzM+woRCvCrT7D82mBox+c+RK6pvcDHa6XEhRsjTElOwFJ8/efC542uYWKugT1ub4HIJLqgcFFno2FtMjmBwpSWlro/hLqLnCUmm0=
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 (2603:10b6:803:47::21) by SN6PR04MB4862.namprd04.prod.outlook.com
 (2603:10b6:805:90::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 08:37:47 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::65d7:592a:32d4:9f98]) by SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::65d7:592a:32d4:9f98%7]) with mapi id 15.20.3589.022; Thu, 19 Nov 2020
 08:37:47 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 03/20] block: add a bdev_kobj helper
Thread-Topic: [PATCH 03/20] block: add a bdev_kobj helper
Thread-Index: AQHWvYgpPQQYaHo5cUCzCzUTvKQePw==
Date: Thu, 19 Nov 2020 08:37:47 +0000
Message-ID: <SN4PR0401MB3598F34DA0C62243AE70450F9BE00@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-4-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2001:a62:157d:bf01:851e:5636:4e29:3e2e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8ee06524-e692-40f5-4335-08d88c6664ce
x-ms-traffictypediagnostic: SN6PR04MB4862:
x-microsoft-antispam-prvs: <SN6PR04MB4862C03F8508DDA87FBC44E39BE00@SN6PR04MB4862.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cM6Zu8k0lk01FkTpo0twM3+ihg0ZM0fWiBNV2YgNEq57IjliedsG4hdFNcEeWr7gyHPkC8wcmnKwmo6B3s8tfpyVYHRb369EZu5lJp8WgHdKOrCDl8dYh+AoDVZOyHBJAApMKIwuC7ziO+80CWeJMYgP/KjPjWAAmmvtPZpr5T0vHcJ61OqTTQqpm/dAMMvfYKFKyVVrdU6RDU7QvDYf4966kTRcn2fjQAK/lEl83mzI9rCinyGP+fV6M6X1MZDvlQl1fBMPaZYSTHITNHBlN5eH3SpuuTOwrySY8c311ZVBL9e28Qbhi10GesUwg4oIYwFlt3n7YhgV7z/c6qgjQA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(8936002)(71200400001)(19618925003)(4326008)(33656002)(7416002)(9686003)(55016002)(66946007)(76116006)(478600001)(66476007)(66446008)(64756008)(86362001)(54906003)(66556008)(91956017)(52536014)(558084003)(2906002)(186003)(8676002)(4270600006)(7696005)(316002)(6506007)(110136005)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: MPTcc0vfLSyiAnTcb7e0ZxYCdd6X03PO+hkR4w17tnb1Hno0kQos4K2mXREGZgLW8ratrL8B7Yc0xKuz7b23avFfKFDWdAJZ0unQKNigvjqNfnlg52/l4vaB8VnQZB3bpxteL0XUwl5NiaDQSk18o+OUjU6RZIyFhczuuhvrHmiKMZyfEnE8pTXBOd+/9pmy9yKTzOl/EY3xuD3FdC+yKpHGqoQeKme4gD8v1ge8V9vYMQPLRQN4SQUoDaP0Vhgal4WsQ11lCXcin1Sgb/kzAOo6HfpEaNbxuyWxQRqCcOrSZPHv5iOftO9p1YtRY2wXtOWa1sA0KDa+0NgPNmtRLl7gp31EOqfqtNqNh6Ji75jeIcd8MNht16s0FlwCAxlS2P8ZifB1ZytH8GPK1oLJUuBHcDST5AFPfxNo41bS07GjTHsegEcVM/GpeqePqTEK25jhlPUX/8ihe+88T/wAtAe8dOwDwVwq3Ninb1XiaK4VoJrXQAY8ejc4zmH3i83S23c1Fzv9HnNe4uR6JJMG8X6/ACG+ofnt/1lGR8TWaNqhuE4Gi7IGxuzaNvNEg8jY0uvKRJBl9Dda3h/Tvg9GBd7a8Wd5g1EN03Czd4mU+OGBFfY63oZR25JElYnN6XzREmBQGQmrYNBD0aZqccL0wwTasGf4sNjm8alHdyyRXA/Cs8mp3uYnhFcU+sEq2shb/XRcDIJn+LkN+wlrb9jGvw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee06524-e692-40f5-4335-08d88c6664ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2020 08:37:47.7068 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FtL10fHlsqtF9VKWClE12kvG/4VucNbBlCk7eB3jP86NM/MVKoi5xzwEvgHccVAHfo1Z5D+XGYZM8Ev0yG9YEwoLHBffgmsp1L9OHKub5+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4862
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_033752_006891_961DA5AC 
X-CRM114-Status: GOOD (  11.59  )
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
Cc: "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
 Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Richard Weinberger <richard@nod.at>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jan Kara <jack@suse.com>, Tejun Heo <tj@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Looks good,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
