Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T9aIi-0007La-LQ
 for linux-mtd@lists.infradead.org; Thu, 06 Sep 2012 11:31:13 +0000
Received: by wibhq4 with SMTP id hq4so4631976wib.0
 for <linux-mtd@lists.infradead.org>; Thu, 06 Sep 2012 04:31:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201209061307.53014.jbe@pengutronix.de>
References: <CACKLOr0zCCZ0WNpGiOOvoUk4s_vR5Ls4aw6PhXDoYeNQFTESgQ@mail.gmail.com>
 <504871AF.7040809@gmail.com>
 <201209061257.26566.jbe@pengutronix.de>
 <201209061307.53014.jbe@pengutronix.de>
Date: Thu, 6 Sep 2012 13:31:09 +0200
Message-ID: <CACKLOr1ZA_KzTbj4ntqgaCiQ9pyxD2xj+KcrZBawERmnCYQEqg@mail.gmail.com>
Subject: Re: [1/1] mxc_nand : allow swapping the Bad block Indicator for NFC
 v1.
From: javier Martin <javier.martin@vista-silicon.com>
To: Juergen Beisert <jbe@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Fabio Estevam <fabio.estevam@freescale.com>, linux-mtd@lists.infradead.org,
 =?ISO-8859-1?Q?Ga=EBtan_Carlier?= <gcembed@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Juergen,

On 6 September 2012 13:07, Juergen Beisert <jbe@pengutronix.de> wrote:
> Juergen Beisert wrote:
>> Ga=EBtan Carlier wrote:
>> > [...]
>> >
>> > > Furthermore, what I can't guess is where that 0x7D0 comes from. I kn=
ow
>> > > J=FCrgen described something related to the spare area being mixed w=
ith
>> > > the data (main) area but, is there any documentation about it we can
>> > > check?
>>
>> Maybe this image could help to understand:
>>
>> http://imagebin.org/227389
>
> Ups, just recognized the green line points to the wrong page offset. Sorr=
y.
> But the rest should show the real behaviour of these NFCs.
>

OK, that was very clarifying. I know understand where the offset comes from=
.

Thank you very much.

Regards.
--=20
Javier Martin
Vista Silicon S.L.
CDTUC - FASE C - Oficina S-345
Avda de los Castros s/n
39005- Santander. Cantabria. Spain
+34 942 25 32 60
www.vista-silicon.com
