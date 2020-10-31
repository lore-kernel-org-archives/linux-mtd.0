Return-Path: <SRS0=Ys1R=EG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00084C388F9
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 11:27:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91E0B206F7
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 11:27:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="atp+rMVR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=infinera.com header.i=@infinera.com header.b="FcCnXyqV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91E0B206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=infinera.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BJDlTncjWwZeSXe5u02B7+Kg5VeTfPxFI1Y2jRIO7uQ=; b=atp+rMVR8PhXCkJhTn0TmCNql
	4PCocdskwlRlmul4j1WSa6WeidjG0mz3/kqiecDljTWvsVI4cFRlk+H6xgIU9aQeOKjuZ7ViiGyd2
	X4560NoIxRzTfbUAGVf0WjDK7LXwOaCtb3ZuCJBac15dU+ssy79lOhjvtcC/Wximl3MIAYhFjZ1rD
	E16IU9t5H6dJ5vgBnJu4PZWUW+BzLkuHPTLK1jAes77/l8+RhP8V+CoWvZO4jdjNi3IrDelXpj88W
	5W6udMDC3qofsJbUlzEwaW0VnY5+ro9FkxuWmb2NtULfYVgHb4cSnfpJrdxcPJEINnyZD6td6qWxL
	M2WaOppjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYp1e-0004Lq-6W; Sat, 31 Oct 2020 11:26:26 +0000
Received: from mail-bn8nam11on2085.outbound.protection.outlook.com
 ([40.107.236.85] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYp1b-0004LO-Ch
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2020 11:26:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKWsRxWjCpG87w3D9gpi1AemukFTNSRVgihSQwM/BxMMZGZJF7TBzkMukmBBF42C4RqUFgu+c+mPKmUpX5B0BxLcoRMB+EQ0RIH3hyY0mU0nQWcF/m+3Hsk5qhZFQRgeCfJLAIkaiJ8hCOWw//wHC/E6+te1wi/HHZn67OLfATTy9Y+eh6RLzTXNX5z44Q+emy37Dt+m82Jh5BJGtXwkfD1srnTKTSnizQQPK7V84XZ3EcWnT2AY3LS8v4eogN8pnDsWLDtrX+FwL4Hcxwis2WCx+xBZirYhKIbjdHyqwTe9veCrp0vfsIFhGEzgMpquZMdvTY8hSrwF4yFWEhQB5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtQDnTG16V1DHPy+eJAPc5adpIp2T+AbI07+P6vREs0=;
 b=P8f5p1+GsebUDV3a3nkj6k4vGIIg/DuovlBk9OH9XR1PQ84paR6Jrh/Tj+0j6bxRSKAfpEKz3m9boh3ORdOpo0I16MqtBeJu5B5WMvLPQpMpF7NZRc4mKmU6AHhLTbXUnC4mMLERNn2/Q0tAIp/Qs8w7A06bXtO1VqIL/p5qtKSrjDZMOJvSUkckOJSWb/ySGu0jXayTyN1F/qR7Tyzij/KyBJ3XEsz56RnLFnJGN4WYs3j8JMMJRR758gMWebBxHEEHfwlxLVaaswptuEMDJuwoW748EQqEA7wA8N9gbMD9bNkpdmPD2XsKYsV1Q0cVXTqYl0vhSkNEsnPaa5KfmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtQDnTG16V1DHPy+eJAPc5adpIp2T+AbI07+P6vREs0=;
 b=FcCnXyqVNzlVoLtBgPXUEN98KuaqxS7Q6WSmm7lK81z0jxLemc37ZBy8wOIDa2/Bx97sReA0yDihdATfEPBR+Zpf4nTqfmAV1/6iAG7tI27724eSJC5Y6u4eEl+5oFc7OgUhE813xn8gd24GshG0PlIvYS50e8gbvS5Z4SaRMmU=
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 (2603:10b6:910:45::21) by CY4PR1001MB2168.namprd10.prod.outlook.com
 (2603:10b6:910:48::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Sat, 31 Oct
 2020 11:26:18 +0000
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::a4b0:cd03:3459:6853]) by CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::a4b0:cd03:3459:6853%2]) with mapi id 15.20.3499.027; Sat, 31 Oct 2020
 11:26:18 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "vigneshr@ti.com" <vigneshr@ti.com>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: Use status register where possible
Thread-Topic: [PATCH] mtd: cfi_cmdset_0002: Use status register where possible
Thread-Index: AQHWqIpTWSfEXw2OaEiocc+ivq8o4KmweGwAgAAOhQCAAAO2gIABFY8A
Date: Sat, 31 Oct 2020 11:26:18 +0000
Message-ID: <931f422255204f0420e6f1b79657f9770ce0cf6e.camel@infinera.com>
References: <20201022154506.17639-1-joakim.tjernlund@infinera.com>
 <20201030184736.4ec434f5@xps13>
 <aefef0187e5ebbe315e57e834ff1ba756ba88817.camel@infinera.com>
 <20201030195251.687809f7@xps13>
In-Reply-To: <20201030195251.687809f7@xps13>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.1 
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9fe306f4-bee1-47bc-7dfe-08d87d8fc98f
x-ms-traffictypediagnostic: CY4PR1001MB2168:
x-microsoft-antispam-prvs: <CY4PR1001MB21681F71EC08DF499EECE4E3F4120@CY4PR1001MB2168.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gmPF6W8ia3i2biLnijCOTLhniCrAbCigxY63fzGwl4wYGbVDRgpe5NySG46Rx4XCs3wBVElyDxsnZaQlnwr1l7COoL+K74ulBCvDYFYXVkpKU1c7nWOgqNsZVca+++510p9p6DiY4QqlqtRN/XkDeDhiylvBphxIqirbYe3OFkUiqga+2/EoqTyNOMpmVjZ2Buvvpvc0nd2hW+Z7YP8+9awH8QEhaJO76Jb4PIjHARvtVwLDSAskvjsyeeDpM0FQL2TF0i48KJzRvHRIKL3uvCITc2VeRSHQzlCpNnDsmX+PGMieLxpsHxGd9zGalWYt3R+GBZI+it/eO1i1ioyTBA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1001MB2389.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(6512007)(186003)(110136005)(4001150100001)(26005)(36756003)(316002)(54906003)(6506007)(478600001)(2616005)(71200400001)(2906002)(66946007)(4326008)(66476007)(86362001)(66556008)(66446008)(76116006)(91956017)(8936002)(8676002)(6486002)(64756008)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: AB9O9EYX87gL2n+7zqr6KP2Fgn+yOWWMm6qeelef9PUfoijt4E8mreWnK98xy0NcF60F+mcq5WlVfo0JgAIDrNqSosWrFL0STdSSCS4eD627uzlNniDsUdvfTyWN6pzZXVW6/2fjg8OopL1fTBiL8KNZ6H6uHnKy76kRHt7cNaGGkpOQNHDgeg7xdIEA2pFeROkM3o5bSF1naXghzICLkVJQZg+f/bOqJsFfQRXMXCjzf70YODtRj7/AH9tx5qacSwLKzcegcxVbG0HfjaB083ziTGeakUBxPXpZuXjDkFvxGkJNa1JIzHP8QC/XmRqrMr+YjRvUPR4JpcGFl+SrJ+QovqMp9aw+DkUN9ccEuCWxUKlKIVD+39gF2uY+P5Oc098QiOLbr+bsKWw91GYE6pCOxw4OZKprbFZlPsAD4Qp23S/0fcXUEDarctKBbvcBG3ZsYaA7GM/0atIVRjRHRxE+fitdU65QqhPBn2Wiuvszy3B5XYMe1hIxfyBKB46qUP7f/RRakY4PVkr5klwhoI+zilrBm+QFCF/wSFfiN2zzMBhAhwdwCn0HLFYctq91D4aOObbBCqiWQDIeHoivkXOn2wM3qqacolM++mCcKgHAjn0KzT/yo8XUE/HDA8AGeUWr1VMrcevG50Klzj7ytQ==
x-ms-exchange-transport-forked: True
Content-ID: <D9A607EDDDFE3A4BB69914B1B1C18097@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2389.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe306f4-bee1-47bc-7dfe-08d87d8fc98f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2020 11:26:18.7805 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z8ast3NK4/yqDSQiIn1IReqC/ji4yoGW2wYuGVUPQxuLbRQYv68KETdYfriywj1TYYwaV3g9QTh86I05zb7pCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201031_072623_652404_2DC9BB66 
X-CRM114-Status: GOOD (  19.73  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2020-10-30 at 19:52 +0100, Miquel Raynal wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> Hi Joakim,
> 
> Joakim Tjernlund <Joakim.Tjernlund@infinera.com> wrote on Fri, 30 Oct
> 2020 18:39:35 +0000:
> 
> > On Fri, 2020-10-30 at 18:47 +0100, Miquel Raynal wrote:
> > > 
> > > Hi Joakim,
> > 
> > Hi Miquel
> > 
> > > 
> > > Please Cc the MTD maintainers, not only the list (get_maintainers.pl).
> > 
> > I figure all maintainers are on the list ?
> 
> I personally don't look at the list very often. I expect patches to be
> directed to me (in the current case, Vignesh) when I am concerned.

Added Vignesh

> 
> > 
> > > 
> > > Joakim Tjernlund <joakim.tjernlund@infinera.com> wrote on Thu, 22 Oct
> > > 2020 17:45:06 +0200:
> > > 
> > > > Commit "mtd: cfi_cmdset_0002: Add support for polling status register"
> > > > added support for polling the status rather than using DQ polling.
> > > > However, status register is used only when DQ polling is missing.
> > > > Lets use status register when available as it is superior to DQ polling.
> > > > 
> > > 
> > > I will let vignesh comment about the content (looks fine by me) but you will
> > > need a Fixes tag here.
> > 
> > This is not a Fixes situation, no bug just a hw enabling thing.
> > Also, I would like to see the Status patches be backported to 4.19 as well.
> 
> Backporting features is IMHO not relevant. I guess stable kernel only
> take fixes...

This is not a feature really and the 5.4 stable did get them, I ask 4.19 get them too.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
