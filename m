Received: from automatix.objectxp.com ([62.2.156.210])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HTdbN-0006TG-2d
	for linux-mtd@lists.infradead.org; Tue, 20 Mar 2007 08:38:09 -0400
Message-ID: <45FFD596.7020205@objectxp.com>
Date: Tue, 20 Mar 2007 13:37:42 +0100
From: Michel Marti <mma@objectxp.com>
MIME-Version: 1.0
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: JFFS2: Filesystem corruption after umount/mount
References: <etoj9s$b84$1@sea.gmane.org>
	<625fc13d0703200531i359508a9jbe1a32524da5d6d1@mail.gmail.com>
In-Reply-To: <625fc13d0703200531i359508a9jbe1a32524da5d6d1@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

on 03/20/2007 01:31 PM Josh Boyer said the following:
> Do you have any output from the kernel after doing the
> mount/unmount/ls operations?  dmesg after those would perhaps be more
> interesting.

no output whatsoever - last thing that dmesg reports is:

  Freeing unused kernel memory: 124k init

Shall I rebuild the kernel with CONFIG_JFFS2_FS_DEBUG=1 and try again?

--Michel
