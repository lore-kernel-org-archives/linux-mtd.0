Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SKPd8-0007Iz-85
 for linux-mtd@lists.infradead.org; Wed, 18 Apr 2012 07:48:47 +0000
Message-ID: <4F8E72B3.1090205@freescale.com>
Date: Wed, 18 Apr 2012 15:52:19 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd : add parsing code for one kind of Hynix's nand chip
References: <1334026606-18327-1-git-send-email-b32955@freescale.com>	<CAN8TOE8xz+t1X-JVC1sOy70k64_gRDU-6DkrnqtDkvdbELHQLQ@mail.gmail.com>	<4F86416B.4090501@freescale.com>
 <CAN8TOE_yhvB+xnyS_UZn0ko+QySFZJsYBk5w0PB_O37eZaQj9g@mail.gmail.com>
In-Reply-To: <CAN8TOE_yhvB+xnyS_UZn0ko+QySFZJsYBk5w0PB_O37eZaQj9g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Huang Shijie <shijie8@gmail.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B404=E6=9C=8818=E6=97=A5 13:00, Brian Norris =E5=86=99=
=E9=81=93:
> Now that I've given them all a second read, it really looks like this
> new Hynix chip actually follows no discernible pattern, which seems to
> suggest that we have to know all the chip parameters in order to know
> which ID decode table to use...but if we know all the parameters, then
> why do we need the table?? (Just being devil's advocate) If I had
This makes me confused too.
It looks like hardcode when i use the 0xd7 to disdinguish this nand chip.

> samples of all the chips, perhaps I could test some to determine other
> patterns, like ID wraparound behavior, but I doubt it...
>
> So really, I'd be interested in asking Hynix (and Toshiba and probably
> Samsung, for that matter): what do you expect software developers to
> do when you provide datasheets with useless ID decode tables? Are we
> supposed to read your mind to determine which chips are supposed to
> follow a given decode table?
>
> But seriously: let me know if you have better insight into how to
> associate this table with a set of chip IDs. Otherwise, I might as
I only have the H27UBG8T2A nand chip in my hand, and test it in the=20
imx28 board.
I do not have other nand chips which may also follow the same parsing=20
code as the H27UBG8T2A.


Best Regards
Huang Shijie

> well finish adding an 8-byte ID table and adding this one chip
> manually.
