Received: from [195.205.16.233] (helo=dgt-lab.com.pl)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15byQQ-0004bk-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2001 07:02:06 +0100
Received: from dgt-lab.com.pl (unknown [192.168.6.66])
	by dgt-lab.com.pl (Postfix) with ESMTP id DDCBA479F
	for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2001 07:10:34 +0200 (CEST)
Message-ID: <3B8C86BD.5C4FBCF9@dgt-lab.com.pl>
Date: Wed, 29 Aug 2001 08:07:57 +0200
From: Wojciech Kromer <krom@dgt-lab.com.pl>
MIME-Version: 1.0
To: mtd <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 on 8MB Flash-Chip conneted to MPC850 works extremly slow	:(
References: <3B8B87A9.2F622A89@dgt-lab.com.pl> <999014039.27952.2.camel@russ>
Content-Type: text/plain; charset=iso-8859-2
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


>
> It will take longer than a ramdisk because of the way jffs2 works, but
> it looks like you might not be setting your flash timings

Do You mean 'wait wtates' on MPC chip-select configuration?
Or trere are some time settings in MTD?

--
* * * * * * * * * * * *
* per pedes ad astra! *
* * * * * * * * * * * *    mailto:krom@dgt-lab.com.pl
