From: David Woodhouse <dwmw2@infradead.org>
To: vsergey@digitalparus.com
In-Reply-To: <1072696192.3ff00b80ee311@digitalparus.com>
References: <1072696192.3ff00b80ee311@digitalparus.com>
Content-Type: text/plain
Message-Id: <1072783494.2059.2.camel@lapdancer.baythorne.internal>
Mime-Version: 1.0
Date: Tue, 30 Dec 2003 11:39:02 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Problem using JFFS2 with NOR flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-12-29 at 20:09 +0900, vsergey@digitalparus.com wrote:
> I have a problem with JFFS2 romfs. I can mount empty JFFS2 partition only first 
> time!!! Here is the log.

Looks like a problem with the underlying flash drivers, not with JFFS2.
Double-check that the partition really is empty when you've attempted to
erase it, and that anything you write to it via pwrite() to /dev/mtd2
actually works.

Check bus width, Vpp handling, etc. are correct. If it's the newer flash
which requires unlocking after every reset, check that's done too.

-- 
dwmw2
