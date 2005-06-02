Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DdnqV-0005P4-Ux
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2005 07:26:45 -0400
Date: Thu, 2 Jun 2005 13:26:38 +0200
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050602112637.GA442@synertronixx3>
References: <1117710064.23635.100.camel@server21>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1117710064.23635.100.camel@server21>
Subject: Re: jffs2, intel flash and i.MX21
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2005-06-02 19:01 +0800 schrieb Munira Ahmed:

> 1)	how can I debug that 

Tell us what you did, what is happening, what should happening, what
hardware you are using, which bootloader.

> 2) 	which part of the kernel should I look into i.e where do I found the
> code to mount the jffs2 in the kernel tree

Oh my... fs/jffs2 or drivers/mtd.

> 3) what might be missing in the kernel config

Many many things. A mapping driver, or partition support, wrong
commandline, wrong chip driver, modules instead of *'s.

> 4) any other idea?

Many, your provided information is very insufficient.

Regards, Konsti
