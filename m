Received: from mail-pg0-x22d.google.com ([2607:f8b0:400e:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eNoSb-0000se-VH
 for linux-mtd@lists.infradead.org; Sat, 09 Dec 2017 23:23:12 +0000
Received: by mail-pg0-x22d.google.com with SMTP id j4so8764256pgp.1
 for <linux-mtd@lists.infradead.org>; Sat, 09 Dec 2017 15:22:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sat, 9 Dec 2017 20:22:48 -0300
Message-ID: <CAAEAJfAjd0mn7n_GqGAtsftfd_ihXjDgqR-z5BEpYjgY85RSCg@mail.gmail.com>
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
To: =?UTF-8?Q?Sean_Nyekj=C3=A6r?= <sean.nyekjaer@prevas.dk>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Kasper Revsbech (KREV)" <krev@triax.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 28 November 2017 at 06:12, Sean Nyekj=C3=A6r <sean.nyekjaer@prevas.dk> w=
rote:
> Hi Ezequiel
>
> I'm currently in the process of doing bringup on a custom armada 38x boar=
d.
> During the firsts boots of the Linux kernel we saw that the NAND driver
> throws a lot of timeout messages.
>
> Like this:
> [ 28.321054] pxa3xx-nand f10d0000.flash: Wait time out!!!
> [ 28.521054] pxa3xx-nand f10d0000.flash: Wait time out!!!
> [ 28.721054] pxa3xx-nand f10d0000.flash: Wait time out!!!
>
> That lead me to investigate the issue and found this thread (quite old):
> https://www.spinics.net/lists/arm-kernel/msg488581.html
>
> In the thread some is describing a possible race condition when the NAND
> framework is scanning for bad blocks.
> 1. I tried enabling PREEMPT with no success.
> 2. I tried with commenting out the bad block scanning function, with succ=
ess
> but not very useful :-)
> 3. I enabled the BBT function in uboot and the kernel, and that apparentl=
y
> fixes the problem.

Which means you were not using the BBT. Any idea why?
Storing bad-block information in the NAND block itself,
is a bad idea. I suggest you use BBT.

To be frank, I can't recall if the driver supported OOB read/writes
in all modes. It should, judging from the code, but maybe
there is a bug somewhere.

In any case, most of the OOB is used for ECC. There are
some nice notes about it here [1]
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
