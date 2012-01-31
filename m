Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsHmw-0002eX-NL
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 17:46:39 +0000
Received: by ghbg20 with SMTP id g20so193977ghb.36
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2012 09:46:37 -0800 (PST)
MIME-Version: 1.0
Sender: linus971@gmail.com
In-Reply-To: <CALJbWeptUqUyVrNZOeQz-toE=akT31L8MLubMj8FKjKy05ppzg@mail.gmail.com>
References: <CALJbWeoznAvoSzdBp0Kunn+uxqB0XafrLmp7im=49ST340vSjw@mail.gmail.com>
 <CA+55aFzaErfoKG5KEyRMnjHS1=XbA7FNHRhF3J2iR8-m6PqtxQ@mail.gmail.com>
 <CALJbWep4pD69wP76Fcwupw0ppoztOpfHPnv7RvczW06Ko0E4YQ@mail.gmail.com>
 <CA+55aFyquFTUxgtHNRdz-rwha7H2bBocC6hw67a_g0FxG_=95Q@mail.gmail.com>
 <CALJbWeptUqUyVrNZOeQz-toE=akT31L8MLubMj8FKjKy05ppzg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Jan 2012 09:46:17 -0800
Message-ID: <CA+55aFzruneRNt28L5d_fX71-YSGmMXL=4kck_pQbxob4_2+8g@mail.gmail.com>
Subject: Re: [GIT PULL] logfs: bug fixes
To: Prasad Joshi <prasadjoshi.linux@gmail.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 David Woodhouse <David.Woodhouse@intel.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 31, 2012 at 9:02 AM, Prasad Joshi
<prasadjoshi.linux@gmail.com> wrote:
>
> I have pushed the signed tag on the master branch as suggested by you

Ok, this works, but please don't put auto-generated content with no
semantics in the tag message. The shortlog and diffstat don't actually
tell me anything new - I can see those from the git details directly.

I want to see them in the *email* - so that I know what I'm pulling
beforehand, and so that I know that you are aware of what you are
pushing me - but there's no point in putting them in the signed tag.

So please put your own explanations for what is going on (if there is
anything half-way interesting) in the signed tag message, but not
anything that can be seen automatically from git itself. You signed
it, that signature covers the contents, but explanations for humans
are interesting.

Anyway, it does have a conflict. And I can (and did) easily resolve
the conflict that I get, even if I can't really test my end result.

HOWEVER: the conflict has a major semantic component to it that I want
people to discuss and be aware of my resolution.

So the conflict is between

 - commit f2933e86ad93: "Logfs: Allow NULL block_isbad() methods"

 - commits 7086c19d0742: "mtd: introduce mtd_block_isbad interface"
and d58b27ed58a3: "logfs: do not use 'mtd->block_isbad' directly"

both of which change how mtd->block_isbad' is used (the first
semantically by logfs, the others change the interface)

Now, my reaction and resolution to the conflict is to actually take
the *semantics* from commit f2933e86ad93, and just make
mtd_block_isbad() return zero (false) if the 'block_isbad' function is
NULL. But that also means that now "mtd_can_have_bb()" always returns
0.

At the same time, "mtd_block_markbad()" will obviously return an error
if the low-level driver doesn't support bad blocks, so this is
somewhat non-symmetric, but it actually makes sense if a NULL
"block_isbad" function is considered to mean "I assume that all my
blocks are always good".

Anyway, it is possible that the MTD people react very negatively to
this semantic change, but quite frankly, 99% of all uses of the new
mtd_block_isbad() function treated it as a boolean, so returning an
error from it didn't actually *work* correctly - and also made that
whole mtd_can_have_bb() function kind of pointless.

Essentially nobody checked it anyway with a *very* few exceptions. And
the mtd_can_have_bb() function was imnsho clearly misdesigned for the
whole concept.

So I think my resolution is reasonable, but I also think that you guys
should look at

 - getting rid of mtd_can_have_bb() entirely as being stupid
(mtd_block_isbad() does the right thing regardless - if the MTD
supports bad blocks it will do the right thing, and if it doesn't, it
will do the best thing it can)

 - instead introduce a "mtd_can_mark_blockbad()" and use that as a
"does this MTD device support *explicit* bad blocks" thing.

Some uses may care about that "does it support bad blocks explicitly",
but nobody should ever care about "can_have_bb()". Possibly somebody
could care about the "inverse", in the sense that some filesystem
might want to only support devices that are defined to be perfect, but
that doesn't sound much like a MTD filesystem.

Anyway, I think you guys should have discussed this conflict when you
saw it in -next (or when the MTD people changed the fs/logfs code - I
see that J=F6rn was cc'd).

As it is, I just did what I think was the "RightThing(tm)". Please
discuss, and feel free to send me patches/pull requests for whatever
resolution you get to.

                        Linus
