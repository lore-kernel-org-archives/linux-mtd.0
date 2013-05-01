Received: from mail-ob0-x235.google.com ([2607:f8b0:4003:c01::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UXeCv-0002oM-E0
 for linux-mtd@lists.infradead.org; Wed, 01 May 2013 21:05:01 +0000
Received: by mail-ob0-f181.google.com with SMTP id ta17so1618244obb.12
 for <linux-mtd@lists.infradead.org>; Wed, 01 May 2013 14:04:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <6C00A5CD-15B0-41F3-9505-276081572E77@gmail.com>
References: <6C00A5CD-15B0-41F3-9505-276081572E77@gmail.com>
Date: Wed, 1 May 2013 23:04:35 +0200
Message-ID: <CAFLxGvwavoqqi6CTrNq+ASS-tch7sWou7z3QfmbMe6RKiFxSDQ@mail.gmail.com>
Subject: Re: UBI fastmap used PEB search
From: richard -rw- weinberger <richard.weinberger@gmail.com>
To: Brian Pomerantz <bapper@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

On Wed, May 1, 2013 at 7:18 PM, Brian Pomerantz <bapper@gmail.com> wrote:
> I have been doing some profiling on why it takes UBI attach longer as UBI=
 volumes fill up.  I found that the majority of time takes place in fastmap=
.c during the search of the used PEB list when matching for the volume's LE=
Bs.  Specifically, I saw that the inner loop "list_for_each_entry(tmp_aeb, =
&used, u.list)" gets hit a LOT.  The time it takes to search this list can =
be reduced if the attached patch is used, all it does is put a break in the=
 loop when the pnum is matched.  This seems so obvious I figure there must =
be a reason it isn't done this way and I'm just missing it, is the patch va=
lid or will it cause issues?  I'm also wondering if anyone has tried buildi=
ng the used list as a RB tree instead to further reduce the time spent spin=
ning through the list.

Nice catch!

Yeah, the break makes sense. I simply forgot it.
As pnum has to be unique we can stop processing after the found a matching =
pnum.
Do you have some numbers how much your fix improves the overall performance=
?

The current fastmap implementation is more or less a prove of concept
implementation,
I'm sure there is potential to gain more performance.
Patches are very welcome!

Thanks,
//richard

P.s: Can you please re-submit your patch in the proper "Linux kernel" forma=
t?
See: Documentation/SubmittingPatches
tl;dr: use scripts/checkpatch.pl and git send-email
