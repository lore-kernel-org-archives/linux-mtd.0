Return-Path: <SRS0=3Hr+=C5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5156EC43465
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2020 09:46:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9359A20866
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2020 09:46:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oND4vCIG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NxAC5HjL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9359A20866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:In-Reply-To:
	References:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=90M923hrnb8m803hpmM6adEdJ3Td7Kym+yYMIOU8blE=; b=oND4vCIG8yJaR31XCkdRDLSBF
	EWPfIjfNvHFIRY2Wc6KtFZsrYK80JgP76XhsqB2IZfgfnau5xWdEaBpygfnpzu4IMWt78nGj4khR5
	FoYG2D4BBowmc3wbHfHZ//asXmM8yonFIEKOhiiE9PsrodzWL0FTIudZAWn2K7RxO89kQUp6TcN0y
	QsKsoifatgAKtvybl/VCqtiL4uqL9lzlFHh6kX5U8nPB1e7DGbR6RIRzdDKVgL+ccNVoiiENcXBdb
	4FdmzmImqPjwQIcVDNS07ToxwFt/XSpicX0MQanVdcELfeBDoj2aTYNo3fpQuJde54HAcIski6vzn
	7Us1T110w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJvuL-00067N-JX; Sun, 20 Sep 2020 09:45:21 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJvuI-00066t-8D
 for linux-mtd@lists.infradead.org; Sun, 20 Sep 2020 09:45:19 +0000
Received: by mail-qv1-xf29.google.com with SMTP id q10so5755912qvs.1
 for <linux-mtd@lists.infradead.org>; Sun, 20 Sep 2020 02:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=bI+KOrtm+DSOj1ybD5+aMPXLAeGAqLLQ4CXe7B48ZTE=;
 b=NxAC5HjLQiiQOxYG1GSo4Va4sls7g1uaLOZZTDnvfUHeEzmqLO0BYQKz1TLdRixF3E
 KbeMAmB3eCmXKcWTICE0OGJZrOpxm8DglmaSkqQzVoipcIbiO5ReHxTAyBhgg+iOs9zy
 H7aMX0gyIxbIusGhjGvyD+tJKqezSxj50OGbo544PUDnOD+entJF548NRPSMCbT/Oyhq
 oqzMY9cO6zakK6R2FVd//CwE3Tx+1YLTFk/syGN2r6Mq0VxoeN6mXKtRpJzXyXGE1X8B
 ds5hzde/kJ6sdRDk9mT/SanfRkT4mBzMtp9q4Tu3KvaovtT2dzMyASKRsTFbKHCTFfPR
 MXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=bI+KOrtm+DSOj1ybD5+aMPXLAeGAqLLQ4CXe7B48ZTE=;
 b=WnzFLxvNZCsT8vv0JJoE4h0AXgcoHZvgRscAAgh7F+nygL2FxNp0BGhWTGFrP3Ddvi
 DYdFNy6x4y0lEzlJwAG2F1+cLT2Rj7I9zkdGT5NYSdqE15cgi13uTGMFTlRliQwSs5bk
 j5KjddMTarO0RHtZ6um0FMu7o54DadVA8qUQIBlnJU1dNUpJXy4EYmsi1Dt/W7XV4W8P
 Psdwj03F2YBrivupfqyGan401PsCY3apmwih7rk1zfdE0HohQiJAHkqWatccjp1iQB/O
 trbBOAK5M+sTeY8FYaJZ65OQpCoCmQ6jSSKly2RKBtJnZ9JhUkDwEVju4DcCAv3CJBQ6
 hc1g==
X-Gm-Message-State: AOAM530xChN+uD2t3KYg3Pn8TReVq8wBBW1IHiEUsmR0x7Avvc2Rm1Xi
 /uchbMDjI/PdgVkvSMgwacA=
X-Google-Smtp-Source: ABdhPJydcBHGJIrOrtEfrenLSKbouJBsnyeBUGfdfMaMGB5KmQOskprwcIhcZLog9QuzQ3/4vEGcdQ==
X-Received: by 2002:a0c:9a01:: with SMTP id p1mr24371120qvd.61.1600595115198; 
 Sun, 20 Sep 2020 02:45:15 -0700 (PDT)
Received: from AnsuelXPS (93-39-149-95.ip76.fastwebnet.it. [93.39.149.95])
 by smtp.gmail.com with ESMTPSA id n144sm6257632qkn.69.2020.09.20.02.45.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 20 Sep 2020 02:45:14 -0700 (PDT)
From: <ansuelsmth@gmail.com>
To: "'Andrew Lunn'" <andrew@lunn.ch>
References: <20200919223026.20803-1-ansuelsmth@gmail.com>
 <20200919223026.20803-5-ansuelsmth@gmail.com>
 <20200920003128.GC3673389@lunn.ch>
 <006301d68ee6$87fcc400$97f64c00$@gmail.com>
 <20200920012216.GE3673389@lunn.ch>
In-Reply-To: <20200920012216.GE3673389@lunn.ch>
Subject: RE: R: [PATCH v2 4/4] dt-bindings: net: Document use of
 mac-address-increment
Date: Sun, 20 Sep 2020 11:45:08 +0200
Message-ID: <002a01d68f32$bc737bb0$355a7310$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJTwTIROpBsKHcYsKMkb8exrd/FtgHUg4PZAkc+4zACC3fAJQJmQYzGqDJ2ekA=
Content-Language: it
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200920_054518_301247_33400768 
X-CRM114-Status: GOOD (  26.29  )
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

> On Sun, Sep 20, 2020 at 02:39:39AM +0200, ansuelsmth@gmail.com
> wrote:
> >
> >
> > > -----Messaggio originale-----
> > > Da: Andrew Lunn <andrew@lunn.ch>
> > > Inviato: domenica 20 settembre 2020 02:31
> > > A: Ansuel Smith <ansuelsmth@gmail.com>
> > > Cc: Miquel Raynal <miquel.raynal@bootlin.com>; Richard Weinberger
> > > <richard@nod.at>; Vignesh Raghavendra <vigneshr@ti.com>; Rob
> Herring
> > > <robh+dt@kernel.org>; David S. Miller <davem@davemloft.net>; Jakub
> > > Kicinski <kuba@kernel.org>; Heiner Kallweit <hkallweit1@gmail.com>;
> > > Russell King <linux@armlinux.org.uk>; Frank Rowand
> > > <frowand.list@gmail.com>; Boris Brezillon <bbrezillon@kernel.org>;
> linux-
> > > mtd@lists.infradead.org; devicetree@vger.kernel.org; linux-
> > > kernel@vger.kernel.org; netdev@vger.kernel.org
> > > Oggetto: Re: [PATCH v2 4/4] dt-bindings: net: Document use of mac-
> > > address-increment
> > >
> > > > +  mac-address-increment:
> > > > +    description:
> > > > +      The MAC address can optionally be increased (or decreased
using
> > > > +      negative values) from the original value readed (from a nvmem
> > cell
> > >
> > > Read is irregular, there is no readed, just read.
> > >
> > > > +      for example). This can be used if the mac is readed from a
> > dedicated
> > > > +      partition and must be increased based on the number of device
> > > > +      present in the system.
> > >
> > > You should probably add there is no underflow/overflow to other bytes
> > > of the MAC address. 00:01:02:03:04:ff + 1 == 00:01:02:03:04:00.
> > >
> > > > +    minimum: -255
> > > > +    maximum: 255
> > > > +
> > > > +  mac-address-increment-byte:
> > > > +    description:
> > > > +      If 'mac-address-increment' is defined, this will tell what
byte
> > of
> > > > +      the mac-address will be increased. If 'mac-address-increment'
is
> > > > +      not defined, this option will do nothing.
> > > > +    default: 5
> > > > +    minimum: 0
> > > > +    maximum: 5
> > >
> > > Is there a real need for this? A value of 0 seems like a bad idea,
> > > since a unicast address could easily become a multicast address, which
> > > is not valid for an interface address. It also does not seem like a
> > > good idea to allow the OUI to be changed. So i think only bytes 3-5
> > > should be allowed, but even then, i don't think this is needed, unless
> > > you do have a clear use case.
> > >
> > >     Andrew
> >
> > Honestly the mac-address-increment-byte is added to give user some
> control
> > but I
> > don't really have a use case for it. Should I limit it to 3 or just
remove
> > the function?
> 
> If you have no use case, just remove it and document that last byte
> will be incremented. I somebody does need it, it can be added in a
> backwards compatible way.
> 
>      Andrew

I just rechecked mac-address-increment-byte and we have one device that
use it and would benefits from this.  I will change the Documentation to
min 3 and leave it.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
