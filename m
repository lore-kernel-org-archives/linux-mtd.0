Received: from josephine.discordia.ch ([193.246.253.137])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Nyng-0005Tq-00
	for <linux-mtd@lists.infradead.org>; Fri, 28 Jun 2002 17:40:48 +0100
Date: Fri, 28 Jun 2002 18:40:42 +0200
From: Peter Keel <grubby@discordia.ch>
To: g_friend@etang.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: How to Clean bad Grubfirmware off  DOC?
Message-ID: <20020628164042.GA5930@discordia.ch>
References: <3D1ADE5D.01401@webmta2>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <3D1ADE5D.01401@webmta2>
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

How funny. I did the same and now have the same problem. 

* on the Thu, Jun 27, 2002 at 05:43:57PM +0800, g_friend@etang.com wrote:
> I have put a grub_firmware on my doc2000. It can drop me grub console 
> mode but it cannot find any filesystem ,even filesystem on my harddisk.
> I have tried to use root(dc0,0) ,root(hd0,0),root(hd0,1)etc ,but it 
> had no effect. It find nothing yet.

I even tried to load a kernel by giving grub the blocks to boot it
from, but no success so far. It can read the partition-table, but
not the filesystem. 

> Then I face a serious situation.----How can I save my DOC ?
> How can I clean the bad grub off my doc?
> Before I put grub_firmware onto my DOC, I can boot from my harddisk ,
> floppy with DOC in place.However, after that , with DOC in place ,I 
> even cannot boot from my floppy . It always give me grub boot.

Ok. I havent tried booting from floppy so far, but this tells me
I don't even have to try. 

> If I  pull out it from my board , the system boot from my hard disk 
> or floppy as usually.

Nice to know.

Peter
-- 
Those who give up essential liberties for temporary safety deserve 
neither liberty nor safety. -- Benjamin Franklin
