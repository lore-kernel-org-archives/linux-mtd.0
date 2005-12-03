Received: from zproxy.gmail.com ([64.233.162.203])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EiZiS-0003qK-H7
	for linux-mtd@lists.infradead.org; Sat, 03 Dec 2005 10:54:36 -0500
Received: by zproxy.gmail.com with SMTP id m7so473444nzf
	for <linux-mtd@lists.infradead.org>;
	Sat, 03 Dec 2005 07:54:21 -0800 (PST)
Message-ID: <6d6a94c50512030754v21b0afddnb65e75fc8f094bdb@mail.gmail.com>
Date: Sat, 3 Dec 2005 23:54:21 +0800
From: Aubrey <aubreylee@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: NAND flash with *Chip Enable Don't Care" option
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Nowadays there are some kind of NAND flash has *Chip Enable Don't care" opt=
ion.
That means *Chip Enable* can be de-asserted during read, program or
erase cycles, without interrupting the operation. Because the
glue-less microcontroller interface, I think the driver shouldn't be
the same as the standard interface. Does the current NAND driver
support this option? Thanks.

Regards,
-Aubrey
