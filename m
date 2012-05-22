Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SWjNu-0006x6-48
 for linux-mtd@lists.infradead.org; Tue, 22 May 2012 07:19:58 +0000
Message-ID: <1337671409.2483.98.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 0/2] use hrtimer in nand_wait
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Johan Gunnarsson <johan.gunnarsson@axis.com>
Date: Tue, 22 May 2012 10:23:29 +0300
In-Reply-To: <1337589758-8775-1-git-send-email-johan.gunnarsson@axis.com>
References: <1337589758-8775-1-git-send-email-johan.gunnarsson@axis.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-L6N1ZUmSByYDyyXeO18S"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, jespern@axis.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-L6N1ZUmSByYDyyXeO18S
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-05-21 at 10:42 +0200, Johan Gunnarsson wrote:
> I've narrowed it down to the nand_wait routine and its dependency on a
> reliable jiffies counter. Sadly, jiffies is not reliable when handling
> of timer interrupts are delayed or even completely discarded. If
> interrupts are disabled for, say, 3 timer periods, jiffies will stop
> counting during this time and have a very fast increment by 3 when
> interrupts are later enabled.

I can follow up to this point.

>  This combined with unfortunate timing can cause the timeout loop
> think a 20ms timeout is happening when just <0.1ms has passed in wall
> clock time.

What is you HZ? Let's say it is 100, then jiffie increments every 10ms,
right? How can it increment by 2 after 0.1 ms?
>=20
> To illustrate the jiffies/interrupt-relationship:
>=20
> Interrupts: |      |      |                    |      |      |      |
> Jiffies:    |      |      |                    |||    |      |      |
>=20
> This obviously only happen on multi-core CPUs, where the write and
> interrupts are executed by different cores simultaneously. Switching
> to hrtimer-based timeout solves this problem for me. I found a second
> (less serious) issue which included in the first patch.

Sorry, I do not understand why this happens only on SMP. Could you
please explain some more?

I do not disagree that we should stop using jiffies, if we can, I just
want to understand what is happening.

--=20
Best Regards,
Artem Bityutskiy

--=-L6N1ZUmSByYDyyXeO18S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPuz7xAAoJECmIfjd9wqK0pbQP+wXt05L0Pq8/KaWy/tzwCzmK
jTOAdNHTkf9vtMDU7oC/5dRhbPRrSl6DbQpmSSgfeXXRHPPc1c66Poy/zEUkq9so
Gmm4q+m0SgKY1yN84scq++lWMSz6HIwxXtYwGybROHvxS57emhtsTQ9MPQ/pBV8C
cDyIvAmyqUq1e2OWJuH5hOfnR+MuEHpTR1UbZ1whflIKTvZL09ULsr9w5YxsCfd9
k6QEUGQqMrwpNizu8KWkJrnsin/jdP1l9+yRa+NwN32evVI02XFip5I6+tz0j321
vMMl3ehi+DA+GaJrUx3S0vjVg/Q7a29YijXT3smbCwmnihEF0V5XCVGuAA4Vc/Qb
71A6wMJDVfMTHJ0/pSBbXOM8JjehZNZA/7I9sUNVbjb6eTtcZ90PO+P7J0XM8lD/
rcfwy38K2vPo1FvWD7Bv1oj8QLg+fkZRKGUV+H/IJlWn8HNwpVqeI5g7ZsBtrJ6m
EwSbBylkYrd8DsItdRpJCeOQ7IqB20cYOM7XToTuvJEsbTof1G0Z69bXCjOG2GL0
dAEYeb4ut51X6smdTQ8Kq+NFx/E9voK2zHkghssiKc66k85jrGNheNWukIKag3iB
P/Lk+nfDATTrjo1+xbvUidumJq6/8IxqPTGCBYs7Vdol+fBygHp11fGc33UyZkBP
cOxEU7tX/7KNOPQd4v76
=DAjQ
-----END PGP SIGNATURE-----

--=-L6N1ZUmSByYDyyXeO18S--
