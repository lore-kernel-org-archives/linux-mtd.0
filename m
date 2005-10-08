Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EOBQA-0007h8-F5
	for linux-mtd@lists.infradead.org; Sat, 08 Oct 2005 05:55:28 -0400
Message-ID: <43479777.5060309@ru.mvista.com>
Date: Sat, 08 Oct 2005 13:55:03 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: nreddy@netenrich.com
References: <5080.61.95.208.3.1128750482.squirrel@61.95.208.3>
In-Reply-To: <5080.61.95.208.3.1128750482.squirrel@61.95.208.3>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: "Timing issue when we use SPANSION 8MB Flash"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

am I right that it's a NOR flash? What's the reason for using JFFS2 on 
it then?
Also questionable is whether you're sure that you have right timings 
configuration for the flash. I'm afraid that 8MB Spansion flash might 
have timing values different from 4 MB's.

Best regards,
   Vitaly

nreddy@netenrich.com wrote:

>Hi ,
>
>We are developing an embedded system with u-boot and Montavista Emebededd
>linux ( Kernel Version 2.4.20).
>Here we have put AMD 4MB flash  and the system is working is working fine.
>Recently we have increased Flash size to 8MB(SPANSION ( S29GL064M90FAIR10)
>make).
>
>Now the system works fine but with one problem.
>
>When i try to copy files to /mnt/jffs2 directory it is taking very long
>time(around 8 Minutes for 2.2 MB files).
>But when i try to copy files on 4MB Flash (AMD(AM29LV320DT) Make) it is
>taking only 1.7 Min to copy same size of files.
>
>Can any one throw a light on this...
>
>Thanks in advance,
>--Nagi Reddy
>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
>  
>
