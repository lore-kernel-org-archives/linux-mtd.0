Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14unJD-0006Ll-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 May 2001 04:28:11 +0100
Received: from sis.com.tw ([203.67.208.2] helo=maillog.sis.com.tw)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14unJc-0008EH-00
	for linux-mtd@lists.infradead.org; Wed, 02 May 2001 04:28:36 +0100
Message-ID: <3AEF7D1A.B71AE636@sis.com.tw>
Date: Wed, 02 May 2001 11:20:58 +0800
From: Ollie Lho <ollie@sis.com.tw>
MIME-Version: 1.0
To: schang <schang@3inet.com>
CC: linux-mtd@lists.infradead.org
Subject: Re: Is DOC Address 0xC8000 Something Special?
References: <21813.988381415@redhat.com> <004f01c0d188$4688c5e0$88b4b8d1@ShuhIII> <3AEF5AC6.47ABF513@sis.com.tw> <002f01c0d2b4$bb6e7b20$6401a8c0@faxtell.net>
Content-Type: text/plain; charset=us-ascii
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

Shuh C Chang wrote:
> 
> So far I have *yet* to find the answer/solution.  Like I mentioned in my
> original posting, addresses at 0xD0000 and 0xD8000 work well.  I am still
> trying different options.  I would welcome any suggestions from the pundits
> out there.
> 

If the same hardware setup works for 0xDxxxx but 0xCxxxx, then it must
be VGA BIOS related stuff. And YES, the old dinosor still lives in your
PC.

> On a related note, I would suggest adding some notes to the MTD HOWTO
> document about the DOC itself.  The DOC chip must be in a *good format*
> (don't know what it means yet) before you can even nftl_format or fdisk
> through /dev/mtd0 and /dev/nftla, etc.  One example that I have is that
> during the experiment of installing the mtd/nftl drivers, one DOC
> (Millennium) was zapped.  The DOC chip could not be recognized until it is
> "reburned" with a good "image file" using M-System's own docpmap DOS
> utility.  The "good image file" was a bootable kernel in ext2 fs.  We used
> it for the original M-System's binary driver.  As I mention above, I don't
> know what constitutes a "good format," but the one I had worked.
> 

The reason you can not detect a "corrupted" DoC is because you did not
disable the 0x55AA probe in the Config tool. Usually the docprobe probes
the 0x55AA signautre for DoC, but if your DoC is really screwed up you
certainly don't have them. Trust me, we F**KED the DoC as bad as you can
image in LinuxBIOS project and docprobe works PERFECTLY!!! Generally
speaking, you can drop your M-System supplied software altogether.

Ollie
