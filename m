Received: from webmail.phodyn.com ([63.66.55.13]
	helo=sjo-exch-01.photondynamics.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AGm3a-0005fc-Nb
	for <linux-mtd@lists.infradead.org>; Mon, 03 Nov 2003 21:16:14 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Mon, 3 Nov 2003 13:14:22 -0800
Message-ID: <F62D50EDEAC1F34AA69101426791ED2E02C2C183@sjo-exch-01.photondynamics.com>
From: "Shawn Sharp" <shawn.sharp@photondynamics.com>
To: <linux-mtd@lists.infradead.org>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: DOC2000 Locks up Terminal Window
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am running a Linux Kernel 2.4.20 and I am using the MTD Driver.  I am
able to mount the DOC and see the top level file structure but I can not
access any of the files under the top level.  When I try to access the
lower file structure the terminal window currently in use will lockup.
Anyone seen this before?  And any ideas so that it won't lock up or see
the lower level file structure?

Thanks
