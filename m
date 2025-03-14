Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D139C28B2F
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Mar 2025 19:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=onbIpqyoZOA/5xZxW0bOZTG8btyYegGRVFGkRdzJZbA=; b=1eftEBV/rf+NBs
	sLYIg3laWph4AsZVx9B07MByLz6RZHgwSWNDd/I+oDKfbqcaXJoHW6Mr7jyvx2pr/bEdG3yVOFJ1/
	5hgzP4JiqYYofVIPYzHqCwh6Bj3YzqAGZJLosmAI0s1JCXdxxtUQywMCAcDW27NXWbKobfdPz2TDB
	LMGiwHnHO6fxsrDCdPjs62wkeU7/IGHdcmlHpMdyl0O1O8gfJO0QPbzjksvq20ZsbEhBWuWQ31NWn
	3vLQpu9bqnbTCdJbIllhThsW9hUHVA+jzXCSCGvmtFbP3tCnh0A6oAm/rr496H0OIpU9+IDqUJzuJ
	AwiHekZDuERuX6hvhvjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttAMJ-0000000F5fg-0tmP;
	Fri, 14 Mar 2025 19:06:15 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttAMG-0000000F5ex-18sj
	for linux-mtd@lists.infradead.org;
	Fri, 14 Mar 2025 19:06:13 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4394036c0efso280425e9.2
        for <linux-mtd@lists.infradead.org>; Fri, 14 Mar 2025 12:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741979170; x=1742583970; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIoPbweeHXZ8jSMzIt/eB2E0Gri/NMU0G6vQgDoXF0o=;
        b=QrhB3/+u2wnhtCUk0I0d6LRGDeihqzwL6toSh9AjC5t7JzTvP05r7Mezo+OknclyGe
         tHMa55V/8NzRZsyPFqYfMBDQY1BJmOcbimHxG/Hze5O0LopiQIh1DuMn/XfuwzPZ51VV
         Lr4pCdtRmRcTnNU6LtM9VlExi6VZB9cdzUmroLoWijX26ayhbjv2PJAvLUqdPoQxGHzo
         mPUluyxIsxAPLWi/zukwKB10fS6+NDLq7R3ePu7+xbvfT9caibQQiGMeZUxi6vuxfNEK
         z9DR0Y2hh2EXFOD4d9qzHpk7PsteIykXupRRF6jGGlY2KqUFYTbzjz+88epNzxj+bkSs
         ms5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741979170; x=1742583970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EIoPbweeHXZ8jSMzIt/eB2E0Gri/NMU0G6vQgDoXF0o=;
        b=IYGVTNsPz7VJjME55TU//BmaYzms67GJNpZDDta9P60iV0BQrywVHAkbYu/XZt/65f
         +tRwzNeqnsBd9r+L3y8waBhJmJduMN8Elh7oJBrzwbjynQ7VBfU8ixJMDXjJKRJStkjj
         tTRPeIoaVSUeU4y4ovIrMMHFwDZlhf0NrokwH+1/b0i2+xO6y1FVNmyqrw1E9H5Y0mlh
         0oTOmxBI7cJPYyxz/LfdHy+7WBULCsr553BonzxX3HCvCSv3MR08C4w9oziD6i9pXCDB
         oR7XMN2KzHTvAiERZKwn6JyUKclWU/rONknFOq+V1v5SdvqD3D2U9bpUvjAftIvzIgDo
         rlBA==
X-Forwarded-Encrypted: i=1; AJvYcCU4eazp431Mi71vItaiJOgCancg7xHZV0nfOcvivm2hagLkgy/GdC+NyNTE8ogDUbqXVo6vwtB4MTs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzX5CZwHsA1E3D5kJ8QcmOEZZ5qHH9kebfFOiyCeY575Mx8ppPj
	G7gKlLtp3XMnOdmYv3CwQFWX1Dtwn3EyDspX88K+kKevulQMtxeR
X-Gm-Gg: ASbGncvFvFOZGoevLvpJzBOaYF3oJV6+l8paojHcoWciN3imtvg5WSbE5ImyfQXAIK5
	PAAFw4qlw+BF20Dbnj82XbHQJb/euoxiIWY7JFlE3SVRkkfy76l558xVs2Ap8QOYs7cdFzGgyv3
	0cG3q4+AN2QXbZjYHnx0YNMw2HC0j1jvggO1KBaCyhxdortKTZMk5YIzmsKZhUr93i8/I6v/aKH
	bjVBSPS+p56HUwUnIdPD1TLyqPoe7azyU98DLF2Wh1XG2QOF2Yr0JUt781szCB3rovNWUlLo5wZ
	oP4qNwhcnv4uW6UcGGQrMA/MUndna/N3x7zJLIkc2RwA9OiiHko6SeIJYI5MdIniyV4W+jtXPQj
	pqytrzw8=
X-Google-Smtp-Source: AGHT+IEjEm1NLGYF77AUJiqADkJJt9c0HAwrROWKW9ldaOHP/gE/432Db9RpHAyqooeI7TNtApdt1Q==
X-Received: by 2002:a05:600c:4447:b0:43c:eea9:f45a with SMTP id 5b1f17b1804b1-43d1ec646demr47176475e9.4.1741979169941;
        Fri, 14 Mar 2025 12:06:09 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200fae32sm25534355e9.31.2025.03.14.12.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 12:06:09 -0700 (PDT)
Date: Fri, 14 Mar 2025 19:06:04 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Yury Norov <yury.norov@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Ingo Molnar <mingo@kernel.org>, Kuan-Wei
 Chiu <visitorckw@gmail.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
 <bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
 <jk@ozlabs.org>, <joel@jms.id.au>, <eajames@linux.ibm.com>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dmitry.torokhov@gmail.com>, <mchehab@kernel.org>,
 <awalls@md.metrocast.net>, <hverkuil@xs4all.nl>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <louis.peens@corigine.com>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
 <edumazet@google.com>, <pabeni@redhat.com>,
 <parthiban.veerasooran@microchip.com>, <arend.vanspriel@broadcom.com>,
 <johannes@sipsolutions.net>, <gregkh@linuxfoundation.org>,
 <akpm@linux-foundation.org>, <alistair@popple.id.au>,
 <linux@rasmusvillemoes.dk>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>, <kuba@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-fsi@lists.ozlabs.org>,
 <dri-devel@lists.freedesktop.org>, <linux-input@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <oss-drivers@corigine.com>, <netdev@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>,
 <brcm80211-dev-list.pdl@broadcom.com>, <linux-serial@vger.kernel.org>,
 <bpf@vger.kernel.org>, <jserv@ccns.ncku.edu.tw>, Yu-Chun Lin
 <eleanor15x@gmail.com>
Subject: Re: [PATCH v3 01/16] bitops: Change parity8() return type to bool
Message-ID: <20250314190604.53470966@pumpkin>
In-Reply-To: <b2b632cc-ca69-497f-9cf9-782bd02cac79@intel.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
	<20250306162541.2633025-2-visitorckw@gmail.com>
	<9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org>
	<Z8ra0s9uRoS35brb@gmail.com>
	<a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org>
	<20250307193643.28065d2d@pumpkin>
	<cbb26a91-807b-4227-be81-8114e9ea72cb@intel.com>
	<0F794C6F-32A9-4F34-9516-CEE24EA4BC49@zytor.com>
	<Z9MGxknjluvbX19w@thinkpad>
	<795281B1-9B8A-477F-8012-DECD14CB53E5@zytor.com>
	<b2b632cc-ca69-497f-9cf9-782bd02cac79@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_120612_317984_67448D30 
X-CRM114-Status: GOOD (  20.60  )
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

On Thu, 13 Mar 2025 14:09:24 -0700
Jacob Keller <jacob.e.keller@intel.com> wrote:

> On 3/13/2025 9:36 AM, H. Peter Anvin wrote:
> > On March 13, 2025 9:24:38 AM PDT, Yury Norov <yury.norov@gmail.com> wrote:  
> >> On Wed, Mar 12, 2025 at 05:09:16PM -0700, H. Peter Anvin wrote:  
> >>> On March 12, 2025 4:56:31 PM PDT, Jacob Keller <jacob.e.keller@intel.com> wrote:  
> >>
> >> [...]
> >>  
> >>>> This is really a question of whether you expect odd or even parity as
> >>>> the "true" value. I think that would depend on context, and we may not
> >>>> reach a good consensus.
> >>>>
> >>>> I do agree that my brain would jump to "true is even, false is odd".
> >>>> However, I also agree returning the value as 0 for even and 1 for odd
> >>>> kind of made sense before, and updating this to be a bool and then
> >>>> requiring to switch all the callers is a bit obnoxious...  
> >>>
> >>> Odd = 1 = true is the only same definition. It is a bitwise XOR, or sum mod 1.  
> >>
> >> The x86 implementation will be "popcnt(val) & 1", right? So if we
> >> choose to go with odd == false, we'll have to add an extra negation.
> >> So because it's a purely conventional thing, let's just pick a simpler
> >> one?
> >>
> >> Compiler's builtin parity() returns 1 for odd.
> >>
> >> Thanks,
> >> Yury  
> > 
> > The x86 implementation, no, but there will be plenty of others having that exact definition.  
> 
> Makes sense to stick with that existing convention then. Enough to
> convince me.

There is the possibility that the compiler will treat the builtin as having
an 'int' result without the constraint of it being zero or one.
In which case the conversion to bool will be a compare.
This doesn't happen on x86-64 (gcc or clang) - but who knows elsewhere.

For x86 popcnt(val) & 1 is best (except for parity8) but requires a non-archaic cpu.
(Probably Nehelem or K10 or later - includes Sandy bridge and all the 'earth movers'.)
Since performance isn't critical the generic C code is actually ok.
(The 'parity' flag bit is only set on the low 8 bits.)

	David



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
