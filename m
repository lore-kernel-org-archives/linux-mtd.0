Received: from hu-out-0506.google.com ([72.14.214.230])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JvZA3-0006wr-PI
	for linux-mtd@lists.infradead.org; Mon, 12 May 2008 14:37:56 +0000
Received: by hu-out-0506.google.com with SMTP id 34so2937417hui.22
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 May 2008 07:37:54 -0700 (PDT)
Message-ID: <386072610805120737y7a243d99o5a855564575d2fb8@mail.gmail.com>
Date: Mon, 12 May 2008 22:37:53 +0800
From: "Bryan Wu" <cooloney@kernel.org>
Sender: cooloney.lkml@gmail.com
To: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: [PATCH try#2] [MTD/MAPS] Blackfin BF5xx Maps: Handle the case
	where flash memory and ethernet mac/phy are mapped onto the
	same async bank
In-Reply-To: <8bd0f97a0805120548k356aff52pdf66acf88fadfebb@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <1202020355.6671.23.camel@roc-laptop>
	<20080512122650.GA10014@logfs.org>
	<8bd0f97a0805120548k356aff52pdf66acf88fadfebb@mail.gmail.com>
Cc: Bryan Wu <bryan.wu@analog.com>,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	will.newton@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 12, 2008 at 8:48 PM, Mike Frysinger <vapier.adi@gmail.com> wrot=
e:
> On Mon, May 12, 2008 at 8:26 AM, J=F6rn Engel <joern@logfs.org> wrote:
>  > On Sun, 3 February 2008 14:32:35 +0800, Bryan Wu wrote:
>  >> +static void bf5xx_copy_from(struct map_info *map, void *to,
>  unsigned long from, ssize_t len)
>  >> +{
>  >> +     unsigned long i;
>  >> +     map_word test;
>  >> +
>  >> +     if ((unsigned long)to & 0x1) {
>  >> +             for (i =3D 0; i < len / 2 * 2; i +=3D 2) {
>  >> +                     test =3D bf5xx_read(map, from + i);
>  >> +                     put_unaligned(test.x[0], (__le16 *)(to + i));
>  >> +             }
>  >> +     } else {
>  >> +             for (i =3D 0; i < len / 2 * 2; i +=3D 2) {
>  >> +                     test =3D bf5xx_read(map, from + i);
>  >> +                     *((u16*)(to + i)) =3D test.x[0];
>  >                        ^^^^^^^^^^^^^^^^^
>  >
>  > I'm not particularly fond of such constructs, maybe because I have suc=
h
>  > a hard time understanding what the code actually does.
>  >
>  > How about:
>  >        u16 *foo =3D to;
>  >
>  >        for (i =3D 0; i < (len & ~1); i++) {
>  >                test =3D bf5xx_read(map, from + 2 * i);
>  >                foo[i] =3D test.x[0];
>  >        }
>  >
>  > With perhaps a better name than "foo" and the same conversion in the
>  > rest of the function as well?
>
>  indeed.  Bryan: i can take care of this as there's a few other pieces
>  i want to fiddle first (like getting rid of "bf5xx")
>  -mike
>

My pleasure. Thanks.
This patch has been in my queue for a long time

-Bryan
