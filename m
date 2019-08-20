Return-Path: <SRS0=j2Kw=WQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480B8C3A59D
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 16:58:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A77A2087E
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 16:58:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LYOj2f6R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A77A2087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wp/v2RBKdJrHxB0ej1rcHJfbdZ0UKebtzMi/Kkvyk88=; b=LYOj2f6RBN9kc1mhYX5+ANEfB
	/45j472VQF3xPy2ZqX+aZguVKs/v8z8fuWw0Uifuyhlh1kPUQco8aEcFAXellu6TwQW9KFnLtvhHt
	zgDLTslYGxM5DDkRTNyZ8dLDdfGt9ohfbVHt6HO28Qho9OxXqImMI0ykahuvSA7sqE4d1IA0jeAZq
	j6GsqBnfVWSGgrQTUdSyEuwtw4E6OtwWUzHd+QVvjGOTjQp3VKwo15fj0YjCvt8dxTdvkCfKMRObg
	jKWLeOuU80JXQuc5TX/Vkeq68J8SDP3b4zpSwc9EFtNs65reTFRya7nr9XpZSyQMllNs3WHKzbP+p
	yNKLEX+Hg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i07Sq-0001oM-Pz; Tue, 20 Aug 2019 16:58:32 +0000
Received: from mail-ed1-f99.google.com ([209.85.208.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i07So-0001mh-4y
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2019 16:58:31 +0000
Received: by mail-ed1-f99.google.com with SMTP id m44so7120158edd.9
 for <linux-mtd@lists.infradead.org>; Tue, 20 Aug 2019 09:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ooh6mwKy6a+QGfw+7zbwTx9DfsC355+UrHQNcQkfTs0=;
 b=adMjXSOIhuKz23dAmL5yNltmtOT2idE9eRxYPA4qf0WpTCAeFsFvlRxZEXDbfcqsdv
 etT8xyspyzG4fKVS68jq7ZBrTPoRUUNMjfJuCHMLFqSn7GaVAPZiE+HzizbdXz+XxXmY
 4YcZjfQGjBqo8ys/WBbsV3Ay23hBlTsr112pdQzJAtntrV7DpjzfDLVa7GaMvzA94Eoq
 p+l+kpTNgT9Cy8DD2KojOK05hUJnC2tXeDJbtssQMpHXDmMrNb9X1hTs3q+K+xgH5Shp
 tSOA5LxKLTcMPVVPrRcHYnAEn8loV4On6XQxgD8HrHa8k/9q9sRu5zO/48SoQjSJw0GE
 vZaw==
X-Gm-Message-State: APjAAAUSXWzS1xj5JMXu6EdWtcfFyi3ige4AqIcvpsItX3wW8fD41mmD
 zz+IPmSXxPszWydnYk0uFOLRxZw+Kh/1g3hv50h7Q1gJno+gX2Y9E/o1qS5J/LHYYg==
X-Google-Smtp-Source: APXvYqyXYDITnerApjnV3yhEXbC8CsmwtSNn7YEC7TwQ4jD0UiOEEoErm4RuMvwy8jf2prlgJYaGQRrquonj
X-Received: by 2002:a17:906:4d19:: with SMTP id
 r25mr26660999eju.125.1566320308261; 
 Tue, 20 Aug 2019 09:58:28 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id u11sm303737edq.8.2019.08.20.09.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 09:58:28 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i07Sl-0002xT-Q6; Tue, 20 Aug 2019 16:58:27 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id BB8642742ABD; Tue, 20 Aug 2019 17:58:26 +0100 (BST)
Date: Tue, 20 Aug 2019 17:58:26 +0100
From: Mark Brown <broonie@kernel.org>
To: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH] docs: mtd: Update spi nor reference driver
Message-ID: <20190820165826.GF4738@sirena.co.uk>
References: <1565107583-68506-1-git-send-email-john.garry@huawei.com>
 <6c4bb892-6cf5-af46-3ace-b333fd47ef14@huawei.com>
 <9b074db7-b95d-a081-2fba-7b2b82997332@kontron.de>
 <ab2d3c29-982f-cb13-e2a2-e6d8da8f1438@huawei.com>
 <b2a475eb-58e6-e7c7-7b8f-b1be04cf27c0@ti.com>
 <c5e063e8-5025-8206-f819-6ce5228ef0fb@huawei.com>
MIME-Version: 1.0
In-Reply-To: <c5e063e8-5025-8206-f819-6ce5228ef0fb@huawei.com>
X-Cookie: It's the thought, if any, that counts!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_095830_188530_8A0018E7 
X-CRM114-Status: GOOD (  12.68  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, "corbet@lwn.net" <corbet@lwn.net>,
 "richard@nod.at" <richard@nod.at>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
 wanghuiqiang <wanghuiqiang@huawei.com>
Content-Type: multipart/mixed; boundary="===============3099633712666912696=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3099633712666912696==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NGIwU0kFl1Z1A3An"
Content-Disposition: inline


--NGIwU0kFl1Z1A3An
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 20, 2019 at 03:09:15PM +0100, John Garry wrote:
> On 19/08/2019 05:39, Vignesh Raghavendra wrote:
> > On 16/08/19 3:50 PM, John Garry wrote:

> > > About the child spi flash devices, is the recommendation to just use
> > > PRP0001 HID and "jedec,spi-nor" compatible?

> > I am not quite familiar with ACPI systems, but child flash device should
> > use "jedec,spi-nor" as compatible.

> Right, so to use SPI MEM framework, it looks like I will have to use PRP0001
> and "jedec,spi-nor" as compatible.

> My reluctance in using PRP0001 and compatible "jedec,spi-nor" is how other
> OS can understand this.

Last I heard Windows wasn't doing anything with PRP0001 but on the other
hand the idiomatic way to handle this for ACPI is as far as I can tell
to have what is essentially a board file loaded based on DMI information
without any real enumerability so there's no real conflict between the
two methods.

--NGIwU0kFl1Z1A3An
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1cJrEACgkQJNaLcl1U
h9CKegf/diFxbL9O/cQMcq2uRUNMNl4gLgGHjuKME4Zo+1sQkFrJNR27rNlGsAh2
mulo2giJlmEzVN1m+nQouojKPegOQjt42Oj8UDF1XOg9LKisfrXp4JMQ7mmQ2Joh
B37OCYGAZPzjJk6MpPwRGUD94v/BE9H6Ma5cqdL+HKTx4dIgMMdvszTG7gwsGDoP
S+BjjyCx/Y/qByOr0w4VxAuMYo/D43tfzvIgcE1YnhPtnkPBIDx7qUa0gWEWVqjF
q8AqdEPcJyLL3Wu+8OBPFdFRWlbjXtLwoCXy+nsC9285sqc8uF+ppJ9UyFP3FgFW
J5/itNaPyZUXNmFPziim/nbgI43BTQ==
=Hh41
-----END PGP SIGNATURE-----

--NGIwU0kFl1Z1A3An--


--===============3099633712666912696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3099633712666912696==--

