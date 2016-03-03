Received: from mail.fideltronik.com ([94.42.89.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abQrD-00018l-99
 for linux-mtd@lists.infradead.org; Thu, 03 Mar 2016 10:51:48 +0000
Date: Thu, 3 Mar 2016 11:51:23 +0100 (CET)
From: Tomasz Lach <tomasz.lach@fideltronik.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <1254141292.9968387.1457002283483.JavaMail.zimbra@fideltronik.com.pl>
In-Reply-To: <CAFLxGvwVE0V2eL2cvbcv7kGxvu_1ZBg+GL95D+b_gVs8Qw4Znw@mail.gmail.com>
References: <959619813.9882304.1456995893128.JavaMail.zimbra@fideltronik.com.pl>
 <CAFLxGvwVE0V2eL2cvbcv7kGxvu_1ZBg+GL95D+b_gVs8Qw4Znw@mail.gmail.com>
Subject: Re:
 Subject=Re:%20Re%3A%20UBI%20leb_write_unlock%20NULL%20pointer%20Oops%20%28continuation%29&In-Reply-To=%3C20140205201223.GA25295%40gmail.com%3E
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Thanks Richard!
It works!

Tomek

----- Original Message -----
From: "Richard Weinberger" <richard.weinberger@gmail.com>
To: "Tomasz Lach" <tomasz.lach@fideltronik.com>
Cc: "linux-mtd" <linux-mtd@lists.infradead.org>
Sent: Thursday, March 3, 2016 10:56:33 AM
Subject: Re: Subject=Re:%20Re%3A%20UBI%20leb_write_unlock%20NULL%20pointer%20Oops%20%28continuation%29&In-Reply-To=%3C20140205201223.GA25295%40gmail.com%3E

On Thu, Mar 3, 2016 at 10:04 AM, Tomasz Lach 
<tomasz.lach@fideltronik.com> wrote: 
> 
> Hello everybody! 
> 
> I have the same error (OOPS in leb_write_unlock). 
> I run kernel 3.6.9 on Atmel SAMA5D31 cpu, compiled with buildroot gcc 4.6.3 
> 
> I can reproduce error quite easy - writing lot of inserts into sqllite table from tcl. 
> 
> I've found that problem is with mutex le->mutex.wait_list.next -> it is NULL 
> When I turn on mutex debugging - error disappears... 
> I can't find when .next is NULL... 

I think your kernel misses this stable patch: 
commit 2928f0d0c5ebd6c9605c0d98207a44376387c298 
Author: Adam Thomas <adamthomas1111@gmail.com> 
Date: Sat Feb 2 22:32:31 2013 +0000 

UBIFS: fix use of freed ubifs_orphan objects 

-- 
Thanks, 
//richard 
