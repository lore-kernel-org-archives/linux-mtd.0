Received: from mailrelay2.inwind.it ([212.141.54.102])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17IWxo-0002U7-00
	for <linux-mtd@lists.infradead.org>; Thu, 13 Jun 2002 16:56:44 +0100
Received: from ester (62.98.12.59) by mailrelay2.inwind.it (6.5.015)
        id 3CF4B8F500AF4983 for linux-mtd@lists.infradead.org; Thu, 13 Jun 2002 17:56:16 +0200
Message-ID: <003301c212f3$0d3ba200$0100a8c0@ester>
Reply-To: "Krypton" <krypton8@inwind.it>
From: "Krypton" <krypton8@inwind.it>
To: <linux-mtd@lists.infradead.org>
References: <002e01c212c9$6c6dd920$0100a8c0@ester>  <001101c212c6$de2f94c0$0100a8c0@ester> <003101c212b5$95362790$0100a8c0@ester> <16692.1023958536@redhat.com> <28908.1023965039@redhat.com>  <32493.1023967387@redhat.com>
Subject: Re: first jffs2 boot problem 
Date: Thu, 13 Jun 2002 17:54:40 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

> >  Image was created using  mkfs.jffs2 -o root.jffs2 -e 0x20000 -r
> > tmproot -p -l
>
> > and is was put onto the flash using my own bootloader
>
> Is there definitely a /lib directory in the directory from which you made
> the image? Can you make the image available somewhere?
>

Great David !
The problem was the missing /lib directory.
Thank you very much

Marco
