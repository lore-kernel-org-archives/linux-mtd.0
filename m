Received: from mail-la0-f50.google.com ([209.85.215.50])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSAlX-0007wh-Sm
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 21:19:24 +0000
Received: by lalv9 with SMTP id v9so11077887lal.0
 for <linux-mtd@lists.infradead.org>; Wed, 19 Aug 2015 14:19:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1440009015-3765-1-git-send-email-robert.jarzmik@free.fr>
References: <1440009015-3765-1-git-send-email-robert.jarzmik@free.fr>
Date: Wed, 19 Aug 2015 18:18:57 -0300
Message-ID: <CAAEAJfAuV7shpbp=k_dd4L6cSJcu4E+WVRcRpipXKBq0aGwT3w@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/2] mtd: nand: pxa3xx-nand: fixes
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 19 August 2015 at 15:30, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> Hi Brian,
>
> As promised, here are the remaining fixes I have on pxa3xx-nand I'd like =
you to
> queue up. The other changes I have submitted are under review and not of =
"fixes" type.
>
> Cheers.
>
> --
> Robert
>
> Robert Jarzmik (2):
>   mtd: nand: pxa3xx_nand: fix early spurious interrupt
>   mtd: nand: pxa3xx-nand: fix random command timeouts
>

For both patches:

Acked-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

I tested this on Armada 370:

Tested-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
