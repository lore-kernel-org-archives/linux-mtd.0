Subject: Re: File size limitation on JFFS2.
From: David Woodhouse <dwmw2@infradead.org>
To: Han Chang <posaune@hotmail.com>
In-Reply-To: <BAY110-F38A943ADF26D7AEF738A26BC680@phx.gbl>
References: <BAY110-F38A943ADF26D7AEF738A26BC680@phx.gbl>
Content-Type: text/plain
Date: Wed, 12 Jul 2006 00:01:51 +0100
Message-Id: <1152658911.25567.83.camel@shinybook.infradead.org>
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

On Tue, 2006-07-11 at 15:32 -0700, Han Chang wrote:
> I'm trying to put a file of size 1G on the JFFS2/NAND. I got "Out of Memory" 
> error. Looks like the max size of file I can put on it is 500M, though my 
> NAND has 2G space. This is on Linux. I noticed JFFS2 is using filemap in the 
> Linux mm, where it crashed. Any help? 

Yeah, JFFS2 doesn't scale well to that kind of size. Are you using the
2.6.18-rc1 kernel? That has some improvements to its memory usage.

Another thing that'll help with this is going to 16KiB or 32KiB node
sizes instead of limiting them to 4KiB.

-- 
dwmw2
