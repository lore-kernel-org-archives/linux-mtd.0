Message-ID: <428899DA.3040507@netwinder.org>
Date: Mon, 16 May 2005 09:02:18 -0400
From: Ralph Siemsen <ralphs@netwinder.org>
MIME-Version: 1.0
To: Munira Ahmed <munira.ahmed@radixs.com>
References: <1116226208.31694.26.camel@server11>
In-Reply-To: <1116226208.31694.26.camel@server11>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: stdio.h and kernel space
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Munira Ahmed wrote:
> I believe that stdio.h is used only in user space. If I am correct that
> can anybody please tell me why lld.c, low level driver for AMD CFI
> flash, contains stdio.h as header file?

You are correct, stdio.h is for userspace.  However I do not see the 
file lld.c in any standard kernel tree, either version 2.4 or 2.6. 
Where did you get your kernel source from, which version is it, and what 
patches have been applied to it?

-R
