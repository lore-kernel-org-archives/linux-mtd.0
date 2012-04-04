Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SFXEf-00013F-L1
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2012 20:55:23 +0000
Received: by eaak13 with SMTP id k13so289248eaa.36
 for <linux-mtd@lists.infradead.org>; Wed, 04 Apr 2012 13:55:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOdLEaoboQowyx3T9ONjv-Y3q1JfFRb4ahS8CNrzeJi3N8Dczg@mail.gmail.com>
References: <CAOdLEarFOdmDBS0iDmafLeBU=NNWxWjejTvJ-eEkQjRO12+VYg@mail.gmail.com>
 <20120404070157.GB24930@pengutronix.de>
 <CAOdLEaqXyvHzTRSq2=RquZLqEO6kMEp11rjKJ+UtSqtF4nr-EA@mail.gmail.com>
 <20120404183314.GF17187@pengutronix.de>
 <CAOdLEaoboQowyx3T9ONjv-Y3q1JfFRb4ahS8CNrzeJi3N8Dczg@mail.gmail.com>
Date: Wed, 4 Apr 2012 17:55:16 -0300
Message-ID: <CAOMZO5AsbFDXHs3JRLC5=1MjZ7QrxciqV25xpZQL1Yvk3boQmw@mail.gmail.com>
Subject: Re: Using GPMI-NAND driver on iMX28 using 3.4-rc1?
From: Fabio Estevam <festevam@gmail.com>
To: Sam Gandhi <samgandhi9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Wolfram Sang <w.sang@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 4, 2012 at 5:27 PM, Sam Gandhi <samgandhi9@gmail.com> wrote:

> However moment I try to do =C2=A0flash_erase /dev/mtd1 0 0 I see followin=
g error:
>
> kernel BUG at /home/sam/linux/drivers/dma/dmaengine.h:53!
> Internal error: Oops - BUG: 0 [#1] PREEMPT ARM
> Modules linked in:
> CPU: 0 =C2=A0 =C2=A0Not tainted =C2=A0(3.4.0-rc1-09874-g9e81810-dirty #6)
> PC is at mxs_dma_int_handler+0xfc/0x16c
> LR is at handle_irq_event_percpu+0xc4/0x258
> pc : [<c024c924>] =C2=A0 =C2=A0lr : [<c006e47c>] =C2=A0 =C2=A0psr: 600000=
93
> sp : c3b99b00 =C2=A0ip : c3b99b28 =C2=A0fp : c3b99b24
> r10: 00000000 =C2=A0r9 : c0529058 =C2=A0r8 : 00000000
> r7 : 00000010 =C2=A0r6 : 00000004 =C2=A0r5 : c3811000 =C2=A0r4 : 00000004
> r3 : c38111e0 =C2=A0r2 : 00000000 =C2=A0r1 : 00000000 =C2=A0r0 : 00000058
> Flags: nZCv =C2=A0IRQs off =C2=A0FIQs on =C2=A0Mode SVC_32 =C2=A0ISA ARM =
=C2=A0Segment user
> Control: 0005317f =C2=A0Table: 42ce4000 =C2=A0DAC: 00000015
> Process flash_erase (pid: 1214, stack limit =3D 0xc3b98270)

Please try reverting commit 00292bbf. Check
http://www.spinics.net/lists/kernel/msg1321399.html
