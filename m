Received: from fed1mtao03.cox.net ([68.6.19.242])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1818BL-0005Wx-00
	for <linux-mtd@lists.infradead.org>; Mon, 14 Oct 2002 17:35:03 +0100
Subject: Re: Memory usage?
From: Russ Dill <Russ.Dill@asu.edu>
To: Steve Tsai <startec@ms11.hinet.net>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
In-Reply-To: <000101c27359$9ec6d6b0$80d1a8c0@synso.com.tw>
References: <000101c27359$9ec6d6b0$80d1a8c0@synso.com.tw>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 14 Oct 2002 09:34:46 -0700
Message-Id: <1034613287.30080.19.camel@russ>
Mime-Version: 1.0
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

On Mon, 2002-10-14 at 01:13, Steve Tsai wrote:
> Does JFFS2 will allocate large memory to read big file? I have  a 128M
> bytes nand flash on my board and there is a large file about 12M bytes.
> After I use the  testing program to read the file, the free memory
> reduce to 312Kbytes (from 10660Kbytes). How can I reduce the memory
> usage of JFFS2? Thanks.

what do you mean by "free memory", are you including buffers and cache?
