Received: from mgr2.xmission.com ([198.60.22.202])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17JdR7-00014L-00
	for <linux-mtd@lists.infradead.org>; Sun, 16 Jun 2002 18:03:34 +0100
Received: from mail by mgr2.xmission.com with spam-scanned (Exim 3.35 #1)
	id 17JdR6-0001z2-00
	for linux-mtd@lists.infradead.org; Sun, 16 Jun 2002 11:03:32 -0600
Received: from [198.60.22.200] (helo=mail.xmission.com)
	by mgr2.xmission.com with esmtp (Exim 3.35 #1)
	id 17JdR6-0001yz-00
	for linux-mtd@lists.infradead.org; Sun, 16 Jun 2002 11:03:32 -0600
Received: from [166.70.16.78] (helo=elphel.com)
	by mail.xmission.com with esmtp (Exim 3.22 #1)
	id 17JdR5-0002q9-00
	for linux-mtd@lists.infradead.org; Sun, 16 Jun 2002 11:03:32 -0600
Message-ID: <3D0CC4F6.3060106@elphel.com>
Date: Sun, 16 Jun 2002 11:03:50 -0600
From: Andrey Filippov <andrey@elphel.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [Fwd: cfi_cmdset_0001.c: do_write_buffer bug]
References: <3D0CC18A.8080002@elphel.com>
Content-Type: text/plain; charset=windows-1251; format=flowed
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

Working with Intel TE28F640J3A and Axis ETRAX100LX processor I ran over a bug in cfi_cmdset_0001.c: do_write_buffer. It checks ready state 20 times but does not resend 
Write-to-Buffer command (E8) before new checks. So if it was not ready first time it will never be ready later.

Andrey Filippov
