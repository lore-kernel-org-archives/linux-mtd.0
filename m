Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZGOo-0001Oy-Io
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 08:36:11 +0000
Message-ID: <5268DC8E.1040908@freescale.com>
Date: Thu, 24 Oct 2013 16:38:38 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: gpmi: fix the ecc regression
References: <1382418628-4521-1-git-send-email-b32955@freescale.com>
 <20131022185639.GK23337@ld-irv-0074.broadcom.com>
 <5268C56E.8050806@freescale.com>
 <20131024075249.GB9863@norris.computersforpeace.net>
In-Reply-To: <20131024075249.GB9863@norris.computersforpeace.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 dedekind1@gmail.com, tharvey@gateworks.com, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B410=E6=9C=8824=E6=97=A5 15:52, Brian Norris =E5=86=99=
=E9=81=93:
> David seemed to suggest that something like your current binding might
> be OK. (I still thing it was too vague, but if you can describe it
> better, it may be sufficient.) A possible starting point:
> "fsl,use-minimum-ecc". Does this properly reflect your intention of
> using the datasheet's minimum required ECC (from ONFI or from the
> driver's full ID table)?
yes, it's okay to me.

thanks
Huang Shijie
