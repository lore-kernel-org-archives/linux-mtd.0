Received: from mail-ob0-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1STXbK-0002xs-KD
 for linux-mtd@lists.infradead.org; Sun, 13 May 2012 12:08:39 +0000
Received: by obqv19 with SMTP id v19so7800037obq.36
 for <linux-mtd@lists.infradead.org>; Sun, 13 May 2012 05:08:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.00.1205060950090.3701@eddie.linux-mips.org>
References: <1335534510-12573-1-git-send-email-dedekind1@gmail.com>
 <4F9AD14E.9060008@gmail.com>
 <alpine.LFD.2.00.1205060754390.19691@eddie.linux-mips.org>
 <1336289676.1996.3.camel@koala>
 <alpine.LFD.2.00.1205060925070.3701@eddie.linux-mips.org>
 <1336293478.2801.4.camel@brekeke>
 <alpine.LFD.2.00.1205060950090.3701@eddie.linux-mips.org>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Sun, 13 May 2012 14:08:16 +0200
Message-ID: <CAOiHx=k75NsRWSsDNBd+1CVBwGYK6xHMZV_hrcfrs44OM_dFRg@mail.gmail.com>
Subject: Re: [PATCH 1/2] MIPS: Kbuild: remove -Werror
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: MIPS Mailing List <linux-mips@linux-mips.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Ralf Baechle <ralf@linux-mips.org>, David Daney <ddaney.cavm@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
On 6 May 2012 11:14, Maciej W. Rozycki <macro@linux-mips.org> wrote:
> On Sun, 6 May 2012, Artem Bityutskiy wrote:
>
>> > =C2=A0And my opinion is based on experience. =C2=A0Please check the LM=
O archives for
>> > why Ralf added this option in the first place -- many years ago. =C2=
=A0It's
>> > probably recorded in the git repository too (I'm not sure if the optio=
n
>> > was added before or after we moved away from CVS, but in any case old
>> > change logs have been imported when our current repo was created).
>>
>> We need to figure out how to make -Werror be applied only when we do not
>> have W=3D[123].
>
> =C2=A0Hmm, that sounds better, however has the counter-intuitive side-eff=
ect of
> lowering the severity of the warnings that are enabled even without
> W=3D[123].
>
> =C2=A0Modern versions of GCC have that selective -Wno-error=3Dfoo option =
and I
> think it should be possible to build the precise list of warnings not to
> choke on locally in arch/mips/Kbuild with little Makefile magic, falling
> back to something sane for older GCC versions (I'm not sure exactly when
> these selective options were added, certainly sometime between 4.1 and
> 4.3).
>
> =C2=A0This will be a bit imperfect if any of these additional -Wfoo optio=
ns
> duplicate ones already added to KBUILD_CFLAGS in our top-level Makefile
> (either explicitly or via -Wall), but that's about the best we can do.
> I'll see if I can cook up something quickly.

Hm, how about doing it the other way round, i.e. explicitly enable
which warnings we want to treat as errors with -Werror=3Dfoo? That way
we don't lower the severity when W=3D[123] and new default enabled
warnings in gcc can't break the build any more, just better (or worse
;-) heuristics can.


Jonas
