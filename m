Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ot1ni-0006Pv-81
	for linux-mtd@lists.infradead.org; Tue, 07 Sep 2010 17:17:43 +0000
Received: by bwz13 with SMTP id 13so5690604bwz.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Sep 2010 10:17:40 -0700 (PDT)
Subject: Re: ubi_eba_init_scan: cannot reserve enough PEBs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <AANLkTi=LT+rigRKrUkwF202mqvJCA7L0DG4WTYqBzCLE@mail.gmail.com>
References: <AANLkTi=nYBryUf8SyNFAcx_PPqTfdmY=x835Q-RhLmAn@mail.gmail.com>
	<1280121714.14917.40.camel@localhost>
	<AANLkTinJbZXx+YY7dxhmuEJ4XgN4Fj77=fFo_2WYL1fJ@mail.gmail.com>
	<1280243535.3021.29.camel@localhost.localdomain>
	<1282501832.16502.97.camel@brekeke>
	<AANLkTi=AXo7Ziiz9qWTFMuYaMJbq0xpS2YcuJeWL3BC5@mail.gmail.com>
	<AANLkTinHmSpucwL4nKc5RNaBVc6fdt7bT_hTd2-fkQhB@mail.gmail.com>
	<1283367468.2209.33.camel@brekeke>
	<1283764656.11066.22.camel@localhost>
	<AANLkTi=LT+rigRKrUkwF202mqvJCA7L0DG4WTYqBzCLE@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Sep 2010 20:17:36 +0300
Message-ID: <1283879856.2029.6.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: JamesLNute@eaton.com, linux-mtd@lists.infradead.org,
	Adrian.Hunter@nokia.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-09-07 at 11:59 -0400, Matthew L. Creech wrote:
> On Mon, Sep 6, 2010 at 5:17 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >
> > The other idea which would definitely help is to create a debugging
> > patch which will track all erasures of PEBs and store them somewhere. I
> > do not know which tracing debugging tools you have, if you have some
> > fast tracing you can just send this info via your tracing interface. But
> > if you don't, you can use other flash or another partition on your flash
> > and store the info.
> >
> ...
> 
> This makes sense, however I'm not sure of a good way to store this
> info.  I don't have any hardware debugging tools (BDI, etc.) though I
> could probably get my hands on one if you think it would help.
> Creating another flash partition and saving data there could work,
> although I'm not familiar with how to do that safely/cleanly from
> within the kernel (I could give it a try though).

Well, MTD API provides all basic operations. But I guess this is more
complex, so I'd leave this as a last resort method.

> The brute-force method would be to just dump all of this info out to
> the serial console,

Serial is too slow. If this bug is about race conditions, serial will
make it unreproducible. And this will slow down stuff too much, so you'd
run the same amount of operations tens time slower.

Take a look at the netconsole - using ethernet will be faster. It is
really easy to setup - just do not forget to switch off/configure
iptables. See Documentation/networking/netconsole.txt

>  and I'll leave a minicom session running on a PC
> to capture everything that happens.  I can't be certain how long it
> would take to get a freshly-formatted device into this state, but the
> quantity of output isn't a problem if I'm capturing to a PC.

Yeah, s/minicom/netconsole/, and capture the stuff in a file. This will
makes stuff simpler, at least the 'dump_stack()' issue I told about will
go away.

> I'll probably have time to set this test up in the next few days, but
> it may be weeks until the test device goes bad (if it ever goes bad at
> all).  As far as what code should be tested, do you want me to just
> pull a copy of the latest ubifs-2.6 tree?

This is probably not so important. Use the ubifs you have, but I'd like
to also see it. And send the debugging patch to me for reveiw to
comments (you'll need to prepare).

>   Or apply these patches to
> something more stable?

I think the ubifs base where you already saw the issue will be the best.

> Thanks for your help Artem!

NP, feel free to ask questions.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
