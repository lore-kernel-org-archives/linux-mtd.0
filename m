Received: from av4-2-sn3.vrr.skanova.net ([81.228.9.112])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Csm8w-00025v-9f
	for linux-mtd@lists.infradead.org; Sun, 23 Jan 2005 13:07:23 -0500
From: =?iso-8859-1?Q?Torbj=F6rn_Jansson?= <torbjorn.jansson@mbox200.swipnet.se>
To: "'Balint Cristian'" <rezso@rdsor.ro>,
	<linux-mtd@lists.infradead.org>
Date: Sun, 23 Jan 2005 19:07:53 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <200501231315.04773.rezso@rdsor.ro>
Message-Id: <20050123180719.AC63F38011@smtp1-2-sn3.vrr.skanova.net>
Cc: 
Subject: RE: A few questions about diskonchip
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Balint Cristian <mailto:rezso@rdsor.ro> wrote:
> On Sunday 23 January 2005 12:37, Torbj=F6rn Jansson wrote:
>=20
>> I can get the old doc2001plus module to load and detect the chip (2
>> modifications requierd), but when i cat from /dev/mtdblock0 the
>> resulting data doesn't match a dump of the rom i have on file.
>> For example, one string in /dev/mtdblock reads "Cyrht" but it shoud
>> be "Copyright" so it looks like the module is reading 32bits and
>> throwing away 16 or something like that.
>=20
>  Same problem here. Just to know.
>=20

Ok, so that means it's probably not my fault then.
