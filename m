Return-Path: <SRS0=xwO+=WV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29CE2C3A5A1
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 22:09:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDA31206E0
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 22:08:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KNu7vAx4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=fb.com header.i=@fb.com header.b="jmYDc2b9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com header.b="OSivPdeR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDA31206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fb.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TlhVR1BMJFaP3WbhvbSf+GfAviAfUVTsMqQAl6lZxDc=; b=KNu7vAx4nXRgVd
	0h3uWbbwL+aKVm1txorqdych7r3epbbLonVPqlHshoDenLAlTM8GBqbdJpnfaavckjjhLhtQ47DR7
	ONElNMS1AeYhQmwtZt2/RDvN5IGRGRwMmsAICneVGtD8zSMvnoINsCdNjdlusEXG+gcbZnkEaxkv9
	GUSgkj7Y4++gHc/zMuUgHdqPo4R0ZZ1AoFgT8O/4cYKF9ABxg8Zc2/fgm2GJntUi+mDHxbtvZwcwG
	Fem5OrSEmnVkGgJ+jdQHaGN0QMv3rsJQ4s1F9le2LXacdnJGI427LcRT3e+7QtiKtA2/y+OqEVAVB
	T3VgtsYkEIfyjoSqzVNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i20gf-0003ax-P9; Sun, 25 Aug 2019 22:08:37 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i20gc-0003aY-QO
 for linux-mtd@lists.infradead.org; Sun, 25 Aug 2019 22:08:36 +0000
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x7PM8Nu9002192; Sun, 25 Aug 2019 15:08:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=owNEY8OWz02/bXW+aU/IGgPSjADigaFv4pELm5lXmws=;
 b=jmYDc2b9d/2QH7lhw7dDiXyFhKI0Y1dhc4wikY7tszbubpq9IYwC8vAFYwk0ghidWzUv
 qKdXWmdOWj+A0dwVgYnUSycQgUtzgRIjXkbz4UDcTb8qxqwMtak5kwHcTy7lm/lvGclo
 soAjnR1eKTEvX/8Mew7pgAI72UDJ8aoznbM= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2uknj61s2m-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sun, 25 Aug 2019 15:08:25 -0700
Received: from ash-exhub203.TheFacebook.com (2620:10d:c0a8:83::5) by
 ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 25 Aug 2019 15:08:23 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.102) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 25 Aug 2019 15:08:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pw9f3yW0kGhsXd/xodD2ziLDxCqQG9XMK9zTgXlMBXZEULZj4NY+9kYGK2AdhF3xDMY2tFkkwGZQgE6nQreEag/8rC51Q8g+RFPsy2i0Tj7yR1LV+4jU32IPxtuZBPgW1LyNRF/j6eRIFnWBzina/gXN4JFRj2/vQPq/4bdbGlM4P84dSzAm6HGIdqkBg7/f3tD4NmbRwuQiJn7oMJNDp7YC5kDB3EvE0t9qZ9A4aoeSTvL7aHo8jcyOmfYq86LXxFF6Qlc/nAfEYdOkElavynUTDolzZbkIAPaMlFplBOe1TGXJjHqz4ewJJLuvsEEd0Q+CvOWdY1Tn/7IdctDInA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owNEY8OWz02/bXW+aU/IGgPSjADigaFv4pELm5lXmws=;
 b=dah27flb25GjLugAZrCS28riRc3ZTZJsLtjjr7XkTdMbS0ccF17Q4EWOgehvVzy4+5B8jiO+ODRUizrdGBnIgwt171RlEYPWjyJvNYlJ6+SfVZmhjHNn/0EVekskWTHJIzlUiMbO0+UNj7zjg7LaeobLrzxg6xopr18H090xTQhGjjjash5wvThHl86XZQMEskLX87NW6N7aavLYk7UpeUfi/ADjXZOQCxcSZxcKYBXPw6WqbFDHSwa7Gr8KYZ7vdiPIW0GwkT+DvQjpq29Q7Xm+6XB4f4lNols2BNCw13Vl8Zc2qP83nuwq9y+mOxiE+ncpWMr3tw0yVkzpsR/Mfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owNEY8OWz02/bXW+aU/IGgPSjADigaFv4pELm5lXmws=;
 b=OSivPdeRW7z3rsUDc2p7IH2Rv0YV91txy6LCXlGwxmpNiZfIOo+V9IBhokbUdC3kmPF0W5Gn/dAG7wVvogVwRFeZNJfFAu4WJO9WZT6LwOdCEJnmbpoYV2h6RujtTF+qqffZH6/nwUb0tR80Z1pVE52ALFXtUW8iXlS0DJD0p58=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1440.namprd15.prod.outlook.com (10.173.234.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Sun, 25 Aug 2019 22:08:08 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::2971:619a:860e:b6cc]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::2971:619a:860e:b6cc%2]) with mapi id 15.20.2178.023; Sun, 25 Aug 2019
 22:08:08 +0000
From: Tao Ren <taoren@fb.com>
To: Richard Weinberger <richard.weinberger@gmail.com>, Andrew Jeffery
 <andrew@aj.id.au>
Subject: Re: kernel BUG at fs/jffs2/gc.c:395!
Thread-Topic: kernel BUG at fs/jffs2/gc.c:395!
Thread-Index: AQHVV6xCTU2NhpXAkkGUQ2XhN58pgKcEqeqAgAAPW4CAB4xhAIAALiMA
Date: Sun, 25 Aug 2019 22:08:08 +0000
Message-ID: <4dee9f54-1cf4-94ca-4ddc-2b1f8892d9b1@fb.com>
References: <e8bde724-46fd-4264-ea3f-a84a792bcad8@fb.com>
 <236e95be-a2cd-3b44-36c5-121678f7c009@fb.com>
 <afe2b8f2-d1be-4cd2-971a-b13c1e38da67@www.fastmail.com>
 <CAFLxGvypuPp_Q_31DpKmfqte4uxHfYiQ6KvT1f2LGo_y7EvKfw@mail.gmail.com>
In-Reply-To: <CAFLxGvypuPp_Q_31DpKmfqte4uxHfYiQ6KvT1f2LGo_y7EvKfw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR01CA0045.prod.exchangelabs.com (2603:10b6:300:101::31)
 To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:180::b0e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f30f21f5-36e4-4d59-8ab8-08d729a8b5e0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1440; 
x-ms-traffictypediagnostic: MWHPR15MB1440:
x-microsoft-antispam-prvs: <MWHPR15MB144021F26DC24B27547B8753B2A60@MWHPR15MB1440.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 01401330D1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(376002)(396003)(39860400002)(346002)(189003)(199004)(110136005)(58126008)(8936002)(66946007)(54906003)(6246003)(6436002)(386003)(229853002)(53546011)(65956001)(65806001)(52116002)(6512007)(53936002)(46003)(14454004)(6506007)(25786009)(478600001)(4744005)(305945005)(186003)(66556008)(316002)(64756008)(446003)(66476007)(66446008)(11346002)(31686004)(7736002)(256004)(5660300002)(6486002)(86362001)(71190400001)(71200400001)(2906002)(76176011)(8676002)(81166006)(476003)(31696002)(102836004)(486006)(6116002)(4326008)(81156014)(36756003)(2616005)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1440;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +5a95j39SHkToSqWBMvu/28pLzW4UVP1Av951r6cHBBq5WEBbzhTpSiN9zOAJ+Z7gp1CUs0OorezZFCMkV4xNC/olVxOt9NzcBErVB5CYaq2lWifA09upNnBTR0MDDYKUCYd7qROfppkqwUfHC7KKrH8zi2oDrS+hoRnLPC35rgl6eVupg/0bI0yq049/qHat9iya4LJ07bJI/0JF+bco3WoP0+/x4YYPpozjdmQWe6uSeHDnkrYAhVkW0zFvytGXpJTU65t8iTKRUT6z7Xl9i+8zTAWLbFp6ZeZEkM7VDFTHoCuqw7zpLuP7uP/MsdeQuTqvi6lXSN6ekoki4QrhIiPCaZ1aH9QOFiZquHTcz+/gmRAQsrtS2kvUFzBtEBNGe7+uiUsvQ5hRjdJ5eGFFAxUgytrkUnndw51JxQigW8=
x-ms-exchange-transport-forked: True
Content-ID: <247EE95655181A469348414E88728C35@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f30f21f5-36e4-4d59-8ab8-08d729a8b5e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2019 22:08:08.0969 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eOFhXyPdrUZ1bps4VAbCs3EQNXsrWpfitKXSqkk6Z3aUuhDNcgR8k3rAyddO99Y7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1440
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:5.22.84,1.0.8
 definitions=2019-08-25_14:2019-08-23,2019-08-25 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 mlxlogscore=999 adultscore=0 spamscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1908250248
X-FB-Internal: deliver
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_150834_920146_8037E58D 
X-CRM114-Status: GOOD (  13.45  )
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 8/25/19 12:22 PM, Richard Weinberger wrote:
> On Wed, Aug 21, 2019 at 2:06 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>> Looks like a lack of robustness to filesystem corruption to me. LWN
> 
> What exactly makes you think so?
> The inode cache entry is in state INO_STATE_UNCHECKED while GC run,
> which is not allowed.
> 
> Tao, is the error persistent or did it happen only once?

Hi Richard,

It rarely happens (~1 out of 1000 machines in my environment), but once it happens, it's persistent: the machine will fall into reboot loop due to the crash.


Thanks,

Tao
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
