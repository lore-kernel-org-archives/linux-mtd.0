Received: from mf2.realtek.com.tw ([220.128.56.22])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EbXoS-0004yQ-Hr
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2005 01:27:38 -0500
Message-ID: <007e01c5e8e4$5fb80490$135415ac@realtek.com.tw>
From: =?utf-8?B?6Zmz576/6YCeIFwoQ2h1Y2tcKQ==?= <ycchen@realtek.com.tw>
To: <dedekind@infradead.org>
References: <010201c5e43f$796bd5f0$135415ac@realtek.com.tw>
	<1131887362.3479.29.camel@sauron.oktetlabs.ru>
Date: Mon, 14 Nov 2005 14:26:40 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
	charset="utf-8"
Cc: linux-mtd@lists.infradead.org
Subject: Re: CRC error of jffs2_get_inode_nodes() for JFFS2 on NAND
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

----- Original Message ----- 
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: "陳羿逞 \(Chuck\)" <ycchen@realtek.com.tw>
Cc: <linux-mtd@lists.infradead.org>
Sent: Sunday, November 13, 2005 9:09 PM
Subject: Re: CRC error of jffs2_get_inode_nodes() for JFFS2 on NAND


> On Tue, 2005-11-08 at 16:36 +0800, 陳羿逞 \(Chuck\) wrote:
> > What time will JFFS2 flush wbuf out to sync the data if there is a
> > remainder in wbuf ?
> >
> http://lists.infradead.org/pipermail/linux-mtd/2005-November/014285.html
> http://lists.infradead.org/pipermail/linux-mtd/2005-November/014286.html
>

 Thanks for your information.
 Dose it to say that is there a possibility to make data missing if we
interrupt the GC operation just like shutdowm the system before a wbuf flush
?
 In my system, the JFFS2 CRC error of inode always happens after a reboot.
