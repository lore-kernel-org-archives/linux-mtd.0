Received: from tomts8.bellnexxia.net ([209.226.175.52] helo=tomts8-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17BdZO-000569-00
	for <linux-mtd@lists.infradead.org>; Sat, 25 May 2002 16:35:02 +0100
Date: Sat, 25 May 2002 11:34:58 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: =?gb2312?q?cytang?= <cytang_cn@yahoo.com.cn>
cc: linux-mtd@lists.infradead.org
Subject: Re: Why cannot boot off my doc 2000 ?
In-Reply-To: <20020525082133.75934.qmail@web14405.mail.yahoo.com>
Message-ID: <Pine.LNX.4.44.0205251131130.17602-100000@server.superbt.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Sat, 25 May 2002, [gb2312] cytang wrote:

> run dmesg , I can find diskonchip found on 0xdc000
> ,and I can read/write/mount /dev/nftla1 .
> however I run "dformat /win:dc000 " ,I get "no
> diskonchip 2000R found at c000:0" 

<offtopic>
Does dformat needs the segment address which is the absolute address 
divided by 16?  If this is true, perhaps /win:dc00 might work.
</offtopic>

Ilguiz
