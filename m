Received: from [195.205.16.233] (helo=dgt-lab.com.pl)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15fGzL-0006NW-00
	for <linux-mtd@lists.infradead.org>; Fri, 07 Sep 2001 09:27:47 +0100
Received: from dgt-lab.com.pl (unknown [192.168.6.66])
	by dgt-lab.com.pl (Postfix) with ESMTP id E1876479F
	for <linux-mtd@lists.infradead.org>; Fri,  7 Sep 2001 09:36:59 +0200 (CEST)
Message-ID: <3B98865D.8043C745@dgt-lab.com.pl>
Date: Fri, 07 Sep 2001 10:33:33 +0200
From: Wojciech Kromer <krom@dgt-lab.com.pl>
MIME-Version: 1.0
To: mtd <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 on 8MB Flash-Chip conneted to MPC850 works extremly slow:(
References: <3B987838.A7F8B7AA@dgt-lab.com.pl>  <3C6BEE8B5E1BAC42905A93F13004E8AB6B6B35@mailse01.axis.se> <18025.999850205@redhat.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
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


David Woodhouse wrote:

> krom@dgt-lab.com.pl said:
> >  But writing my user partition (/dev/mtdblock4) destroys data from the
> > begining of my chip ! What's wrong?
>
> Put printk statements in the glue functions which add the offset to the
> write request and pass it along. See if they're adding the correct offset.
>

Which funcion do You mean?

Another msgs:
# dd if=file of=/dev/mtdblock4
588+1 records in
588+1 records out
Last[3] is a79f, datum is 7c60
end_request: I/O error, dev 1f:04 (mtdblock), sector 128
Last[3] is a79f, datum is 7c60
.....

But /dev/mtdblock4 should be1024K (see my prev mail)



--
* * * * * * * * * * * *
* per pedes ad astra! *
* * * * * * * * * * * *    mailto:krom@dgt-lab.com.pl
