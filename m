Received: from chrudim.coprosys.cz ([194.108.73.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ATgJ-0007bz-00
	for <linux-mtd@lists.infradead.org>; Wed, 22 May 2002 11:49:24 +0100
Received: from wolfhill.cz (user@ales.coprosys.cz [192.168.1.97])
	by chrudim.coprosys.cz (8.9.3/8.9.3) with ESMTP id MAA15329
	for <linux-mtd@lists.infradead.org>; Wed, 22 May 2002 12:49:22 +0200
Message-ID: <3CEB781F.79F063D0@wolfhill.cz>
Date: Wed, 22 May 2002 12:51:11 +0200
From: Ales Makarov <ales.makarov@wolfhill.cz>
Reply-To: ales.makarov@wolfhill.cz
MIME-Version: 1.0
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Kernel oops after sync command in jffs2
References: <F1BED55F35F4D3118C0F00E0295CFF4D014ECF49@mail.mediatrix.com> <18394.1022048830@redhat.com>
Content-Type: text/plain; charset=iso-8859-2
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

I have also reported our oops messages few day ago. I traced down the
functions and I got from JFFS2 to MTD. The problem is somewhere in
cfi_amdstd_write(). The problem appears only if there are 2 consecutive
writes (immediately one after another).

This happens regulary when GC tries to reclaim some space. The kernel
dies when GC calls mtd_fake_writev()...

Now I tried the latest version of cfi_cmdset_0002.c (v1.55). The kernel
oops messages are gone, but now I get:

Last[2] is ffff, datum is 1985
Write of 50 bytes at 0x00052438 failed. returned 0, retlen 0
Not marking the space at 0x00052438 as dirty because the flash driver
returned retlen zero
jffs2_write_dirent in garbage_collect_dirent failed: -5

Ales


David Woodhouse wrote:
> 
> fgiasson@mediatrix.com said:
> > The 'called while erasing!' message means that I put a trace in the
> > map driver write16() function to tell me if write16()is called when a
> > global variable is set.  This global variable indicates that
> > do_erase_oneword has sent the erase sector command and is currently
> > polling for the erase operation to complete.
> 
> OK. We already fixed one of these by disabling fast programming mode, after
> you pointed out that it was sending the unlock command without paying due
> attention to the state machine. If you're definitely using v1.55 of
> cfi_cmdset_0002.c, can you put a BUG() in the mtxmap_write16() call just
> after it prints the 'called while erasing!' message, and we'll see where
> it's being called _from_.
> 
> --
> dwmw2
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
