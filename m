From: =?iso-8859-1?Q?Cal=F2_Massimo?= <m.calo@ctsgroup.it>
To: "ucLinux-Mtd@Lists. Infradead. Org" <Linux-Mtd@Lists.Infradead.Org>
Date: Mon, 8 Aug 2005 11:38:19 +0200
Message-ID: <003b01c59bfc$e92929a0$050213ac@MCaloMobile>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: 
Cc: 
Subject: R: Newly-erased Block...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> >=20
> > JFFS2 issued the erase command then found that the block
> > contains some=20
> > trash. That's not JFFS2's fault. Dig your flash driver/hardware.

I think that the problem is not in the erase command because in the =
function
"do_erase_oneblock" after
the erase command (file linux2.4.x/drivers/mtd/chips/cfi_cmdset_0002.c =
line
880)I tested the value of "oldstatus" and "status" variables : they have
always the same value... According to the toggle method it means that =
the
block has been erased (if I had understood?!?).


...please can you tell me what happen after one partition has been =
erased?


How does the "mount" command expect to find the erased partition? With =
all
bytes to 0xff or does it look for some data?

Thanks!

	Massimo.
