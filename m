Subject: Re: Linux Boot Time measurements
From: David Woodhouse <dwmw2@infradead.org>
To: Davide CASCONE <davide.cascone@st.com>
In-Reply-To: <003501c69510$e7e9c370$253682a4@nap.st.com>
References: <003501c69510$e7e9c370$253682a4@nap.st.com>
Content-Type: text/plain
Date: Wed, 21 Jun 2006 10:26:05 +0100
Message-Id: <1150881965.3176.584.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-06-21 at 10:58 +0200, Davide CASCONE wrote:
> 2. about 1.2s to mount the JFFS2 file system on a 16MByte partion
> (13MByte of used space and 3MByte of free space)
> 
> What do you think about these measurements?
> Any suggestion to improve the performances? 

Profile it. Then quadruple INOCACHE_HASHSIZE and profile it again :)

Are you using summary? We can halve the amount of data we have to read
from the flash.... I've had that half-implemented for about two weeks
now. Must get it done before the 2.6.18 merge window closes...

-- 
dwmw2
