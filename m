Received: from va3ehsobe001.messaging.microsoft.com ([216.32.180.11]
	helo=VA3EHSOBE008.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvXFu-0002Sb-TO
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2011 16:21:43 +0000
Message-ID: <4E52819C.8080204@freescale.com>
Date: Mon, 22 Aug 2011 11:19:40 -0500
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH v3] mtd/nand : workaround for Freescale FCM to support
	large-page Nand chip
References: <1313634783-8855-1-git-send-email-b35362@freescale.com>
	<4E4D452C.7050805@parrot.com> <4E4DD661.5080006@freescale.com>
	<4E4E2571.20409@parrot.com> <4E4EA70B.9050203@freescale.com>
	<1314010719.2644.114.camel@sauron>
	<20110822152530.GA16794@parrot.com>
	<4E527E0F.1010500@freescale.com> <4E528036.5070801@parrot.com>
In-Reply-To: <4E528036.5070801@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <dedekind1@gmail.com>, LiuShuo <b35362@freescale.com>,
	"linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Ivan Djelic <ivan.djelic@parrot.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/22/2011 11:13 AM, Matthieu CASTET wrote:
> Scott Wood a =C3=A9crit :
>> To eliminate it we'd need to do an extra data transfer without reissui=
ng
>> the command, which Shuo was unable to get to work.
>>
> That's weird because our controller seems quite flexible [1].
>=20
> Something like that should work ?
>=20
>             out_be32(&lbc->fir,
>                      (FIR_OP_CM2 << FIR_OP0_SHIFT) |
>                      (FIR_OP_CA  << FIR_OP1_SHIFT) |
>                      (FIR_OP_PA  << FIR_OP2_SHIFT) |
>                      (FIR_OP_WB  << FIR_OP3_SHIFT));
> refill FCM buffer with next 2k data
>=20
>             out_be32(&lbc->fir,
>                      (FIR_OP_WB  << FIR_OP3_SHIFT) |
>                      (FIR_OP_CM3 << FIR_OP4_SHIFT) |
>                      (FIR_OP_CW1 << FIR_OP5_SHIFT) |
>                      (FIR_OP_RS  << FIR_OP6_SHIFT));

Something like that is what I originally suggested, but Shuo said it
didn't work (even in theory, it requires a CE-don't-care NAND chip,
since bus atomicity is broken).

Shuo, what specifically did you try, and what did you see happen?

-Scott
