Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TheH7-0005wO-Ea
 for linux-mtd@lists.infradead.org; Sun, 09 Dec 2012 10:38:22 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH 1/3] mtd: nand/docg4: add support for writing in reliable
 mode
References: <1354910843-5598-1-git-send-email-mikedunn@newsguy.com>
 <1354910843-5598-2-git-send-email-mikedunn@newsguy.com>
 <87hanvplmy.fsf@free.fr>
Date: Sun, 09 Dec 2012 11:38:12 +0100
In-Reply-To: <87hanvplmy.fsf@free.fr> (Robert Jarzmik's message of "Sun, 09
 Dec 2012 11:25:57 +0100")
Message-ID: <87a9tnpl2j.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Robert Jarzmik <robert.jarzmik@free.fr> writes:

> I was considering adding this to the docg3 driver, but I didn't because I was
> afraid what would happen if you change this mode *after* mounting a partition.
> Imagine you have your rootfs mounted on /dev/mtd2, and u-boot is in /dev/mtd1 :
> wouldn't changing the reliable mode to write "mtd1" corrupt all writes to mtd2
> ?

I will rephrase that : I didn't "succeed" in having that parameter mtd partition
bound. If you find a way, I'll steal it for docg3 driver :)

If you don't, your patch is fine :
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

-- 
Robert
