Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKiIS-0002Rs-Ln
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2004 15:08:26 -0400
Message-ID: <417809FB.3060801@inf.u-szeged.hu>
Date: Thu, 21 Oct 2004 21:11:55 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
References: <41767593.9030004@inf.u-szeged.hu>
	<20041021124926.GA1497@angel.research.nokia.com>
In-Reply-To: <20041021124926.GA1497@angel.research.nokia.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, Kluba Patrik <pajko@halom.u-szeged.hu>,
	linux-mtd@lists.infradead.org
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jarkko,

> My initial test was only about the mount time. I have now also tried
> to exercise the patched file system and with very little testing I get
> CRC or ECC errors.
> 
>   # mount /dev/mtdblock2 /mnt -t jffs2
>   # mkdir /mnt/testdir
>   # umount /mnt
>   jffs2_flush_wbuf(): Write failed with -5
>   # mount /dev/mtdblock2 /mnt -t jffs2
>   mtd->read(0x1fbec bytes from 0x1fc0414) returned ECC error
>   Empty flash at 0x01fc2f1c ends at 0x01fc3000
>   #
> 
> With plain 2.6.9-rc4-omap1 with fresh CVS MTD code, I don't see anything
> weird occuring.

Can you send me the full kernel log file?

Another interesting test would be to test the new image (sumtool) with 
the CVS MTD code. Because the summary is RWCOMPAT_DELETE node it should 
works well. It would be nice to now if there is CRC/ECC errors in this case.

Thanks,
Ferenc
