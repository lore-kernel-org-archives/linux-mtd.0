Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D9NIm-0001Bs-LR
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2005 08:02:09 -0500
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id 909512F016
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 Mar 2005 14:02:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 84C4011828
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 Mar 2005 14:02:04 +0100 (CET)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id D2610117BE
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 Mar 2005 14:02:03 +0100 (CET)
Message-ID: <42304549.6080104@imc-berlin.de>
Date: Thu, 10 Mar 2005 14:02:01 +0100
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <1110380223.422f0ebf951f5@intern.netexpress.de>
In-Reply-To: <1110380223.422f0ebf951f5@intern.netexpress.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Bugreport: mkfs.jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Wolfram Gettert wrote:
> Hi,
> I want to report two bugs on mkfs.jffs2 Revision 1.44
> 
> 1.
> I tried to create a file sytem image with this commandline.
> 
> mkfs.jffs2 -l -e 0x20000 -D devtable.txt -d rootfs -o test.img
> 
> The file devtable.txt contains a line  
> 
> ----8<-----
> /dev/input   d  755     0       0       -       -       -       -       -
> ----8<-----
> 
> and the rootfs directory contains a directory 
> 
> rootfs/dev/input
So what is the problem?

I am using mkfs.jffs2: revision 1.43 with devtable entries like

/dev/input       d   755     0       0       -       -       -       -       -
/dev/input/event c   640     0       0       13      64      0       1       1

and it works just fine...

--
Steven
