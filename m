Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18LkkM-0006CW-00
	for <linux-mtd@lists.infradead.org>; Tue, 10 Dec 2002 13:48:26 +0000
Date: Tue, 10 Dec 2002 15:18:58 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: fred <fred@sc23.sc.mcel.mot.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Which filesystem can live on one flash sector?
Message-ID: <20021210141858.GC23134@wohnheim.fh-wedel.de>
References: <20021210071208.F30D7154A1@dragon.actrix.co.nz> <000101c2a053$f2732f80$940879c8@sc.mcel.mot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <000101c2a053$f2732f80$940879c8@sc.mcel.mot.com>
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

On Tue, 10 December 2002 21:56:31 +0800, fred wrote:
> 
> Ok, I understand I can't run JFFS at only one sector.
> 
> In fact, I have 64k space left for saving configuration data.
> The size of a sector is 64k normally except the bottom sectors that are 8k,
> 4k, 4k, 16k, 32k.
> So you see, I have five sectors to run JFFS rather than one 64k sector.
> Then, is it possible to run JFFS on these sectors?

Yes, jffs (not jffs2) would be working on those sectors. But I fear
that the partition code doesn't treat them seperately, so jffs will
only see one sector and won't work.
You should tweak the partition code or provide your own mapping driver
to get it working. Something like that

Jörn

-- 
Everything should be made as simple as possible, but not simpler.
-- Albert Einstein
