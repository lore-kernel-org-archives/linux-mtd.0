Return-Path: <SRS0=y1SG=VW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC5AC7618B
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 13:48:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E338722BEF
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 13:48:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EZfoTJKX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E338722BEF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eckelmann.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PRAnbVJJCuxmAoWyTX8fnCZWmYUMdbHJBTAyjVm5K2o=; b=EZfoTJKXc4mi8L
	5cZZU5uSshjHtPARTQcZSOZ4JuLpnCVKMbtMIpm4N+w1ginPTeQEkb1zuLnr/i4pJrRMD4s2cSBQJ
	7/XD0ouXZxpLFOeq5g5qQkXdnINOKJks0KjSDwnbFWN1so/lYJfr+JwpnyzujMTfGkQfHmVnJdXwS
	0wzV3gWg9gkRzVqngfXqVXlxi7/ezASU90bJcJJr5ERSVgQELw7B/t0vIuefVUwi29I2xmkQWzBhF
	DJeG2LAIwueMcCIWNPdsLiA28GkJC0umpvLehT50VccqwVntmjHfPOttCrnoNCOt52IrRPPgqaQWa
	GEcgcy//EbL9AEwksWDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqe63-0003Xs-CN; Thu, 25 Jul 2019 13:47:51 +0000
Received: from mail.delivery-59-eu-central-1.prod.hydra.sophos.com
 ([35.159.27.150])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqe5y-0003WL-Dx
 for linux-mtd@lists.infradead.org; Thu, 25 Jul 2019 13:47:49 +0000
Received: from ip-172-20-0-46.eu-central-1.compute.internal
 (ip-172-20-0-46.eu-central-1.compute.internal [127.0.0.1])
 by mail.delivery-59-eu-central-1.prod.hydra.sophos.com (Postfix) with ESMTP id
 45vYSG1KSBzFpVT
 for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2019 13:47:42 +0000 (UTC)
X-Sophos-Email-ID: d8ebc45aaae84b6799d0d65c7d831f7b
X-Sophos-TLS-Probe: SUCCESS
Received: from smtp.eckelmann.de (smtp.eckelmann.de [217.19.183.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by relay-eu-central-1.prod.hydra.sophos.com (Postfix) with ESMTPS id
 45vYS35Y1MzgYDx
 for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2019 13:47:31 +0000 (UTC)
Received: from EX-SRV1.eckelmann.group (2a00:1f08:4007:e035:172:18:35:4) by
 EX-SRV2.eckelmann.group (2a00:1f08:4007:e035:172:18:35:5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Thu, 25 Jul 2019 15:47:30 +0200
Received: from EX-SRV1.eckelmann.group ([fe80::250:56ff:fe8b:faa6]) by
 EX-SRV1.eckelmann.group ([fe80::250:56ff:fe8b:faa6%3]) with mapi id
 15.01.1591.017; Thu, 25 Jul 2019 15:47:30 +0200
From: "Mainz, Roland" <R.Mainz@eckelmann.de>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: ubsfs scrubbing ?
Thread-Topic: ubsfs scrubbing ?
Thread-Index: AQHVQu9MK95b/s+0xk2i2/lN4ArN3A==
Date: Thu, 25 Jul 2019 13:47:30 +0000
Message-ID: <e42672a6e383438ba32b61da1dbd70c7@eckelmann.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a00:1f08:4007:f224:172:18:224:13]
MIME-Version: 1.0
X-LASED-Pver: 0000002
X-Sophos-Email: [eu-central-1] Antispam-Engine: 3.1.5,
 AntispamData: 2019.7.25.133916
X-LASED-SpamProbabilty: 0.079439
X-LASED-Hits: BODYTEXTP_SIZE_3000_LESS 0.000000,
 BODYTEXTP_SIZE_400_LESS 0.000000, BODY_SIZE_1000_LESS 0.000000,
 BODY_SIZE_2000_LESS 0.000000, BODY_SIZE_300_399 0.000000,
 BODY_SIZE_5000_LESS 0.000000, BODY_SIZE_7000_LESS 0.000000,
 HTML_00_01 0.050000, HTML_00_10 0.050000, NO_URI_HTTPS 0.000000,
 OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000, WEBMAIL_SOURCE 0.000000,
 __ANY_URI 0.000000, __BODY_NO_MAILTO 0.000000, __BUSINESS_SIGNATURE 0.000000, 
 __CC_NAME 0.000000, __CC_NAME_DIFF_FROM_ACC 0.000000, __CC_REAL_NAMES 0.000000,
 __CT 0.000000, __CTE 0.000000, __CT_TEXT_PLAIN 0.000000,
 __FROM_DOMAIN_IN_ANY_CC1 0.000000, __FROM_DOMAIN_IN_RCPT 0.000000,
 __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000, __HAS_MSGID 0.000000,
 __HAS_XOIP 0.000000, __MIME_TEXT_ONLY 0.000000, __MIME_TEXT_P 0.000000,
 __MIME_TEXT_P1 0.000000, __MIME_VERSION 0.000000, __MSGID_32HEX 0.000000,
 __NO_HTML_TAG_RAW 0.000000, __SANE_MSGID 0.000000, __SUBJ_ALPHA_START 0.000000,
 __TO_MALFORMED_2 0.000000, __TO_NAME 0.000000, __TO_NO_NAME 0.000000,
 __URI_NO_WWW 0.000000, __URI_NS 0.000000
X-LASED-Authed: 1
X-LASED-Spam: NonSpam
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_064746_608285_555E9C25 
X-CRM114-Status: UNSURE (   5.15  )
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
Cc: "Mainz, Roland" <R.Mainz@eckelmann.de>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi!

----

Is there a tool to scrub an ubifs filesystem, i.e. that data are read, veri=
fied and then written to a new block/leb ?

----

Bye,
Roland =

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
