Received: from mgw-x3.nokia.com ([131.228.20.26])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CKcjf-0007YL-76
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2004 09:12:18 -0400
Date: Thu, 21 Oct 2004 15:49:26 +0300
From: Jarkko Lavinen <jarkko.lavinen@nokia.com>
Message-ID: <20041021124926.GA1497@angel.research.nokia.com>
References: <41767593.9030004@inf.u-szeged.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41767593.9030004@inf.u-szeged.hu>
Sender: <jlavi@angel.research.nokia.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 20, 2004 at 04:26:27PM +0200, ext Ferenc Havasi wrote:
> Jarkko made a measurement on a real NAND device: his JFFS2 image was 
> 120819928 (115M), after running sumtool the new image was 123338752 (117M).
> 
> Using the original mount time was 55 sec, with the new image it is only 
> 8.5 sec.

My initial test was only about the mount time. I have now also tried
to exercise the patched file system and with very little testing I get
CRC or ECC errors.

  # mount /dev/mtdblock2 /mnt -t jffs2
  # mkdir /mnt/testdir
  # umount /mnt
  jffs2_flush_wbuf(): Write failed with -5
  # mount /dev/mtdblock2 /mnt -t jffs2
  mtd->read(0x1fbec bytes from 0x1fc0414) returned ECC error
  Empty flash at 0x01fc2f1c ends at 0x01fc3000
  #

With plain 2.6.9-rc4-omap1 with fresh CVS MTD code, I don't see anything
weird occuring.

Jarkko Lavinen
