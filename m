Received: from 12-234-34-139.client.attbi.com ([12.234.34.139] helo=heavens.murgatroid.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17hBwl-0006Oa-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Aug 2002 17:33:36 +0100
From: "Christopher Hoover" <ch@murgatroid.com>
To: "'Jamey Hicks'" <jamey.hicks@hp.com>,
	"'David Woodhouse'" <dwmw2@infradead.org>
Cc: "'Conn Clark'" <clark@esteem.com>,
	=?iso-8859-1?Q?'J=F6rn_Engel'?= <joern@wohnheim.fh-wedel.de>,
	"'MTD Mailing List'" <linux-mtd@lists.infradead.org>
Subject: RE: How does one mount an existing jffs2 partition so it is writeable?
Date: Tue, 20 Aug 2002 09:34:12 -0700
Message-ID: <000301c24867$6a81ad70$7800000a@derelict>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <3D623224.1090604@hp.com>
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

> I would much rather that JFFS2 not unlock blocks automatically.  We
tend 
> to lock blocks for a reason (e.g., so that we don't accidentally erase

> the boot loader with incorrect mount options).

You have a different flavor flash.  My platform uses Intel C3
StrataFlash parts.  The flash is completely locked after any power
cycle.   If I don't unlock the jffs2 partition somehow someway, I can't
write to it.

I suppose we could add yet another mount option for this
("really_and_truly_rw"!).

-ch
ch@murgatroid.com
ch@hpl.hp.com
