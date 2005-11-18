Received: from smtprelay03.ispgateway.de ([80.67.18.15])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ed2aj-0001Go-E5
	for linux-mtd@lists.infradead.org; Fri, 18 Nov 2005 04:31:41 -0500
Message-ID: <437D9F6F.80102@gmail.com>
Date: Fri, 18 Nov 2005 10:31:27 +0100
From: Bernhard Priewasser <priewasser@gmail.com>
MIME-Version: 1.0
To: Jared Hulbert <jaredeh@gmail.com>
References: <4379B814.3010407@gmail.com>
	<6934efce0511170958j9df6e3cu6329cf51088416f@mail.gmail.com>
In-Reply-To: <6934efce0511170958j9df6e3cu6329cf51088416f@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Strange NOR read/write throughput behaviour
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 > Could you please explain the experiment a little more?
Sure!

 > How are you measuring read and write throughput?
C-Program, gettimeofday(). Very clean conditions: Empty flash, mount 
JFFS2, fopen one file. Measure duration of fwrite(filesize). Throughput 
= 1/duration.

 > Which StrataFlash are you using?
E28F128J3, 128 Mbit. 128KiB erase block size.

 > What board are you connecting the flash to?
Hynix HMS30C7202 evaluation board.

 > What kernel and MTD are you using?
Kernel 2.6.11-hnx3
MTD/JFFS2 of kernel 2.6.11. (I know, I should try newest CVS...)

-- 
Bernhard
