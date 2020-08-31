Return-Path: <SRS0=zkQe=CJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F1DC433E2
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2020 10:56:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FAE6206F0
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2020 10:56:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cJzDSPii";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=prevas.dk header.i=@prevas.dk header.b="QaTqLkTg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FAE6206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=prevas.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QXeFN+qZ6fcciEpn3H6uQze86cQlvwB4jUMa/mRCyy8=; b=cJzDSPiiHJq0tYX6u+H8UvDnh
	GLvupedN4Cna5GooSCkmXfLp0ype4XotVQl5TMsZ1ToJAVJjWF24annCwkxIiAuIzcM9zzWSHZVh9
	z5UZShtkw1qyDZt/xUieZ1tWkRg1V2yjigpTzqg9sP/+rxUQpaP17zWlJZhpGPlpd8w6uVvNX7ECx
	N3wU1PLCXsRUz7oAU7LXYfxk/uTFBHoX3QMlhv9N30mxDa4nHl2gGeSmFeimYwx4ZeN7CY17Ly/gx
	1gPZ+hafpZrPDccwY6l+7xbFNAKr6GXNNDq4tV+lFDlHEFjC3Ziksouwehr64lON2z2XZlbVVZV1H
	z8zWsh2/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kChTB-0001ki-N7; Mon, 31 Aug 2020 10:55:25 +0000
Received: from mail-eopbgr00112.outbound.protection.outlook.com
 ([40.107.0.112] helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kChT8-0001ja-6y
 for linux-mtd@lists.infradead.org; Mon, 31 Aug 2020 10:55:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=az4jGmFDXf7jRh2bqPgJd0t7MMZ4anEKr1K8mLgPe63rqTqqYuM0lSlFrGp7fTg026G0QRGeveOb8dDu6pSK5hzKbHOy3b+2ArlphsK0wDv/t3nFBE5pAsD92NNWvaSsYBUa2ijdHc8PKZiddznd339FpG6jbHpVz2AurLWWFr3prmi7Mc4XnLxYzkm1kFzsUtt5pD2kA+TTGf9Scu7Dl7KQwqg0lArGHMZD+XJubhBeT7Btnyei6CrIZIZqWgVO2o+NC9r7QUpguwQy2m9mQACntbzpqhFdQkONe198DGtSPzKRtzzw7m0tr22VqJ/iaAHN+vsxaPnUfvqKeybagw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CP4+mNDXx6XQKukanVDEw8CA9fMjnCKDq+Ox4MsFRT8=;
 b=Ez9tsiFO+3kKA5TTzX9khSKmsjQEH/uWhsdFH3sLI4/hwQKNGYr5YzjN/HQ9bezs2vZmVxQnr3g8c8Q6hk8qk+fcfBuiRlZU71XBhOz76/vGv+wrSHtq9ej4FvU9ANa+w9LcURFrTJd+S7ALSfhQJ04/ISqe7eQWZSDUJTW21d6dF6pQNApC26AVoFNl+phl0zNDQamSCQNJ9OPq++o8Xqow7UcZ75rgdvvvA8x+wKVRJMSYcR4LkJ2hplo+wSHETNTGQsqb0hLGLc26btgYUdknCZLqf2NraeCz/lyax+6xfdFeqdaid9M5dknhOnikYXFgESh1pBC+mcZc+Tcx2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CP4+mNDXx6XQKukanVDEw8CA9fMjnCKDq+Ox4MsFRT8=;
 b=QaTqLkTgs4NxAL1dAweH/79jchGX9xCBj5oFeHSOArw0aH6t3MVI4qy3mlM/T+KWSjPz3iueai7looolrpUT4NrV1xfWRfCeFQKbI3Av7GyOhRUatIylX/6RwF7Oq0o1dAKLQhEroxqeFs5AR+lX9eLSVfF3MDQPk4arZIWiWUk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB3220.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:182::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.24; Mon, 31 Aug
 2020 10:55:17 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3cfb:a3e6:dfc0:37ec]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3cfb:a3e6:dfc0:37ec%3]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 10:55:17 +0000
Subject: Re: [PATCH 2/2] mtd: spi-nor: enable lock interface for macronix chips
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
References: <20200812151818.16699-1-i.mikhaylov@yadro.com>
 <20200812151818.16699-3-i.mikhaylov@yadro.com>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Message-ID: <ae094597-e57e-dff1-f897-bf3cc75f5511@prevas.dk>
Date: Mon, 31 Aug 2020 12:55:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200812151818.16699-3-i.mikhaylov@yadro.com>
Content-Language: en-US
X-ClientProxiedBy: AM3PR07CA0110.eurprd07.prod.outlook.com
 (2603:10a6:207:7::20) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (5.186.112.31) by
 AM3PR07CA0110.eurprd07.prod.outlook.com (2603:10a6:207:7::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.5 via Frontend Transport; Mon, 31 Aug 2020 10:55:17 +0000
X-Originating-IP: [5.186.112.31]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8aec64e9-4109-47e8-30a5-08d84d9c58cf
X-MS-TrafficTypeDiagnostic: AM0PR10MB3220:
X-Microsoft-Antispam-PRVS: <AM0PR10MB3220DCBEE627A004DCCE22D193510@AM0PR10MB3220.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pRk3KABxRVg3Hhn0oq1Z8Q6GoadwZPc34iBhzTRD6QbIO8qdPvjFmCqz+hfTqARRKCVyST0wWRJLDqJ/Q+SiPKo9Luh90AVEH6wiUIdk3AylJVxFXuFGbQw1PddGzvigl+83vihF8q2C7Obg9AvboqnsZXa4NiNUJEQOur3QD5wsRnZTGaT54EPuSuBN+NwfHC16FofwNjgx+0IXY0mJAtEcsJz6V47H1Usf1VAbjZw9lJtKuCqGKfrFi3bfPciy9xVHyyW5wzmRsa2JL2nYkszizF3BQ6bM1QGDhp4xMVsqRNrYIMlgm72ggyEe3mtBPl48Wl86XEIEluddrUev5vl2Qh4+NdKykk0aUVNnLB2d67T85WSmzC9BnJP5pQEMLbAkUY3P+NIZKDKpmPuWEUOgVjGY58wRdHnMIYBy17BRwVHKfbdhVeL8o8ANd/iP3QIh2sN40oyqKeDS4VqOAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(396003)(346002)(136003)(376002)(366004)(39840400004)(36756003)(6486002)(86362001)(6916009)(2906002)(478600001)(16526019)(44832011)(316002)(31696002)(16576012)(26005)(8976002)(66556008)(66946007)(66476007)(31686004)(8676002)(8936002)(186003)(4744005)(956004)(2616005)(5660300002)(52116002)(83380400001)(54906003)(4326008)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: alZ8h0jsy2eUGzO1tL+ROp/9E4Stm4eZt4/8oj2xO2NzlK1MM28AKk0LuMJYEkBtiyez1mS5WNiYiS4Xo0H5MxzHa8RhbW8UbZ/wl/h/qHVkjYGthMmL5+sjNIlMIUZu7JdXbHu8uoMoTcioPcTU52EovtfJqqaUFMOwJvi2ZcsMRv7Dugezfo0Ib2ulmx+QbusMLfqSNlHOVUcfYLyb8Q8NjZtL+5Y5o/HM1/MEcK/oIE1vi13mRU3k/MdlPj+k8637mLseiSt8eaCnj+gpw3WIObFDWS5seufodLNlbxky9VfFTBcZeV4tTzO4cOGrv//jksE7o7vZLRlo4v58Qgnj/v3O34hWtO7JBcE6tgAgx9jj76LXQpe6PObpxGVH2NEQjlCPwA0h+TrdcRW7AUQ8Cp95VvNBWjm8Kz54l3y9YxvhrEasP3cwxJDeC5EnlIPn8HVX3tl0IKO5PdUyYPj4Zw97iqxIpB9OuWIWJrnPGkK0fueLCD/Nymn2DLJ5IaIHuouodtk7EXP2MFeXYT1arx2S5ezC+Fo9CNoyDFViIFhSPfY5XgiMLmG0WEqxltvHxf+DwiB3CEmz4uD2rmm+E9J36OCjCxlPGWfzRKKaPinKugq7sLioJKr2l9LlG8jhVnW/2yitenrKpfI89Q==
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aec64e9-4109-47e8-30a5-08d84d9c58cf
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2020 10:55:17.5853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGXiZP2GDPBPSbiivwiHFmGgbnAcgoBD04ehrPiP0MNePLh+H0nW/aBT6KYVE7GFD1/kpQEaRG6M28+J2WShbSBYbzrtnJ+4gkR8qHf5ChE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3220
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_065522_495044_F7F0CA95 
X-CRM114-Status: GOOD (  11.58  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 12/08/2020 17.18, Ivan Mikhaylov wrote:
> Add locks for whole macronix chip series with BP0-2 and BP0-3 bits.
> 
> Tested with mx25l51245g(BP0-3).

Hmm. I've tried adding support for locking on Macronix to U-Boot
(https://patchwork.ozlabs.org/project/uboot/patch/20200326114257.1782-3-rasmus.villemoes@prevas.dk/),
but that was quite a bit more involved than this. Note in particular the
first part of my commit message:

  Macronix chips implements locking in (power-of-two multiple of) 64K
  blocks, not as a fraction of the chip's size.

At least, that was true for the chip I was interested in and the few
others whose data sheets I grabbed to double-check. So I'm a bit
skeptical that this can work out-of-the-box without introducing a new
struct spi_nor_locking_ops.

Rasmus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
