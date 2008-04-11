Date: Fri, 11 Apr 2008 19:00:42 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: Jean Pihet <jpihet@mvista.com>
Subject: Re: [BUG] JFFS2 usage of write_begin and write_end functions causes
	kernel panic
In-Reply-To: <200804101918.21362.jpihet@mvista.com>
Message-ID: <Pine.LNX.4.64.0804111824450.12186@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0804101152270.13226@pentafluge.infradead.org>
	<200804101918.21362.jpihet@mvista.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: nickpiggin@yahoo.com.au, joern@logfs.org, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jean,
> Alexey,
> 
> Here is the patch (attached) I applied to get a stable JFFS2 filesystem.
> The changes have been cherry picked from 
> http://sourceforge.net/projects/mtd-mods.
> 
> I stressed it with intensive read/write, flash fill-up and data removal. A few 
> GB's of data have been transferred without any problem. I didn't try the tool 
> you mentionned though.
> Tested on OMAP3 platform.
> 
> Now I am testing with PREEMPT_RT config.

Oh very interesting link. I'm glad to hear that people use it - even
before announce. Actually I know this project very well - I'm the author and maintainer of this ;-). The project will be announced soon.

You can find the workaround  for the kernel panic problem which disables write_begin and write_end in JFFS2 already exists in the newest release. But fix for the problem does not ready yet. We found one bug in implementation but post validation is not completed yet.  

The patch you have sent is intended to fix another kernel panic issue. It doesn't depend on write_begin/write_end functionalities. Sometime ago we posted the fix to get included, but it was rejected. 

Thanks,
Alexey
