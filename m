Return-Path: <SRS0=eoWp=6U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0ADDC4724C
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 08:29:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77936206E6
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 08:29:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="txzyvNTT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="JbHg9Rvs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77936206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xtS60VFjjJbO8zuMgDlEABlh25IPhhhpyvct6CmAjWE=; b=txzyvNTTdS7162
	5tt2utFprac4yEc+1RGpgUY+HAE+u/FyJ4RiCHkM6BvWgnn3Q0YOh8yenxgO+ZFYq/PjTvghWAvre
	ERe4P+dJMkzxAiGS3YiyHxyTgcpBy51ditC9+y8fQ6FMEYMUO9WtTowyPD9BHKdLNcQdJQHMpBMY2
	9DuWIRrAOqecn+VQ5yhrxZBPscYSWrxbcRvKcmGTHyobxvhCTLmuT8sRFTUY3utJOd6x/guLgp0fm
	2bBIUzqNdBAK3irldDq5PaOBgXkVorW55WHtrZeRm5JigDkjMm0sOIcS7m6701ufPm6S2IYdXmgV8
	pafe4v24ZLXJZcigaFIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWFQA-000164-0W; Wed, 06 May 2020 08:28:50 +0000
Received: from mail-dm6nam11on2058.outbound.protection.outlook.com
 ([40.107.223.58] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWFQ7-00015R-16
 for linux-mtd@lists.infradead.org; Wed, 06 May 2020 08:28:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhoA2TPHptGJ6+QDfWvZkzfBwaYAsoEZ2RWsjneSJ9FHwE84bXC+GoX+4uarIAqfwkEqK5l1bJ1PXk56ob9u59g/sVD4E/X5V8hafPQySOi2+6HkU/MwgoEP38eJe266p7unAF4HWHZ6SUwaqW2pq8OCgfVnfuoJkbaJYmnGNNODwgx4U7V90RegxPdeJT2UJD3t/gPqCaIodoGiHcVvCBez/gXsrfZYxKqTpga/lYb+bHOsDl5NcSNivGCWDa3rVYX653iQsx5UN4mYgDqi4x2S7h5kijcGyvTRwIbZBfSQANM2lY8HFH1kgy97bWm2E/eG6/fYOHdD5MFLM+t5Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LXQ4R40G72i+Y0xHZm0YSw+oOH0F83mreju+c7M7Yo=;
 b=gv/Kdxpk2tJhnxkT4wVRAO52/qthYv6VmyEbbFZpVpV5PBBBCl6uopMJ+h0oCmU8lbJGZ3JV+DadRaz+AAcPwktCF1fWTxxsbtR0FWKbdCZyl9+338IWmceR8oL2kMq2rgvu0NYRS3QHNh1SSNuWHfGADMnQ6/ndjEyCTqbMYbf7vGyeEtFvwdtnI40pEG9xnNX4JL31k4t+SKUx0abBOf6nJJzq9AFqi03up4DG+mf6ZbQh4BicufDo2nxX7gpa3atj+j+mWfqwgLh2AG3pyBQxt4xbXe8QvJYcgpe6mEvEZN1iR9VazRW8PbjUnYpTT6LHA63Y4zUvUpZRQi6bbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=micron.com; dmarc=pass action=none header.from=micron.com;
 dkim=pass header.d=micron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LXQ4R40G72i+Y0xHZm0YSw+oOH0F83mreju+c7M7Yo=;
 b=JbHg9Rvs45fmn3shrIyfgz+nrKO8Mo0mYu+cSM+qDBRBcJ1J8qWU2YVMVu5je2vW6vI3Td8gWO2/62afUjgIV/dYLhhDz/gexANcFnrv584LQqvS4Yg/oGDVnRWWGDisv8/B4Xir2lnARVAkwIc28wgrbIbgduXp9PSqjVfjES8=
Received: from BN7PR08MB5684.namprd08.prod.outlook.com (2603:10b6:408:35::23)
 by BN7PR08MB4865.namprd08.prod.outlook.com (2603:10b6:408:22::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Wed, 6 May
 2020 08:28:44 +0000
Received: from BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::9ca2:4625:2b46:e45c]) by BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::9ca2:4625:2b46:e45c%4]) with mapi id 15.20.2958.030; Wed, 6 May 2020
 08:28:43 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <Tudor.Ambarus@microchip.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Steve deRosier <derosier@gmail.com>
Subject: RE: [EXT] [PATCH v2 3/3] mtd: rawnand: micron: Address the shallow
 erase issue
Thread-Topic: [EXT] [PATCH v2 3/3] mtd: rawnand: micron: Address the shallow
 erase issue
Thread-Index: AQHWIT+tSg2eMxWQMkmMQ2x4Hr5xC6iauX8w
Date: Wed, 6 May 2020 08:28:43 +0000
Message-ID: <BN7PR08MB5684D285CAE2438B355DCE80DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
References: <20200503114029.30257-1-miquel.raynal@bootlin.com>
 <20200503114029.30257-4-miquel.raynal@bootlin.com>
In-Reply-To: <20200503114029.30257-4-miquel.raynal@bootlin.com>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYmVhbmh1b1xhcHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJhMjllMzViXG1zZ3NcbXNnLTk2YmQ2ZjMyLThmNzMtMTFlYS04Yjk2LWRjNzE5NjFmOWRkM1xhbWUtdGVzdFw5NmJkNmYzMy04ZjczLTExZWEtOGI5Ni1kYzcxOTYxZjlkZDNib2R5LnR4dCIgc3o9IjIzNTMiIHQ9IjEzMjMzMjI3MzIxMTkzNDYxNSIgaD0iN3VkelhJem5jRlZpUVVMdkw0MXU0SkFwVGg4PSIgaWQ9IiIgYmw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBSEFBQUFDWEJ4NVpnQ1BXQWRObmJ6ZUVwaTkvMDJkdk40U21MMzhBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQkFBQUFmM09FS1FBQUFBQUFBQUFBQUFBQUFBPT0iLz48L21ldGE+
x-dg-rorf: true
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=micron.com;
x-originating-ip: [165.225.81.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fea44125-f9e0-41ba-b240-08d7f1977d2f
x-ms-traffictypediagnostic: BN7PR08MB4865:|BN7PR08MB4865:|BN7PR08MB4865:|BN7PR08MB4865:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR08MB48655D120A40A44E7E8E4775DBA40@BN7PR08MB4865.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 03950F25EC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3GhsGcofueSDC35UXVSDdBDWoQV1pWW1c90WyjTY1GZTV3D0L3YGCcCjamwKOepX857nxM0GTA9qhYrQmg7suB8w/jDtG50iEW8en0J6aKgLoL2fyRZ46oV8rFpYJ3AxKQSGKAIl8v7PEXcE8s+VnV/EiHfYHd8Ozth3eV8WW8g/Cx3q1AQEVcgjyMbcOHslwlREdHOHrg+UBr62cVpG92snF7XVnr1bMfumNo5Y+ETWoto8CBjrF8wgzqwspJMdBPi4VZhdEduR1Vo0E+SuwfY2QAQeaYPiTvHx+Uv9PyaP/fJCQBC02j9oYUqg0wHXyTujFLDwjqSWOwI5cb5U0i01iM1cq1sBXlhra20sRbj4DM0CDj5/oYfpyQDyucgVAkIY4wdFfItSrZzGjZQjZ+ry0eHzwEfV1Fi0KH4OH/z0IZ9mP5iPqF+ACbFICII0zE8kQRPVwcOn2JIjpSa2JtzNwGETUzXyRtNHKWM3GdFozt2lc+DIbkXnJKKhaW3VekzwnmHpL4l754oNPgUTHw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR08MB5684.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(33430700001)(110136005)(7416002)(7696005)(316002)(33656002)(54906003)(8676002)(6506007)(5660300002)(86362001)(4326008)(26005)(52536014)(33440700001)(186003)(8936002)(71200400001)(66556008)(2906002)(9686003)(55016002)(66446008)(64756008)(66476007)(55236004)(66946007)(478600001)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: bbsfFZmh4QS+/lqMsMcLthqxK9/uEPG4gu6E36xs6xSTH9FpNXM6U1+AIp5SQdJ7ByRa94yatuj/chaxLs8o2cpyNaewl+tELAkdR5kYhrEJJnF0mqCIedfx+XOoDsp9ha5kp2DHtUvQIZ3BeGOv5PNW1DaZbTA0eVP9WlLeAkvPfBCkPz/Bj8/3JdsTAG4Vb0ojTbN6dgkTn9g9NdEuyCjdtPip+WsYRRijTBGc7fjE9ilm/743f+UI7kr0DSsYBJY5NnhjUY3ndJJfzrIbHiiakuvy3eWHcZBuvPhe/ni7WqHaJGt4+qNVNErMwRWLNsfR7vcRDqmkHO498+9Wl/MEXJAkKGrNp8uXlITnDgB2oGFE4TudtoaK2HwK1DZ1sJWo4TUE+9N4j32eiH8aRAVAY+raUN4XgJnv2r3jtvEcs5UoD+1qGpzmrrX8LC/Ya1Wg5sV0o7aPDwTOiSo4rEAGd7oBvheyRG0ljg/Ge0GJHfx/9FHl9HV6tdEBmJpIJLRPGc7tNSZJr21PTDR3wZDld2+5sVthNajfiVy+uLxYUUbpvSvnWZzW5P7E1TFGHUHkNEjs3pHUfGbjWp1MfepjolJ4vQPRweCjoOhruz1h+vaP5JsZVy0CmAMZayAQ8VoTMTjYyo6wSVm8hM6+lhZA+OM9YKqTH4t5DeR6A/eG/mqpGeDkiWyFPcSLJQwVPNge8Cws8e5BBjPzFKKbf7nyW7b8PR5R+ogM0mW8/xc8UDDoRqrgHygDl64LR2swV3wEoQ8u2dnh3JsDPLkiOi7UvwcznPq+VgWWJhYjP2g=
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fea44125-f9e0-41ba-b240-08d7f1977d2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2020 08:28:43.6649 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MQGerLJHixtUJatAJmWtco8HBW7NxNptez7x8UvfIvrsljAouaGtH9OdacVFS0Cs7ktNoD1bMrCC6CbjHmZKFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB4865
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_012847_175053_D16AC693 
X-CRM114-Status: GOOD (  13.02  )
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
Cc: "Zoltan Szubbocsev \(zszubbocsev\)" <zszubbocsev@micron.com>,
 Piotr Wojtaszczyk <WojtaszczykP@cumminsallison.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Miquel
I have two questions about your patch, please help me. 

> +	 */
> +	for (eb = first_eb; eb < first_eb + nb_eb; eb++) {
> +		/* Il all the first pages are not written yet, do it */
> +		if (micron->writtenp[eb] != MICRON_PAGE_MASK_TRIGGER)
> +			micron_nand_avoid_shallow_erase(chip, eb);
> +
> +		micron->writtenp[eb] = 0;
> +	}


Here, if the power loss happens before erasing this block, for the next time boot up,
What will happen from FS layer in case FS detect this filled data?

> +
> +	return nand_erase_nand(chip, instr, allowbbt); 
>+ }

 static int
> +micron_nand_write_oob(struct nand_chip *chip, loff_t to,
> +				 struct mtd_oob_ops *ops)
> +{
> +	struct micron_nand *micron = nand_get_manufacturer_data(chip);
> +	unsigned int eb_sz = nanddev_eraseblock_size(&chip->base);
> +	unsigned int p_sz = nanddev_page_size(&chip->base);
> +	unsigned int ppeb = nanddev_pages_per_eraseblock(&chip->base);
> +	unsigned int nb_p_tot = ops->len / p_sz;
> +	unsigned int first_eb = DIV_ROUND_DOWN_ULL(to, eb_sz);
> +	unsigned int first_p = DIV_ROUND_UP_ULL(to - (first_eb * eb_sz), p_sz);
> +	unsigned int nb_eb = DIV_ROUND_UP_ULL(first_p + nb_p_tot, ppeb);
> +	unsigned int remaining_p, eb, nb_p;
> +	int ret;
> +
> +	ret = nand_write_oob_nand(chip, to, ops);
> +	if (ret || (ops->len != ops->retlen))
> +		return ret;
> +
> +	/* Mark the last pages of the first erase block to write */
> +	nb_p = min(nb_p_tot, ppeb - first_p);
> +	micron->writtenp[first_eb] |= GENMASK(first_p + nb_p, first_p) &
> +				      MICRON_PAGE_MASK_TRIGGER;
> +	remaining_p = nb_p_tot - nb_p;
> +
> +	/* Mark all the pages of all "in-the-middle" erase blocks */
> +	for (eb = first_eb + 1; eb < first_eb + nb_eb - 1; eb++) {
> +		micron->writtenp[eb] |= MICRON_PAGE_MASK_TRIGGER;
> +		remaining_p -= ppeb;
> +	}
> +
> +	/* Mark the first pages of the last erase block to write */
> +	if (remaining_p)
> +		micron->writtenp[eb] |= GENMASK(remaining_p - 1, 0) &
> +					MICRON_PAGE_MASK_TRIGGER;
> +


This micron->written is stored in the system memory, once power cut,  for the next time
Boot up, will it be reinstated or it will be 0x00?



> +	return 0;
> +}
> +


Thanks,

Bean
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
