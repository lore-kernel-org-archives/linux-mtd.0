Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PLN0u-0002PA-7G
	for linux-mtd@lists.infradead.org; Wed, 24 Nov 2010 21:36:33 +0000
Received: by wwb13 with SMTP id 13so139795wwb.0
	for <linux-mtd@lists.infradead.org>;
	Wed, 24 Nov 2010 13:36:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTinTpe=niqS87JRR4h53TJ803ohs3e2MwiVFstgR@mail.gmail.com>
References: <AANLkTimwumfui-_T1ScDYwMLKbNh1ia-SDMUg56wTfN5@mail.gmail.com>
	<4CD11C03.3090207@parrot.com>
	<AANLkTimfxjrtV4eks5tK68h6TQ20soib+6gaTC+QyB4a@mail.gmail.com>
	<AANLkTinSj2vAJJjeSxF-rvq08OVsnw3YcpRSpuOfv9pQ@mail.gmail.com>
	<AANLkTikQtNwsPkJSkmpmC=kMZpmdqHDW0HROeUBNDOEi@mail.gmail.com>
	<1289646433.2218.22.camel@localhost>
	<1289649338.2218.42.camel@localhost>
	<AANLkTink+0WvCmQWwd4+Vf8TETjR5-6BsGU=a071Rk0+@mail.gmail.com>
	<AANLkTim7TT8ydMiSX8B2ehJP2kQ6jtGSnEZU98AZjWUf@mail.gmail.com>
	<AANLkTimHCBNCcc3suXv4kJ4+MXUSf5Tw2r876A7tqtoL@mail.gmail.com>
	<AANLkTinzqwsEFoG+Z0S0ep7JN3p4jHugkHhN-J19Y3cn@mail.gmail.com>
	<1290607959.2793.11.camel@localhost>
	<AANLkTinTpe=niqS87JRR4h53TJ803ohs3e2MwiVFstgR@mail.gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Wed, 24 Nov 2010 16:36:04 -0500
Message-ID: <AANLkTi=sKOzXnr-CZLvu_XP4gm5y15pL0HxS+=-=2ij7@mail.gmail.com>
Subject: Re: Suggested patch: reset errno after isatty()
To: Ketil Froyn <ketil@froyn.name>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 24, 2010 at 09:30, Ketil Froyn wrote:
> On Wed, Nov 24, 2010 at 3:12 PM, Artem Bityutskiy wrote:
>>
>> So it dies very soon. You should easily find the line of code where this
>> happens with gdb. Just compile nanddump with -g -O0
>
> It's just that I have limited tools on my device where this happens.
> But I've finally pinned it!
>
> There's a couple of issues, I guess. Firstly, calling mtd_read_oob()
> with an oob_size of 0 segfaults, which I guess it shouldn't. I haven't
> looked into that. The problem here was that the oob_size was set to 0,
> and that happens because the legacy code forgot to set it. This patch
> fixes it for me:

awesome.  can you post your signed-off-by tag and/or a proper git patch please ?
-mike
