Received: from na3sys009aog118.obsmtp.com ([74.125.149.244])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RHAnE-0008Up-3o
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2011 08:49:33 +0000
Received: by mail-qy0-f175.google.com with SMTP id 35so356718qyk.6
	for <linux-mtd@lists.infradead.org>;
	Fri, 21 Oct 2011 01:49:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1319127627.20953.8.camel@sauron>
References: <1318866038-11781-1-git-send-email-h-fache@ti.com>
	<1319127627.20953.8.camel@sauron>
Date: Fri, 21 Oct 2011 10:49:29 +0200
Message-ID: <CA+Xn3W3huOu_zu7MzSr0W1wpo7mD_ek8eOYNstkMnb9wm3-JZw@mail.gmail.com>
Subject: Re: [PATCH] phram: make kernel boot command line arguments work
From: "Fache, Herve" <h-fache@ti.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: joern@lazybastard.org, joern@logfs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Thu, Oct 20, 2011 at 18:20, Artem Bityutskiy <dedekind1@gmail.com> wrote=
:
>
> On Mon, 2011-10-17 at 17:40 +0200, h-fache@ti.com wrote:
>
> > -static int phram_setup(const char *val, struct kernel_param *kp)
> > +static int phram_init_called;
> > +static __initdata char phram_paramline[64+12+12];
>
> snip..
> > +static int phram_setup(const char *val, struct kernel_param *kp)
> > +{
>
> snip..
>
> > + =C2=A0 =C2=A0 strlcpy(phram_paramline, val, sizeof(phram_paramline));
>
> Accessing __initdata from non __init function. Please check that your
> patch does not introduce a new section mismatch. There is even a kernel
> config option to debug these issues.

I enabled DEBUG_SECTION_MISMATCH but I don't get errors. Also, this
part of the code will never be reached once init has run. If you think
that it's a risk, then I can remove the __initdata keyword.

Herv=C3=A9
--
Texas Instruments France SA, 821 Avenue Jack Kilby, 06270 Villeneuve
Loubet. 036 420 040 R.C.S Antibes. Capital de EUR 753.920
