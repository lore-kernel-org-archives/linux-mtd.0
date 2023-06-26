Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7C3EB64DC
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Jun 2023 01:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iuuAT2gIm6L8h+vC6zwXi24jXuUhZPD1W+w7rdoj56Q=; b=UCp01dMcGPRZzX
	c2vWA9ylpjhIZfPrIaJYtRg6aBawe3YhxbnD5odCR+bieVfWsCLSYFMEFlTHi9R5wf0aWv3h5Hl9S
	cfEzfvs2MfrxHXJlvZ69KJbvBlkm8iQXOQ+fP4LeAYBvaI49e1aZp7jqcHWZvQbS7wXQnj7J7RwWM
	Z9/pCPMNvaN8xE25Xt9NBV55yTyvz8fM+7/4qUBHavWxUDQnU+XdvcJN8UEwAP/sltrIv8bPd8E6c
	tG/ZAmHoVU0LHt+Z8VFhjK+Uing80mNsgzlZtRN032cRF+Vh8WEPFF+g31SRefNreMhIe6VcCnXxo
	5edMepgegqmrReuXoDhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDbUz-0096BG-2Y;
	Mon, 26 Jun 2023 01:58:37 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDbUu-0096AG-0K;
	Mon, 26 Jun 2023 01:58:34 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6b74e2d8c98so267036a34.2;
        Sun, 25 Jun 2023 18:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dawes-za-net.20221208.gappssmtp.com; s=20221208; t=1687744706; x=1690336706;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cpd1DCIfGpvNSfdeEbs1vXO8F5LKqnoZEZn5IxdcDhs=;
        b=XXEuWZKj/UkiyVVOX8x9wY61kouroWv++UO+PSrtnN7qVp7IS6cFyBv7xvGPiD0tob
         25Z2Xq8Db0ZkiowL6bs03wCz/ZWEsk0P+G8Os4OaBMRIkriLeqLMZdg/zvjHetwMBbxL
         9tg9PAkeDinxB0Pih0D927Vxwl20YKuf3QNKcv6mf1dsoA5hyf9u96HrM3ha6I6XnRp1
         6Alzjvje6l1qW3r4yTcbh0esgWjpxj0QCPiHR6/oOFS4n3XgjucYfnhzvBqBTLd/VcZf
         GJuVOGw8xVujURHwYroBqptq64vg0yQoNiB/xFFgXM1u/NIJJiEjETHE/dgsnwnhZ0E8
         AsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687744706; x=1690336706;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cpd1DCIfGpvNSfdeEbs1vXO8F5LKqnoZEZn5IxdcDhs=;
        b=SovwGl4qG7loDbpUCkFtBmfEY5gM5vXTceWQON+odMkd48SdXnJunTdthrWaaLD0nE
         U9JKvo+f9Lj3iacDpoarga6zuzJm5I5VkUESI2LkoWxR7mIZ0tTQ0PVsvxJqgpQk4TB1
         qTnV/VCgugwJtdLqZdwhGvuf+/ANS6/qcwgp8Oktu1jvjQ0sujHPFecvFPD+6+YKp8ri
         znsK91Km+z0FWBUf+hT1R4vpJfa+G33RiBUvDa/QMXGkJ2AhbZPctANX4KvTzsY8t3vt
         v7KwHqaRwfIQDbqyHBho3qz79EWYPnzOA4dSdu6luwp1Sx01EMnFY0gF0peq2VjmvcUH
         v0Qg==
X-Gm-Message-State: AC+VfDwMIivtQLWgTtQjDn0wuXIkXnK+3fFkYKh1x3Cm0FjJTNwhe3mC
	/o0Wxb3Z7OwipcY+Kygl1ejA69qVTRk+UJ0nPBk=
X-Google-Smtp-Source: ACHHUZ7/dQWIYR+MWCZ32GPrtmAI+HUBvAEjGZ+ojf1YmZ0CiADFsv8ASsmczFJDO2Z5yBInZUnPxm6WjWqhX35CV88=
X-Received: by 2002:a9d:7cc9:0:b0:6b5:b654:6d52 with SMTP id
 r9-20020a9d7cc9000000b006b5b6546d52mr15885840otn.8.1687744706551; Sun, 25 Jun
 2023 18:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAOYdKdhscu_NDetiWDgm7bqh-Tf7kqGMHYOvOE0sQh2dU3t64g@mail.gmail.com>
 <CAOMZO5AZQ1147K8tD5e0fJ680CtdDBWk1eMN7n9rVWtJX06W3A@mail.gmail.com>
 <CAOYdKdhuVbzavb9CJYqOLXX7PYCbOGzmeUg2eTgF1saTviCo-Q@mail.gmail.com>
 <f2570cf9-d01f-431b-832c-deae7a8f4c61@lunn.ch> <CAOYdKdiKxpk6sY7wWrrpW+ih6JziMyboRQO=2L3qov_DMhBmOA@mail.gmail.com>
 <CAOYdKdgrpQ9LQvjG7Eg40XtNPonYXmtRmwR=ZERatRJC6osZsA@mail.gmail.com> <ddb713dd-c8d5-4daa-a24f-64c8d213e0ae@lunn.ch>
In-Reply-To: <ddb713dd-c8d5-4daa-a24f-64c8d213e0ae@lunn.ch>
From: Rogan Dawes <rogan@dawes.za.net>
Date: Mon, 26 Jun 2023 03:58:15 +0200
Message-ID: <CAOYdKdiiXr73QVN+TEVH=0Sw_cOVkDWagXVNLT=PjPQF6cwoEg@mail.gmail.com>
Subject: Re: Trying to boot mainline on Wink Hub v1
To: Andrew Lunn <andrew@lunn.ch>
Cc: Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mtd <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	=?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@karo-electronics.de>, 
	Marek Vasut <marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_185832_387733_7489D802 
X-CRM114-Status: GOOD (  13.97  )
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

Fabio provided me with a working dts, and I was able to mount and run
/sbin/init, etc from the original vendor filesystem. Obviously, there
was still lots of breakage, like console names changing, and wifi
drivers (from the 2.6.35 kernel) no longer loading.

I'm going to apply that dtb to an OpenWrt image, I think, and see if I
can get that booting.

Thanks again for the help!

Rogan

On Sun, 25 Jun 2023 at 23:38, Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Sun, Jun 25, 2023 at 11:09:21PM +0200, Rogan Dawes wrote:
> > I tried adding a &nand block to my device tree, but I think it is not
> > quite as simple as that, as I got an error message complaining about
> > my additions:
> >
> > Error: arch/arm/boot/dts/imx28-wink-hub-v1.dts:40.6-11 syntax error
> > FATAL ERROR: Unable to parse input tree
>
> Looking at imx28.dtsi, it appears the nand controller is called gpmi,
> not nand. So try replacing &namd with &gpmi.
>
> Look at arch/arm/boot/dts/imx28-apf28.dts as an example.
>
>      Andrew
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
