Received: from go4.ext.ti.com ([192.91.75.132])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AwaOg-0007CL-P8
	for linux-mtd@lists.infradead.org; Fri, 27 Feb 2004 05:18:50 +0000
Received: from dlep51.itg.ti.com ([157.170.141.75])
	by go4.ext.ti.com (8.12.11/8.12.11) with ESMTP id i1R5IlXF012661
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Feb 2004 23:18:48 -0600 (CST)
Received: from popsvr.india.ti.com (localhost [127.0.0.1])
	by dlep51.itg.ti.com (8.12.10/8.12.10) with ESMTP id i1R5IjJk005145
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Feb 2004 23:18:46 -0600 (CST)
Received: from SBAJAN14 (sbajan-14.india.ti.com [192.168.182.115])
	by popsvr.india.ti.com (8.8.8/8.8.8) with SMTP id KAA09393
	for <linux-mtd@lists.infradead.org>;
	Fri, 27 Feb 2004 10:48:43 +0530 (IST)
Message-ID: <032e01c3fcf1$2bacab00$73b6a8c0@ent.ti.com>
From: "Trilok Soni" <x000soni@india.ti.com>
To: <linux-mtd@lists.infradead.org>
References: <015601c3fc3b$49a70b20$73b6a8c0@ent.ti.com>
	<1077782240.11584.1041.camel@imladris.demon.co.uk>
Date: Fri, 27 Feb 2004 10:48:43 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Re: Unable to mount rootfs on mtdblock3
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David,

Yes, it worked out. Kernel is able to mount jffs2 on H2 Board.

--
I think, I need to spend more time on reading 2.6.x kernel updates and
changelogs again.!!!

Regards,
Trilok Soni
----- Original Message -----
From: "David Woodhouse" <dwmw2@infradead.org>
To: "Trilok Soni" <x000soni@india.ti.com>
Cc: <linux-mtd@lists.infradead.org>
Sent: Thursday, February 26, 2004 1:27 PM
Subject: Re: Unable to mount rootfs on mtdblock3


> On Thu, 2004-02-26 at 13:06 +0530, Trilok Soni wrote:
>
> > 3. Now I had tried to boot using root=/dev/mtdblock3 command line
argument.
> > Here is the kernel -boot output.
>
> In the 2.6 kernel you also need 'rootfstype=jffs2'.
>
> --
> dwmw2
>
>
>
