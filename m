Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ISh2-0002EI-00
	for <linux-mtd@lists.infradead.org>; Thu, 13 Jun 2002 12:23:08 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <002e01c212c9$6c6dd920$0100a8c0@ester> 
References: <002e01c212c9$6c6dd920$0100a8c0@ester>  <001101c212c6$de2f94c0$0100a8c0@ester> <003101c212b5$95362790$0100a8c0@ester> <16692.1023958536@redhat.com> <28908.1023965039@redhat.com> 
To: "Krypton" <krypton8@inwind.it>
Cc: linux-mtd@lists.infradead.org
Subject: Re: first jffs2 boot problem 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 13 Jun 2002 12:23:07 +0100
Message-ID: <32493.1023967387@redhat.com>
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

krypton8@inwind.it said:
>  Image was created using  mkfs.jffs2 -o root.jffs2 -e 0x20000 -r
> tmproot -p -l

> and is was put onto the flash using my own bootloader 

Is there definitely a /lib directory in the directory from which you made 
the image? Can you make the image available somewhere?

--
dwmw2
