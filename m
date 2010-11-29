Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PN5Jv-0004Xp-1d
	for linux-mtd@lists.infradead.org; Mon, 29 Nov 2010 15:07:13 +0000
Received: by bwz5 with SMTP id 5so4181106bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 29 Nov 2010 07:07:08 -0800 (PST)
Subject: Re: Suggested patch: reset errno after isatty()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ketil Froyn <ketil@froyn.name>
In-Reply-To: <AANLkTikSEH4SOTYv9oqniP6-pPtRc0Y=M2+8hvdAirRg@mail.gmail.com>
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
	<AANLkTi=sKOzXnr-CZLvu_XP4gm5y15pL0HxS+=-=2ij7@mail.gmail.com>
	<AANLkTikSEH4SOTYv9oqniP6-pPtRc0Y=M2+8hvdAirRg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 29 Nov 2010 17:07:03 +0200
Message-ID: <1291043223.2141.15.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-11-25 at 09:58 +0100, Ketil Froyn wrote:
> On Wed, Nov 24, 2010 at 10:36 PM, Mike Frysinger <vapier.adi@gmail.com> wrote:
> >
> > awesome.  can you post your signed-off-by tag and/or a proper git patch please ?
> > -mike
> 
> I'm pretty new to git. Hope this is right.

Pushed this patch to the mtd-utils tree, thanks!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
