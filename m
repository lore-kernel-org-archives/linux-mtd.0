Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B2zv2-0001we-5S
	for linux-mtd@lists.infradead.org; Mon, 15 Mar 2004 21:46:44 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Brian T <btuch@usa.net>
In-Reply-To: <002901c406cb$3c049ec0$fd0ba8c0@briantpc>
References: <002901c406cb$3c049ec0$fd0ba8c0@briantpc>
Content-Type: text/plain
Message-Id: <1079387201.5835.344.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Mon, 15 Mar 2004 21:46:41 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: free_list / free_size messages
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-03-10 at 12:12 -0600, Brian T wrote:
> Hi,
> 
> Since moving from JFFS2 2.1 to 2.2, I have noticed klog messages I didn't
> see before.  It only seems to happen after a fresh flash when writing data
> to the romfs.  sometimes I get a few messages, but this time I only got the
> one:
> 
> Mar 10 12:07:25 klogd: Eep. Block 0x00120000 taken from free_list had
> free_size of 0x00000038!!

I've no idea what could cause this; it's a sanity check which I don't
recall ever happening to anyone else. Can you run with a serial console
and CONFIG_JFFS2_FS_DEBUG=1, and with 'debug' on the kernel command
line. Log _everything_ it says, and hopefully it'll give us a clue.

-- 
dwmw2
