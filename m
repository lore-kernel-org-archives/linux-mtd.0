Return-path: <David.Woodhouse@mvhi.com>
Received: from localhost ([127.0.0.1] ident=root)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 10pUJC-0000Xz-00
	for mtd@imladris.demon.co.uk; Thu, 3 Jun 1999 11:01:10 +0100
Received: from pop3.mail.demon.net
	by localhost with POP3 (fetchmail-5.0.0)
	for mtd@imladris.demon.co.uk (multi-drop); Thu, 03 Jun 1999 11:01:10 +0100 (BST)
Received: from punt-2.mail.demon.net by mailstore for mtd@imladris.demon.co.uk
          id 928404062:20:14258:16; Thu, 03 Jun 99 10:01:02 GMT
To: Werner Almesberger <almesber@lrc.di.epfl.ch>
Cc: dhinds@lahmed.Stanford.EDU (David Hinds),
    linux-kernel@vger.rutgers.edu,
    "Linux MTD discussion list" <mtd@imladris.demon.co.uk>
Subject: Re: 2.3 wish: integrate pcmcia into mainstream kernel 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 03 Jun 1999 10:59:36 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E10pUHg-0002ob-00@devel2.axiom.internal>
Sender: David Woodhouse <David.Woodhouse@mvhi.com>
List-ID: <linux-mtd.lists.infradead.org>


almesber@lrc.di.epfl.ch said:
>  I've posted this to linux-kernel about two weeks ago, asking for
> comments. David Woodhouse responded that there's a group of people
> looking at the same issue for certain embedded devices. Their main
> concern seems to be space: if you only have a few MB of total storage
> for your system, you don't want initrd, cardmgr, insmod, etc. 

Actually, my main focus is memory devices - that's on-board flash, SRAM, 
EMS boards if you still have them, and anything like that. The main aim is to 
be able to use them for root filesystems.

We're developing a generic subsystem for handling MTDs (Memory Technology 
Devices), into which you plug a low-level driver for your specific hardware, 
and all the higher-level functions such as FTL filesystems are provided for 
you by the upper layers.

David Hinds has already implemented something very similar to this in his 
PCMCIA code, and the intention is to make them compatible enough that future 
PCMCIA code can use our new MTD subsystem rather than its own. 

My intention wasn't to bypass the PCMCIA code for _PCMCIA_ devices, but to
abstract the MTD subsystem so that it can be used with non-PCMCIA devices as 
well as PCMCIA.

However, it should be fairly easy to convert your 'enabler' to a low-level MTD 
device module, which can be distributed as one of the device drivers for the 
MTD subsystem. That way, people can choose whether to use it or the full-blown 
PCMCIA implementation. 

Some way of using your enabler at boot-time, and then passing control to the
'real' PCMCIA implementation, might be appropriate too.

Work on the MTD subsystem hasn't been moving very fast - we have two versions,
both available in ftp://imladris.2001ad.net/pub/mtd/ - we're intending to merge
them and make sure they still provide the functionality that the PCMCIA code
wants. But I've been concentrating on this poxy Disk-On-Chip2000 from
M-Systems, and haven't had any time for it.

On the subject of the Disk-On-Chip - the best advice seems to be 'use 
something else'. M-Systems are being extremely awkward about support, and the 
device appears to require sequential reads of bytes from a single byte-wide 
window to the flash - not something you want to use if you're at all 
interested in performance. But I'm struggling on with it - if you're stuck 
with a Disk-On-Chip, we should be able to use it soon anyway, but just don't 
expect it to be much better than their binary-only drivers.

----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
