Received: from mail.mediatrix.com ([205.237.248.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 155WEH-0000s4-00
	for <linux-mtd@lists.infradead.org>; Thu, 31 May 2001 18:27:25 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D995479@mail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: Frederic Giasson <fgiasson@mediatrix.com>, 'David Woodhouse'
	 <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: RE: Found a potential bug in MTD 
Date: Thu, 31 May 2001 13:27:07 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


-----Original Message-----
From: Frederic Giasson [mailto:fgiasson@mediatrix.com]
Sent: Tuesday, May 29, 2001 3:38 PM
To: 'David Woodhouse'
Cc: linux-mtd@lists.infradead.org
Subject: RE: Found a potential bug in MTD=20


----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: Tuesday, May 29, 2001 3:13 PM
To: Frederic Giasson
Cc: linux-mtd@lists.infradead.org
Subject: Re: Found a potential bug in MTD=20



fgiasson@mediatrix.com said:
>=20
> 	Maybe but the actual code does not work if you specify a 1x16
> geometry with an actual single 16 bits chip on the memory bus.

For CFI chips, I believe it works. The Compaq iPAQ 31xx series have=20
precisely this arrangement.

I'm interested to know whether it's the CFI probe or the JEDEC probe =
which=20
is working on your device. Please could you make it print the contents =
of=20
cfi->cfi_mode after detecting the chip?



--
dwmw2
=20

cfi->mode =3D 1 which means that MTD detects in JEDEC mode.  This =
result is
obtained by compiling the kernel with 1x16 geometry specification, and =
the
modification to cfi_qry_mode I talked about in a previous mail.

But Atmel chips are CFI, right?  Correct me if I am wrong.=20

Fr=E9d=E9ric Giasson

About my own last question, I just got the answer for someone at Atmel:
their chips are NOT CFI compliant.

Fr=E9d=E9ric Giasson




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
