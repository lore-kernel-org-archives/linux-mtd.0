Received: from web8503.mail.in.yahoo.com ([202.43.219.165])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E0An3-0001Sg-Hh
	for linux-mtd@lists.infradead.org; Wed, 03 Aug 2005 00:23:50 -0400
Message-ID: <20050803042331.59780.qmail@web8503.mail.in.yahoo.com>
Date: Wed, 3 Aug 2005 05:23:31 +0100 (BST)
From: Soma sundaram Veerappan <soma_edu@yahoo.co.in>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1122902406.22995.6.camel@weaponx.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd-20040610
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Thanks.I got the patch, but in compilation i am
getting some error while linking mtdlink.o to create
vmlinux.

drivers/mtd/mtdlink.o(.text+0x714c): In function
`do_read_onechip':
: undefined reference to `memcpy_fromio'

definition for "memcpy_fromio" is not there in
include/asm-arm/io.h

Thanks in advance.

Regards,
Soma sundaram.V


> > I am working with linux-2.4.18-rmk7 for arm and i
> need
> > mtd-20040610.I am not finding this patch on net
> and
> > infrared.org ftp site.can someone please give some
> > pointers where can i find this patch.
> 
> Please read:
> 
>
http://linux-mtd.infradead.org/source.html#kernelversions
> 
> It tells you in there how to extract a certain
> snapshot from CVS.
> 



		
_______________________________________________________
Too much spam in your inbox? Yahoo! Mail gives you the best spam protection for FREE! http://in.mail.yahoo.com
