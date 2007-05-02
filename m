Subject: Re: JFFS2 wrong data CRC message
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@lazybastard.org>
In-Reply-To: <20070502135133.GC20776@lazybastard.org>
References: <46385786.5020804@nokia.com>
	<1178108604.2875.182.camel@pmac.infradead.org>
	<46388BF9.4060807@nokia.com>
	<1178111184.2875.185.camel@pmac.infradead.org>
	<20070502135133.GC20776@lazybastard.org>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 May 2007 15:00:02 +0100
Message-Id: <1178114402.11120.15.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <ext-adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-05-02 at 15:51 +0200, Jörn Engel wrote:
> You could add a new node type to mark "safe" crc errors.  Something
> roughly like this:
> - Print error for crc errors, unless the next node in eraseblock is a
>   "known crc error" node.
> - Write "known crc error" node on mount for any node that is the last in
>   an eraseblock if there still is enough room to write further data.
> 
> That should be able to eliminate most false positive.  If you care.

I'm not sure we even need to go that far. If the data CRC fails and the
last data bytes are 0xFF rather than anything else, then it's almost
certain it's an unfinished write. I just don't care -- I'm happy enough
seeing the warning. 

-- 
dwmw2                       09 F9 11 02 9D 74 E3 5B D8 41 56 C5 63 56 88 C0
