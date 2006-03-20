Received: from mail.auerswald.de ([212.185.163.229])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLMDA-0006TF-Oy
	for linux-mtd@lists.infradead.org; Mon, 20 Mar 2006 10:22:34 -0500
From: Wolfgang =?iso-8859-1?q?M=FCes?= <wolfgang.mues@auerswald.de>
To: linux-mtd@lists.infradead.org
Date: Mon, 20 Mar 2006 16:22:08 +0100
References: <1142865089.c65a3380tomas2003@home.se>
In-Reply-To: <1142865089.c65a3380tomas2003@home.se>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200603201622.08947.wolfgang.mues@auerswald.de>
Subject: Re: cfi 0001
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

Am Montag, 20. M=E4rz 2006 16:12 schrieb Tomas E:
> I have a problem with writing to a Intel Strata flash
> and then doing a warm reset.
>
> I have a jffs2 mounted on mtdblock which uses cfi_cmdset_0001 according to
> the console messages.
>
> When I do a simple write echo "xxxx" > /MyFlash/test.text
> the flash writes but remain in the state that only 0080
> can be read when I ioremap some address in the flash.

Hmmm... seems to be the status register!

Is there a function in the mtd subsystem that misses a read array command a=
t=20
the end of a flash function?

best regards
=2D-=20
Wolfgang Muees                    Vor den Grashoefen 1
Auerswald GmbH & Co. KG       	  D-38162 Cremlingen
Hardware Development              Germany
Tel +49 5306 9219 0               Fax +49 5306 9219 94
