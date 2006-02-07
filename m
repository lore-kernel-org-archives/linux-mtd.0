Received: from zproxy.gmail.com ([64.233.162.194])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F6JaI-0002JE-5z
	for linux-mtd@lists.infradead.org; Mon, 06 Feb 2006 22:32:10 -0500
Received: by zproxy.gmail.com with SMTP id q3so1420392nzb
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Feb 2006 19:32:04 -0800 (PST)
Message-ID: <7e560e180602061932n28df14aep5bd2b10f29b189c5@mail.gmail.com>
Date: Tue, 7 Feb 2006 16:32:03 +1300
From: Braden Simpson <braden.simpson@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: JFFS2 and INFTL compatibility
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I am having mixed success in using both JFFS2 and INFTL on different partit=
ions
of a Diskonchip 2000 TSOP and was wondering if I was missing something that
should have been obvious.

The intention is to have the main application residing on a seldom-modified=
 EXT2
over INFTL partition and the logs and such on a power-failure resistant JFF=
S2
partition.  The system currently boots the kernel from the Diskonchip using=
 the
Docboot bootloader and loads the root filesystem into a RAMDisk.

Formatting and mounting the EXT2 partition works just fine but I cannot get=
 the
JFFS2 partition to survive a reboot without being 'fixed' by the INFTL driv=
er on
kernel startup.  The kernel messages on startup are:

INFTL

The kernel is based on 2.6.12.6 with the latest MTD updates and a patch I h=
ad
to make to the fill_autooob_layout function to get it to work.

Regards,

Braden Simpson
