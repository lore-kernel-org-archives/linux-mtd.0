Received: from avg3.hkpc.org ([202.64.133.85])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17InW6-0003sC-00
	for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2002 10:37:15 +0100
Received: from smtp2.hkpc.org ([202.64.133.13])
 by avg3.hkpc.org (NAVGW 2.5.2.11) with SMTP id M2002061417370612639
 for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2002 17:37:06 +0800
Date: Fri, 14 Jun 2002 17:39:22 +0800 (HKT)
From: Clifford Loo <kfloo@hkpc.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Problem putting JFFS on MTD 
In-Reply-To: <20079.1024046273@redhat.com>
Message-ID: <Pine.LNX.4.33.0206141726250.8899-100000@cliffordux.hkpc.org>
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

On Fri, 14 Jun 2002, David Woodhouse wrote:
>
>kfloo@hkpc.org said:
>>  I'm not sure what's from the flash driver itself, but there's no
>> "Flash writer error" or anything like that.  In any case I've attached
>> all the log messages leading up to the "I/O error" in my previous
>> post.  For the mount command, here's an excerpt of the debug message:
>
>What flash hardware and driver? Sorry, you did tell me this once I think.

The flash part is a CFI-compatible MBM29DL32XBD by Fujitsu.  The flash
driver (drivers/char/flash.c and cfi_flash.c) is by DENX Software
Engineering (Wolfgang Denk, wd@denx.de).

>You sure you have Vpen enabled, etc.?

I'm not sure what Vpen is.  But if you mean anything like the Write Enable
pin of the flash part, it ought to be.  The hardware has been verified
'coz we used to run a different OS (OS9000) and flash filesystem (FTL) on
it, and the same flash could do read/write with no problem.

-- 
Clifford
