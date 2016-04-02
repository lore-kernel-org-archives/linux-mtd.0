Received: from mail-lf0-x229.google.com ([2a00:1450:4010:c07::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1amNc9-0006c4-7n
 for linux-mtd@lists.infradead.org; Sat, 02 Apr 2016 15:37:30 +0000
Received: by mail-lf0-x229.google.com with SMTP id k79so111139638lfb.2
 for <linux-mtd@lists.infradead.org>; Sat, 02 Apr 2016 08:37:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160402155556.41cde687@bbrezillon>
References: <1459546164-6269-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20160402155556.41cde687@bbrezillon>
Date: Sat, 2 Apr 2016 12:37:06 -0300
Message-ID: <CAAEAJfA2wYAR+ZO0CL1dAy=OPi4gEUBf1zoT1JHO076UyvZmQQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] nand: Remove BUG abuse
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>
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

On 2 April 2016 at 10:55, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Hi Ezequiel,
>
> On Fri,  1 Apr 2016 18:29:22 -0300
> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
>
>> Hi,
>>
>> While using nandsim to debug an issue with an UBI image,
>> I hit a BUG() when passing some crazy ID values to nandsim.
>>
>> I've always felt that nand_base.c is sort of abusing the
>> BUG() macro, so decided to fix it.
>>
>> There are other BUG() uses, but they aren't in the nand_scan
>> path, so I'm not touching them.
>
> Now that you've opened the door to this rework, can you also patch other
> locations where BUG() is employed? :)
>

Well, it's true that BUG() is abused all over the place, but most of them
should be of the "not reached" type.

So, I fixed these two because they *are* reached and they are in the core.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
