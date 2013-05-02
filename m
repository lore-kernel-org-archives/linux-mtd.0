Received: from mail-pa0-f47.google.com ([209.85.220.47])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UXhKT-0006bS-1s
 for linux-mtd@lists.infradead.org; Thu, 02 May 2013 00:24:57 +0000
Received: by mail-pa0-f47.google.com with SMTP id kl13so35221pab.20
 for <linux-mtd@lists.infradead.org>; Wed, 01 May 2013 17:24:35 -0700 (PDT)
Content-Type: text/plain; charset=iso-8859-1
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
Subject: Re: UBI fastmap used PEB search
From: Brian Pomerantz <bapper@gmail.com>
In-Reply-To: <CAFLxGvwavoqqi6CTrNq+ASS-tch7sWou7z3QfmbMe6RKiFxSDQ@mail.gmail.com>
Date: Wed, 1 May 2013 17:24:33 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <19F8F9AF-96A1-4ACF-B0A5-9A9B7D4EB326@gmail.com>
References: <6C00A5CD-15B0-41F3-9505-276081572E77@gmail.com>
 <CAFLxGvwavoqqi6CTrNq+ASS-tch7sWou7z3QfmbMe6RKiFxSDQ@mail.gmail.com>
To: richard -rw- weinberger <richard.weinberger@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On May 1, 2013, at 2:04 PM, richard -rw- weinberger =
<richard.weinberger@gmail.com> wrote:

>=20
> Yeah, the break makes sense. I simply forgot it.
> As pnum has to be unique we can stop processing after the found a =
matching pnum.
> Do you have some numbers how much your fix improves the overall =
performance?

Off the top of my head (that was last week, I need to rerun the tests to =
get real numbers), with two volumes at 400MB each almost filled with =
UBIFS, that test in the loop for pnum was hit more than 2,200,000 times. =
 With the break in there it was more like 1,200,000 times.  This knocked =
off some 100ms off my attach time.

>=20
> The current fastmap implementation is more or less a prove of concept
> implementation,
> I'm sure there is potential to gain more performance.
> Patches are very welcome!

I think I'll try using a RB tree to see if the overhead is offset by the =
search time savings.  At the very least, the attach time would be more =
consistent no matter how full the volumes get.

Another idea I was kicking around that might be easier than passing =
processed attach data to the kernel is short circuiting the attach =
process in u-boot to only process the volume that contains the kernel.  =
This would take significantly less time than processing all of the =
volumes.

>=20
> Thanks,
> //richard
>=20
> P.s: Can you please re-submit your patch in the proper "Linux kernel" =
format?
> See: Documentation/SubmittingPatches
> tl;dr: use scripts/checkpatch.pl and git send-email

Okay, just resubmitted.  It's been a while so hopefully I got it right. =
:)


--Brian
