Received: from [195.166.20.93] (helo=frumious.unidec.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14xXbU-0002r1-00
	for <linux-mtd@lists.infradead.org>; Wed, 09 May 2001 18:18:24 +0100
From: dr john halewood <john@frumious.unidec.co.uk>
Reply-To: john@unidec.co.uk
To: Peter Keel <killer@discordia.ch>
Subject: Re: Read Flash-Dumps
Date: Wed, 9 May 2001 18:18:05 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
References: <20010509190106.A10693@discordia.ch>
In-Reply-To: <20010509190106.A10693@discordia.ch>
Cc: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Message-Id: <0105091818050L.10317@frumious.unidec.co.uk>
Content-Transfer-Encoding: 8bit
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

On Wednesday 09 May 2001 18:01, Peter Keel wrote:
>
> So how do I do a loopack-mount of the files? I tried several
> filesystems, but that doesn't seem to work. Also, nftl doesn't
> even appear in /proc/filesystems.
>
IIRC the igel box uses minix filesystems mounted on top of the NFTL so you 
don't access the flash layer directly. (It also uses the M-Systems proprietry 
driver, which isn't suprising as Igel wrote it)

mount file.img /mnt -t minix -o loop  should do the trick.
I think the igel box has 4 minix partitions on the DoC.

cheers
john
