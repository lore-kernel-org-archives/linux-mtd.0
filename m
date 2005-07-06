Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DqD0j-0003Ot-5W
	for linux-mtd@lists.infradead.org; Wed, 06 Jul 2005 12:44:34 -0400
Received: from [10.0.10.193] (av [127.0.0.1])
	by av.mvista.com (8.9.3/8.9.3) with ESMTP id JAA08208
	for <linux-mtd@lists.infradead.org>; Wed, 6 Jul 2005 09:44:30 -0700
Message-ID: <42CC0A6E.9090704@mvista.com>
Date: Wed, 06 Jul 2005 09:44:30 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <20050706144545.GA11447@zappa>
In-Reply-To: <20050706144545.GA11447@zappa>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: xip changes between 2.6.11 and 20050530?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Konstantin Kletschke wrote:
> Hello to the list members!
> 
> I had XIP in linux-2.6.11 running very well.
> Then I patched a mtd snapshot from 20050530 in in order to get code into
> there which properly unlock intel K3 flash devices properly (which is
> not solved yet).
> Now the xipuImage freezes at booting when it comes to
> 
> Probing scb9328_flash at physical address 0x10000000 (16-bit buswidth)

Do you have a diff of drivers/mtd/chips/cfi_cmdset_0001.c between the 
two versions?  I'll guess a change was made that didn't wrap something 
in the xip disable/check for pending interrupts stuff.

-- 
Todd
