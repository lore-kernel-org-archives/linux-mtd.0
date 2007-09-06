Received: from mail.ku-gbr.de ([81.3.11.18] helo=ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1ITCyq-0002Qv-GA
	for linux-mtd@lists.infradead.org; Thu, 06 Sep 2007 04:44:56 -0400
Date: Thu, 6 Sep 2007 10:44:18 +0200
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Subject: Re: General performance of NAND operations i.e mount and ls
Message-ID: <20070906084418.GC2164@z1.synertronixx>
References: <20070906081215.GA5693@anita.doom>
	<1189067241.14370.23.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1189067241.14370.23.camel@sauron>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2007-09-06 11:27 +0300 schrieb Artem Bityutskiy:
> Hi,

Hi There :-)

> If you useed on-flash BBT, you'd avoid scanning and make this phase
> faster. But the improvement would be nothing comparing to JFFS2's delay.

Yes, it is on-flash BBT but the scan time is okay and the probing
lasting two seconds is no issue.

> Well, JFFS2 scans on mount, so no wonder it is that long. Summary should
> improves the situation - do you have it enabled?

Summary is enabled in Kernel but I created the files with flash_eraseall
and mounted the block device as jffs2 and copied the files onto it in
system. So no summaryze, is that right?

> It's because you use -a, which causes stat() to be called for each file.
> Stat causes read_inode(), which is slow. It builds file's fragtree,
> which means it reads and checks each of its nodes. So the larger is the
> file the longer it takes to stat() it for the first time (the second and
> later are cached).

Okay.

> I do not think you may make JFFS2 work faster on such big flash with
> such big files, at least it will be difficult and would require core
> jffs2 changes.

Okay, I wanted to check if the time is okay for 520MHz core with 104MHz
Bus and 8Bit flash. If this is the case my Hardware driver is okay.
There is no urge to improve this stat() time and fragtree building at
the moment. If it takes so long and the driver is okay it wioll take so
long (arguing with boss and customers :-)).

> I'd suggest you to try UBIFS - it must be faster. We would also be
> interested to get a feedback.

Hmm. I will take a look at this :-)

Kind Regards, Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
