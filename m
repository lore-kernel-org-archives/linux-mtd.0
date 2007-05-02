Subject: Re: JFFS2 wrong data CRC message
From: David Woodhouse <dwmw2@infradead.org>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
In-Reply-To: <46388BF9.4060807@nokia.com>
References: <46385786.5020804@nokia.com>
	<1178108604.2875.182.camel@pmac.infradead.org>
	<46388BF9.4060807@nokia.com>
Content-Type: text/plain
Date: Wed, 02 May 2007 14:06:24 +0100
Message-Id: <1178111184.2875.185.camel@pmac.infradead.org>
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

On Wed, 2007-05-02 at 16:02 +0300, Adrian Hunter wrote:
> Unfortunately I started with an empty flash and have not rebooted at all.
> 
> I've been running stress tests constantly for about a week, and this is
> the only JFFS2 message.  The tests do unmount and remount, but there are
> no error messages.
> 
> So unless you can offer an alternative explanation I am going to have to
> assume it is an error.

That's certainly possible -- and in fact is why I've resisted the
persistent requests _not_ to print that message.

Can I see a hexdump of the offending node?

-- 
dwmw2
