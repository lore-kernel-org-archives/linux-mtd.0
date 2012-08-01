Received: from co1ehsobe004.messaging.microsoft.com ([216.32.180.187]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SwOY6-0003eW-Vo
 for linux-mtd@lists.infradead.org; Wed, 01 Aug 2012 02:20:35 +0000
Message-ID: <501892C1.7060502@freescale.com>
Date: Wed, 1 Aug 2012 10:21:53 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH RESEND] mtd: nand: allow NAND_NO_SUBPAGE_WRITE to be set
 from driver
References: <1343696537-2564-1-git-send-email-computersforpeace@gmail.com>
 <50178A45.3000406@parrot.com> <501803C5.8080105@freescale.com>
In-Reply-To: <501803C5.8080105@freescale.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Marek Vasut <marex@denx.de>, Artem Bityutskiy <dedekind1@gmail.com>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B408=E6=9C=8801=E6=97=A5 00:11, Scott Wood =E5=86=99=
=E9=81=93:
> Why is it better to lie about ECC geometry than to just say "subpage
> writes aren't supported"?  Does/will the ECC geometry get used by upper
yes. I think it's better to provide an official method to let the driver=20
say: " i do not support the subpage writes."

Huang Shijie
