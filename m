Received: from am1ehsobe001.messaging.microsoft.com ([213.199.154.204]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TuN8Q-0004Gr-UL
 for linux-mtd@lists.infradead.org; Sun, 13 Jan 2013 12:58:00 +0000
From: <alessandro.maro@accenture.com>
To: <ricard.wanderlof@axis.com>
Subject: Re: Implementing NAND driver on a PrimeCell SMC PL350 series
Date: Sun, 13 Jan 2013 12:57:47 +0000
Message-ID: <6C54479A-73AD-4E1E-9F87-383E5CDCD40B@accenture.com>
References: <D9B11571-8012-4206-B903-A4C59B85F318@gmail.com>
 <alpine.DEB.2.00.1301111155250.13078@lnxricardw.se.axis.com>
 <6EBAA2A8-BB5B-47E8-9E89-4A4F2A5870BD@gmail.com>,
 <alpine.DEB.2.00.1301121214110.30304@lnxricardw.se.axis.com>
In-Reply-To: <alpine.DEB.2.00.1301121214110.30304@lnxricardw.se.axis.com>
Content-Language: it-IT
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: dt.tangr@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Inviato da iPhone

Il giorno 12/gen/2013, alle ore 12:25, "Ricard Wanderlof" <ricard.wanderlof=
@axis.com> ha scritto:

>
> On Sat, 12 Jan 2013, Daniel Tang wrote:
>
>> I didn't know high level functions could be overridden. Most of the driv=
ers I looked through didn't override the 'nand_command' function for exampl=
e, so I wasn't aware it was possible.
>
> A long time ago, the functions in nand_base.c were marked with things lik=
e "REPLACABLE" or somesuch to show that they could be replaced with user-de=
fined functions.
>
> I guess you have to read through things like nand_scan_defaults() e.g.
>
>        /* check, if a user supplied command function given */
>        if (chip->cmdfunc =3D=3D NULL)
>               chip->cmdfunc =3D nand_command;
>
> etc to get an idea of what to replace.
>
> Of course, if the existing driver framwork is not flexible enough for you=
r needs, patches are always welcome.
>
>> As per your advice, I also read through some of the other NAND drivers. =
Although they didn't have anything similar to what I need, I have a good id=
ea of where to head.
>
> Ok, good!
>
> /Ricard
> --
> Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden            www.axis.com
> Phone +46 46 272 2016                           Fax +46 46 13 61 30
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>

This message is for the designated recipient only and may contain privilege=
d, proprietary, or otherwise private information. If you have received it i=
n error, please notify the sender immediately and delete the original. Any =
other use of the e-mail by you is prohibited.

Where allowed by local law, electronic communications with Accenture and it=
s affiliates, including e-mail and instant messaging (including content), m=
ay be scanned by our systems for the purposes of information security and a=
ssessment of internal compliance with Accenture policy.

___________________________________________________________________________=
___________

www.accenture.com
