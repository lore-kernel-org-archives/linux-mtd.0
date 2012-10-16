Message-ID: <1350371511.5769.43.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 07/11] fsmc/nand: Provide contiguous buffers to dma
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 16 Oct 2012 10:11:51 +0300
In-Reply-To: <CAN8TOE-7d=YUSYsHFw9X5vnz8cpSJYv5uZfvBpDyhg+-F_LDiQ@mail.gmail.com>
References: <cover.1349778820.git.vipin.kumar@st.com>
 <2b88c853b3691338fae037f569917fc300cd6032.1349778821.git.vipin.kumar@st.com>
 <CACRpkdb6ArMUQ6MAsue+Gh15UfOUrWNAc9wrxd6awc0BTwOGiw@mail.gmail.com>
 <CAOh2x=ksMr7VRCnpF-rK+Mesg1p4Td++SQ-t=ShrguRRVWSSSQ@mail.gmail.com>
 <CACRpkdYjA8QUh4HqvE1rsnXcGA4WafTkMq_wLNJ__gXEnEYrow@mail.gmail.com>
 <507794B6.2000107@st.com> <1350307104.4115.23.camel@sauron.fi.intel.com>
 <CAN8TOE-7d=YUSYsHFw9X5vnz8cpSJYv5uZfvBpDyhg+-F_LDiQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-7VNS0LQDYZtqDPcw5haq"
Mime-Version: 1.0
Cc: Vinod Koul <vinod.koul@intel.com>, viresh kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 spear-devel <spear-devel@list.st.com>, Vipin Kumar <vipin.kumar@st.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "plagnioj@jcrosoft.com" <plagnioj@jcrosoft.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-7VNS0LQDYZtqDPcw5haq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-10-15 at 09:27 -0700, Brian Norris wrote:
> > I'd really prefer to just switch to kmalloc() everywhere instead of
> > adding hacks like this to the drivers. Then if this is a problem for
> > someone, he can fix it by either switching to smaller buffers (possible
> > in many places), or by improving memory fragmentation issues on his
> > system, or by just using CMA.
>=20
> I think I can suggest that this is already a problem on real systems.
> In bringing up a board on v3.3 kernel, I experienced a kernel memory
> allocation error when trying to memdup_user() in eraseblock-size
> regions. I believe I would experience more of these if all
> eraseblock-sized buffers were kmalloc()'d.
>=20
> See the commit description for the following commit in mtd-utils.git:
>=20
>     commit 71c76e74661492b4f68f670514866cfc85f47089
>     libmtd: fix mtd_write() issues for large data-only writes

Well, this is another work-around. The better way to fix this would be
to change kernel's 'mtdchar_write_ioctl()' to be iterative and avoid
calling 'memdup_user(len)' for arbitrary 'len' passed from user-space.

> I would prefer not building a solution that hopes kmalloc() can get a
> large contiguous buffer (remember, eraseblock sizes come as large as
> 2MB these days). A real solution like CMA or scatter-gather seems like
> a better idea.

Me too. But this does not happen. People bring this up for years. Of
course it is easier to hack drivers, and very understandable. So what
I would like to do is somehow force people to fix this issue.

So I thought about something like introducing an mtd_alloc() which
would:
   a. Try doing CMA allocation: dma_alloc_from_contiguous()
   b. If it fails, use kmalloc().

This function would probably need a cookie which it returns and which
the mtd_free() function would use to call either kfree() or
dma_release_from_contiguous()...

If both fail - bad luck. Go look at the code and switch to S-G lists
instead of allocating contiguous regions. As I said, in many places it
is easy to do, and there are few places when you would need to spend a
bit more time.

How does this sound to you?

--=20
Best Regards,
Artem Bityutskiy



--=-7VNS0LQDYZtqDPcw5haq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQfQi3AAoJECmIfjd9wqK0WUkP/39CkcTmx05hL/wdWnMEeqOj
3NADAUTk0m7EWlt6FXr/66sfcYyZvjaXNPA7XLdLti/XlEZwhlePt9EBfyIRa+Ux
tB5S69sUCeGOOf5VEAtLqkMfervuSQWVOxiUQdqFp9B9d9epwgGXdgmA45ChsZtz
koLAVfqkrbyacNtfkdkBwiwaLqz0kSGxSLjDLL8fyvG8C5/q8+KouPjssveXjUCf
nerO+eGi/KFrSsHJ4Mq/Mz1udcelUEhGGYMAwdpPEKn4n3GKg4c8jIAVPv9iKUaN
98fq4sFtDJqkvLA1E+VBzmc9RAZ2N1Pq/5K6iQolDw+N1eRglYK3c3y8BXbdpCEC
w/n0ZcwGS0HVDXEkobV95pUWauAhz7HuQ13P2+D4RJng3APRF4FfKlOOChdiZCBp
d/XlxOhNVnuxUFDrlzocof5hp95aezYc1JBHUImtwjZIu6tEU3W+Qc2lY8cc+K8e
GHklQAcmFu+G+JUKu+y16ldB65RyZP8+U6UFlNZD7LUob0v5apLhcoewwF3CYoV5
O37Rs5Ly24UEZasXF0W3fqEHHsBQkJzxyBGA358rDheqMqZOgyG3RVivruvP9ttj
egMXddf8SbNynjcT0fjp3goPUyQ0nvjnrD0BgZP5mZIomJ/EzmFfX3fz+r6GW04m
VUfm1gXjdJ8Lmoz+WUMW
=K90N
-----END PGP SIGNATURE-----

--=-7VNS0LQDYZtqDPcw5haq--
