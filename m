Received: from [212.87.56.100] (helo=mail.taytron.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14vBfB-0000HB-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 May 2001 06:28:29 +0100
From: "Florian Schirmer / TayTron" <schirmer@taytron.net>
To: "Vipin Malik" <vipin.malik@daniel.com>,
	"Fry, Dan" <dfry@bb.directv.com>
Cc: <linux-mtd@lists.infradead.org>
Subject: AW: /dev/mtdblock missing
Date: Thu, 3 May 2001 07:29:45 +0200
Message-ID: <BKEKLBIBFPNGJKJDEODFIEPHEIAA.schirmer@taytron.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <3AF0914A.418BAE6@daniel.com>
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

Hi!

>Are you using devfs?
>
>If not then the MAKEDEV script file in the utils file should do it. (using
the
>mknod command)
>
>If you are using devfs, then I don't know.

If using devfs /dev/mtdblock/{0,1,...} will be created automatically.

>2) Is ftl.c needed -- the HOWTO doesn't include it

No, you dont need it.

Cheers,
   Florian
