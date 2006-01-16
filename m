Received: from wproxy.gmail.com ([64.233.184.195])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EyJ3Q-0001aI-6L
	for linux-mtd@lists.infradead.org; Sun, 15 Jan 2006 20:21:09 -0500
Received: by wproxy.gmail.com with SMTP id 71so1013469wra
	for <linux-mtd@lists.infradead.org>;
	Sun, 15 Jan 2006 17:20:47 -0800 (PST)
Message-ID: <7e560e180601151720g6d2f8378x578a1225646ca7e2@mail.gmail.com>
Date: Mon, 16 Jan 2006 14:20:46 +1300
From: Braden Simpson <braden.simpson@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: Eternal loop in fill_autooob_layout
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I'm pretty new to this whole Linux and MTD thing so my apologies in
advance if I seem to
be unusually clueless in this regard.

I am working on getting a 2.6.16 kernel to boot from a Diskonchip 2000
TSOP on a PC/104
'embedded' platform with mixed success.

When I patch my 2.6.12.6 kernel with any of the more recent MTD
snapshots (12th Jan 2006
for example) it causes the kernel to hang on startup.  I have tracked
down the location of the hang to the fill_autooob_layout function in
nand_base.c and it appears that the while loop is
never being exited.

Turning on the MTD kernel debug to level three gives a continuous stream of=
:

     fill_autooob_layout: oob concatenated, aggregate length 0

Note that this is being logged by the second kernel debug line in the
'else' clause.  Further
investigation shows that the 'i' counter never gets incremented above
2 and if I follow the code
it is reasonably obvious why.  Neither loop termination condition will
ever become true as 'i' is
decremented and incremented by one each loop, and 'cur' is always
incremented by zero!

What is not so obvious is what this routine is doing as the unpatched
MTD version of the
nand_base.c code in the 2.6.12.6 kernel doesn't have this routine and
works as expected.
Can anybody provide any pointers as to what should be happening here?

Regards,

Braden Simpson
