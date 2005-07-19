Received: from mx1.cdacindia.com ([203.199.132.35] helo=mailx.cdac.ernet.in)
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DukL0-0001MV-5b
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2005 01:08:24 -0400
Received: from mailhub.cdac.in ([196.1.109.254])
	by mailx.cdac.ernet.in (SAVSMTP 3.1.0.29) with SMTP id
	M2005071910373125830
	for <linux-mtd@lists.infradead.org>; Tue, 19 Jul 2005 10:37:31 +0530
Received: from mailhub.cdac.in (mailhub [196.1.109.254])
	by mailhub.cdac.in (8.13.4/8.13.4) with ESMTP id j6J56eXE023269
	for <linux-mtd@lists.infradead.org>; Tue, 19 Jul 2005 10:36:40 +0530
Received: from nisg60b51cbee8 (nisg-wireless.cdac.ernet.in [196.1.109.162])
	by mailhub.cdac.in (8.13.4/8.13.4) with SMTP id j6J56djw023258
	for <linux-mtd@lists.infradead.org>; Tue, 19 Jul 2005 10:36:39 +0530
Message-ID: <011501c58c1f$f481a8a0$a26d01c4@nisg60b51cbee8>
From: "Nupur" <nupurj@cdac.in>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 19 Jul 2005 10:38:52 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: error while including support for mtdchar devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
I am trying to make Linux 2.6.10 work with MTD support. I am compiling the

kernel on the host platform (Desktop computer) and then will be porting

it on target platform. Though, whenever I include the support for mtdchar

device, I get errors and the kernel wont compile.



The error being:
in function 'mtd_notify_add': undefined reference to 'class_device_create'

in function 'mtd_notify_remove': undefined reference to
'class_device_destroy'

in function 'init_mtdchar': undefined reference to 'class_create'

in function 'cleanup_mtdchar': undefined reference to 'class_destroy'



I checked in mtdchar.c, there is a call to the above functions but I could
not

find the definition of these functions in my kernel.  One thing more I would

like to mention is that when I include mtdchar as module the kernel compiles

with similar warnings of course, but then to erase an mtd device I don't

have the utility eraseall. It says the command is not recognized.



I understand that I am missing something, but what I am missing is not clear
to me.

Can you please help?



Thanks and regards,

Nupur
