Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15H5wi-0000ce-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jul 2001 16:49:08 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010702150401.CE683E814@lin01.mn-logistik.de> 
References: <20010702150401.CE683E814@lin01.mn-logistik.de> 
To: Holger Schurig <h.schurig@mn-logistik.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 loop mounting 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 02 Jul 2001 16:54:29 +0100
Message-ID: <15141.994089269@redhat.com>
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

h.schurig@mn-logistik.de said:
> How difficult would it be for a relatively kernel-newby to add
> mount -o loop -t jffs2 /var/tmp/somefile.jffs2 /mnt/jffs2
> support? 

On your workstation:

modprobe mtdram totalsize=$TOTALSIZE erasesize=$ERASESIZE
dd if=somefile.jffs2 of=/dev/mtd0
mount -t jffs2 /dev/mtdblock0 /mnt/jffs2


--
dwmw2
