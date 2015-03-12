Received: from mail-oi0-x22c.google.com ([2607:f8b0:4003:c06::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YW9ag-0005mt-F7
 for linux-mtd@lists.infradead.org; Thu, 12 Mar 2015 20:20:23 +0000
Received: by oiav1 with SMTP id v1so13539012oia.3
 for <linux-mtd@lists.infradead.org>; Thu, 12 Mar 2015 13:20:01 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20150312152420.11C821A2425@localhost.localdomain>
References: <20150312152420.11C821A2425@localhost.localdomain>
Date: Thu, 12 Mar 2015 21:20:01 +0100
Message-ID: <CAMuHMdVuECs41hdUfdK9Q6-Kf53C874RC7PuvoqU8LieqgmDug@mail.gmail.com>
Subject: Re: [PATCH 0/8] powerpc/8xx: Getting rid of CONFIG_8xx
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Content-Type: text/plain; charset=UTF-8
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Vitaly Bordug <vitb@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Pantelis Antoniou <pantelis.antoniou@gmail.com>, Jiri Slaby <jslaby@suse.cz>,
 Richard Weinberger <richard@nod.at>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 David Woodhouse <dwmw2@infradead.org>,
 uml-devel <user-mode-linux-devel@lists.sourceforge.net>,
 Jeff Dike <jdike@addtoit.com>,
 uml-user <user-mode-linux-user@lists.sourceforge.net>,
 Scott Wood <scottwood@freescale.com>, Karsten Keil <isdn@linux-pingi.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 12, 2015 at 4:24 PM, Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
> Two config options exist to define powerpc MPC8xx:
> * CONFIG_PPC_8xx
> * CONFIG_8xx
> In addition, CONFIG_PPC_8xx also defines CONFIG_CPM1 as
> communication co-processor
>
> arch/powerpc/platforms/Kconfig.cputype has contained the following
> comment about CONFIG_8xx item for some years:
> "# this is temp to handle compat with arch=ppc"
>
> It looks like not many places still have that old CONFIG_8xx used,
> so it is likely to be a good time to get rid of it completely ?

We also have CONFIG_40x,. CONFIG_44x, and CONFIG_4xx.
There's no CONFIG_PPC_4* though.

Do we want (some) consistency?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
