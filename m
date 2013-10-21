Received: from mail-ob0-x235.google.com ([2607:f8b0:4003:c01::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYJU5-0000ZP-KP
 for linux-mtd@lists.infradead.org; Mon, 21 Oct 2013 17:41:42 +0000
Received: by mail-ob0-f181.google.com with SMTP id va2so6293262obc.12
 for <linux-mtd@lists.infradead.org>; Mon, 21 Oct 2013 10:41:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5264DFF7.2090702@freescale.com>
References: <CAJ+vNU1JWZp=JoBDJALh59yFybGZ0iQxMEYy8qvTFGDLhyRzqg@mail.gmail.com>
 <52649FDA.1030804@freescale.com>
 <CAN8TOE9+ez=t-1n+jd5d3tu+EB9YJKFeM2RKAHBf059L5TYM7A@mail.gmail.com>
 <5264DFF7.2090702@freescale.com>
Date: Mon, 21 Oct 2013 10:41:17 -0700
Message-ID: <CAN8TOE-swY_uA3u3OBt3ip-F=s3_H5hDZE=uDE5VNBGCeZc-XA@mail.gmail.com>
Subject: Re: gpmi-mtd ecc regression
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Tim Harvey <tharvey@gateworks.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 21, 2013 at 1:04 AM, Huang Shijie <b32955@freescale.com> wrote:
> =D3=DA 2013=C4=EA10=D4=C221=C8=D5 15:21, Brian Norris =D0=B4=B5=C0:
>> Well, we do prioritize "no regressions", rather than new features. So
>> we may have to do this until a proper solution can be formed.
> ok.
>
> I will create a patch to fix this regression.

Yes. We should either get it into 3.12 or mark it -stable.

> And it seems i have to add new devicetree property to enable the JFFS2
> support.

We cannot use device-tree to enable JFFS2 (a purely software issue),
but you could use it to specify the ECC strength or layout. Be sure to
CC devicetree@vger.kernel.org on any new bindings, since they need to
review bindings and tend to have good input.

Brian
