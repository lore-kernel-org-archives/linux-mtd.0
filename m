Received: from nz-out-0506.google.com ([64.233.162.236])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I0NkW-0006zH-Dd
	for linux-mtd@lists.infradead.org; Mon, 18 Jun 2007 16:22:59 -0400
Received: by nz-out-0506.google.com with SMTP id s18so1399560nze
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Jun 2007 13:22:51 -0700 (PDT)
Message-ID: <79ac09b60706181322g9676cdp9fd08c6b32ed1b2@mail.gmail.com>
Date: Mon, 18 Jun 2007 15:22:51 -0500
From: Duke <ezbonites@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: bad VPP, Block erase error
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,
I can't seem to get rid of these error messages.
I get them when the system comes up and when I use
the mtd erase tools although the block is erased.
Can someone please help me solve this?

My block region
0x001c0000 25 block of 0x40000 is cramfs mounted ro,
and 0x00180000 6 blocks of 0x40000 is jffs2 mounted rw.

physmap-flash.0: block erase error: (bad VPP)
Erase at 0x00100000 failed immediately: errno -5
physmap-flash.0: block erase error: (bad VPP)
Erase at 0x003c0000 failed immediately: errno -5
physmap-flash.0: block erase error: (bad VPP)
Erase at 0x00380000 failed immediately: errno -5
physmap-flash.0: block erase error: (bad VPP)
Erase at 0x00340000 failed immediately: errno -5
physmap-flash.0: block erase error: (bad VPP)
Erase at 0x00300000 failed immediately: errno -5
physmap-flash.0: block erase error: (bad VPP)
Erase at 0x002c0000 failed immediately: errno -5
physmap-flash.0: block erase error: (bad VPP)
Erase at 0x00200000 failed immediately: errno -5
physmap-flash.0: block erase error: (bad VPP)
Erase at 0x001c0000 failed immediately: errno -5
physmap-flash.0: block erase error: (bad VPP)
Erase at 0x00180000 failed immediately: errno -5
physmap-flash.0: block erase error: (bad VPP)
Erase at 0x00140000 failed immediately: errno -
