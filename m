From: David Woodhouse <dwmw2@infradead.org>
To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
In-Reply-To: <20040127100613.GA16078@angel.research.nokia.com>
References: <20040127100613.GA16078@angel.research.nokia.com>
Content-Type: text/plain
Message-Id: <1075211292.1633.90.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 27 Jan 2004 13:48:13 +0000
Content-Transfer-Encoding: 7bit
cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 case insensitivity
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-01-27 at 12:06 +0200, Jarkko Lavinen wrote:
> How difficult it would be to add support for file name case
> insensitivity to JFFS2?

I'm dubious about the need for this. 

You only need case insensitivity when the filename you're given is wrong
in case only -- which is basically only if you're taking input from the
user and trying to look up a filename directly, surely? 

On an embedded device, how often are your filenames coming from external
sources in that way, rather than being chosen by the user from a list?

Even then, it should be easy enough to do it in userspace if you really
need it.

Unless, of course, you're pondering a port to WinCE. In which case it's
easier than it would be under Linux. You don't actually _use_ the
readdir() and lookup() functions which the Linux version uses, you
implement real FindFirst() and FindNext() functions directly on top of
the JFFS2 core code, and can do what you want.

-- 
dwmw2
