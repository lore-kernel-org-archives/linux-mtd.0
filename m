Return-Path: <SRS0=y1SG=VW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D58F6C7618B
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 16:18:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8CD5218F0
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 16:18:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ABip2cv0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8CD5218F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eckelmann.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HPJmN7bRrjd1IR7oWugjczwxBQ3xfn9EAqXQxX619Vo=; b=ABip2cv0/Dlqdc
	VMMoBM3rABJNiUMaIaKqGq1LK9BH2DBdoY+iPFw46NxVxC7tzit/oU2sdRSMu2qeBXoQQhcSblY7v
	v0col39H3fSBHT2g5hC7ULADSbOLRlC1BlzjvjLmcdTZ7c05bwnVAla5WgHzkLsqQ3avYzHHWbUKN
	KXTvQgZEpsI1zI3bO6Fhjhb/EYA8RtCMGuoTebYnurV59UiFdfAgH9IP/wrxEQTQL36P309Z1suzH
	VAa042SOeb5EFprHoFW3ey0iC1l6fgbPu55SGNXjOqrs8SOituMvSO8g4hs3akis+jZAwzZrxBtXl
	H/hgGgqRXGoiU0wa3c5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqgRl-0007zs-Uz; Thu, 25 Jul 2019 16:18:26 +0000
Received: from mail.delivery-51-eu-central-1.prod.hydra.sophos.com
 ([35.159.27.143])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqgRh-0007zL-32
 for linux-mtd@lists.infradead.org; Thu, 25 Jul 2019 16:18:22 +0000
Received: from ip-172-20-1-61.eu-central-1.compute.internal
 (ip-172-20-1-61.eu-central-1.compute.internal [127.0.0.1])
 by mail.delivery-51-eu-central-1.prod.hydra.sophos.com (Postfix) with ESMTP id
 45vcp02DdjzHnHY
 for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2019 16:18:16 +0000 (UTC)
X-Sophos-Email-ID: 8e3e8cc1d58c432295f8d1c1fc138578
X-Sophos-TLS-Probe: SUCCESS
Received: from smtp.eckelmann.de (smtp.eckelmann.de [217.19.183.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by relay-eu-central-1.prod.hydra.sophos.com (Postfix) with ESMTPS id
 45vcnn4s0qzRhXn
 for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2019 16:18:05 +0000 (UTC)
Received: from EX-SRV1.eckelmann.group (2a00:1f08:4007:e035:172:18:35:4) by
 EX-SRV2.eckelmann.group (2a00:1f08:4007:e035:172:18:35:5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Thu, 25 Jul 2019 18:18:05 +0200
Received: from EX-SRV1.eckelmann.group ([fe80::250:56ff:fe8b:faa6]) by
 EX-SRV1.eckelmann.group ([fe80::250:56ff:fe8b:faa6%3]) with mapi id
 15.01.1591.017; Thu, 25 Jul 2019 18:18:05 +0200
From: "Mainz, Roland" <R.Mainz@eckelmann.de>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Does a chattr -c/+c on ubifs automagically compress/uncompress all
 blocks of an inode ?
Thread-Topic: Does a chattr -c/+c on ubifs automagically compress/uncompress
 all blocks of an inode ?
Thread-Index: AQHVQwSJu4Ttn1nf7kSKa7Z1RxEikQ==
Date: Thu, 25 Jul 2019 16:18:05 +0000
Message-ID: <1c8ba7bc90fa4695be180e106309819d@eckelmann.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a00:1f08:4007:f224:172:18:224:13]
MIME-Version: 1.0
X-LASED-Pver: 0000002
X-Sophos-Email: [eu-central-1] Antispam-Engine: 3.1.5,
 AntispamData: 2019.7.25.155716
X-LASED-SpamProbabilty: 0.079439
X-LASED-Hits: BODYTEXTP_SIZE_3000_LESS 0.000000, BODY_SIZE_1000_LESS 0.000000, 
 BODY_SIZE_2000_LESS 0.000000, BODY_SIZE_400_499 0.000000,
 BODY_SIZE_5000_LESS 0.000000, BODY_SIZE_7000_LESS 0.000000,
 HTML_00_01 0.050000, HTML_00_10 0.050000, NO_URI_HTTPS 0.000000,
 OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000, WEBMAIL_SOURCE 0.000000,
 __ANY_URI 0.000000, __BODY_NO_MAILTO 0.000000, __BUSINESS_SIGNATURE 0.000000, 
 __CT 0.000000, __CTE 0.000000, __CT_TEXT_PLAIN 0.000000, __HAS_FROM 0.000000, 
 __HAS_MSGID 0.000000, __HAS_XOIP 0.000000, __MIME_TEXT_ONLY 0.000000,
 __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000, __MIME_VERSION 0.000000,
 __MSGID_32HEX 0.000000, __NO_HTML_TAG_RAW 0.000000, __SANE_MSGID 0.000000,
 __TO_MALFORMED_2 0.000000, __TO_NAME 0.000000, __TO_NO_NAME 0.000000,
 __URI_NO_WWW 0.000000, __URI_NS 0.000000
X-LASED-Authed: 1
X-LASED-Spam: NonSpam
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_091821_359687_5D1DEF53 
X-CRM114-Status: UNSURE (   4.62  )
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



Hi!

----

Does a chattr -c/+c automagically compress/uncompress all blocks of an inod=
e in ubifs, or will the change only affect newly written or updated blocks ?

----

Bye,
Roland
-- =

 Roland Mainz, MAA/CAS
 Eckelmann AG, Berliner Str. 161, 65205 Wiesbaden
 Telefon +49/611/7103-661, Fax +49/611/7103-133
 r.mainz@eckelmann.de
 =

 Eckelmann Group =96 Source of inspiration
 =

 =

  =

 =

    =

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
