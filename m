Received: from softsteprubberfloors.com ([192.220.111.56] helo=rcmenter.iserver.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18LncG-0006d5-00
	for <linux-mtd@lists.infradead.org>; Tue, 10 Dec 2002 16:52:16 +0000
Subject: Re: Which filesystem can live on one flash sector?
From: Russ Dill <Russ.Dill@asu.edu>
To: fred@sc23.sc.mcel.mot.com
Cc: linuxppc-embedded@lists.linuxppc.org, linux-mtd@lists.infradead.org
In-Reply-To: <000001c2a011$ab5926f0$940879c8@sc.mcel.mot.com>
References: <000001c2a011$ab5926f0$940879c8@sc.mcel.mot.com>
Content-Type: text/plain
Message-Id: <1039541302.8122.40.camel@timmy>
Mime-Version: 1.0
Date: 10 Dec 2002 10:28:22 -0700
Content-Transfer-Encoding: 7bit
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

On Mon, 2002-12-09 at 23:02, fred wrote:
> Hi,
> 
> I am using CRAMFS plus RAMFS on my board.
> And there is only one sector left for saving configuration data.
> Can I put a file system, e.g. JFFS, on it?

I'd make another block free and then do some sort of journalling from
userspace (each data block has a header with crc, size, header crc, and
revision). If you flash it boot block flash, the boot block may be the
place to find a couple small free sectors.
