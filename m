Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SQ4be-0002nH-NR
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 22:34:39 +0000
Received: by yenr9 with SMTP id r9so629206yen.36
 for <linux-mtd@lists.infradead.org>; Thu, 03 May 2012 15:34:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120503204307.6d93115d@halley>
References: <1335978904-8005-1-git-send-email-computersforpeace@gmail.com>
 <1335978904-8005-2-git-send-email-computersforpeace@gmail.com>
 <4FA2BD85.1050102@newsguy.com> <20120503204307.6d93115d@halley>
Date: Thu, 3 May 2012 15:34:36 -0700
Message-ID: <CAN8TOE9ETNcbFamO-rAzb-5GzTwA9x7UiOzgjC+E_rPJPWQ7Zw@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] mtd: nand: add 'oob_required' argument to NAND
 {read, write}_page interfaces
From: Brian Norris <computersforpeace@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Mike Dunn <mikedunn@newsguy.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Lei Wen <leiwen@marvell.com>, Kevin Cernekee <cernekee@gmail.com>,
 Wolfram Sang <w.sang@pengutronix.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Bastian Hecht <hechtb@googlemail.com>, Jiandong Zheng <jdzheng@broadcom.com>,
 Florian Fainelli <ffainelli@freebox.fr>, Scott Wood <scottwood@freescale.com>,
 Jamie Iles <jamie@jamieiles.com>, Thomas Gleixner <tglx@linutronix.de>,
 Li Yang <leoli@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 Axel Lin <axel.lin@gmail.com>, Prabhakar Kushwaha <prabhakar@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mike and Shmulik,

On Thu, May 3, 2012 at 10:43 AM, Shmulik Ladkani
<shmulik.ladkani@gmail.com> wrote:
>> Still, it seems inconsistent. =A0When calling the functions, you sometim=
es pass
>> the bool form...
>>
>> > - =A0 status =3D docg4_read_page(mtd, nand, buf, DOCG4_FACTORY_BBT_PAG=
E);
>> > + =A0 status =3D docg4_read_page(mtd, nand, buf, false, DOCG4_FACTORY_=
BBT_PAGE);
>>
>> and sometimes the int form...
>>
>> > - =A0 chip->ecc.read_page_raw(mtd, chip, buf, page);
>> > + =A0 chip->ecc.read_page_raw(mtd, chip, buf, 1, page);
>
> I guess the 'true/false' arguments are leftovers from Brian's previous
> posts...

Yes, accidental leftovers.

> I noted these while reviewing, and personally don't mind them, but I
> guess '0/1' are more appropriate.

Yes, these should all be 0/1. It shouldn't be a significant issue,
except for consistency.

Artem: I fixed these up and sent a fixup patch.

[Mike:] "Aside from that, you can add my Acked-by for the docg4 driver
if you like."

The docg4 stuff already went into l2-mtd-2.6.git; Artem can add the
Acked-by as he rebases.

Brian
