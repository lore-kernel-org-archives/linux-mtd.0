Received: from hex.linuxgrrls.org ([212.18.228.73] ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Y17u-0003I9-00
	for <linux-mtd@lists.infradead.org>; Fri, 26 Jul 2002 10:11:11 +0100
Date: Fri, 26 Jul 2002 10:11:03 +0100
Subject: Re: Compact Flash is a valid canidate for an MTD device.
Content-Type: text/plain; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v482)
Cc: <linux-mtd@lists.infradead.org>, LinuxBIOS <linuxbios@lanl.gov>
To: Eric W Biederman <ebiederman@lnxi.com>
From: Jasmine Strong <jasmine@regolith.co.uk>
In-Reply-To: <m3ofcv57nz.fsf@DLT.linuxnetworx.com>
Message-Id: <9C0262F9-A077-11D6-A351-000502893FA1@regolith.co.uk>
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

On Friday, July 26, 2002, at 07:23 AM, Eric W Biederman wrote:
> In particular the following commands were added to IDE.
> -  CFA REQUEST EXTENDED ERROR CODE
> -  CFA WRITE SECTORS WITHOUT ERASE
> -  CFA ERASE SECTORS
> -  CFA WRITE MULTIPLE WITHOUT ERASE
> -  CFA TRANSLATE SECTOR
> -  SET FEATURES Enable/Disable 8-bit transfer
>

If you can bypass the device's internal wearlevelling logic, then
maybe;  but it doesn't look awfully like one can.  Can you, for
example, write your own out-of-band data, or write untranslated sectors?

The problem we had was the internal ASIC getting confused and causing
the whole device to cease to function.  It doesn't look awfully like
these extra commands will help this.

Jas.
