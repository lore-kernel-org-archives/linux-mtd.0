Received: from smtprelay02.ispgateway.de ([80.67.18.14])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ejbib-00086P-AF
	for linux-mtd@lists.infradead.org; Tue, 06 Dec 2005 07:14:54 -0500
Message-ID: <439580AA.4050407@gmail.com>
Date: Tue, 06 Dec 2005 13:14:34 +0100
From: Bernhard Priewasser <priewasser@gmail.com>
MIME-Version: 1.0
To: Jared Hulbert <jaredeh@gmail.com>
References: <4379B814.3010407@gmail.com>	
	<6934efce0511170958j9df6e3cu6329cf51088416f@mail.gmail.com>	
	<437D9F6F.80102@gmail.com>	
	<6934efce0511211418s5317b7a6tee5b391e28eb8491@mail.gmail.com>	
	<4382EF68.3010204@gmail.com>
	<6934efce0512031336p292fd27fjbfbf6fbabd750023@mail.gmail.com>
In-Reply-To: <6934efce0512031336p292fd27fjbfbf6fbabd750023@mail.gmail.com>
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

> Sorry for the long wait.
No problem.

> Let me ask around a little more.  This is an arm7 processor,
> no L1 or L2 caches?
ARM 720T, 8 KiB combined instruction/data cache. I don't know if there 
is any L2-Cache on Hynix HMS30C7202; but if there is one, I doubt it's 
as big as 128 KiB.
It looks pretty much like there is a cache sized 128 KiB somewhere 
beetween fread() and the flash. But don't know where...

-- 
Bernhard
