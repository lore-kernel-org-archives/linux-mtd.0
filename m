Received: from zmamail05.zma.compaq.com ([161.114.64.105])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 186v95-0000tS-00
	for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2002 15:52:39 +0000
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: MTD Config.in items not escaped by bus availability
Date: Wed, 30 Oct 2002 11:22:50 -0500
Message-ID: <D99C1FB421989A40818B6370E3187094040A3A91@tayexc19.americas.cpqcorp.net>
From: "Hicks, Jamey" <Jamey.Hicks@hp.com>
To: "Brian J. Murrell" <cc718ee62b87e84e665d57aa27e6bf39@interlinx.bc.ca>,
	<linux-mtd@lists.infradead.org>
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

> -----Original Message-----
> From: Brian J. Murrell
> [mailto:cc718ee62b87e84e665d57aa27e6bf39@interlinx.bc.ca]
> Sent: Monday, October 28, 2002 8:49 AM
> To: linux-mtd@lists.infradead.org
> Subject: MTD Config.in items not escaped by bus availability
>=20
>=20
> I have noticed that the whole MTD kernel configuration subsystem
> (drivers/mtd/Config.in) in the 2.4.19 kernel is not escaped by any bus
> configuration items.  That is, even on a kernel that I configure with
> no busses (i.e. UML), I am still asked about MTD devices.  Should ths
> really be so?  How can I have any MTD devices with no bus to connect
> them to?

Some MTD devices connect directly to the CPU.  It seems to me that if =
you have a CPU with a memory bus, then it is possible to have MTD =
devices, so drivers/mtd/Config.in needs to give you the option of =
selecting those devices.

The MTD configuration is all wrapped with the toplevel CONFIG_MTD =
option, so there is really only one question you would have to say 'No' =
to in order to avoid the others.

-Jamey
