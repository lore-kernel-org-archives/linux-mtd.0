Received: from transedge-153-132.transedge.com ([216.171.153.132] helo=mercury.steinkuehler.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16EAhZ-0004AD-00
	for <linux-mtd@lists.infradead.org>; Wed, 12 Dec 2001 14:49:41 +0000
Received: from csteinathlon (transedge-153-131.transedge.com [216.171.153.131])
	by mercury.steinkuehler.net (8.9.3/8.9.3) with SMTP id MAA06812
	for <linux-mtd@lists.infradead.org>; Wed, 12 Dec 2001 12:41:33 -0600
Message-ID: <07ba01c1831d$91390d10$4101220a@csteinathlon>
From: "Charles Steinkuehler" <charles@steinkuehler.net>
To: <linux-mtd@lists.infradead.org>
References: <062d01c1829d$c20e54c0$4101220a@csteinathlon>
Subject: Newbie questions
Date: Wed, 12 Dec 2001 08:59:15 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

OK, I have to ask for help.

I'm trying to compile MTD on a 2.2.19 kernel and am getting all turned
around.  I've found several patch files (in the CVS patches directory, and
on the FTP site), but these all see to be ancient (like a year old or so).

Running the patchin.sh script in the patches directory seems to hook the CVS
code into my kernel tree, but the kernel build system is left unmodified.

Finally, a simple "make" in the top level of the CVS directory doesn't work,
I think because I can't get my kernel patched properly.

I'm no stranger to writing code, or patching/compiling kernels, I'm just
seeing too many half-finished trails to figure out which one I'm supposed to
follow...

So, how does one compile MTD for a 2.2.x kernel?

Charles Steinkuehler
charles@steinkuehler.net
