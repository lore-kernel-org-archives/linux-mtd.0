Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD03C001DB
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 13:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uiX3K6g4gVWNDNbXYlT8LFgeJ4+VDBgd/sKFLUC6Ln8=; b=KN0Rd3FqlOuTjg
	yGOGqpRsxF3SgsYOu5CEjYgrGh8zWkAUhaNH2HgtFxvmZuc9mZZqHjptiI0mxtc6si+kbrZNxivdh
	/uBt5DbGC+dQDTPHGtkMpBh07eTfNYEksVbmjJzRSBqpPjTbFG5ZesI2BqDZDrstGNJXXWUgjj7Ci
	BTW/yeOonHJhzmRS6NUUM5SiN5Z9xRPV3UCD+JB+zip2YIBaTvKTRleMY5xaXcvxQiqSo+yVIVjBu
	yJFVbAU57rMtNhkp6UqxqIbj6SdA0eWH1AvlYhONCgDJRx5nALxzJiU3pniW2dDEH7Y+9W1O79Mgy
	aNLbmdsgUq/x/vkfeTmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0Xh-00HRNa-0o;
	Mon, 07 Aug 2023 13:45:05 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0Xe-00HRMJ-0u
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 13:45:03 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-d16639e16e6so3693168276.3
        for <linux-mtd@lists.infradead.org>; Mon, 07 Aug 2023 06:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691415901; x=1692020701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMUoL4hnGiYD5mlozK9nMbQkuwFZ1466myKRpxECfj8=;
        b=c2hxnScmXyOJNNEwoKxei8znJecQS2wtI3TXpVfWBeONeEnG4vwx3hpcJpNe2AayPO
         0AMVZyb/lJSbUeTXtOm1Pe21cRqHs/VtGvkHi8MJvRMFFglgz/80jxQAaCUUe/phOgl+
         Qpm4Uk9oDmcOpnq7mI7TqxH1yYgAW7W51OpmZaeTlrdOKGOZyz/gild0J8SldxlJ8Vm+
         tWG35Hf6tHY/F2mjV+O+qDQgjBmuR6DtLD7/o7uSnQ2NONh4YbEdfL1P+dwcdwJJnrKp
         JkELJca+1W2nV5dANEMwy59TbI68sZY5P+DSD2wmKU1l6My7Ng/g6H72CJmoUzsZZFWh
         6YCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691415901; x=1692020701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMUoL4hnGiYD5mlozK9nMbQkuwFZ1466myKRpxECfj8=;
        b=fEMXw+rxc0l7oV+zOms7o+IxVAkfaj/XNv3wW8wWw5Gyx6NOYO8ebomDVRNxOCmQwd
         176xw17EaQgMtmUgnAJ8+CC9j9ft1K16td+4WGSioPJYv5svNkDVi7knGqjw4wbOpZO/
         SRm2gRq1dx+tYXBRjvM7kaTY2lKDbQZG3w3jyxF3OBCdZLZ9t7Uu5xSZT3nrZlzrOi+s
         ZWMjHUzD3ZbPM+d5JZoCYWychty45J/gps7gaUZQRNSe5oUxZZYzQA7Ckpu/Zo5aDaXg
         RI6HZ+N/f/1ixm3LyvkY5jCePVli5VjCFpsohRPuxrBPX6u9kf86bMUMb96VuL9561vh
         BKtQ==
X-Gm-Message-State: AOJu0YwGvGrlvX8zcUX41NDSeE9W0Y6SmKN0c3fioQ5Rgg9ra3LyqmCI
	36icqUmbEIwhq5fnyXhqRYRNtcFaAV+tuna/E+KWag==
X-Google-Smtp-Source: AGHT+IHx1ajT83sKAnSY+O0ambUwFc4zjHyYjGAv1pUY5pxl3rdlLFD2APpbEZ6FIFnRNRDlCKdb6Khb5uVyVETW/uM=
X-Received: by 2002:a25:d70a:0:b0:d4c:a288:ef4 with SMTP id
 o10-20020a25d70a000000b00d4ca2880ef4mr4049416ybg.44.1691415901373; Mon, 07
 Aug 2023 06:45:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
 <20230630-topic-oxnas-upstream-remove-v2-9-fb6ab3dea87c@linaro.org> <a9074f2d-ffa2-477f-e3b5-2c7d213ec72c@linaro.org>
In-Reply-To: <a9074f2d-ffa2-477f-e3b5-2c7d213ec72c@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 7 Aug 2023 15:44:50 +0200
Message-ID: <CACRpkdbMy=JWAgybtimQXJRQ7jsVZ1g-DfqjryjP31JT9f=Prg@mail.gmail.com>
Subject: Re: [PATCH v2 09/15] pinctrl: pinctrl-oxnas: remove obsolete pinctrl driver
To: neil.armstrong@linaro.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Sebastian Reichel <sre@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-oxnas@groups.io, 
	Arnd Bergmann <arnd@arndb.de>, Daniel Golle <daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_064502_325777_09792E29 
X-CRM114-Status: GOOD (  11.99  )
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

T24gTW9uLCBKdWwgMzEsIDIwMjMgYXQgNDo0NOKAr1BNIE5laWwgQXJtc3Ryb25nCjxuZWlsLmFy
bXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPiBPbiAzMC8wNi8yMDIzIDE4OjU4LCBOZWlsIEFy
bXN0cm9uZyB3cm90ZToKPiA+IER1ZSB0byBsYWNrIG9mIG1haW50ZW5hbmNlIGFuZCBzdGFsbCBv
ZiBkZXZlbG9wbWVudCBmb3IgYSBmZXcgeWVhcnMgbm93LAo+ID4gYW5kIHNpbmNlIG5vIG5ldyBm
ZWF0dXJlcyB3aWxsIGV2ZXIgYmUgYWRkZWQgdXBzdHJlYW0sIHJlbW92ZSBzdXBwb3J0Cj4gPiBm
b3IgT1g4MTAgYW5kIE9YODIwIHBpbmN0cmwgJiBncGlvLgo+Cj4gRG8geW91IHBsYW4gdG8gdGFr
ZSBwYXRjaGVzIDksIDEwICYgMTEgb3Igc2hvdWxkIEkgZnVubmVsIHRoZW0gdmlhIGEgZmluYWwg
U29DIFBSID8KCkkgdHJpZWQgdG8gYXBwbHkgdGhlbSB0byB0aGUgcGluY3RybCB0cmVlIGJ1dCB0
aGF0IGZhaWxzIC4uLgpDb3VsZCB5b3UgcmViYXNlIHBhdGNoZXMgOSwxMCwxMSBvbnRvIG15ICJk
ZXZlbCIgYnJhbmNoCmFuZCBzZW5kIHNlcGFyYXRlbHk/IFRoZW4gSSB3aWxsIGFwcGx5IHRoZW0g
cmlnaHQgYXdheS4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
