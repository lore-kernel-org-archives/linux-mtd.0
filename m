Received: from mail-gx0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5hWM-0006wk-5a
 for linux-mtd@lists.infradead.org; Thu, 08 Mar 2012 17:52:58 +0000
Received: by ggnk1 with SMTP id k1so452375ggn.36
 for <linux-mtd@lists.infradead.org>; Thu, 08 Mar 2012 09:52:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMjpGUc1m8D-nKVoddTehEDfx0r9R+sMTgtqxkfEG9W2Ok6-6w@mail.gmail.com>
References: <1330726673-9860-1-git-send-email-computersforpeace@gmail.com>
 <CAMjpGUc1m8D-nKVoddTehEDfx0r9R+sMTgtqxkfEG9W2Ok6-6w@mail.gmail.com>
Date: Thu, 8 Mar 2012 09:52:56 -0800
Message-ID: <CAN8TOE9yLLnV2_imd0GUbue+z0A2PNdD6Vz7qr2dYaVjsugN=w@mail.gmail.com>
Subject: Re: [PATCH (mtd-utils)] Makefile: fix "make clean" for old GNU find
From: Brian Norris <computersforpeace@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 8, 2012 at 8:54 AM, Mike Frysinger <vapier.adi@gmail.com> wrote=
:
> On Fri, Mar 2, 2012 at 17:17, Brian Norris <computersforpeace@gmail.com> =
wrote:
>> However, it will launch a lot more `rm' processes...
>
> indeed, that does suck. =A0you could do this, but it kind of sucks too ..=
.
> CLEAN_FIND =3D find "$(BUILDDIR)/" -xdev '(' -name '*.[ao]' -o -name
> '.*.c.dep' ')'
> ...
> =A0 =A0@if test -d "$(BUILDDIR)/"; then
> =A0 =A0 =A0 =A0$(CLEAN_FIND) -exec rm -f {} + 2>/dev/null || \
> =A0 =A0 =A0 =A0$(CLEAN_FIND) -exec rm -f {} \; ; \
> =A0 =A0fi

I'm fine with that too. It's a little uglier, but it's not quite as
bad for systems that have a modern `find', I think. I'll resend with
your suggestion if there are no better suggestions.

Brian
