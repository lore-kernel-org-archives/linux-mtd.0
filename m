Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ot0eq-0007rl-F7
	for linux-mtd@lists.infradead.org; Tue, 07 Sep 2010 16:04:29 +0000
Received: by wyb38 with SMTP id 38so6710235wyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Sep 2010 09:04:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1283764656.11066.22.camel@localhost>
References: <AANLkTi=nYBryUf8SyNFAcx_PPqTfdmY=x835Q-RhLmAn@mail.gmail.com>
	<1280121714.14917.40.camel@localhost>
	<AANLkTinJbZXx+YY7dxhmuEJ4XgN4Fj77=fFo_2WYL1fJ@mail.gmail.com>
	<1280243535.3021.29.camel@localhost.localdomain>
	<1282501832.16502.97.camel@brekeke>
	<AANLkTi=AXo7Ziiz9qWTFMuYaMJbq0xpS2YcuJeWL3BC5@mail.gmail.com>
	<AANLkTinHmSpucwL4nKc5RNaBVc6fdt7bT_hTd2-fkQhB@mail.gmail.com>
	<1283367468.2209.33.camel@brekeke>
	<1283764656.11066.22.camel@localhost>
Date: Tue, 7 Sep 2010 11:59:25 -0400
Message-ID: <AANLkTi=LT+rigRKrUkwF202mqvJCA7L0DG4WTYqBzCLE@mail.gmail.com>
Subject: Re: ubi_eba_init_scan: cannot reserve enough PEBs
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: JamesLNute@eaton.com, linux-mtd@lists.infradead.org,
	Adrian.Hunter@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 6, 2010 at 5:17 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>
> The other idea which would definitely help is to create a debugging
> patch which will track all erasures of PEBs and store them somewhere. I
> do not know which tracing debugging tools you have, if you have some
> fast tracing you can just send this info via your tracing interface. But
> if you don't, you can use other flash or another partition on your flash
> and store the info.
>
...

This makes sense, however I'm not sure of a good way to store this
info.  I don't have any hardware debugging tools (BDI, etc.) though I
could probably get my hands on one if you think it would help.
Creating another flash partition and saving data there could work,
although I'm not familiar with how to do that safely/cleanly from
within the kernel (I could give it a try though).

The brute-force method would be to just dump all of this info out to
the serial console, and I'll leave a minicom session running on a PC
to capture everything that happens.  I can't be certain how long it
would take to get a freshly-formatted device into this state, but the
quantity of output isn't a problem if I'm capturing to a PC.

I'll probably have time to set this test up in the next few days, but
it may be weeks until the test device goes bad (if it ever goes bad at
all).  As far as what code should be tested, do you want me to just
pull a copy of the latest ubifs-2.6 tree?  Or apply these patches to
something more stable?

Thanks for your help Artem!

-- 
Matthew L. Creech
