Received: from smtp-3.hut.fi ([130.233.228.93] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173giA-0005Ut-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 May 2002 18:19:14 +0100
Date: Fri, 3 May 2002 20:19:00 +0300
From: Jarkko Lavinen <jlavi@iki.fi>
To: David Woodhouse <dwmw2@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>, jffs-dev@axis.com
Subject: Re: Benchmarking JFFS2
Message-ID: <20020503201900.A32761@kosh.hut.fi>
References: <20020502155602.A8801@kosh.hut.fi> <13211.1020346858@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
In-Reply-To: <13211.1020346858@redhat.com>; from dwmw2@infradead.org on Thu, May 02, 2002 at 02:40:58PM +0100
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

--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> I suspect your results are skewed, and can see two possible reasons.
> 1. The file system is getting progressively dirtier as your tests continue.
>    Perhaps you should take a complete snapshot of the flash when the file
>    system is 'dirty', and reinstall that precise image before each run.

It is quite laborious to flash a new file-system for each benchmark
run. Instead I added an option to make clean file-system dirty.

The program opens two files and fills the file-system writing these two
files in turns. The file A writes big blocks (about 2K) and is thrown
away once the file-system fills. The file B writes smaller blocks but
is left in place. Because the writes for the two files occurred in tuns
every erase block will have about 90% of garbage and small live data
pieces here and there. This dirtiness is reproducible and but perhaps even
too dirty and artificial for benchmarking.

Rerunning the benchmark with this setup had dramatic result. You were
right. My results were badly skewed.

Now the write performance peak is 11300 B/s at 1024 byte block
size. After 4K block size the throughput drops close to 2KB/s. I have
included the gnuplot figure containing the previous result from clean
file-system and the new result from extra dirty file-system. 

During my benchmark runs I have encountered 'Eep. read_inode() failed for 
ino #...'. Is this something I should be concerned?

Jarkko Lavinen

--3V7upXqbjpZ4EhLz
Content-Type: image/png
Content-Disposition: attachment; filename="combined.png"
Content-Transfer-Encoding: base64

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
IQAAAABJRU5ErkJggg==

--3V7upXqbjpZ4EhLz--
