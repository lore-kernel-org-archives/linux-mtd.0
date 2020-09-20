Return-Path: <SRS0=3Hr+=C5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A0FC433DB
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2020 00:40:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33BA820758
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2020 00:40:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W93GjkU2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9QkbF8d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33BA820758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:In-Reply-To:
	References:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PfDtdSrhEAk28Mlxj78JW8rDVBgko7ru9H5OcoV5Z9U=; b=W93GjkU2BE6noO9TR63ozBeFm
	Ky15UQTyiA4yEXD3UPGXdzoRLRxbYqT9LakY4zPYQMJ02ecxLn7G4FDK/R0XSdUBJlj0dAmAWi6z4
	SE7QJxYQ85jF4nmnBpRqlJ/vHQMupSrHuLDEMhAAOdRK4hhHV+M5XHg8/POodC2yAsYfO/v1M6Y4A
	wDxE5C4MGVIEWtACUekhxPNeh16HidRd0l94CIMN7WAE9Y4BOcUb98VFj7wA5c+9MSdIrem15Wjm1
	3RN7b/dyA+MA4ywKMJlkjUr4gu10eXfufIxKd4UpcynbNyz7g9e1kT508hbC6LRSE/owpOElFcSR5
	7rH9VMU7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJnOO-0003Dd-4h; Sun, 20 Sep 2020 00:39:48 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJnOL-0003D9-VI
 for linux-mtd@lists.infradead.org; Sun, 20 Sep 2020 00:39:46 +0000
Received: by mail-qv1-xf31.google.com with SMTP id ef16so5314842qvb.8
 for <linux-mtd@lists.infradead.org>; Sat, 19 Sep 2020 17:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=213PH6EgWk1l6jbeXwi32jF2mR0ZroKqbGXcagQaHzw=;
 b=a9QkbF8dFjqcX59eKlRG8Z8WH7zWXFeGoj5bx89rxeJdrWjolaxA/WFJA4ub69MdY8
 aFKSPB0PwDAD2lLH7u6//rPCU/iTN03un0ZEs+5IcJyJlMQQBfPdRfKXiISP+nK9jFZM
 Oa7Hmk17p24+nwO1mK1y0QtO6jMdiPRjdjDdzsj7DhnauzyDgfPAAbFis0e1JZ7b3qj2
 vBHJ69ZI0t//QofQ10+chFiGupfS8C8uSnn9jaAP3BBO51KDOe6z0g9S4gOP0KvwsetK
 2tWVHjjworsQhuIzfJwxpHz3p6oVRcRyxwPpFI97U9uz5S9gWZqaalPa1pkTReaZX69g
 PmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=213PH6EgWk1l6jbeXwi32jF2mR0ZroKqbGXcagQaHzw=;
 b=X1NUxWtz2xJVxgXT2onuDYVzPfkAT1EFzrvcMq5AcOzl2Fjlks5Y/AS1V2pOk7BL5/
 OAcHU9RPAeqzm5CM45VfSsVV1d4PuulDokKq8y9U8XNNv6UbO6Yl4BqjU1RpBuos75c3
 zJvQru7GdbQfWVYv4TA9IUpSi936w1/6SSUS/jwaB9JzGc4Fn7wcS0ekHavwfaBEd7SU
 j70ILaYX4ZXVDLIqqVVwquejqT67TfRQBhkZPugQLcmZBnJzBCGbhBiD9WZmuqz8lchg
 bfLj7oKuzz64GnYyEz20ECY+afavJ0oaypWSXIn+bnUx8lwrCmQ/ioHa6ohumfKkq3e9
 /nVg==
X-Gm-Message-State: AOAM530OqI9/sQsYduRi5Tdz2j7Hxok+se/GGbPgoUmKwIZl6AM6dIsL
 CydXow2nboingQ7+wRFAbdw=
X-Google-Smtp-Source: ABdhPJyy+1H3RXGpW2J8hxvDWOoSU38MTeyHVAP8AqmacZJ93UPEZCrIIT/K8LGTEfD6dzBTCst89Q==
X-Received: by 2002:ad4:47cc:: with SMTP id p12mr39319748qvw.25.1600562384041; 
 Sat, 19 Sep 2020 17:39:44 -0700 (PDT)
Received: from AnsuelXPS (93-39-149-95.ip76.fastwebnet.it. [93.39.149.95])
 by smtp.gmail.com with ESMTPSA id t10sm5315485qkt.55.2020.09.19.17.39.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 19 Sep 2020 17:39:43 -0700 (PDT)
From: <ansuelsmth@gmail.com>
To: "'Andrew Lunn'" <andrew@lunn.ch>
References: <20200919223026.20803-1-ansuelsmth@gmail.com>
 <20200919223026.20803-5-ansuelsmth@gmail.com>
 <20200920003128.GC3673389@lunn.ch>
In-Reply-To: <20200920003128.GC3673389@lunn.ch>
Subject: R: [PATCH v2 4/4] dt-bindings: net: Document use of
 mac-address-increment
Date: Sun, 20 Sep 2020 02:39:39 +0200
Message-ID: <006301d68ee6$87fcc400$97f64c00$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJTwTIROpBsKHcYsKMkb8exrd/FtgHUg4PZAkc+4zCoVWtPAA==
Content-Language: it
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_203946_048535_9798F669 
X-CRM114-Status: GOOD (  20.60  )
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
Cc: devicetree@vger.kernel.org, 'Vignesh Raghavendra' <vigneshr@ti.com>,
 'Boris Brezillon' <bbrezillon@kernel.org>,
 'Richard Weinberger' <richard@nod.at>, 'Russell King' <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, 'Rob Herring' <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, 'Miquel Raynal' <miquel.raynal@bootlin.com>,
 'Jakub Kicinski' <kuba@kernel.org>, netdev@vger.kernel.org,
 'Frank Rowand' <frowand.list@gmail.com>,
 "'David S. Miller'" <davem@davemloft.net>,
 'Heiner Kallweit' <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



> -----Messaggio originale-----
> Da: Andrew Lunn <andrew@lunn.ch>
> Inviato: domenica 20 settembre 2020 02:31
> A: Ansuel Smith <ansuelsmth@gmail.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>; Richard Weinberger
> <richard@nod.at>; Vignesh Raghavendra <vigneshr@ti.com>; Rob Herring
> <robh+dt@kernel.org>; David S. Miller <davem@davemloft.net>; Jakub
> Kicinski <kuba@kernel.org>; Heiner Kallweit <hkallweit1@gmail.com>;
> Russell King <linux@armlinux.org.uk>; Frank Rowand
> <frowand.list@gmail.com>; Boris Brezillon <bbrezillon@kernel.org>; linux-
> mtd@lists.infradead.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; netdev@vger.kernel.org
> Oggetto: Re: [PATCH v2 4/4] dt-bindings: net: Document use of mac-
> address-increment
> 
> > +  mac-address-increment:
> > +    description:
> > +      The MAC address can optionally be increased (or decreased using
> > +      negative values) from the original value readed (from a nvmem
cell
> 
> Read is irregular, there is no readed, just read.
> 
> > +      for example). This can be used if the mac is readed from a
dedicated
> > +      partition and must be increased based on the number of device
> > +      present in the system.
> 
> You should probably add there is no underflow/overflow to other bytes
> of the MAC address. 00:01:02:03:04:ff + 1 == 00:01:02:03:04:00.
> 
> > +    minimum: -255
> > +    maximum: 255
> > +
> > +  mac-address-increment-byte:
> > +    description:
> > +      If 'mac-address-increment' is defined, this will tell what byte
of
> > +      the mac-address will be increased. If 'mac-address-increment' is
> > +      not defined, this option will do nothing.
> > +    default: 5
> > +    minimum: 0
> > +    maximum: 5
> 
> Is there a real need for this? A value of 0 seems like a bad idea,
> since a unicast address could easily become a multicast address, which
> is not valid for an interface address. It also does not seem like a
> good idea to allow the OUI to be changed. So i think only bytes 3-5
> should be allowed, but even then, i don't think this is needed, unless
> you do have a clear use case.
> 
>     Andrew

Honestly the mac-address-increment-byte is added to give user some control
but I
don't really have a use case for it. Should I limit it to 3 or just remove
the function?
Will address the other 2 comment in v3.
Thx for review.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
