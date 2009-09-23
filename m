Received: from mail-yw0-f204.google.com ([209.85.211.204])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MqTEz-0000GQ-4l
	for linux-mtd@lists.infradead.org; Wed, 23 Sep 2009 14:54:49 +0000
Received: by ywh42 with SMTP id 42so926449ywh.28
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Sep 2009 07:54:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1253690210.4170.618.camel@macbook.infradead.org>
References: <1244033509-31586-1-git-send-email-vapier@gentoo.org>
	<1253681321-24600-1-git-send-email-vapier@gentoo.org>
	<1253690210.4170.618.camel@macbook.infradead.org>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Wed, 23 Sep 2009 10:54:23 -0400
Message-ID: <8bd0f97a0909230754t62598e91sd79271c922d77abb@mail.gmail.com>
Subject: Re: [Uclinux-dist-devel] [PATCH v3] mtd/maps: gpio-addr-flash: new
	driver for GPIO assisted flash addressing
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: uclinux-dist-devel@blackfin.uclinux.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 23, 2009 at 03:16, David Woodhouse wrote:
> On Wed, 2009-09-23 at 00:48 -0400, Mike Frysinger wrote:
>>
>> + =C2=A0 =C2=A0 =C2=A0 depends on GENERIC_GPIO || GPIOLIB
>
> That still isn't right -- the failing case for me was when GENERIC_GPIO
> was set but _not_ GPIOLIB.
>
> I'll accept an answer of "that's because x86 gpio support is broken",
> but you do have to handle the whining from the 'make randconfig' folks
> for me :)

right, but this code doesnt depend on GPIOLIB.  it needs functioning
GPIO support and GENERIC_GPIO means the arch has a functioning GPIO
core for just the CPU pins.  i'm pretty sure x86 lies in this respect,
so hopefully this randconfig will poke the x86 guys to fix their tree
(or tell me where i'm wrong).  i looked at the x86 Kconfig and it
seems like it should be using "def_bool n" for this symbol, but i'm
not sure that'll fix things.

> And please can you make it an incremental patch against what's in the
> mtd-2.6.git tree (which I've already asked Linus to pull).

sorry, i didnt realize you merged it
-mike
