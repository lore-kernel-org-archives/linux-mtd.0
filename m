Received: from mail-io0-x235.google.com ([2607:f8b0:4001:c06::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arAac-0002QY-Af
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2016 20:43:42 +0000
Received: by mail-io0-x235.google.com with SMTP id u185so146120399iod.3
 for <linux-mtd@lists.infradead.org>; Fri, 15 Apr 2016 13:43:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1460751891.19090.45.camel@perches.com>
References: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
 <1460750052-16285-10-git-send-email-zajec5@gmail.com>
 <1460751818.19090.43.camel@perches.com>
 <1460751891.19090.45.camel@perches.com>
Date: Fri, 15 Apr 2016 22:43:21 +0200
Message-ID: <CACna6rxgNCGUf7w0+NyWepiDLn7C4mS2vuifaeBARDqO_NDu-A@mail.gmail.com>
Subject: Re: [PATCH 09/12] mtd: nand: fsmc: validate ECC setup by checking
 algorithm directly
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
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

On 15 April 2016 at 22:24, Joe Perches <joe@perches.com> wrote:
> On Fri, 2016-04-15 at 13:23 -0700, Joe Perches wrote:
>> Why not just add NAND_ECC_SOFT above the default case?
>
> Nevermind, misread.

At least someone reviews it which is nice :)

--=20
Rafa=C5=82
