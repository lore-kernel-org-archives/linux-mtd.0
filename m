Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16BO8n-0001OU-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Dec 2001 22:34:17 +0000
Date: Tue, 4 Dec 2001 23:44:46 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: Aleksander Sanochkin <asanochkin@lnxw.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: Re: JFFS1/MTD bug-fixes
Message-ID: <20011204234446.B14180@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.33.0112040822310.7813-300000@newbast.lynuxworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.33.0112040822310.7813-300000@newbast.lynuxworks.com>; from asanochkin@Lnxw.COM on Tue, Dec 04, 2001 at 08:30:10AM -0800
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

Hi!

> Yes, I've looked through Jörn Engel's code. Our modifications are less
> significant and are based on other goals in mind.
> 
> Primary goal was to allow for creating Flash partitions that consist of
> non-consequent sectors. For instance, the user may wish to chose sector
> 2 for storing some binary data and use sectors 1,3,4..... as a single
> JFFS partition.
> 
> Another goal was a possibility of flexible (re-)configration of the
> partitions, without having to change any C code. Supported methods are:
> build-time (via a CONFIG_... define), boot-time (via a kernel command
> line), and run-time (via an mtdchar IOCTL command). With all the three
> methods, the user uses a string notation to specify desired layout of the
> partitions. For instance, "0,3-8:1,2:9-25" means three partitions, with
> sectors 0 and 3 to 8 belonging to the first partition, 1 and 2 to the
> second, and 9 to 25 to the third.

We already have partitioning that is independent of the kernels normal
partitioning. Now you send in the equivalent of the logical volume
manager. The mtd code is getting there. :)

What are your reasons to use mtdchar ioctl()s for runtime
repartitioning? This should be pretty independent of the char device,
(caching) block device or whatever the future might still bring. Why
not a /proc interface?

Apart from that the design looks pretty sane. I will look through the
code and try to merge it with mine as soon as my workload drops to an
acceptable value again, most likely around christmas.

Joern
