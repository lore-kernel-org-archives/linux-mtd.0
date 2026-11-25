Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5915C606A31E
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 18:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FH4g76Cg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HnGmMwwT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LasuVOY4OLoK4o7G6nZrpcZTIvYNXU/QqE45t1H5V6M=; b=FH4g76Cg4Y34ewJmx7lQhyIVfr
	4kHrmkHkeJe3MTSISCVVE6L1c6FmxxvJglFjmTIclwWoWuCeNTB81CVQJ72EUwuS7/rtyGDuNL0FW
	a18CgjQfT4GbILazrpdvRTaI90GpPQsyadtcZh4u35o31FEBtTqK4vecDq4Ysniox4DontOn4HECx
	eYYZX7i9754hdbEaBZaK4FspSgULRtziKAHK1DwLRXi8oBcZ3hVbyejb1/f+7TfXcLl9kEnAiYVgZ
	+X+zwoHbmDiCj0Oj4YJHSkfLV9YCK6FMzZKczSZVk5wx9hwKeBc+9WjRqM+gUrQJutPE0BYptK/4N
	Tk/fHBww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHu0-0000000B2CC-2pgB;
	Wed, 25 Nov 2026 18:39:32 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHtx-0000000B2Bh-245F
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 18:39:30 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5c15956ce07so5687535e87.0
        for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2026 10:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795631967; x=1796236767; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qrWO10HzV0M7DzaG2wh5D1Meq1mD1jI27J97rru23Fs=;
        b=HnGmMwwTxLesg3Vf8NBIePcEtUBjx65YVBWct+HQRvltaLYsOWcWlyv/2Dhckqvws8
         oGKU/J87fWiVLjGdL0mv+Jcirt77sE7NrPAkp7CfiDj4VB0a2B50zMc3Wy1TodQo6N8D
         yBFklms+P07Z9t9+jR4C+z0i7udZraNJDkMHh9fr6l1MO46FtB4Os0RbKq+FnhFF8tmF
         9lYutWR7dUqVRCkQrVlNTQASlXrrZS5VXF6yuPby8/dVuEHQHX4l4MSthKxKDilixTga
         Tw3JUQOKTOwN0bK7dZxzxiSxYaH34V1BgCQD9Y7oFcOWXTvpOCoH9ehHKEhb8dpqxgRX
         tDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631967; x=1796236767;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qrWO10HzV0M7DzaG2wh5D1Meq1mD1jI27J97rru23Fs=;
        b=pg91uKI55ixoNp5gLZMZhrxaZVKRfcIkaru399RyvA08gqa499nETZQoUgl4o4U0Oj
         OXpWDZeVbt8j9wO/qFuPNF8I8bfekWlryAVbthrn8DZre+7O7qNUm0Ugp0Pe51hitISd
         X++3yvV/Voh4qtCOH7pDZT4ugfUjjEMTfwKbRkJVQlSXiRmT8gsRgLyLpLYACLravVWw
         fV20wDdWapcLZCqysbhqY0kKEhebGvJfROg4Idn6QyDve10yLhHXCl3Jn3YrFkutRdiq
         Vpvw8g1FbOxlJBOO3m94kIgrFrkvcGu3Lhg083IocW1hdX9kS2XokkwdtqWBwwXwAFSe
         S5cg==
X-Forwarded-Encrypted: i=1; AL+hErGWJe1oQ/gkyIO8I05XdiNDtyzlvxhOraY2GTWDIutrGuoi/1+00s/rd8p+8Hb2+JdIDam7yWxeLaI=@lists.infradead.org
X-Gm-Message-State: APuU4Z87o/iCwxu5CvnDiLDqxu5Lkt8j3nruqWMM5qYIExUijdlEMIa3
	sxFNuGelwF0gKgOyB4MNLA3VXr//9eEo9VwikrLTP+gKpNHKwn5lcusv
X-Gm-Gg: AZFdTZct4FzoXtJYmQgKZqoN4tsrTR+163LfwOi0Z+9kYwnJNYWIGn+lkOrKaLtvzXs
	8fuUmJkvhuis99TBqhrKOrWj9xjD56b1HWYtegw9yIt6ATJMssf/cLkqXz3nIO3y4AcvI+GAvKG
	LDVBr/IjZ46GWsbe4HrJ+Oq6j/4xUHyUliqZhqeWRblP0nwSZ/FJw6OXvwfRYRhByZGP0ATRNwi
	McoDwjqRyMH1Ge8QflKZSTFzXzpAk4Fv++J1Ic5ZRANA/qH2zYFarSZ+922INcqjOTmmqnAlQZl
	md9HKWSnxyDEc/LdKdEP49TDYRW0Qdc8ybCUwwTgFqQ5W0hxlW09WsOClfyGtvFx2gXXqXLllzw
	D9vKrs0LkIAqf7Hg9tzENsHv6YJA2ewNsqfwbSCtMxqIqb0HKXiza9CZo4/qJIANFljSeD9+DhQ
	wO2nTaT23JJRHt690K/cwCc0orJHL9wO7IIRq1NQboCCmNmWTjPeg1VSyzE0GFQBwHJwnkmjXKf
	RTALc11ZlT8jcvKITBV36IGg5JkmydQCd1kQh2s9UQlRoLiD6/xkO9MQP7KqsKEP7/CDkWQNXVw
	gioa8zvGGoaSI3pgHLIXubjudnAfleyDMx4UYbDA23Lm92UpLholv9A=
X-Received: by 2002:a05:6512:2509:b0:5bf:ce43:979b with SMTP id 2adb3069b0e04-5c1b7c0725bmr5141409e87.21.1795631966994;
        Wed, 25 Nov 2026 10:39:26 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae804ee57dsm45217441fa.7.2026.11.25.10.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:39:26 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: sashiko-bot@kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] mtd: rawnand: Add Cortina CS7542 controller support
Date: Wed, 25 Nov 2026 21:39:08 +0300
Message-ID: <179563194871.3.18108963585378703111@gmail.com>
In-Reply-To: <sashiko-outbox-233989@kernel.org>
References: <20261125-b4-cs7542-nand-v3-0-0b6d141c102e@gmail.com>
 <20261125-b4-cs7542-nand-v3-2-0b6d141c102e@gmail.com>
 <sashiko-outbox-233989@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_103929_545181_2A70CFB8 
X-CRM114-Status: UNSURE (   7.58  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This repeats the EXTADDR question discussed for v2:
https://lore.kernel.org/all/179546920557.4112741.10222765658884997584@gmail.com/

I compared the generic cs752x_nand_pio() function in v2 and v3; it is
byte-identical. It supplies all NAND address cycles through ADDRESS_1/_2.
Both vendor GPL drivers explicitly clear EXTADDR for erase and OOB
register-PIO transfers, while using the full row address.

The earlier read-only hardware comparison used non-erased OOB data at
0x08600000, 0x10600000 and 0x18600000. Full raw page+OOB reads, with
EXTADDR set, matched OOB-only exec_op reads, with EXTADDR zero. Each
upper-bank result differed from the lower-bank alias. The new v3 cover
also records a fresh native RAM UBI program/erase test and preservation
checks after return to OpenWrt. This does not claim OOB-only program
coverage.

I have queued a comment explaining the vendor register-PIO convention.
I do not see evidence for changing the bank field on this path.

Thanks,
Fil

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
