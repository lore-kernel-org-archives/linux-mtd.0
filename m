Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13p5Pd-0007Ys-00
	for mtd-list@infradead.org; Fri, 27 Oct 2000 10:02:57 +0100
Received: from mail.auriga.ru ([213.24.209.102])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13p5Pb-0007Yk-00
	for mtd@infradead.org; Fri, 27 Oct 2000 10:02:56 +0100
Message-ID: <39F94471.D0E5F971@auriga.ru>
Date: Fri, 27 Oct 2000 13:01:38 +0400
From: Nick Ivanter <nick@auriga.ru>
MIME-Version: 1.0
To: Qiuyuan Liu <q.liu@acm.org>
CC: mtd@infradead.org
Subject: Re: building mtd: DECLARE_MUTEX?
References: <39F8EAB996.E4A2Q.LIU@mail.neontech.com>
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

/include/linux/compatmac.h was introduced in 2.2.16
You shoud get it from there. Once have this done, you
find DECLARE_MUTEX defined.

Nick

Qiuyuan Liu wrote:

> I am trying to build mtd (checked out from the CVS version) on my Red
> Hat Linux 6.2 box (2.2.14).
>
> I can't find where DECLARE_MUTEX is defined, which referenced in
> mtdcore.c (line 89).
>
> Btw, there isn't a file named compatmac.h under /usr/include/linux,
> except the one came with mtd package, which refers to it.
>
> Thank you,
> Qiuyuan
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
