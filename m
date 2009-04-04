Received: from mail-gx0-f160.google.com ([209.85.217.160])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lq0xo-0004Tz-Hv
	for linux-mtd@lists.infradead.org; Sat, 04 Apr 2009 08:10:59 +0000
Received: by gxk4 with SMTP id 4so3394914gxk.18
	for <linux-mtd@lists.infradead.org>;
	Sat, 04 Apr 2009 01:10:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090404073155.GA12392@turtle.localnet>
References: <20090404073155.GA12392@turtle.localnet>
Date: Sat, 4 Apr 2009 04:10:50 -0400
Message-ID: <8bd0f97a0904040110o6e595583m177fcbabad82d37e@mail.gmail.com>
Subject: Re: [PATCH] Fix erase timeout in M25P80 driver
From: Mike Frysinger <vapier.adi@gmail.com>
To: Peter Horton <zero@colonel-panic.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, tbm@cyrius.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Apr 4, 2009 at 03:31, Peter Horton wrote:
> =C2=A0static int wait_till_ready(struct m25p *flash)
> =C2=A0{
> - =C2=A0 =C2=A0 =C2=A0 int count;
> +# =C2=A0 =C2=A0 =C2=A0define DIV_U(n,d) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (((n)+(d)-1)/(d))
> +
> + =C2=A0 =C2=A0 =C2=A0 unsigned long deadline;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int sr;
>
> - =C2=A0 =C2=A0 =C2=A0 /* one chip guarantees max 5 msec wait here after =
page writes,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0* but potentially three seconds (!) after pa=
ge erase.
> + =C2=A0 =C2=A0 =C2=A0 deadline =3D jiffies + DIV_U(MAX_READY_WAIT_TIMEOU=
T * HZ, 1000);

there's already a macro for working with jiffies and time.  dont start
writing yet another one with its own ugly magic.  just look in
linux/jiffies.h.

> + =C2=A0 =C2=A0 =C2=A0 /* this can take a long time for sector erase.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* we should probably have a separate timeout
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* for program and erase and we should check
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* for signals ...

timeouts only occur when there's a problem.  a problematic system is
not normal, so having longer (and common) timeouts is fine because
they should never be reached.
-mike
