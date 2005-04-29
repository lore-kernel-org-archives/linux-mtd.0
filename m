Message-ID: <4272ABFF.7070709@netwinder.org>
Date: Fri, 29 Apr 2005 17:49:51 -0400
From: Ralph Siemsen <ralphs@netwinder.org>
MIME-Version: 1.0
To: Sam Pham <anhmn@yahoo.com>
References: <20050429212410.49709.qmail@web54109.mail.yahoo.com>
In-Reply-To: <20050429212410.49709.qmail@web54109.mail.yahoo.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd emulation
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sam Pham wrote:
> I'd like to evaluate JFFS2.  Has anyone done this
> before?  Does linux have the capability of emulating
> mtd block device and mtd memory so that I can run
> JFFS2 on top of it without using the actual flash?

I believe you can use MTD_MTDRAM for this.  There are a few associated 
parameters (total size, erase block size) to be fiddled as well.  See 
the the file linux-2.6.x/drivers/mtd/devices/mtdram.c

-R
