Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC12CC28B23
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 19:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dHLIzH5yc13JY0s3fi8rwTxruLeGJmgxjgB/T/LMCNk=; b=xC+EdFeSeys3+5
	BMapQhz3nwz2JxqpSEg+aY40cQdBA7mjMjQKdO8aLml61qGKLSlBusqwr4t00GfjTklpNprOEzNaZ
	hcMCdvQ+QK0qYnru5AfIm4YvDnmkUH/TjbIIhKp0jRxhbd0/E+ATXWT6/RFu0oSx8trux6sdU+kHT
	cnRrA1EgzbNcMV6VJck8LcKM6Uwz3laJsQ/5Hpuu+9u++XWWasZqRA39aWSpAOTZ29rfD26Q1KvDH
	wS6bm/GDl3RwJRv6Ym24QhTZa2oQ8tGHaYIywJHi+FfO5SuPCnmdYkGNuBCgi/W5EPZuIOVas9Bom
	UybDRsfUk7JCPD7wqdZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqdl0-0000000FQ5B-3chU;
	Fri, 07 Mar 2025 19:53:18 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqdky-0000000FQ4o-2Jo4
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 19:53:17 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-438a39e659cso13250075e9.2
        for <linux-mtd@lists.infradead.org>; Fri, 07 Mar 2025 11:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741377194; x=1741981994; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFjCWoFVVseHqDKPyVju+l4iTZxEMM/BbzUS5g6rWQg=;
        b=LVt6MjrCB6f0vU0uXk37vzurdWlNkYEYZA2v0bJAGMB7ip/YaODSYcmnRz+i8JfmOq
         qjx7wElADfMqeJT8aGz2Q7UFzGKT6zxXZaIwpumFmQRq5TT9N0AuQplVvfA5vU64FYB+
         5+ktT6x8+H2l2RRqO0vin1LWs9x8ssLSotVpfNPyKLmz0F7ZiFBXaHKlGmTTOXwIb4xZ
         GVaV7jX5iPLfHyyms7eh5tGJbAqNl9GUsj/g9apBLZJsPH8HzenCEr303z9/ynRta8N/
         2Z30q2AsA98gRb6DRcHcW7NkzZnihgKZ8WYlIIF1OnO6wvNe2N8o95XnlaW2nR85Q37W
         eHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741377194; x=1741981994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OFjCWoFVVseHqDKPyVju+l4iTZxEMM/BbzUS5g6rWQg=;
        b=fHeCKiPjxMcE8by9FINJyvh8zZXUzbwxSRqbW5M6KwJNNTswfbPC+/nADLxLB+R4O0
         QZbP2oLTr+m/qyxytucCuANQsQjw+Y4ooq/rcaCHE/yXB0pu+89TPqKieTziWUKOp8cJ
         HIYjeIV1BrtFB/3LZkYOVYweWyduQrt023Lai6tSLgCl759Ph0qgi4n3Q8Xyv8FF1Uz/
         v7/jU4AREHQ+nr41zEEO1yufPaOGGjYrzIbF+TpMmxrBRkAAiXpjsFG5Mi2P2z+PwgkC
         SmZwO987/bXHaQ53RkCMXX3Bkd5Io8UKK7851mAH0+HKrXbyH7yY1hVRZUYwbgZdqp5h
         UG5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWf2m6vJBU2GLaBMKbOr0Z0s8QkgKkGxzf839pbTGXvUe1flpoPQigyzkMjLJaB7Z9FmZ/2k45JE3g=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+04F27CXckpGDanBxKNu6L3VukLiYZkN4G+VnaHrNj+Be4AvL
	hjv6VJXjxh+VMmUOuQrubJN12YiQ0ma7xQ93Jv5a3L9oa4rninxm
X-Gm-Gg: ASbGnculQl1qigk5gh18xkNQMsfmiUGK5EFwXhX0r1WcE35AVIrp0ptyd6WNdvE5N7D
	17+iGrlgi0Fdo+O4s7olHjZGNg2AcAYtntiClOwO3O5SsuduWCNtpxR/nXnqBFZW5W9O1SI0XcR
	EHOAKWKyEE8NMC5rV0ogf0JyX8QRPYVp5PJzSsUJ55whYKCNzEdUBkd9CCRWFDtXfGm9OztaIKP
	5w12jTK562dl5Pvn2tjpDt+HLE9neWu/MeanndWWvhBydQGbH2l7VXKVN0Y2YG8pjvzi8eecOoH
	8Yu5Zl8H7wqYDyFGaRujfXFA5yXZaf/BNdTpmAgK20+8O33pnAAngYH4hGS9c0TMi4/07Palgda
	6dWhYZGA=
X-Google-Smtp-Source: AGHT+IFtUYsYiNnYKhfvrcaN1ioOhGevW7gRyAbgDR19AZMXszweQZgGUKeQX4mOm4dqyM9BgE29Gg==
X-Received: by 2002:a05:6000:18ab:b0:391:122c:8aa with SMTP id ffacd0b85a97d-39132d96079mr3226538f8f.30.1741377194381;
        Fri, 07 Mar 2025 11:53:14 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c01d2cdsm6394936f8f.57.2025.03.07.11.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 11:53:13 -0800 (PST)
Date: Fri, 7 Mar 2025 19:53:10 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 akpm@linux-foundation.org, alistair@popple.id.au, andrew+netdev@lunn.ch,
 andrzej.hajda@intel.com, arend.vanspriel@broadcom.com,
 awalls@md.metrocast.net, bp@alien8.de, bpf@vger.kernel.org,
 brcm80211-dev-list.pdl@broadcom.com, brcm80211@lists.linux.dev,
 dave.hansen@linux.intel.com, davem@davemloft.net,
 dmitry.torokhov@gmail.com, dri-devel@lists.freedesktop.org,
 eajames@linux.ibm.com, edumazet@google.com, eleanor15x@gmail.com,
 gregkh@linuxfoundation.org, hverkuil@xs4all.nl, jernej.skrabec@gmail.com,
 jirislaby@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 johannes@sipsolutions.net, jonas@kwiboo.se, jserv@ccns.ncku.edu.tw,
 kuba@kernel.org, linux-fsi@lists.ozlabs.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux@rasmusvillemoes.dk,
 louis.peens@corigine.com, maarten.lankhorst@linux.intel.com,
 mchehab@kernel.org, mingo@redhat.com, miquel.raynal@bootlin.com,
 mripard@kernel.org, neil.armstrong@linaro.org, netdev@vger.kernel.org,
 oss-drivers@corigine.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, rfoss@kernel.org, richard@nod.at,
 simona@ffwll.ch, tglx@linutronix.de, tzimmermann@suse.de, vigneshr@ti.com,
 visitorckw@gmail.com, x86@kernel.org, yury.norov@gmail.com
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64
 helper
Message-ID: <20250307195310.58abff8c@pumpkin>
In-Reply-To: <5A790652-1B22-4D13-AAC5-5D9931E90903@zytor.com>
References: <4732F6F6-1D41-4E3F-BE24-E54489BC699C@zytor.com>
	<efc2ee9d-5382-457f-b471-f3c44b81a190@citrix.com>
	<5A790652-1B22-4D13-AAC5-5D9931E90903@zytor.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_115316_598102_3CA8FC37 
X-CRM114-Status: GOOD (  15.27  )
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

On Fri, 07 Mar 2025 11:30:35 -0800
"H. Peter Anvin" <hpa@zytor.com> wrote:

> On March 7, 2025 10:49:56 AM PST, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >> (int)true most definitely is guaranteed to be 1.  
> >
> >That's not technically correct any more.
> >
> >GCC has introduced hardened bools that intentionally have bit patterns
> >other than 0 and 1.
> >
> >https://gcc.gnu.org/gcc-14/changes.html
> >
> >~Andrew  
> 
> Bit patterns in memory maybe (not that I can see the Linux kernel using them) but
> for compiler-generated conversations that's still a given, or the manager isn't C
> or anything even remotely like it.
> 

The whole idea of 'bool' is pretty much broken by design.
The underlying problem is that values other than 'true' and 'false' can
always get into 'bool' variables.

Once that has happened it is all fubar.

Trying to sanitise a value with (say):
int f(bool v)
{
	return (int)v & 1;
}    
just doesn't work (see https://www.godbolt.org/z/MEndP3q9j)

I really don't see how using (say) 0xaa and 0x55 helps.
What happens if the value is wrong? a trap or exception?, good luck recovering
from that.

	David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
