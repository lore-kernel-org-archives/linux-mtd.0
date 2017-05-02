Received: from mail-pg0-x22c.google.com ([2607:f8b0:400e:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5NSB-0000xi-PV
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 02:22:17 +0000
Received: by mail-pg0-x22c.google.com with SMTP id y4so47814843pge.0
 for <linux-mtd@lists.infradead.org>; Mon, 01 May 2017 19:21:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170502013313.GA136952@google.com>
References: <20170502000455.13240-1-computersforpeace@gmail.com>
 <CAAEAJfAvSGz5-B2rLTzr-W-Hmv_m9NSZz_fx9Q-bY_kRc8yaLQ@mail.gmail.com>
 <20170502013313.GA136952@google.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 1 May 2017 23:21:52 -0300
Message-ID: <CAAEAJfDDbQ+1c2tZoq=_9BPYqgmkqBqFUcm0viYzpdSA=dYenQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: don't leak buffers when ->scan_bbt() fails
To: Brian Norris <computersforpeace@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
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

On 1 May 2017 at 22:33, Brian Norris <computersforpeace@gmail.com> wrote:
> On Mon, May 01, 2017 at 09:22:03PM -0300, Ezequiel Garcia wrote:
>> On 1 May 2017 at 21:04, Brian Norris <computersforpeace@gmail.com> wrote=
:
>> > This bug seems to have been here forever, although we came close to
>> > fixing all of them in [1]!
>> >
>> > [1] 11eaf6df1cce ("mtd: nand: Remove BUG() abuse in nand_scan_tail")
>> >
>>
>> Well, we came even closer. See [1] for a patch that fixes this by cleani=
ng
>> BBT init and release.
>
> That's a different bug(fix), no?
>

Oops, I really jumped on the gun here. The patch looks good.

Acked-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
