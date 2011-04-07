Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q7vTv-0002QZ-Fy
	for linux-mtd@lists.infradead.org; Thu, 07 Apr 2011 20:07:09 +0000
Received: by gyh20 with SMTP id 20so1273385gyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Apr 2011 13:07:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTikp9OAXUFwcvV24x=d7ts3G3VR4yQ@mail.gmail.com>
References: <1302188641-30514-1-git-send-email-fransmeulenbroeks@gmail.com>
	<BANLkTik9BcPTkgb_AwtmG6TPV1uwSxPP6A@mail.gmail.com>
	<BANLkTikp9OAXUFwcvV24x=d7ts3G3VR4yQ@mail.gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 7 Apr 2011 16:06:45 -0400
Message-ID: <BANLkTi=hBd3wgaC8YHrNYen++5d7F-LJOw@mail.gmail.com>
Subject: Re: [PATCH] flashcp: improve speed & some clean ups
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 7, 2011 at 15:56, Frans Meulenbroeks wrote:
>> your style throughout this patch is wrong. =C2=A0this is lkml style, not
>> GNU. =C2=A0for example:
>> =C2=A0- no space between func and open paren
>> =C2=A0- space after commas
>> =C2=A0- braces after if/while/for/etc... need to be cuddled
>
> Hm, yes, I noticed that I have been sloppy here with spaces and
> commas. Peeking back at the original source that also had those
> problems at some places.
> What style did you exactly want? Do you have a pointer? Are the above
> examples of what is wrong, or rules how it should be.
> I'm aware of lkml style

yes, the mtd-utils code base can be a bit messy itself.  but when
adding new code, we should aspire for correctness.  which means please
use lkml style.

> Wrt cuddled: English is not my native language. Do you mean you want
> the opening brace on the same line as the if ?

correct

>> ignoring the style issue you introduced, i dont see how your change
>> from %1$s to %s is correct. =C2=A0all you had to do was change PROGRAM_N=
AME
>> to progname.
>
> The change is tested and correct (I used progname twice).

sorry, when i said "correct", i did not mean that it would not work.
i'm sure your new version does.  i meant that the original version was
doing what was intended and it was not correct to change it.
certainly not without a pervasive argument.

> As it stands this change was already pending on my list to submit for
> quite a while. I guess the %1$s was replaced by %s because the libc I
> tested this with did not support the 1$ position specifier.
> Btw I am not too sure about the status of the positional modifiers and
> how standard it is. It definitely was not in c89/c90.

well, the C standard doesnt matter too much.  the POSIX standard however do=
es.

if i look at the recent specs:
2004: http://pubs.opengroup.org/onlinepubs/009695399/functions/printf.html
2008: http://pubs.opengroup.org/onlinepubs/9699919799/functions/printf.html

they are marked as XSI or CX, but in either case, in order to be
"POSIX compliant", your libc needs to support it.

i tend to leans towards "if it's in POSIX, it's fair game".  so you'll
need something more than "my libc doesnt like it" to sway me ;).

> Btw I feel the program (also in the current form is perhaps not too
> suitable for NAND flash as it does not contain any bad block detection
> or handling (unless ofc there is a translation layer on top of mtd).
> (please enlighten me if I am missing something here).

i think you're right.  this program is not geared towards flashes that
do bad block handling.  but i dont think that is a bad thing, nor
should you worry about it.
-mike
