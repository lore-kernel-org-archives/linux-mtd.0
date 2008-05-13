Received: from py-out-1112.google.com ([64.233.166.180])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jvtpb-0003SB-0J
	for linux-mtd@lists.infradead.org; Tue, 13 May 2008 12:42:11 +0000
Received: by py-out-1112.google.com with SMTP id a73so2476299pye.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 May 2008 05:42:08 -0700 (PDT)
Message-ID: <8bd0f97a0805130542x46f5e7fejf1347f1c71f567fb@mail.gmail.com>
Date: Tue, 13 May 2008 08:42:08 -0400
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@logfs.org>
Subject: Re: [PATCH 1/1] [MTD/MAPS] Blackfin Async Flash Maps: Handle the case
	where flash memory and ethernet mac/phy are mapped onto the
	same async bank
In-Reply-To: <20080513080727.GA15795@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <1210653525-19437-1-git-send-email-cooloney@kernel.org>
	<20080513080727.GA15795@logfs.org>
Cc: linux-mtd@lists.infradead.org, Bryan Wu <cooloney@kernel.org>,
	dwmw2@infradead.org, will.newton@gmail.com, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 13, 2008 at 4:07 AM, J=F6rn Engel wrote:
> On Tue, 13 May 2008 12:38:45 +0800, Bryan Wu wrote:
>  >
>  > +#define pr_devinit(fmt, args...) ({ static const __devinitdata char _=
_fmt[] =3D fmt; printk(__fmt, ## args); })
>
>  Is this still needed?

yes

>  > +static void bfin_copy_from(struct map_info *map, void *to, unsigned l=
ong from, ssize_t len)
>  > +{
>  > +     size_t i;
>  > +     map_word test;
>  > +
>  > +     if ((unsigned long)to & 0x1) {
>  > +             for (i =3D 0; i < len; i +=3D 2) {
>  > +                     u16 *dst =3D (u16 *)(to + i);
>  > +                     test =3D bfin_read(map, from + i);
>  > +                     put_unaligned(test.x[0], dst);
>  > +             }
>  > +     } else {
>  > +             for (i =3D 0; i < len; i +=3D 2) {
>  > +                     u16 *dst =3D (u16 *)(to + i);
>  > +                     test =3D bfin_read(map, from + i);
>  > +                     *dst =3D test.x[0];
>  > +             }
>  > +     }
>  > +
>  > +     if (len & 0x1) {
>  > +             u8 *last_to_byte =3D (u8 *)(to + i);
>  > +             test =3D bfin_read(map, from + i);
>  > +             *last_to_byte =3D (u8)test.x[0];
>  > +     }
>  > +}
>
>  The pointer casts are superfluous.

left over due to "from" being unsigned long ... forgot that "to" is a
void *.  dropped

>  The "+ i" in the last conditional
>  is a bit dangerous as any changes to the loop can break it.  Linux code
>  has lots of churn and not everyone is careful enough to spot such
>  subtleties.
>  And I believe you can improve performance by killing the put_unaligned
>  in the loop.  So if we put it all together the end result should be
>  something like this:
>
>  static void bfin_copy_from(struct map_info *map, void *to, unsigned long=
 from, ssize_t len)
>  {
>         size_t i;
>         map_word test;
>         u8 *byte;
>         u16 *dst;
>
>
>         if ((unsigned long)to & 0x1) {
>                 byte =3D to;
>                 test =3D bfin_read(map, from);
>                 *byte =3D test.x[0] >> 8;
>                 to++;
>                 from++;
>                 len--;
>
>         }
>
>         for (i =3D 0; i < len; i +=3D 2) {
>                 dst =3D to + i;
>
>                 test =3D bfin_read(map, from + i);
>                 *dst =3D test.x[0];
>         }
>
>         if ((len & 0x1) {
>                 byte =3D to + len - 1;
>                 test =3D bfin_read(map, from + len - 1);
>                 *byte =3D test.x[0] & 0xff;
>         }
>  }
>
>  What do you think?

seems reasonable ... i'll have to grab the board again and test it out.

>  > +static void bfin_write(struct map_info *map, map_word d1, unsigned lo=
ng ofs)
>  > +{
>  > +     struct async_state *state =3D (struct async_state *)map->map_pri=
v_1;
>  > +     u16 d;
>  > +
>  > +     d =3D (u16)d1.x[0];
>
>  You didn't need the cast above.  Why here?

*shrug* it's always been there.  i'll drop it.

thanks!
-mike
