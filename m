From: David Woodhouse <dwmw2@infradead.org>
To: Pedro Aguilar <paguilar@junkerhq.net>
In-Reply-To: <61863.81.72.55.167.1102777897.squirrel@81.72.55.167>
References: <61863.81.72.55.167.1102777897.squirrel@81.72.55.167>
Content-Type: text/plain
Date: Tue, 21 Dec 2004 11:39:20 +0000
Message-Id: <1103629161.6111.55.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: Re: Kernel freezing when booting with jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2004-12-11 at 16:11 +0100, Pedro Aguilar wrote:
> The problem is that when mounting the jffs2 filesystem it says read-only
> (I'm not giving it any read-only flag in the MTD partition) and then shows
> the msg 'Warning: unable to open an initial console'

Is there a /dev/console node in your file system? Mounting read-only is
normal -- add 'rw' on the command line if you don't want it read-only.

-- 
dwmw2
