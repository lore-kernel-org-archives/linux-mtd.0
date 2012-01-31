Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsLcf-0000iL-TB
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 21:52:18 +0000
Received: by pbdx9 with SMTP id x9so616103pbd.36
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2012 13:52:14 -0800 (PST)
MIME-Version: 1.0
Sender: glikely@secretlab.ca
In-Reply-To: <20120131211554.GA28105@pengutronix.de>
References: <1328004002-24646-1-git-send-email-Barry.Song@csr.com>
 <1328004002-24646-2-git-send-email-Barry.Song@csr.com>
 <20120131101734.GE2471@pengutronix.de>
 <CAGsJ_4wyJ6Wymy4AWoW1eHubZX=W7GT_Fbow9ofXoY1RrcHzgA@mail.gmail.com>
 <20120131113358.GM2471@pengutronix.de>
 <20120131203455.GG22611@ponder.secretlab.ca>
 <20120131211554.GA28105@pengutronix.de>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Tue, 31 Jan 2012 14:51:53 -0700
Message-ID: <CACxGe6tLLgaetPsW47pXVFbRt64kum+qgeVedFUG9fyDA1c3Hw@mail.gmail.com>
Subject: Re: [PATCH 1/3] platform: add common resource requesting and mapping
 helper
To: Wolfram Sang <w.sang@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@suse.de>, Barry Song <21cnbao@gmail.com>,
 linux-kernel@vger.kernel.org, workgroup.linux@csr.com,
 linux-mtd@lists.infradead.org, Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
 Barry Song <Baohua.Song@csr.com>, David Woodhouse <dwmw2@infradead.org>,
 Erik Gilling <konkers@google.com>, Barry Song <Barry.Song@csr.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 31, 2012 at 2:15 PM, Wolfram Sang <w.sang@pengutronix.de> wrote=
:
>
>> > I am not sure using 'platform_devm_request_and_ioremap' and later usin=
g
>> > plain 'devm_*' functions (without platform_-prefix) is less confusing.
>> > The alternative would be to check which helper functions also use
>> > 'struct resource' and if they do checks on that. If all do that, you
>> > would have the simple rule, that you only need to check yourself if yo=
u
>> > access it yourself.
>>
>> The reason I suggested the wrapper is that then the driver code doesn't =
need
>> to fart around with the res pointer at all. =A0It reduces boilerplate in=
 platform
>> drivers which I think is a good thing.
>
> I do understand your motivation and fully agree with what you are aiming =
for
> (that's exactly why I implemented devm_request_and_ioremap()).
>
> This patch is a micro-optimization, though, and won't cut it IMHO. I stil=
l have
> issues with only one platform_devm_* and all the rest being devm_* (witho=
ut
> platform_). Things might look better, if we'd for example also have
> platform_devm_request_irq() or something similar. That might be an approa=
ch
> where we can play around with and see what is left to do. Or, if other
> approaches might be more elegant.
>
> To discuss that, try things, etc, I'd simply like to have a bit more time=
. If
> we are accepting the first iteration right away, and people let run their
> coccinelle-scripts based on that, it might get annoying to change that a =
second
> time, I'd think.

Okay, I'm willing to sit-tight on this for a bit.

g.
