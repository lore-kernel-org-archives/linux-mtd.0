Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16j2Oe-0005Xt-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Mar 2002 18:13:44 +0000
Date: Thu, 7 Mar 2002 19:25:06 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: Steve Wahl <swahl@brecis.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Possible bug in /proc/mtd ?
Message-ID: <20020307192506.A12769@wohnheim.fh-wedel.de>
References: <20020306094431.C15112@brecis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20020306094431.C15112@brecis.com>; from swahl@brecis.COM on Wed, Mar 06, 2002 at 09:44:31AM -0600
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi!

> Does anyone else get some sort of strange behavior if they run:
> 
> 	dd if=/proc/mtd of=/dev/tty bs=1
> 
> The strange behavior on my system is a hang; it may be an oops or
> panic of some sort on a system with a mmu.
>
> [...]
> 
> -        *start = page + (begin-off);
> +        *start = page + (off-begin);

Pretty obvious. You must be the first one to ever try that. :-)

David, is it ok, if I apply?

Jörn

-- 
When in doubt, use brute force.
-- Ken Thompson
