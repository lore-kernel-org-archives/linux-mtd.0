Received: from [164.164.42.6] (helo=gateway.ncoretech.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15gemU-0006XB-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Sep 2001 05:04:14 +0100
Received: from ncoretech.com (IDENT:root@mail.ncoretech.com [192.168.1.3])
	by gateway.ncoretech.com (8.10.0/8.10.0) with ESMTP id f8B4AEJ15130
	for <linux-mtd@lists.infradead.org>; Tue, 11 Sep 2001 09:40:14 +0530
Received: (from root@localhost)
	by ncoretech.com (8.10.0/8.10.0) id f8B4AE925632
	for linux-mtd@lists.infradead.org.VIRCHECK; Tue, 11 Sep 2001 09:40:14 +0530
Message-ID: <3B9D9024.71EB046B@ncoretech.com>
Date: Tue, 11 Sep 2001 04:16:36 +0000
From: pradeep <pradeep@ncoretech.com>
MIME-Version: 1.0
To: Yunus Shaikh <yshaikh@start-icon.com>, linux-mtd@lists.infradead.org
Subject: Re: Fw: Booting doc2000 and mtd
References: <00d901c13a2c$ca16d2f0$c801a8c0@starticon>
Content-Type: text/plain; charset=us-ascii
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

Hello,
              I think you dont have the proper libraries also in the lib
directory ,
check out the links -- whether they are broken or not.


Pradeep

Yunus Shaikh wrote:

> Hello all
>
> i have managed to write data   in to the doc2000 , although
> i gives segmentation faults many times somehow i haev written it after
> restarting almost 50+ times now the problem is the root file system is
> mounted
> but does not go ahead i get a error mesage saying
> warning: unable to open an initial console
>
> i have tried passing init=/bin/sh parameter to the kernel
> any help ?
>
> Thanks in advance
> Yunus
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
