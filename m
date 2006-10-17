Received: from wmi.com ([209.137.163.242] helo=mail.wmi.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GZsrU-0004Oq-HI
	for linux-mtd@lists.infradead.org; Tue, 17 Oct 2006 13:36:29 -0400
Received: from cac0.wmi.com (cac0.wmi.com [209.137.163.252])
	by mail.wmi.com (8.13.8/8.13.8) with ESMTP id k9HHaIPB030472
	for <linux-mtd@lists.infradead.org>; Tue, 17 Oct 2006 13:36:18 -0400
Received: from [127.0.0.1] (satchmo.wmi.com [192.168.1.194])
	by cac0.wmi.com (8.13.7/8.13.7) with ESMTP id k9HHaH1A010815
	for <linux-mtd@lists.infradead.org>; Tue, 17 Oct 2006 13:36:18 -0400
Message-ID: <45351491.7070207@wmi.com>
Date: Tue, 17 Oct 2006 17:36:17 +0000
From: Joel Coltoff <joel@wmi.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Question on configuring for a MIPS processor
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

First let me apologize if this is in the archive. I've checked
a bit and didn't see it. I'm a bit surprised that it isn't.

We are running, for the moment, a bit of a hack. We are using
a 2.4.18 kernel that has been updated to support a subset of
the intel 28F256P30 strataflash. It seems to be working. In
the meantime, work goes on doing a board support package for
2.6.17.

The problem we are facing is that our flash runs from
0x1f000000 - 0x21000000. Since we are running on a MIPS we've
got boot code at 0x1fc000000 which sort of gets in the way. There's
other stuff that fills memory up to 0x20000000. I've got no problem
having /dev/mtdb0 use the space from the start of flash up to
0x1fc00000. What I'd like to be able to do is use the rest of
the flash. I'm reasonable certain it would be foolish to treat the
memory as 2 devices. Should I use fdisk to create my flash drives?
Is there another way to handle this?

If I do use fdisk what make sense for heads/sectors/cylinders?
In theory, fdisk seems like the best way to go. What I mean
by that is do I want my sector size to be 128K. I really don't
know how the code works when only part of a sector gets updated.

Thanks for your help,
  - Joel
