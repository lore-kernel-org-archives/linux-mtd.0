Received: from mail1.bemta8.messagelabs.com ([216.82.243.201])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X2UQl-0002bt-S6
 for linux-mtd@lists.infradead.org; Wed, 02 Jul 2014 23:59:16 +0000
From: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Thu, 3 Jul 2014 09:58:33 +1000
Subject: RE: Correct behaviour of ubiattach / ubiformat in the face of ECC
 errors?
Message-ID: <EACD232272DA4849B060F0828564D13B0AA3DB913B@ntcex01.corp.netcomm.com.au>
References: <EACD232272DA4849B060F0828564D13B0AA3DB90FC@ntcex01.corp.netcomm.com.au>,
 <1404223553.6841.100.camel@sauron.fi.intel.com>
In-Reply-To: <1404223553.6841.100.camel@sauron.fi.intel.com>
Content-Language: en-AU
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2 Jul 2014 00:05:53 +1000
Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Thu, 2014-06-19 at 13:15 +1000, Iwo Mergler wrote:

> > My question is, what is ubiattach / ubiformat supposed to do if a
> > non-correctable ECC error occurs in a block during the scan?
>=20
> Generally, 'ubiformat' is about to destroy all the data, so should
> ignore errors and just go on, generally speaking.
>=20
> 'ubiattach' asks the kernel to attach the media. And generally, it
> should do something about ECC errors.

Hi Artem,

thanks for answering. I have found out what I was doing wrong
and meant to reply to myself documenting that any day now.. ;-)

You are right, and UBI/UBIFS do indeed behave correctly, if the right
error codes arrive from MTD.

For the 2.6.35 kernel, the chain of return values goes like this:

Low-level ECC functions: return the number of corrected bit errors
(>=3D0) or -EBADMSG when uncorrectable.

Page read functions: return 0 for correctable errors, -EBADMSG
for uncorrectable. Also increments ecc_stats.corrected with the
number of corrected bit errors.

MTD core read: Checks ecc_stats.corrected difference (after-before)
and returns -EUCLEAN if any bit errors were corrected. Error codes
(-EBADMSG) get passed through.

In newer kernels (~v3.9?) , the page read can also return
-EUCLEAN directly to signal a threshold of corrected bit errors
worth worrying about.

In all cases, the read must report having read all requested bytes,
even if the buffer may contain some garbage. Various things (e.g.
jffs2, UBI) have checksums for some data and can independently
verify and maybe recover correct information.

In my system, I did return -EUCLEAN from the page read function,
which was treated as a fatal error by MTD (i.e. it wasn't 0 or -EBADMSG).
This led to MTD-char returning 0 bytes read and the C-library retrying
endlessly.


Best regards,

Iwo

______________________________________________________________________
This communication contains information which may be confidential or privi=
leged. The information is intended solely for the use of the individual or=
 entity named above.  If you are not the intended recipient, be aware that=
 any disclosure, copying, distribution or use of the contents of this info=
rmation is prohibited.  If you have received this communication in error, =
please notify me by telephone immediately.
______________________________________________________________________
