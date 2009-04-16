Received: from mail-gx0-f160.google.com ([209.85.217.160])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LuSDy-0002Jd-4g
	for linux-mtd@lists.infradead.org; Thu, 16 Apr 2009 14:06:02 +0000
Received: by gxk4 with SMTP id 4so2652766gxk.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Apr 2009 07:05:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1239889899.3390.216.camel@localhost.localdomain>
References: <1239883845-17804-1-git-send-email-sr@denx.de>
	<fa686aa40904160626k118cea3cvc0db38a2277e45b8@mail.gmail.com>
	<200904161537.59048.sr@denx.de>
	<fa686aa40904160646v75a98e02s446fd89c08cfebae@mail.gmail.com>
	<1239889899.3390.216.camel@localhost.localdomain>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Thu, 16 Apr 2009 08:05:38 -0600
Message-ID: <fa686aa40904160705x432affadw4eb921aa3ea8f07e@mail.gmail.com>
Subject: Re: [PATCH 1/3 v3] mtd: physmap_of: Add multiple regions and
	concatenation support
To: dedekind@infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linuxppc-dev@ozlabs.org, Stefan Roese <sr@denx.de>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	devicetree-discuss@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 16, 2009 at 7:51 AM, Artem Bityutskiy
<dedekind@infradead.org> wrote:
> On Thu, 2009-04-16 at 07:46 -0600, Grant Likely wrote:
>> On Thu, Apr 16, 2009 at 7:37 AM, Stefan Roese <sr@denx.de> wrote:
>> > On Thursday 16 April 2009, Grant Likely wrote:
>> >> > Signed-off-by: Stefan Roese <sr@denx.de>
>> >> > Reviewd-by: Grant Likely <grant.likely@secretlab.ca>
>> >>
>> >> Yup, still looks good to me. =A0What boards has this been tested on?
>> >
>> > I tested this version on PPC405EX Kilauea equipped only one "standard"
>> > Spansion S29GL512 NOR chip. And a slightly modified version on an MPC8=
360
>> > board (kmeter1) which is equipped with the Intel P30 part mentioned in=
 the
>> > bindings description. Slightly modified since this board support is no=
t yet
>> > pushed upstream and currently using v2.6.28 (physmap_of.c has received=
 minor
>> > modifications after 2.6.28 release).
>>
>> Okay. =A0It will be good to get this one into -next for some testing
>> exposure. =A0Unless he asks me to do otherwise, I'll leave this one to
>> David to pick up.
>
> David usually picks up stuff just before or during merge window,
> so if you want linux-next exposure, you need to have some extra
> care.

Okay, thanks.

David, I'd like to get this into a -next tree.  Are you okay with it
going in via the powerpc tree?

g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
