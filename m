Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1DDC4167B
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Nov 2023 02:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7V/sGICfWCIqY8FdlyKTQdkyqoQ6KxaJ2As5nAqMSKg=; b=YVpaNnqZI2aIq8
	YAC4Y+Oq2DBMBqyvwh+0UyiomhcizLG6sK0InSTxv3O75jAhuzaGdcvPA4vkXpmzBiE6iWV7HUPLL
	i773lDBEAatlGqZXjFqjRp+iBgdd7sp+8jhY5/4GlTYSFCc0Q4y/Ip/KGVZAf2ouAk6FmQ2pLLsXV
	DNlBhbwpCjgHZAc6UbTDKTqJ7kGbS1em6B7ekaB6ofsFi894cbHlFirAHDyeXdmjT1JKMugNV5inT
	Tghp4JWvKj0ZvcLPgT9ytjoLCjQ6wse6SBZ1/Yxlw+Gg3FOe4YKtbsiXC29iUcGPiSlX/6mREd8W7
	2iaZXXl9n7gWUcGmShfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8WmZ-009kIy-14;
	Thu, 30 Nov 2023 02:28:03 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8WmW-009kH1-1l
	for linux-mtd@lists.infradead.org;
	Thu, 30 Nov 2023 02:28:02 +0000
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com [209.85.219.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5D13840331
	for <linux-mtd@lists.infradead.org>; Thu, 30 Nov 2023 02:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701311274;
	bh=51BH6r3NTeuU80Og8+pDQ4LBdHK0XIdfBAWZqxE/rY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=MFGT5+94azVu+ZD9jURjKAOqcrtDbJUr/osgUa3AX2upsm2sP4LsffbqDJBfDynTN
	 zkEvRBRkq3mfeGnHqypd44Qo2ZXqtyYQ0+a3mOAC5fVMhcfPwqgSNfH9VYueJCHFXq
	 9Q2ZT+O973eRHdkAScz06BHbLhawiFBVoSaywzRMF9Tz5MXkzwLAXIWFwt7k2SJ1C/
	 0uuVvghkvwmtyDljphTwBqP+2UGWPiQmkPgYVnCLmMsKXp+MPTM7Gz64XWMGRSE7Oh
	 sJRQ2ynGOmCFcfF6uWo/xuqKcA0yCfCqSqA0swpJUM2HXuEmTTZvVEk4yDp0LG3SoE
	 0NmqWgXvpMX2w==
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-da03c5ae220so1421448276.1
        for <linux-mtd@lists.infradead.org>; Wed, 29 Nov 2023 18:27:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701311272; x=1701916072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51BH6r3NTeuU80Og8+pDQ4LBdHK0XIdfBAWZqxE/rY8=;
        b=QBmpf56CjRtmgmToKlKDcBNjhScQc0CfF1owgscZeSLIOELDWOGhN3k1oR8HsnelV0
         a4SMLEfzqiu7PXqzEQp0gcl2X4S7jywSb3hMMFj44A4tT60hRjJaHl7GepVNWazvXCv0
         yj/oszjwqoK1NhiYE25tta4yqQhTp8fOo9LH/Dn/hljvdM4HQ7gj57R2MGj3+JQ87ta6
         Rf+kQmbmqJ0E3h1zeTVrYP6pYRBCujN+c3wKCBDaVRukukWLEJ4Y+90JlcyBYxiRPt6T
         FBohPrPq2gy/NHIz4oW28iKKX4GRlnnXZTlBOT8i6AyY92ZWskv8kaeSAVevnWmmSQTd
         X7Kw==
X-Gm-Message-State: AOJu0YyaK140NrOi3ZmGXhjYfqoqE3wZsP0yppwRFcjw7HsZ6XfrcQVU
	qEDHidNDBucLPFH5LdGyM4WhNwNLrZBjfRz1rC5p5GAkCK5WuBjf9TgVJ1yxGdIk2frGbiRL/0y
	SPgrybez6fiCaxgRCrly+CE9WlX/2KCU4Pwu4GDQ2CkoVPm49OEfa8pvDw0I=
X-Received: by 2002:a25:75d7:0:b0:db3:fa4e:5b80 with SMTP id q206-20020a2575d7000000b00db3fa4e5b80mr19047538ybc.20.1701311272348;
        Wed, 29 Nov 2023 18:27:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFU+/+cZbTSn4ReKApKLD82OGBkDM2LrmtNnHt3yCLXIOaJ5oVUUQwfztQHQlCy4aFlUeyNvfUi8DlF3WBb+EM=
X-Received: by 2002:a25:75d7:0:b0:db3:fa4e:5b80 with SMTP id
 q206-20020a2575d7000000b00db3fa4e5b80mr19047524ybc.20.1701311272067; Wed, 29
 Nov 2023 18:27:52 -0800 (PST)
MIME-Version: 1.0
References: <20231129064311.272422-1-acelan.kao@canonical.com>
 <20231129064311.272422-2-acelan.kao@canonical.com> <9c97e28e-fbb8-4a7f-8205-821fcbd579f6@linaro.org>
 <2e88fbd7-64ac-41a1-8368-edd430e86e6c@sirena.org.uk>
In-Reply-To: <2e88fbd7-64ac-41a1-8368-edd430e86e6c@sirena.org.uk>
From: AceLan Kao <acelan.kao@canonical.com>
Date: Thu, 30 Nov 2023 10:27:40 +0800
Message-ID: <CAFv23Qk6Qpxu+ROou5Uzdwu_0jSF-EYZPHynUps_5GOAakuJvQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] mtd: spi-nor: Stop reporting warning message when
 soft reset is not suported
To: Mark Brown <broonie@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Dhruva Gole <d-gole@ti.com>, 
	linux-mtd@lists.infradead.org, Kamal Dasu <kamal.dasu@broadcom.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Mario Kicherer <dev@kicherer.org>, Chuanhong Guo <gch981213@gmail.com>, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_182800_927181_32275566 
X-CRM114-Status: GOOD (  13.18  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPiDmlrwgMjAyM+W5tDEx5pyIMzDml6Ug6YCx
5ZubIOS4iuWNiDU6MTnlr6vpgZPvvJoKPgo+IE9uIFdlZCwgTm92IDI5LCAyMDIzIGF0IDA3OjQ2
OjAyQU0gKzAwMDAsIFR1ZG9yIEFtYmFydXMgd3JvdGU6Cj4KPiA+IFlvdSBoYXZlbid0IHNwZWNp
ZmllZCB3aG8gc2hhbGwgdGFrZSB0aGVzZSBwYXRjaGVzLiBJcyBpdCBmaW5lIGZvciB5b3UKPiA+
IGlmIEkgdGFrZSBqdXN0IHRoZSBTUEkgTk9SIGJpdHM/IElmIHlvdSB3YW50IE1hcmsgdG8gcXVl
dWUgYm90aDoKPgo+IEkgY2FuIGNlcnRhaW5seSB0YWtlIGJvdGguICBJIGd1ZXNzIHRoZXJlJ3Mg
bm8gYnVpbGQgdGltZSBkZXBlbmRlbmN5IHNvCj4gd2UgY291bGQgZWFjaCB0YWtlIHRoZSBzdWJz
eXN0ZW0gc3BlY2lmaWMgcGF0Y2gsIHRob3VnaCB0aGVyZSdkIGJlIHNvbWUKPiBiaXNlY3Rpb24g
ZHJpZnQgaWYgdGhhdCBoYXBwZW5zPwpIaSBNYXJrLAoKSXQnZCBiZSBiZXR0ZXIgaWYgeW91IGNv
dWxkIHRha2UgYm90aCBvZiB0aGVtLgpUaGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
