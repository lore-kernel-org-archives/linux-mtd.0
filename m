Received: from [195.144.108.44] (helo=mail.deltaes.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15rbKs-0003ui-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Oct 2001 09:36:59 +0100
Date: Thu, 11 Oct 2001 10:51:35 +0200 (CEST)
From: martin.kula@deltaes.cz
Reply-To: martin.kula@deltaes.cz
To: David Woodhouse <dwmw2@infradead.org>
cc: linux-mtd@lists.infradead.org
Subject: Re: Identification flash on board ? 
In-Reply-To: <32351.1002788457@redhat.com>
Message-ID: <Pine.LNX.4.21.0110111036150.26498-100000@lxserver.deltes.cz>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi

On Thu, 11 Oct 2001, David Woodhouse wrote:

> 
> martin.kula@deltaes.cz said:
> > Can anybody explain me next lines from dmesg ?
> 
> > DiskOnChip 2000 found at address 0xE8000
> > Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba TC58V64AFT/DC)
> > Flash chip at floor 1, chip 0 is different:
> > Unknown flash chip found: F9 F9
> 
> Is this an 8MiB DiskOnChip, or do you actually expect the extra chips to be 
> there?

Hmm... It's strange, my DoC has 24MiB (I have one DoC on board on
address 0xe8000).
.......
3 flash chips found. Total DiskOnChip size: 24 MiB
.......
I'm using this DoC, that's right.

But as I know I have 1 MiB flash integrated on board too.
The flash is Intel 28F800-B5 Flash (from board guide).
I can use it with (ms)dos.
Can I use it with linux ? How I do it ? Or I can't ?

Thanks

Martin 
