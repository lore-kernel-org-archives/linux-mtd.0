Return-Path: <SRS0=rTSM=7C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF36EC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 14:52:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 994E52072C
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 14:52:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nZyu5tKI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=axis.com header.i=@axis.com header.b="Ts2OInR7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 994E52072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=axis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MnkL6J1mwinskmXlN/eNWsF0PxyU95L19TJY7XUZvCQ=; b=nZyu5tKI+aDpNE
	asSWK8HiV0O/y72QMlmHP/v1KPsUCmXgul3i2m1AWwHLp+XHi794aN07aIyeFBISvfGb6Wrtwo3UU
	i+4Hh+692wWWoGsU15O5jGacem+BC8+OOOaSz0Uzw8U+isbKaMPhFg7CFae7YBGJtNSjgAnNB5qEq
	ibTrGcZm3DL1FiUwYv/0hUfUrmL9Da0FIc2Fzl2vJQ89i6lLwao1kQ9VvN2uNZ3XeKpcaP2Th8Q08
	Vfh4vrtQki5EiVsJRzxZGO29FiUWdQFT5KOlsiYtGRVbK8CcNHdSFxHQbMPAxvQvATAGl+wGOBERv
	zgxqAW1IH0twEw//4UzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbQ5Z-0004Sj-22; Wed, 20 May 2020 14:52:57 +0000
Received: from smtp2.axis.com ([195.60.68.18])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbQ5W-0004Rs-JP
 for linux-mtd@lists.infradead.org; Wed, 20 May 2020 14:52:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=1413; q=dns/txt; s=axis-central1;
 t=1589986374; x=1621522374;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JTX40Y26P9qpnP3rMqxJoeus5v3Z1jbGvpoAUWsMENI=;
 b=Ts2OInR7ZwyOI7JNCLrBd4bgUfpUMtOy4N3GPlnUuxcQv+GXbop71Xy1
 Ld+6wZuR9zv4Y2bWIFmNT3Dao3cnj+Q/9kAqwiq7mgZjpp24IG0kQ2vun
 /InGfPXUB19gWXIMBa7rcYAX26cq9pARu0QYK3W+kfWmbN8k0KvseDAB2
 QajF+MqQQIeDsuLz8rDhcKOvnA6jWzp0Bv4CCTKfqZEjVr6qKYqz+vCju
 FZYbhUsoGO6IKOgGBW1x7zEIeuesMDMu4tbV48/hpbbbCdlUywthJndSK
 f+nMPR75JOYKLWPpBX52x9IYdtuz9Q+AkF2GSCZLN1N2/b6gC5yMPiwt8 w==;
IronPort-SDR: lrBym4owJ+qSuaJiEw2aubcZjO0JPOz4I6CgQ84/+7UugsUQM0wIASgh1oWlTOAsm+oYpeCLsZ
 HdZmsSemVazevDW1DQ+ATYrTLVgGqs43ljnkA7oV7fXDEWQdsBo/tOONbAhFgnHiRKBV0xWuKH
 K5MDq3bZmaZ0UrZEKXrsRJw3biYbubdcsR5r5K87tKgO/UnRkpypYzjNY7mdv01tLA4ziVIEAJ
 6jmQr7Dmbacv8IGhjkOFC3OLE5l5EiholDdjkc63W4nPCnWCt009HfhcbOQpscqn3mNJ5CQTeu
 Fgk=
X-IronPort-AV: E=Sophos;i="5.73,414,1583190000"; 
   d="scan'208";a="8681218"
From: Rickard X Andersson <Rickard.Andersson@axis.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: SV: [PATCH v2 1/2] mtd: rawnand: Add a helper for testing data
 interface
Thread-Topic: [PATCH v2 1/2] mtd: rawnand: Add a helper for testing data
 interface
Thread-Index: AQHWLqwJKaZ59bK9OUGbtdzkQ1QSh6iw3cSAgAAu71Q=
Date: Wed, 20 May 2020 14:52:52 +0000
Message-ID: <1589986371551.27178@axis.com>
References: <20200520133854.25241-1-rickaran@axis.com>,
 <20200520155529.3d959e96@xps13>
In-Reply-To: <20200520155529.3d959e96@xps13>
Accept-Language: sv-SE, en-US
Content-Language: sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_075254_965331_6CE62952 
X-CRM114-Status: UNSURE (   6.73  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

Comments on two of your comments. (I am fine with all the other comments.)

> > + =A0 =A0 /*
> > + =A0 =A0 =A0* Pass NAND_DATA_IFACE_CHECK_ONLY to only check if the
> > + =A0 =A0 =A0* controller supports the requested timings.
> > + =A0 =A0 =A0*/
> > + =A0 =A0 ret =3D chip->controller->ops->setup_data_interface(chip,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0NAND_DATA_IFACE_CHECK_ONLY,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0&chip->data_interface);
>
> Could you align these lines to the opened parenthesis?

Then the lines will have 80+ characters.

> > @@ -994,9 +1020,6 @@ static int nand_choose_data_interface(struct nand_=
chip *chip)
> > =A0 =A0 =A0 if (chip->parameters.onfi) {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 modes =3D chip->parameters.onfi->async_timi=
ng_mode;
> > =A0 =A0 =A0 } else {
> > - =A0 =A0 =A0 =A0 =A0 =A0 if (!chip->default_timing_mode)
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> > -
>
> This should not be removed

Then onfi_fill_data_interface would not be called for default_timing_mode 0=
. (In case we have called chip->ops.choose_data_interface and got an error.=
).

BR,
Rickard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
