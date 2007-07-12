Received: from ftp.linux-mips.org ([194.74.144.162])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I8yYU-0002R2-CT
	for linux-mtd@lists.infradead.org; Thu, 12 Jul 2007 09:18:04 -0400
Received: from localhost.localdomain ([127.0.0.1]:7331 "EHLO
	dl5rb.ham-radio-op.net") by ftp.linux-mips.org with ESMTP
	id S20022438AbXGLNSB (ORCPT <rfc822;linux-mtd@lists.infradead.org>);
	Thu, 12 Jul 2007 14:18:01 +0100
Date: Thu, 12 Jul 2007 14:02:59 +0100
From: Ralf Baechle <ralf@linux-mips.org>
To: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: [PATCH] MTD: Remove support for dead HYDROGEN3.
Message-ID: <20070712130259.GB11019@linux-mips.org>
References: <Pine.LNX.4.64.0707111406100.10131@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0707111406100.10131@localhost.localdomain>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 11, 2007 at 02:08:12PM -0400, Robert P. J. Day wrote:

> Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>
> 
> ---
> 
>   i've Cc'ed ralf baechle so he can verify that HYDROGEN3 is dead.  (i
> don't *think* i've sent this patch in before.)

It's dead since a while, so:

Acked-by: Ralf Baechle <ralf@linux-mips.org>

There was also another fragment of Hydrogen 3 code left under arch/mips
which I just deleted.

Cheers,

  Ralf
