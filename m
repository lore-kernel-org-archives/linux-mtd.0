Received: from mail-pb0-x233.google.com ([2607:f8b0:400e:c01::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UZNKq-0007G3-Nl
 for linux-mtd@lists.infradead.org; Mon, 06 May 2013 15:28:17 +0000
Received: by mail-pb0-f51.google.com with SMTP id wy7so2041141pbc.38
 for <linux-mtd@lists.infradead.org>; Mon, 06 May 2013 08:27:54 -0700 (PDT)
Content-Type: text/plain; charset=iso-8859-1
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
Subject: Re: [PATCH] UBI: fastmap convert used list to rb tree
From: Brian Pomerantz <bapper@gmail.com>
In-Reply-To: <CAFLxGvy2icxuGx9+VaiTgFxPwL3pHOEXo6S2UG-tJvoB+GdRCg@mail.gmail.com>
Date: Mon, 6 May 2013 08:27:51 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <B5D1657C-FF53-431E-AF13-5EC929791B66@gmail.com>
References: <1367801267-15659-1-git-send-email-bapper@gmail.com>
 <CAFLxGvzqysw2ABxA9Mz6b6LOdQdGS4y+fN=UeJ0tuk=KPYO55Q@mail.gmail.com>
 <1BB4A15D-C030-4CDC-B5C6-8C687572ACB7@gmail.com>
 <CAFLxGvy2icxuGx9+VaiTgFxPwL3pHOEXo6S2UG-tJvoB+GdRCg@mail.gmail.com>
To: richard -rw- weinberger <richard.weinberger@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On May 6, 2013, at 8:17 AM, richard -rw- weinberger =
<richard.weinberger@gmail.com> wrote:

> On Mon, May 6, 2013 at 5:04 PM, Brian Pomerantz <bapper@gmail.com> =
wrote:
>>=20
>> On May 6, 2013, at 6:45 AM, richard -rw- weinberger =
<richard.weinberger@gmail.com> wrote:
>>=20
>> Using a Samsung 1GB NAND with 3958 PEBs and only 510 left available =
(nearly full), without the patch I get around a 300ms attach time and =
with the patch it is around 50ms attach time.  I made the same change in =
u-boot, our kernel image is stored in UBI along with a backup image, and =
saw the same speedup.  So I shaved off 500ms from my boot time with the =
two changes.  The attach time should be much more constant using the =
tree, not getting much longer as the volumes fill up.  There wasn't a =
noticeable difference in how long it took to fill the tree verses =
appending to a list, so with empty volumes there shouldn't be much =
overhead.
>=20
> Sounds good. :)
> Did you port fastmap to u-boot?
>=20

I didn't, though if it's not upstream then perhaps one of my colleagues =
did.  =46rom what I can tell, it's nearly identical code to what is in =
the kernel.


--Brian
