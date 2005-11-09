Received: from smtprelay04.ispgateway.de ([80.67.18.16])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EZq4e-0005C7-Lm
	for linux-mtd@lists.infradead.org; Wed, 09 Nov 2005 08:33:17 -0500
Received: from unknown (HELO deepspace9.in2soft.meep) (547986@[84.153.73.11])
	(envelope-sender <priewasser@gmail.com>)
	by smtprelay04.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 9 Nov 2005 13:33:11 -0000
Received: from [192.168.0.63] (unknown [192.168.0.63])
	by deepspace9.in2soft.meep (Postfix) with ESMTP id 6783B6A77
	for <linux-mtd@lists.infradead.org>;
	Wed,  9 Nov 2005 14:32:07 +0100 (CET)
Message-ID: <4371FA94.6070602@gmail.com>
Date: Wed, 09 Nov 2005 14:33:08 +0100
From: Bernhard Priewasser <priewasser@gmail.com>
MIME-Version: 1.0
To: MTD mailing list <linux-mtd@lists.infradead.org>
References: <4370AA55.6060703@gmail.com> <4370B9A3.2000809@yandex.ru>
In-Reply-To: <4370B9A3.2000809@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: How to produce dirty space
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 > For the information when things are flushed see "/proc/sys/vm - the
 > virtual memory subsystem" at Documentation/filesystems/proc.txt.

Got it:

 > [/proc/sys/vm/]dirty_writeback_centisecs
 > ----------------------------------------
 >
 > The pdflush writeback daemons will periodically wake up and write
 > `old' data out to disk.  This tunable expresses the interval between
 >  those wakeups, in 100'ths of a second.

Thanks,
-- 
Bernhard
