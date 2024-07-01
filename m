Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E7FC30653
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2024 10:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TcFVHztIoFmj2VC/piZp/eJXeQ0vttTO+Y2fNjXr+34=; b=O1KM4dP9CEU929
	991kja3t+in91ndTISTpQZv1CXfvASVt44AYK3rQ+ZJOpbD2ksGJcTwAy2JDFe6d75RovOSLV1Tcb
	gS8niGE0XWBwbvGbaaQ2Yc6OHzQ8L73hzNffsuSPYbg8xvYcxmCYidv/hf1NuMxdWJ6BZw6trKmbJ
	ais2xjfDN77IUchHIZm9+XhwR6p+8kyjIxbU4FUwrjkPG+ZHGIrQIf9pAg7S2FfTU896GAhtHTXhB
	Kk/GW2bMG+G2XEvqNWvvZPtaySmowuls2HxaBu4xlEqtBEjnKnGRfwI/ubCwqbIcPhL/MiswTFyFa
	OEcRtLgnHElt/xowr8Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOEhS-00000002mwl-0NBn;
	Mon, 01 Jul 2024 10:55:58 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOEhP-00000002mwF-2QS3
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jul 2024 10:55:57 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a6fe81a5838so269641866b.3
        for <linux-mtd@lists.infradead.org>; Mon, 01 Jul 2024 03:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719831354; x=1720436154; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X3RcYdLq/Lsq/wq9vKrRrPvg8enu2de4SNTQnenVjbY=;
        b=jpt/NBiUvh5WB+BDQX6hbzx6JmQ7T/l9FXl7+gKFnQtNgH8L3+skG4Ww1qHMKg+5+s
         ZGG1aFuTkj3/jq8HZQtGrCqykGfDJy5nV+P2VNjBSMo/M5ZQLIXk5f4c4XQ6yz8Q/rmv
         26vXBLE3xsOn0OsmsTwLiS0tQqhROOBCz3+iSjgI7cpI/52/8b1Ds3qNpclOWXr49ol5
         6PttkGAhznlzrut8ycgn0E0sXyrjhj0MPwb32KIl7b4mca+Dh9DUqAm660VNZlw8MHPc
         HiQNMxnvmzKqex2Jf6d0KhPi3eIY0ndJujjs6rywjek40ED9ZFPVw+VOpyVKxy6D+/Ga
         o9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719831354; x=1720436154;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3RcYdLq/Lsq/wq9vKrRrPvg8enu2de4SNTQnenVjbY=;
        b=TVbG8Z9l7aopmLc9fBsEkfLy7kblYtC7aLYNsbD6zkUx3V92uPGSbKvtH6Bd2l3cue
         Sv850MiaWMmUn44j1tgFz3DSY6vJ8Fti/x3TN+lIjeUB9l4T3J2s6BpQ+gmywVCbsrWw
         MMXVwKOCTE6L7RszODke6mqLkRzGXDP1lFrZT1q8lM0c3imBsLIGiQotda6xyuml8eY8
         QyhOJLi9kAYvpfW/UX5kbM9uIZ+tUpkq9VkbCgxVENKiD9CN6yEZpYfIn7+zGxwQK9Ji
         ZAq5sjZN8vpehENpvETXFCO6v6SZp7euVUsvZloyPf26gwIzBisOaIKaxjNk9xBuIxEG
         3TRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNyJRW9q7FrsdXqUz63uZera42jyeA2UKdfmIGxQR6gv99GJjAMDZOCvEzHouQ0vF4fjYsyqID7sK9WCJz5xTsRrzKSVo+DmA4vM3u6Q==
X-Gm-Message-State: AOJu0YwNDx3FEp36eE1/ChdPNlCZRpIUarDzRkSyFpsiKeoNCcyPu2yy
	pfP3/baWt7MbcxYYrr6ENXZp332jQQym68i8N2KXJoUuuQCvXeokfkQXMU8vM7lJCetfnVa+Bah
	lcnJqNfvAzNLcKCiC6xkVhuOTbHTimbztNg==
X-Google-Smtp-Source: AGHT+IHf+jvSnMsS7fnrtn/Hefkzj14PsozhqErpwtq9dwGfGgvNEIM8z2teFIhhWo8QauH1P4mlEOP/wT0RZ4zrz5w=
X-Received: by 2002:a17:906:af87:b0:a6f:22ea:55b6 with SMTP id
 a640c23a62f3a-a7514511fe7mr333247566b.65.1719831353783; Mon, 01 Jul 2024
 03:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240629103914.161530-1-erezgeva@nwtime.org> <20240629103914.161530-4-erezgeva@nwtime.org>
 <1c457520-07b7-4bde-b040-e8bca959a4f5@linaro.org> <CANeKEMOODBNZA6efh0E0Ga_KaVs5Y3WLcUftRhNwYHhnXO=GNw@mail.gmail.com>
 <CANeKEMO42rJt5Ob4_HDcZ3eEMvuMOPvRaFaLwL8SA65NtxSV7A@mail.gmail.com> <1d56c3b2-7adf-45b9-a509-956340f3f17b@linaro.org>
In-Reply-To: <1d56c3b2-7adf-45b9-a509-956340f3f17b@linaro.org>
From: Erez <erezgeva2@gmail.com>
Date: Mon, 1 Jul 2024 12:55:16 +0200
Message-ID: <CANeKEMM_9qs8neP=Dwks_enmUt9oqGx6+UO=CvAh_4Fm+eF+ew@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: mtd: macronix,mx25l12833f: add
 SPI-NOR chip
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Esben Haabendal <esben@geanix.com>, Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_035555_645658_22DE40BD 
X-CRM114-Status: GOOD (  29.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 1 Jul 2024 at 12:15, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
>
>
> On 7/1/24 10:46 AM, Erez wrote:
> > When using mx25l12805d, we do not read SFDP.
> > As it uses the no-SFDP flags.
> > When using mx25l12833f hardware with mx25l12805d driver, it did not
> > try to read the SFDP.
> > Yet mx25l12833f does have SFDP, when I remove the no-SFDP flags, the
> > driver fetch the SFDP.
> >
> > Secondly SFDP does not contain OTP information.
> >
> > mx25l12805d has two OTP regions of 128 KiB and 384 KiB (yes asymmetric).
> > While mx25l12833f has two OTP regions of 512 KiB.
> >
> > How do we handle it?
>
> You would first try to parse SFDP and initialize the flash based on
> SFDP. If there's no SFDP then you fallback to the flags declared at
> flash declaration. Esben had a try recently, see [1]. I don't know if
> there's any progress in that direction.

That's great. I probably haven't seen it yet, as I used kernel 6.5 based.
However the OTP is not in the SFDP.
Reading the SFDP with "mx25l12805d" does improve :-)
if a user wants to use the OTP, he must specify "mx25l12833f".
Perhaps less likely, but yet no other solution for OTP at the moment.
I would not go to a kernel config for this.

>
> Also, you haven't mentioned anything about the testing. Do you have the
> flash?

I test the code with mx25l12833f hardware, with an older version of
the kernel, 6.5 I think.
It is a kernel provided by Microchip with their setting, The SPI-NOR
driver is vanilla.

In my testing using kernel 6.5 with a Microchip based board.
Before changing, the kernel driver, was using the "mx25l12805d"
setting and did NOT read the SFDP.
Once I added the "mx25l12833f" without any no-sfdp flags, the driver
did read the SFDP.
The driver can find "mx25l12833f" with a read ID, once I remove the
"mx25l12805d" setting, I did test that too.
Adding the new 'SPI_NOR_TRY_SFDP' is great. but does not provide proper OTP!

All the testings were done using the same mx25l12833f hardware, only
the settings in the driver were changed.

I am no longer in contact with the company that provides me the hardware.
And as this is a Microchip based hardware it is difficult to use the
latest kernel.

Anyhow as mx25l12805d hardware has not been sold since 2010, it is
hard to get one.
I do not want to change any setting of mx25l12805d without testing!

Anyhow my patch is focused on the new Macronix OTP callbacks.
I do not care about the "mx25l12833f" or "mx25l12805d" compatibilities
or settings.
If I had a different Macronix chip with a unique ID, I would gladly test it.

I only add them as the kernel rule is that new functions must be used
and tested with real hardware.

Erez

>
> [1]
> https://lore.kernel.org/linux-mtd/20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
