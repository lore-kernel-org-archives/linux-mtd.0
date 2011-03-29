Received: from ra.se.axis.com ([195.60.68.13])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q4alI-0006Ew-9R
	for linux-mtd@lists.infradead.org; Tue, 29 Mar 2011 15:23:17 +0000
Date: Tue, 29 Mar 2011 17:23:13 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: Re: [PATCH/RFC v4 1/3] Shared BCH ECC library
In-Reply-To: <20110329150313.GA15405@parrot.com>
Message-ID: <Pine.LNX.4.64.1103291720410.25520@lnxricardw.se.axis.com>
References: <1fb708d8d49cdd83e62424fb77912418f5c92d69.1299836869.git.ivan.djelic@parrot.com>
	<Pine.LNX.4.64.1103291534110.25520@lnxricardw.se.axis.com>
	<20110329150313.GA15405@parrot.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 29 Mar 2011, Ivan Djelic wrote:

> On Tue, Mar 29, 2011 at 02:55:19PM +0100, Ricard Wanderlof wrote:
>> However, if I introduce a single bit error in the page, bch_decode() fai=
ls
>> with -EBADMSG, and some further debugging reveals that
>> bch.c:compute_error_locator_polynomial() returns 4 in this particular
>> case, whereas bch.c:find_poly_roots() returns 0, the two don't match, an=
d
>> the function exits with an error. I'm no wizard with the algorithms used
>> so i have no idea what is reasonable. I would assume both would return 1=
,
>> as there is one bit error that I've introduced.
>
> Yes you are correct, the computed error locator polynomial seems wrong, i=
t
> should be of degree 1.
>
> I should be able to help if you provide me with the following information=
:
>
> - your patch against 2.6.35
> - on an erased page, could you please program just the first byte to 0x7f=
 (in
> raw mode, no ecc), then read the page back normally with ecc, and dump th=
e
> calculated ecc ?
>
> If you wish I can also send you the userland test suite that I use for
> validation.

Thanks for your quick reply.

However, I think I may have found the source of my problem, I think i'm=20
doing something wrong when forcing bit errors using nandwrite with an=20
image containing an oob, so I in fact introduce a wrong ECC. I found this=
=20
out by trying the same scenario using the standard 1-bit ECC algorithm,=20
which also fails in much the same way.

Sorry for the confusion.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
