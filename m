Received: from nwd2mime2.analog.com ([137.71.25.114])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17FNvr-0005Y8-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Jun 2002 00:41:43 +0100
Message-ID: <3CFD502E.870C7AFA@analog.com>
Date: Tue, 04 Jun 2002 16:41:34 -0700
From: Justin Wojdacki <justin.wojdacki@analog.com>
Reply-To: justin.wojdacki@analog.com
MIME-Version: 1.0
To: Jim Thompson <jim@musenki.com>
CC: linux-mtd@lists.infradead.org
Subject: Re: Strange problem related to writing to flash
References: <3CFD131D.1AA4678F@analog.com> <15613.16180.337384.910293@gargle.gargle.HOWL>
Content-Type: text/plain; charset="us-ascii"
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

Jim Thompson wrote:
> 
> I've been seeing similar things (well, worse, the kernel (yes the
> kernel) crashes somewhere in the bootloader after a soft reset) on
> PowerPC.  If the root filesystem is mounted read-only, things are just
> peachy.
> 
> In your case, I'd bet that the flash isn't in 'read' mode.  You
> probably want to assure that the flash is in 'read' mode before you
> soft reset the CPU.
> 
> I haven't figured out whats wrong with mine yet.
> 

That's along the lines of what a few of us discussed here, except for
one issue: 

The bootstrap isn't part of the kernel. So the bootstrap has no
problem running, loading the kernel from flash, and then executing the
kernel. Seems to me that that wouldn't be possible if the flash wasn't
in read mode (unless I'm missing something). The bootstrap being used
has to ID the flash device itself, so if it can ID it and read from it
fine, the kernel should be able to also right? 

-- 
-------------------------------------------------
Justin Wojdacki        
justin.wojdacki@analog.com         (408) 350-5032
Communications Processors Group -- Analog Devices
