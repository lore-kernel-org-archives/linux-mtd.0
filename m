Received: from clinux.manquehue.net ([200.74.167.169] helo=corporacionlinux.cl)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cokr0-0002I8-L4
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 10:56:16 -0500
From: Carlos Manuel Duclos Vergara <carlos@embedded.cl>
To: Lokesh Kumar <kumar.lokesh@wrx-us.com>
Date: Wed, 12 Jan 2005 12:56:03 -0300
References: <294FD9D3403A0340BDAC38E48DCEFFDC935788@RES-EXCH>
In-Reply-To: <294FD9D3403A0340BDAC38E48DCEFFDC935788@RES-EXCH>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200501121256.03461.carlos@embedded.cl>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: how to behave on jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Hi All,
>

Hi,

> I have an embedded Linux (kernel 2.4.18) board at 50MHz, with jffs2 16MB
> flash. My system creates small files of 700 bytes each and is required to
> create ~3000 of such files. I see that when there are 1000 files, the
> system takes 3 minutes or so to mount this partition and then another 3 to
> do "ls -l". When there are 3000 files, the system takes 10 minutes each for
> mount and "ls -l".
>

Why not to create a ramdisk and mount it on the fly?
Only when you modify the ramdisk you save it to the flash, instead of been 
working directly with flash memory. You can save a lot of time by doing this.

Cheers!

-- 
Carlos Manuel Duclos Vergara
carlos@embedded.cl
http://www.embedded.cl
