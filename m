Received: from 12-234-34-139.client.attbi.com ([12.234.34.139] helo=heavens.murgatroid.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17gwqO-0004vp-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Aug 2002 01:26:00 +0100
From: "Christopher Hoover" <ch@murgatroid.com>
To: "'Conn Clark'" <clark@esteem.com>,
	=?iso-8859-1?Q?'J=F6rn_Engel'?= <joern@wohnheim.fh-wedel.de>
Cc: "'MTD Mailing List'" <linux-mtd@lists.infradead.org>
Subject: RE: Re: How does one mount an existing jffs2 partition so it is  writeable?
Date: Mon, 19 Aug 2002 17:25:18 -0700
Message-ID: <007201c247e0$1022fcd0$a15f040f@SNAGGLE>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <3D6186CD.6BCD1850@esteem.com>
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

Do you need to unlock your flash before you can write to it?  That's not
done automatically by mtd or jffs2.  There's a diff in the ARM patch
system by me that might be applicable.

-ch
