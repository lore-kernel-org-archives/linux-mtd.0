Received: from wproxy.gmail.com ([64.233.184.193])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DxRFz-0000uA-QH
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2005 11:22:28 -0400
Received: by wproxy.gmail.com with SMTP id i20so1079416wra
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Jul 2005 08:22:09 -0700 (PDT)
Message-ID: <764af18905072608227da7bce8@mail.gmail.com>
Date: Tue, 26 Jul 2005 20:52:09 +0530
From: Naveen Atmakuri <naveen.maillist@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: JFFS2 on OSK board
Reply-To: Naveen Atmakuri <naveen.maillist@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi everybody,

I am using linux-2.6.12-rc2-omap2 and u-boot-1.1.2 for my OSK board.
I created a minimal jffs2 image for my board.

If i boot with this image for the first time it is taking too much
time to get booted. Is there any way to reduce this boot time.
If i add some files to the filesystem and boot the board using this
new filesystem its not getting booted and it is corrupting my mtd.

I encountered the same problem when i created ext2 filesystem.

Is there any patch that has to be applied to avoid these errors.

In help in this regard would be of great help.

Thanks in Advance,
Naveen A.
