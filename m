Received: from mail-qa0-f42.google.com ([209.85.216.42])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TM2mz-0000IT-Fz
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 20:21:58 +0000
Received: by mail-qa0-f42.google.com with SMTP id t11so4807212qaa.15
 for <linux-mtd@lists.infradead.org>; Wed, 10 Oct 2012 13:21:55 -0700 (PDT)
Date: Wed, 10 Oct 2012 16:21:53 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 09/11] fsmc/nand:FIX: replace change_bit routine
In-Reply-To: <CACRpkdaot3DKCoJOBpUcJFVrJ89xRx2T58fDe4YKY_r4NFqEag@mail.gmail.com>
Message-ID: <alpine.LFD.2.02.1210101559250.16518@xanadu.home>
References: <cover.1349778820.git.vipin.kumar@st.com>
 <ec169eb041e87e66c06108e85ea4a67e5797cecc.1349778821.git.vipin.kumar@st.com>
 <CACRpkdaot3DKCoJOBpUcJFVrJ89xRx2T58fDe4YKY_r4NFqEag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, dedekind1@gmail.com,
 spear-devel@list.st.com, Vipin Kumar <vipin.kumar@st.com>,
 linux-mtd@lists.infradead.org, plagnioj@jcrosoft.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 10 Oct 2012, Linus Walleij wrote:

> On Tue, Oct 9, 2012 at 12:44 PM, Vipin Kumar <vipin.kumar@st.com> wrote:
> 
> > change_bit routine accepts only ulong pointers as buffer, so an unaligned char
> > pointer passed to change_bit may lead to a crash.
> >
> > Fix this bug by accessing the buffer as char pointer.
> 
> Why not see if we can fix change_bit() instead?
> Since I suspect this is on ARM I bet Russell and Nico
> want to hear about this if there is a problem.
> 
> Can the ARM change_bit() not be fixed, so that
> long arguments are the only option?

No.  It is this code which is totally broken.

The change_bit() is defined to operate on long values, in the _native_ 
endian.  Now imagine what this is going to do to your data buffer if 
instead you are running on a big endian device.

And I doubt there is anything requiring atomic bit manipulation here 
either.

> >                 if (err_idx[i] < chip->ecc.size * 8) {
> > -                       change_bit(err_idx[i], (unsigned long *)dat);
> > +                       uint8_t *p = dat + err_idx[i] / 8;
> > +                       *p = *p ^ (1 << (err_idx[i] % 8));
> 
> I'm one of these people who would write >>3 and
> &7 rather than /8 or %8 but I guess we are all
> different. Atleast consider it if you stick with this...

Better yet:

		dat[err_idx[i] / 8] ^= (1 << (err_idx[i] % 8));

The /8 and %8 will be changed into >>3 and &7 by the compiler anyway, 
while the /8 and %8 form is possibly a bit less obscure.

Of course, this needs to be done over _all_ this driver, not only a few 
cases.


Nicolas
