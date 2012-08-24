Received: from mail-vb0-f49.google.com ([209.85.212.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T4rEw-0007Lu-K3
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 10:35:47 +0000
Received: by vbbfo1 with SMTP id fo1so2044783vbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 24 Aug 2012 03:35:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <503758E0.7000408@freescale.com>
References: <1343514565-8983-1-git-send-email-festevam@gmail.com>
 <1343514565-8983-2-git-send-email-festevam@gmail.com>
 <1345734503.2848.247.camel@sauron.fi.intel.com>
 <CAMiH66GeHEet7NUNn+NPJKY9LgWf1whPgOXdQOFAZZUraWMnOw@mail.gmail.com>
 <1345790488.2848.252.camel@sauron.fi.intel.com>
 <503758E0.7000408@freescale.com>
Date: Fri, 24 Aug 2012 18:35:35 +0800
Message-ID: <CAMiH66H=g93KVUAjQs2uByCutawVgc+ywWQ3R2yisO0uGNOzWA@mail.gmail.com>
Subject: Re: [PATCH 1/2] nand: nand_bbt: Export nand_update_bbt
From: Huang Shijie <shijie8@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Fabio Estevam <fabio.estevam@freescale.com>, dedekind1@gmail.com,
 dwmw2@infradead.org, linux-mtd@lists.infradead.org, marex.vasut@denx.de,
 kernel@pengutronix.de, shawn.guo@linaro.org,
 Fabio Estevam <festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 24, 2012 at 6:35 PM, Huang Shijie <b32955@freescale.com> wrote:
> =E4=BA=8E 2012=E5=B9=B408=E6=9C=8824=E6=97=A5 14:41, Artem Bityutskiy =E5=
=86=99=E9=81=93:
>
>> The default function seem to do the same as your function does. You
>> select where you keep your OOB using chip options, and the default
>> function does the right thing, no?
>
> The key issue is that the mx23 should copies the bad block mark into the
> "first byte of the nand page",
> while the other chips does do this.

s/does/does not/

>
> I don't think the default function do the same thing. You see:
>   nand_default_block_markbad() --> nand_do_write_oob() -->
> chip->ecc.write_oob() -->gpmi_ecc_write_oob()
>
> The gpmi_ecc_write_oob() does nothing,but return -EPERM.
>
> Huang Shijie
>
>
>
>
