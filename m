Return-Path: <SRS0=C/uX=A4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D20C433E2
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2020 16:43:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72F652067D
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2020 16:43:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f7tNI+Yo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pensando.io header.i=@pensando.io header.b="pb84lWVv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72F652067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pensando.io
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sor50JNzdHbGGnSjxy3EyfjH3yMn1d/TkH+wkl4X4+8=; b=f7tNI+Yoo0xHMNYSWe8x57RQb
	dFd1C0B5iUpMKC/bvXTNuyakllp7C8Pz8yskvObcn/AAwKKAm9sVPLa4CcelZpSfy8BqCfTTXTEu8
	8QpY2FSw6o1+IKbspFO6RZ683ZPD4SFUcJuvd70VwlKJv/slN+WbeAM7DC+vi9JXP5sWdRFSdFW5t
	sLEq45Pb3stI4gZUkVbX81RDu0UZhBcmUJJPkgJWTEKKaW6pbJsJnXITfDEQCqWJVXnIiofoxZCl9
	3xK0rvIEbPvVGhpHv5CxdQk4UhBIdAw6lfFkdwKmNnAAQHjgfIrMbdSqATVNZLGQFrBL0gXJhAJaI
	N4rVdCrvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwTRS-0007d4-9N; Fri, 17 Jul 2020 16:42:34 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwTRQ-0007cc-BF
 for linux-mtd@lists.infradead.org; Fri, 17 Jul 2020 16:42:33 +0000
Received: by mail-wm1-x32e.google.com with SMTP id f139so18150370wmf.5
 for <linux-mtd@lists.infradead.org>; Fri, 17 Jul 2020 09:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pensando.io; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GWDxLQJYi267CP7O2brFkpQaCNuwG2kyB74XlieRqGI=;
 b=pb84lWVvkqXyMEYjE2ml1DcEKFv78CH8q62tAc2yA1ox3cA3vhZhdE9ogV7wk/Mtjx
 aMLD4ySjmu87dRRvHFeeEvNXk70BLgFxStg2g/MY6egXsu2Hkagxxz+NEloZkUS0/O70
 LaFHDMlLypa7gLaKEr9B1Q+WIIfJaH9vEo3BkJoQX52vwPAKTAIHzNefHJQy9mxMoojV
 631M4kXdQe5xC9cHnQwtPM9+bUjOp1ki59/Vi3rH4zr7BOlVbOSXAmMJ53LNVukOS7s4
 p0JL8Cu4IvGCLEBXurlQ4/5QWPh4xb63WOWd7heQ9fpXMUfSnZwkDw5cC5QcaMBk2zf1
 y9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GWDxLQJYi267CP7O2brFkpQaCNuwG2kyB74XlieRqGI=;
 b=buggNFA+VIs9wDVZimxx+wdJ1fFlC/V5fbjhKFufxFdOgbFKih1Eztb2U5PM9SWiE3
 EEPZ508o9FqupbUfhvYjBYj6yHQs5asYTotzEv2XCZtLbnyuEXTqA5KTFlFZ8xfyg0lV
 dLbY9UT1sHESTdbffnHxwmwiuewUoCnbA9nXmagrhxtP47TWT1uEYVdx9fbPVgY2uSw0
 be8hrfdwHZDxJy54uF8EW7Z847PikqZ08rB5cztgHu2RsfhOc+C4jD3JrOQCBcjEhlD0
 r/EeXUXrC1I5AqvBdP2UjojL1zGO1tPlBBa7g7uFvJ8voAGkhFYv+Y9XmEAriBznb9ET
 HG5g==
X-Gm-Message-State: AOAM530MiHA6lu37mmZpyedkUw339mgZgbEyHyGgXT0aJYpx5R6DFNZD
 9cpKpD6MAznzH/nL69mQilfFoWwYpWHpuvhhf6IIHQ==
X-Google-Smtp-Source: ABdhPJz5RDzuB0SewlzE/OpKTqVvHZLWJHrIRP1wB9FOPOMNqcB3sZ03uyY6a3Pn3Cj8SYnAOaQvu7OJva8xGfKpxko=
X-Received: by 2002:a7b:cc91:: with SMTP id p17mr10702088wma.90.1595004151254; 
 Fri, 17 Jul 2020 09:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200716211631.38949-1-dac2@pensando.io>
 <20200716211631.38949-3-dac2@pensando.io>
 <1724beec-aceb-b6e9-1288-da340d3fd43c@microchip.com>
 <CA+nMikFDWgLMAhb2rUZnAaLUJdimKZZxqKsQACnXrmCMb_CLMw@mail.gmail.com>
In-Reply-To: <CA+nMikFDWgLMAhb2rUZnAaLUJdimKZZxqKsQACnXrmCMb_CLMw@mail.gmail.com>
From: David Clear <dac2@pensando.io>
Date: Fri, 17 Jul 2020 09:42:20 -0700
Message-ID: <CA+nMikHqOMFUvf-JhQmAX5yePWdNF5G6rDbGbb_JTL-RfTndOw@mail.gmail.com>
Subject: Fwd: [PATCH 2/2] mtd: spi-nor: Support SPI_NOR_DUAL_READ on Micron
 mt25qu02g.
To: Tudor.Ambarus@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_124232_680328_D34161C7 
X-CRM114-Status: UNSURE (   8.06  )
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
Cc: Shannon Nelson <snelson@pensando.io>, linux-mtd@lists.infradead.org,
 vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

[resend due to mailing list bounce]
On Fri, Jul 17, 2020 at 3:33 AM <Tudor.Ambarus@microchip.com> wrote:
>
> > The Micron mt25qu02g supports both x2 and x4 transactions.  Add the
> > SPI_NOR_DUAL_READ to its spi_nor_ids[] table entry.
>
> In spi_nor_select_read() we select the fastest read. Since this flash
> supports Quad Read, the Dual Read will never get selected. As of now,
> there is no benefit in adding SPI_NOR_DUAL_READ when SPI_NOR_QUAD_READ
> is specified.

We're using these devices with the drivers/spi/spi-cadence-quadspi.c
controller.  Now that the Cadence driver is in the spi subsystem, the
spi-rx-bus-width property in the device-tree is honored, and the fastest
available read is selected, taking the bus-width into account.

Only two data pins are hooked up on our board, so we need the x2
mode to work.

> &qspi {
>         status = "okay";
>         flash0: flash@0 {
>                 compatible = "jedec,spi-nor";
>                 reg = <0>;
>                 spi-max-frequency = <50000000>;
>                 spi-rx-bus-width = <2>;

Without this property the interface runs in x1 mode.  Both <2> and
<4> appropriately take effect on this controller (x4 verified under
simulation).

Regards,
David.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
