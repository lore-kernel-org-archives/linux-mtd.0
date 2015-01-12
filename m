Received: from mail1.bemta8.messagelabs.com ([216.82.243.197])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YASvI-0003Ra-BZ
 for linux-mtd@lists.infradead.org; Mon, 12 Jan 2015 00:32:01 +0000
From: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
To: punnaiah choudary kalluri <kalluripunnaiahchoudary@gmail.com>
Date: Mon, 12 Jan 2015 11:31:31 +1100
Subject: RE: nand ecc
Message-ID: <EACD232272DA4849B060F0828564D13B560E987866@ntcex01.corp.netcomm.com.au>
References: <CAGnW=BbmpJqvbuznhxXsfZYz0wWMOQ851f+E3hWrAawOSZWtpQ@mail.gmail.com>
In-Reply-To: <CAGnW=BbmpJqvbuznhxXsfZYz0wWMOQ851f+E3hWrAawOSZWtpQ@mail.gmail.com>
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


> Hamming  Mode:
> What will happen if the data has more than two bit errors for codeword?
> Will the nand_correct_data() function returns uncorrectable ecc error ?

Hamming is said to correct one bit error and detect 2. That is, if you hav=
e
two bit errors, you are guaranteed to get the "uncorrectable error" error.=


More than two bit errors will get reported as no errors, correctable bit e=
rrors
or uncorrectable bit errors, pretty much randomly.

It is possible to have, for instance, 3 bit errors that Hamming will repor=
t as
one correctable error. When corrected, you will have 4 bit errors.

> BCH mode:
> Assume that the BCH block can correct upto 24bit errors. what will
> happen if the data has more than 24 bit errors?
> Will the nand_bch_correct_data() function returns uncorrectable ecc erro=
r?

The situation is similar to the one above. Up to 24 bit errors will be cor=
rected,
25 will be detected and more errors may report anything.


Think of it this way - you have a small number of ECC bits covering a larg=
er
number of data bits. Together they have to form a valid code word.

This means that for every particular ECC bit combination, there are a larg=
e
number of possible data bit patterns that form valid code words. If you ap=
ply
a sufficiently large number of bit errors to one data pattern, you can rea=
ch
another valid one.

The trick of all error correcting codes is to pick the valid code words su=
ch that
the number of differing bits (hamming distance) is maximised. If your numb=
er
of bit errors exceeds the half way point to the next valid code word, your=

error correction will assume that the other code word is the correct one.


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
