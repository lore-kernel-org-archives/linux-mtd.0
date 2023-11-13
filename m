Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FAFC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Nov 2023 16:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OMaFsC3MAf1vJ+eBQ7RGHeIyWMlttKPehBvPnXc3hvI=; b=llgHrFTl9dK8AB
	H14j3+p3TwbSHW52CWi1QPWshsILqAYGxW/LCNtrbD2JA3b0V+DYUzRhMfI7fKEQivPG39HmKMMDw
	Lb6wqswt87WxfEp0HWA/DEof3hiH00E7I79MI8u7LIHuyhNs4ZJfdCxU0DnTNq76ui37eMdC1kgea
	/91UniiQulOBXkVKPBItgfYlobujYVOjIvcXo1STuk/Ly+Nj4kjqTdqgBHpw5QOybPjv62pWwv76o
	wjfv1r32sbo035iqbvyUaR1pqAmT8D5Dc32hcsbwCz9ym/ijSeDclBBhAfrlJmWwXheZcYgFzqOHz
	KiRgVdYRt3Msq6UzUxTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ZhB-00EJyB-2B;
	Mon, 13 Nov 2023 16:21:53 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Zh9-00EJwP-15
	for linux-mtd@lists.infradead.org;
	Mon, 13 Nov 2023 16:21:52 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-32d81864e3fso2690622f8f.2
        for <linux-mtd@lists.infradead.org>; Mon, 13 Nov 2023 08:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699892507; x=1700497307; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6isXPs0sflYE9m4fOOkPNOo14+5QhUVptrDTcdlr+qo=;
        b=hkZNk1QXj1rLirh7cgo5VLNPgCMIanaNtQeDUdWSYB7NHPUKgG0jFfBc+Uqvdgw514
         zAU8Bzi6L60TO5M1qKhYclhzfFxoLHpF7EcLAta5wyU8mh926en8S8/rG2WMi9G3fz+i
         prubNJywy+ARiR/SGspT8NPcJmE7lCtX4FAeJgk973+zA9sWlo+ftCSU9d2yaG+N5hOl
         VqA2N8cYejGwV4XWXoO+5E9Bzme5TWldaX3PCO9dh93Z5dU81rU1Ky39TaOGuJhk8Twy
         ithCl53xxtHZbdq3pY1FQF7YCsJ8SZXIFSMjlCeNorCvUGvUzhf0jAtwt1UQqmjoj3vc
         ugWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699892507; x=1700497307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6isXPs0sflYE9m4fOOkPNOo14+5QhUVptrDTcdlr+qo=;
        b=somRgqIylNFVV5cmgvlyQRxHO8UrpiRmNBs0VZ7X7bhiU4f/WVTijVL2CIlEjApHwc
         duXrr/PZ0RuXoGV5phepz1oq0GBAjTLHZSoAdfVAyu63b7jBhCQjLYwS/2CE7D7uAtPE
         tSNnYPBi+ugJ/jdCw5pfIehsaJVPFUU9/jo4cHkAcBEQpo+hlePOeD3msaMiJ8MXFSBH
         XPZ9Y0ciQR2/MHr9BYPQnqOdwziUD5BKAhZhDnv+IrE7KeTCdrCFdKoWQ/UWZZzepAcn
         C5zP1HqWcRNRq/6y4nqVNZa91IhtacrpObifgGKknGAGIDzay0NvTbBe87GB3R89B8hR
         L8sQ==
X-Gm-Message-State: AOJu0YxQkgcff9lCmD9tZt5P2wfWZ7VyTUsKo5raj0k7UWNGWQVwSwfI
	S+lUdic/hrn+Lsml50WXbehqiDabnLa3nIud2wPp2QCBoqE=
X-Google-Smtp-Source: AGHT+IGH5cy4DsubHL/XylXgpUblwWeL3F6iuwanO8ohcoJVAu0Bwf3MZeyChqUcj8ZiHZaht5eLzm3V9SNQ3bWEDPg=
X-Received: by 2002:adf:e64b:0:b0:32d:b551:3fb8 with SMTP id
 b11-20020adfe64b000000b0032db5513fb8mr3662969wrn.62.1699892507347; Mon, 13
 Nov 2023 08:21:47 -0800 (PST)
MIME-Version: 1.0
References: <20231113131634.614467-1-debug.penguin32@gmail.com>
 <20231113160751.620810-1-debug.penguin32@gmail.com> <ZVJLhbvXSbmnEfwb@smile.fi.intel.com>
In-Reply-To: <ZVJLhbvXSbmnEfwb@smile.fi.intel.com>
From: Ronald Monthero <debug.penguin32@gmail.com>
Date: Tue, 14 Nov 2023 02:21:35 +1000
Message-ID: <CALk6Uxo-Ojc8U7b5wDUJMA-uY1MeXqLBRXSrt6YeSwMnRkhy1w@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: Increment IFC_TIMEOUT_MSECS for nand
 controller response
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de, 
	martin.blumenstingl@googlemail.com, paul@crapouillou.net, robh@kernel.org, 
	u.kleine-koenig@pengutronix.de, AVKrasnov@sberdevices.ru, 
	r.czerwinski@pengutronix.de, jaimeliao.tw@gmail.com, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_082151_372904_BC302227 
X-CRM114-Status: GOOD (  10.26  )
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

T24gVHVlLCBOb3YgMTQsIDIwMjMgYXQgMjoxNeKAr0FNIEFuZHkgU2hldmNoZW5rbwo8YW5kcml5
LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgTm92IDE0LCAy
MDIzIGF0IDAyOjA3OjQ5QU0gKzEwMDAsIFJvbmFsZCBNb250aGVybyB3cm90ZToKPgo+IEknbSBu
b3Qgc3VyZSBpZiBpdCdzIGEgZHVwIGVtYWlsIG9mIHRoZSBwcmV2aW91c2x5IHNlbnQgdjIuIElu
IGFueSBjYXNlIEkgaGF2ZQo+IGNvbW1lbnRlZCBvbiB2MSBhbmQgdjIsIHBsZWFzZSBjb25zaWRl
ciBhZGRyZXNzaW5nIHRoZW0uCj4KPiAtLQo+IFdpdGggQmVzdCBSZWdhcmRzLAo+IEFuZHkgU2hl
dmNoZW5rbwo+Cj4KCkFuZHkgamZ5aSwgdGhlIDIgZW1haWxzIG9mIHYyIGFyZSB0aGUgc2FtZSBl
eGNlcHQgdGhhdCB0aGUgbGF0dGVyIGhhcwp0aGUgc3RhYmxlIHRhZywgd2hpY2ggd2FzIG1pc3Nl
ZC4KSSB3aWxsIGFkZHJlc3MgdGhlIHJldmlldyBjb21tZW50cyBhbmQgc2VuZCBpdC4KCkJSLApS
b24KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
