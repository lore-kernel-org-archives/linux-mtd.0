Received: from mx1.cdacindia.com ([203.199.132.35] helo=mailx.cdac.ernet.in)
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DuouI-0004VJ-TD
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2005 06:01:08 -0400
Received: from mailhub.cdac.in ([196.1.109.254])
	by mailx.cdac.ernet.in (SAVSMTP 3.1.0.29) with SMTP id
	M2005071915305031375
	for <linux-mtd@lists.infradead.org>; Tue, 19 Jul 2005 15:30:50 +0530
Received: from mailhub.cdac.in (mailhub [196.1.109.254])
	by mailhub.cdac.in (8.13.4/8.13.4) with ESMTP id j6J9Wct0029350
	for <linux-mtd@lists.infradead.org>; Tue, 19 Jul 2005 15:02:38 +0530
Received: from nisg60b51cbee8 (nisg-wireless.cdac.ernet.in [196.1.109.162])
	by mailhub.cdac.in (8.13.4/8.13.4) with SMTP id j6J9WcFc029347
	for <linux-mtd@lists.infradead.org>; Tue, 19 Jul 2005 15:02:38 +0530
Message-ID: <025701c58c45$1c6f3790$a26d01c4@nisg60b51cbee8>
From: "Nupur" <nupurj@cdac.in>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 19 Jul 2005 15:04:50 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: there is a change in previous post
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



 Hello,
There are some changes in the previous mail.So, I am re-writing the whole
mail. I appologize for this.
I am trying to make Linux 2.6.10 work with MTD support. I am compiling the
kernel on the host platform (Desktop computer) and then will be porting
it on target platform. I have also included the patch for the kernel called
mtd-snapshot-20050705. Though, whenever I include the support for mtdchar
device, I get errors and the kernel wont compile.

 The error being:
in function 'mtd_notify_add': undefined reference to 'class_device_create'
in function 'mtd_notify_remove': undefined reference to
'class_device_destroy'
in function 'init_mtdchar': undefined reference to 'class_create'
in function 'cleanup_mtdchar': undefined reference to 'class_destroy'

 I checked in mtdchar.c, there is a call to the above functions but I could
not
find the definition of these functions in my kernel.

I understand that I am missing something, but what I am missing is not clear
to me.
Please help me.

 Thanks and regards,
Nupur
