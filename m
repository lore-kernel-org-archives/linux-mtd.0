Received: from mail.fideltronik.com ([94.42.89.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abPCA-0001wB-Hp
 for linux-mtd@lists.infradead.org; Thu, 03 Mar 2016 09:05:20 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.fideltronik.com (Postfix) with ESMTP id C1431A20879
 for <linux-mtd@lists.infradead.org>; Thu,  3 Mar 2016 10:04:53 +0100 (CET)
Received: from mail.fideltronik.com ([127.0.0.1])
 by localhost (mail.fideltronik.com.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id M6q61TP6t9ES for <linux-mtd@lists.infradead.org>;
 Thu,  3 Mar 2016 10:04:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.fideltronik.com (Postfix) with ESMTP id 433B3A2087B
 for <linux-mtd@lists.infradead.org>; Thu,  3 Mar 2016 10:04:53 +0100 (CET)
Received: from mail.fideltronik.com ([127.0.0.1])
 by localhost (mail.fideltronik.com.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id TmaiJXZlhMdj for <linux-mtd@lists.infradead.org>;
 Thu,  3 Mar 2016 10:04:53 +0100 (CET)
Received: from mail.fideltronik.com.pl (mail.fideltronik.com.pl [172.30.32.15])
 by mail.fideltronik.com (Postfix) with ESMTP id 2561DA20879
 for <linux-mtd@lists.infradead.org>; Thu,  3 Mar 2016 10:04:53 +0100 (CET)
Date: Thu, 3 Mar 2016 10:04:53 +0100 (CET)
From: Tomasz Lach <tomasz.lach@fideltronik.com>
To: linux-mtd@lists.infradead.org
Message-ID: <959619813.9882304.1456995893128.JavaMail.zimbra@fideltronik.com.pl>
Subject: Subject=Re:%20Re%3A%20UBI%20leb_write_unlock%20NULL%20pointer%20Oops%20%28continuation%29&In-Reply-To=%3C20140205201223.GA25295%40gmail.com%3E
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


Hello everybody!

I have the same error (OOPS in leb_write_unlock).
I run kernel 3.6.9 on Atmel SAMA5D31 cpu, compiled with buildroot gcc 4.6.3

I can reproduce error quite easy - writing lot of inserts into sqllite table from tcl.

I've found that problem is with mutex le->mutex.wait_list.next -> it is NULL
When I turn on mutex debugging - error disappears...
I can't find when .next is NULL...

regards
Tomek
