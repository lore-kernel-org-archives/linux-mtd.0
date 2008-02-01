Received: from mga03.intel.com ([143.182.124.21])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JKyIv-0002d5-RQ
	for linux-mtd@lists.infradead.org; Fri, 01 Feb 2008 15:59:56 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: JFFS2: file contents in case of data CRC error
Date: Fri, 1 Feb 2008 18:53:42 +0300
Message-ID: <523F3D8D8C97554AA47E53DF1A05466A01880BCA@nnsmsx411.ccr.corp.intel.com>
In-Reply-To: <47A32600.9000807@dave-tech.it>
References: <47A1FD3F.2020102@dave-tech.it>
	<523F3D8D8C97554AA47E53DF1A05466A01880831@nnsmsx411.ccr.corp.intel.com>
	<47A32600.9000807@dave-tech.it>
From: "Korolev, Alexey" <alexey.korolev@intel.com>
To: "llandre" <r&d2@dave-tech.it>, <mattjreimer@gmail.com>,
	<jamie@shareable.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi


>> Could you please give information about how you can get this error? I
>> need to know use case.=20
> The issue has been reported by a customer working on PPC405EP-based=20
> system running linux 2.4.20.
> The device under test has run a temperature cycle test. The
temperature=20
> has been varied in the whole industrial range (-40/+85 deg C). After=20
> completing the test, the files stored on NAND have been read back and=20
> compared to the original ones - written on NAND before starting the=20
> temperature test - and the difference in the file f.img previously=20
> described arose.

Ahh. The temperature tests. That explains a lot.=20
Probably device worked improperly in the test but test did not turn off
device when NAND become unworkable. As result JFFS2 did not detect the
problem of broken CRC on mount but did it on attempt to read the broken
data and printed error message.=20

So JFFS2 performed scan on read - found CRC error in node=20
-> JFFS2 marked node to be obsolete
-> As result hole in the file has been formed.=20
-> You read 0x0 in the middle of the file.=20

I think nobody considered such tests before. I am not sure if any file
system may be reliable in such a case with temperature tests.

Unfortunately I have no idea how this issue could be solved :).


>>> to NAND. In fact, in the middle of the file, I see a 4-kByte "hole"=20
>>> where all bytes are 0.
>>=20
>> It is Ok. NAND error correction could return that data is correct
even
>> if it is not correct. It finds the issues with guarantee only in case
of
>> 1 or 2 bits errors. =20
> About this point I agree with catboat=20
> (http://article.gmane.org/gmane.linux.drivers.mtd/19463). In my
opinion=20
> in this case JFFS2 should report an error code !=3D 0 in order to warn
the=20
> userland that something did not work perfectly.
>
--------------------------------------------------------------------
Closed Joint Stock Company Intel A/O
Registered legal address: 125252, Moscow, Russian Federation,=20
Chapayevsky Per, 14.

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.
