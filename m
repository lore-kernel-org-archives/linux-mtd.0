Received: from rproxy.gmail.com ([64.233.170.196])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1ELFRg-00054M-AX
	for linux-mtd@lists.infradead.org; Fri, 30 Sep 2005 03:36:48 -0400
Received: by rproxy.gmail.com with SMTP id y7so123779rne
	for <linux-mtd@lists.infradead.org>;
	Fri, 30 Sep 2005 00:36:36 -0700 (PDT)
Message-ID: <9b7ca6570509300036r47c410a4la8f8598794a17041@mail.gmail.com>
Date: Fri, 30 Sep 2005 16:36:06 +0900
From: Daniel Ann <ktdann@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: Problem partitioning discontinuous physical start address
Reply-To: Daniel Ann <ktdann@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hey folks,

Im trying to partion my flash using partioning support (ie. parse
partition from the kernel argument) but for board with 2x intel flash
linearly connected, I can partition it no problem.

Problem exist with board with 2x intel flash (16MB each) non-linearly conne=
cted.
One is located at 0x7C00_0000 and another at 0xFF00_0000. If I give
0x7C00_0000 as a physical start address with length as 0x84000000 (ie.
(0xFFFF_FFFF - 7C00_0000) + 1)and select support for non-linear
mappings of flash chips, I get an error saying that its too large.

What options do I have without having to write my own physmap.c. I've
had one before when I was using 2.4 kernel, but having moved to 2.6,
I'm trying not to make any custom changes and trying to stick with the
main stream.

Any advice would be welcome. thanks.

--
Daniel
