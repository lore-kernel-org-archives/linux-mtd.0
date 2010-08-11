Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oj7q3-0000dQ-5F
	for linux-mtd@lists.infradead.org; Wed, 11 Aug 2010 09:43:11 +0000
Message-ID: <4C6270A9.5090606@parrot.com>
Date: Wed, 11 Aug 2010 11:43:05 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Jon Povey <Jon.Povey@racelogic.co.uk>
Subject: Re: How to stop mtd char device generating ECC on writes?
References: <70E876B0EA86DD4BAF101844BC814DFE0903DC2323@Cloud.RL.local>
In-Reply-To: <70E876B0EA86DD4BAF101844BC814DFE0903DC2323@Cloud.RL.local>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Jon Povey a écrit :
> But I can't seem to write it back properly using nandwrite.
> Testing on another partition mtd6, If I do this:
>   nandwrite -r -s 0x20000 /dev/mtd6 ubl0.dump
> then it seems my 64 bytes of "OOB" are skipped and I get a generated 24 bytes of 0xFF spare and 40 bytes of generated ECC.
> 
> If I use --noecc --oob instead of -r, it looks like my 64 bytes of "OOB" does get written, but then hardware ECC is getting written OVER THE TOP, i.e. the last 40 bytes have various bits 0 that should be 1 (but no 1s that should be 0)
> 
> I am looking through the nandwrite and drivers/mtd sources at the moment, but would love to get a clue if someone can tell me
> 
> - Does MTD support what I'm trying to do from userland?
yes write in raw mode + MEMWRITEOOB. But you will need 2 number of program.

> 
> - If yes, could this be a bug in the DaVinci NAND driver?
> 
> - Or, is nandwrite supposed to support this? or do I need to modify it?
> 
I don't know nandwrite


Matthieu.
