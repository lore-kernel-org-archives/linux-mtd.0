Received: from f16.pav2.hotmail.com ([64.4.37.16] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17YQP0-0005gu-00
	for <linux-mtd@lists.infradead.org>; Sat, 27 Jul 2002 13:10:30 +0100
From: "invictus rm" <invictus_rm@hotmail.com>
To: linux-mtd@lists.infradead.org
Subject: Jffs2 on MTD
Date: Sat, 27 Jul 2002 17:39:58 +0530
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F16pVyLridnGiAw8HQE00022566@hotmail.com>
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

hi ,
I have partitioned my flash( strata) as follows
mtd0 .....
mtd1 .....
mtd3: 01dc0000 00040000 "JFFS2"

After that i have mounted the jffs2 as (without doing cp jffs2.img > 
/dev/mtd3)

>mount -t jffs2 /dev/mtdblock3 /mnt/jffs2
>cd /mnt/jffs2

Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/mtdblock3           30464      1284     29180   4% /mnt/jffs2


I am not copying the jffs2 image on to the /dev/mtd3 before mouting but 
rather copying the files after mounting ( i mean putting the required files 
after i have mounted the /dev/mtdblock3)

The reason why i am doing this is becoz i do not need the directory 
structure of a regular filesystem.

Does this make any difference in terms of flash usage as compared to the 
case where i would have copied the jffs2.img to mtd3 and then  mounted it .

rgds
rm


_________________________________________________________________
Chat with friends online, try MSN Messenger: http://messenger.msn.com
