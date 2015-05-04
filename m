Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YpJrO-0006Eu-8T
 for linux-mtd@lists.infradead.org; Mon, 04 May 2015 17:08:51 +0000
From: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: RE: nandtest error
Date: Mon, 4 May 2015 17:08:19 +0000
Message-ID: <0D23F1ECC880A74392D56535BCADD7357DEBF330@NTXBOIMBX03.micron.com>
References: <000c01d08261$9726b7c0$c5742740$@teraoka.com.sg>
 <CA+EcR20vND89+wk5ZTODJ4NoaSC0rrWsV+bXTWbpyZ9Y72aFiA@mail.gmail.com>
 <0D23F1ECC880A74392D56535BCADD7357DEBE4C1@NTXBOIMBX03.micron.com>
 <000201d082e5$032f7d70$098e7850$@teraoka.com.sg>
 <0D23F1ECC880A74392D56535BCADD7357DEBE709@NTXBOIMBX03.micron.com>
 <001c01d0831c$619ac400$24d04c00$@teraoka.com.sg>
 <0D23F1ECC880A74392D56535BCADD7357DEBE7F3@NTXBOIMBX03.micron.com>
 <alpine.DEB.2.02.1505041424590.3922@lnxricardw1.se.axis.com>
In-Reply-To: <alpine.DEB.2.02.1505041424590.3922@lnxricardw1.se.axis.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Richard=20

That's a great question.  Mainly it has to do with ONFI, they define packag=
es and pin outs and it's in our best interest to design to ONFI standards f=
or interoperability.  ONFI is driven by NAND, Controller and End Customers,=
 the original ONFI standard in 2007 defined 4 package types TSOP-48,  WSOP-=
48, LGA52 and BGA-63, since then only a few options have been requested and=
 added BGA-100, BGA-132, BGA-152 (these last two are interchangeable) and B=
GA-272 and BGA-316 (.8mm) .  I believe TSOP is still the most used, and I t=
hink that may be for legacy reasons; once the board was laid out for TSOP o=
ur customers could quickly and continually double the memory by simply drop=
ping in the next TSOP and tweaking the Firmware.  I'm not sure why no one i=
s proposing smaller package sizes to ONFI at this time.  I suspect IoT may =
start driving smaller packages. =20



Jeff Lauruhn
NAND Application Engineer
Embedded Business Unit
Micron Technology, Inc

-----Original Message-----
From: Ricard Wanderlof [mailto:ricard.wanderlof@axis.com]=20
Sent: Monday, May 04, 2015 5:27 AM
To: Jeff Lauruhn (jlauruhn)
Cc: Linux mtd
Subject: RE: nandtest error


Hi Jeff,

A question that might be of interest for others on the list; myself I've al=
ways been curious of this fact: how come NAND flash chips traditionally com=
e in TSOP packages where only 16 or so of the 48 pins are in fact used; why=
 not use a smaller package?

My guess has been that the chip inside is so big that it requires a large p=
ackage but I have no idea if this in fact is true or not.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
