Received: from nz-out-0102.google.com ([64.233.162.197])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GmYRu-00045R-2v
	for linux-mtd@lists.infradead.org; Tue, 21 Nov 2006 11:26:21 -0500
Received: by nz-out-0102.google.com with SMTP id i11so2039420nzi
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Nov 2006 08:26:13 -0800 (PST)
Message-ID: <79ac09b60611210826j33b6b2aeh95d9259ddd3f0481@mail.gmail.com>
Date: Tue, 21 Nov 2006 10:26:11 -0600
From: Duke <ezbonites@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: mtd_debug usage
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
I'm having a bit of trouble understanding the usage to mtd_debug.

With the usage format below, why would I need <offset> and <len> if
the mtdblock sizes are already known? (i.e at boot)
I always thought if I write "mtd_debug erase /dev/mtdblock2" it will
erase the entire /dev/mtdblock2 device. not so?
If not, do I specify "mtd_debug erase /dev/mtdblock2 0x0 0x600000" for
mtdblock2 where 0x0 indicated the start of the block?

When I do a write "mtd_debug write /dev/mtdblock2 0x0 0x600000 myfs.cramfs"
would it do just this?

I've seen usage where /dev/mtd2 is used instead of /dev/mtdblock2,
what is the difference here? which should it be. It seems to me that
/dev/mtd2 simply gives the node info (mtd_debug info )and
/dev/mtdblock2 is really what you want to used. Do I have this
correct?

usage: mtd_debug info <device>
       mtd_debug read <device> <offset> <len> <dest-filename>
       mtd_debug write <device> <offset> <len> <source-filename>
       mtd_debug erase <device> <offset> <len>

Thanks.
