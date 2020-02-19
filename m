Return-Path: <SRS0=2g81=4H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D99C34047
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2020 11:36:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9A40206DB
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2020 11:36:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iUU8iVJI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="KTWi+zQm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9A40206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version
	:References:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0jbclg6Df0wilVF0kJWKyJ7uO3xzjW9B/jW3W+vHi7w=; b=iUU8iVJI7uKP3U
	4lgzrUy2a6JffkBu+UauQxSmD6UcXWorzV3eYMHXH1C75yKLzv04fmzJPO5AyttSRigA7PiZo2+SQ
	ZvHlRbEau4mXba3gkHTAlHxcwLYCAW7M2H2aZiGHPbne8PhLlFX6FoPRkyUnIF1NzVH0S1f/9DLoh
	2pKAzFS6+MGArb3WcBVSpGALxyS1pLzSjSznZHwXXRjqRe6CENRDIa8Tw1DIp7Fj4vdN9VzMTlT5K
	YNVwso6GXcZ8EtHQUiuDkuV1x8qNoCiiVtPb4IED4Zxy5cg5FsEwDgZdc/uG9e2kGCNkgGk4mVAYt
	IYQ5jIqLX/3k7zg4edYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4NeN-0006pI-Aw; Wed, 19 Feb 2020 11:36:19 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4NeK-0006ox-HJ
 for linux-mtd@lists.infradead.org; Wed, 19 Feb 2020 11:36:17 +0000
Received: from [100.102.76.69] (ip-109-40-129-85.web.vodafone.de
 [109.40.129.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 6940522F53;
 Wed, 19 Feb 2020 12:36:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1582112174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+2UBOSg9bwQujgs444m0R61oiGSTcYy60LtMHyWRhfY=;
 b=KTWi+zQmZDhvZctSGPS0Zp3Bh7Q22gMQkL7c/BJuenDOnTS7wSDN6QeV4/F4iUb2Ao/Ett
 LCC9vslJ5G2j0B9l0z9wMI1ynvcTlaHFRmHf5TNn5MwKJJ3g6Sj6trlXEsBXnDAP4vjmC5
 AFFHxfsAtqtuEvED2V6IL8pCi/AKo18=
Date: Wed, 19 Feb 2020 12:36:11 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <3cb7988378ebe79ae0fc82d89de661177f121e60.camel@samsung.com>
References: <20200113055907.9029-2-js07.lee@samsung.com>
 <4000296.ZurDTCRVlM@localhost.localdomain>
 <23efafdb8c439838338eef421e341f4a@walle.cc>
 <CGME20200210112615epcas1p1c838e38a519a3f3e390bfc51d4db1d3b@epcas1p1.samsung.com>
 <132665276.5Rxbr4LpEM@localhost.localdomain>
 <ed9ae10ab3be4da90779cb6f8d6c6cf1e9fbc968.camel@samsung.com>
 <1dea94d182249f9640e2cfb2f7ef402a@walle.cc>
 <3cb7988378ebe79ae0fc82d89de661177f121e60.camel@samsung.com>
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
To: Jungseung Lee <js07.lee@samsung.com>
From: Michael Walle <michael@walle.cc>
Message-ID: <7CA8860D-BFCD-4317-82CD-30A5CB55E1B3@walle.cc>
X-Spamd-Bar: +
X-Rspamd-Server: web
X-Rspamd-Queue-Id: 6940522F53
X-Spamd-Result: default: False [1.40 / 15.00]; MID_RHS_MATCH_FROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; RCPT_COUNT_FIVE(0.00)[6];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; DKIM_SIGNED(0.00)[];
 NEURAL_HAM(-0.00)[-0.844]; RCVD_COUNT_ZERO(0.00)[0];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:3209, ipnet:109.40.0.0/13, country:DE];
 FREEMAIL_CC(0.00)[microchip.com,ti.com,gmail.com,lists.infradead.org,samsung.com];
 SUSPICIOUS_RECIPS(1.50)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_033616_722480_DAEBCA1E 
X-CRM114-Status: GOOD (  11.11  )
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
Cc: js07.lee@samsung.com, js07.lee@gmail.com, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, Tudor.Ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 19. Februar 2020 12:23:24 MEZ schrieb Jungseung Lee <js07.lee@samsung.com>:
>Hi,
>
>2020-02-19 (Wed), 12:08 +0100, Michael Walle:
>> Am 2020-02-19 11:50, schrieb Jungseung Lee:
>> > Hi, Tudor and all
>> > 
>> > 2020-02-10 (Mon), 11:26 +0000, Tudor.Ambarus@microchip.com:
>> > We could also find a few flashes that does not following the
>> > overall
>> > logic. For example, "en25qh256" and "en25qh16" which was
>> > manufactured
>> > by EON. They are always following way (2) no matter what the number
>> > of
>> > slot is. It seems that it could be handled like below with custom
>> > hook
>> > later.
>> 
>> For these two flashes, BP3 is just the TB bit. So it should already
>> work 
>> with the current logic.
>> 
>
>Refer to what I mentioned before in the mail I talked with you.
>
>>>It is mixed. Let's compare "en25qh128" from EON with "w25q128jv" from
>>>Winbond. They have the same capacity(128MBit) and also supporting
>>>3bit
>>>block protection. (Note that the named BP3 bit of "en25qh128" is
>>>working exactly same with T/B bit.)
>
>>>"en25qh128" is following (2) and "w25q128jv" is following (1). It
>>>seems
>>>impossible to distinguish them by the flash size or the number of
>>>protection bits. 

Oh, correct. but why should it then be a problem? Its like all, the other flashes.

-michael 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
