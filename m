Received: from mailsec102.isp.belgacom.be ([195.238.20.98])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yvue9-00049G-7S
 for linux-mtd@lists.infradead.org; Fri, 22 May 2015 21:38:26 +0000
Date: Fri, 22 May 2015 23:37:43 +0200 (CEST)
From: Fabian Frederick <fabf@skynet.be>
Reply-To: Fabian Frederick <fabf@skynet.be>
To: Richard Weinberger <richard@nod.at>
Message-ID: <357577728.30474.1432330663780.open-xchange@webmail.nmp.proximus.be>
In-Reply-To: <555B797B.90309@nod.at>
References: <1431726240-4675-1-git-send-email-fabf@skynet.be>
 <1431726240-4675-6-git-send-email-fabf@skynet.be>
 <CAFLxGvy=QWcaHbgQyk+WjH1KX__u1Ye6eZ+W4NR7RTifQy3CWQ@mail.gmail.com>
 <1796356142.534811.1432057342188.open-xchange@webmail.nmp.proximus.be>
 <555B797B.90309@nod.at>
Subject: Re: [PATCH 6/6 linux-next] ubifs: remove else after return
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Adrian Hunter <adrian.hunter@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> On 19 May 2015 at 19:57 Richard Weinberger <richard@nod.at> wrote:
>
>
> Am 19.05.2015 um 19:42 schrieb Fabian Frederick:
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0All was compiled but untested.
>
> Can you please test your changes too?
> Trivial looking changes introduce sometimes issues and having them
> tested would be wonderful.
>
> You can test UBIFS using nandsim or mtdram on any Linux
> system.
> See: http://www.linux-mtd.infradead.org/faq/nand.html#L_nand_nandsim

I guess the following patches can be applied without testing ?

http://marc.info/?l=3Dlinux-kernel&m=3D143172631802498&w=3D2

http://marc.info/?l=3Dlinux-kernel&m=3D143172628602483&w=3D2

http://marc.info/?l=3Dlinux-kernel&m=3D143172627102471&w=3D2

Other stuff was indeed purely cosmetic :)

Regards,
Fabian

>
> Thanks,
> //richard
