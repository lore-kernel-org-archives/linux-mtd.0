Received: from mx3.mail.ru ([194.67.23.149])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E39or-0003Dc-8s
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2005 05:57:56 -0400
Message-ID: <42FB214D.3040703@mail.ru>
Date: Thu, 11 Aug 2005 13:58:37 +0400
From: Alex Karev <lineum@mail.ru>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <42FAFEC9.1090306@mail.ru>	
	<1123745980.16052.48.camel@sauron.oktetlabs.ru>
	<42FB0734.7050304@mail.ru>	
	<1123748971.16052.65.camel@sauron.oktetlabs.ru>
	<1123749301.23647.1.camel@tglx.tec.linutronix.de>
In-Reply-To: <1123749301.23647.1.camel@tglx.tec.linutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 and nand mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:

>On Thu, 2005-08-11 at 12:29 +0400, Artem B. Bityuckiy wrote:
>
>  
>
>>1. enable JFFS3 debugging level 1
>>2. copy as few as possible files to your flash which is enough just to
>>reproduce the problem.
>>    
>>
>
>After unmount, please create a dump of your FLASH partition with
>nanddump and put it somewhere for download.
>
>tglx
>  
>
Thanks to all for fast response, I'll try 2.6 while attempting to get 
correct corrent snapshot patchs for 2.4.

Here is logs and broken file example for curious:
http://pol3.comintern.ru/mtdlog/mtdlog.tar.gz

Alex.
