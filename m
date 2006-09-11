Received: from www.kernelconcepts.de ([212.60.202.195]
	helo=mail.kernelconcepts.de)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GMjEU-00065x-UW
	for linux-mtd@lists.infradead.org; Mon, 11 Sep 2006 11:41:43 +0100
Message-ID: <45053D5C.5020005@kernelconcepts.de>
Date: Mon, 11 Sep 2006 12:41:32 +0200
From: Nils Faerber <nils.faerber@kernelconcepts.de>
MIME-Version: 1.0
To: Felix Joussein <felix@joussein.com>
Subject: Re: howto jffs2 + mtd
References: <450534E0.2000405@joussein.com>
	<45053680.1060206@kernelconcepts.de>
	<45053A19.5050801@joussein.com>
In-Reply-To: <45053A19.5050801@joussein.com>
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

Felix Joussein schrieb:
>> You do not need that on the mtdblock device. This is only useful on real
>> flash devices, i.e. physicall mapped flash devices, not USB sticks or CF
>> cards.
> So, how else do I get a jffs2 filesystem on my usb or cf?

Oh, sorry, I should have been more precise.
You do not need the flash_erase or flash_erase_all. The rest of the
process is the same.

> As I understand any other filesystem would shredder my usb-stick after a
> approx. 1 mio writes?

But anyway, JFFS2 is not a very good idea on a USB stick. The problem is
that the stick's flash controller already does wear levelling and error
correction for you, transparantly.
With JFFS2 you might end up with doing the process twice which might
result in even worse performance than with a "normal" filesystem, like EXT2.
You should be pretty safe with an ext2 if you mount it with "noatime"
option and if possible, read-only.

> Thanks again,
> Felix
Cheers
  nils

-- 
kernel concepts GbR      Tel: +49-271-771091-12
Dreisbachstr. 24         Fax: +49-271-771091-19
D-57250 Netphen          Mob: +49-176-21024535
--
