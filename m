Received: from web14401.mail.yahoo.com ([216.136.174.58])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17AszL-00019W-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 May 2002 14:50:43 +0100
Message-ID: <20020523135042.47712.qmail@web14401.mail.yahoo.com>
Date: Thu, 23 May 2002 21:50:42 +0800 (CST)
From: =?gb2312?q?cytang?= <cytang_cn@yahoo.com.cn>
Subject: Re: Re: how to make a bootable linux on doc
To: linux-mtd@lists.infradead.org
In-Reply-To: <E17AqL9-00010h-00@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: 8bit
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

Thanks to all replies .
These days I have read some materials about how to
make a bootable system on a floppy. According to them
,I must do like the following:
make a kernel --> make a mini file system->compress
the file system -> try to converge them 
but after many efforts ,I can not manage it
successfully .
I dont konw whether their method on a floppy can be
applied to my doc .
So, Could you do me a favor to give me some help or
materials about how you manage to make such a
filesystem ?
 


>Marius is correct - both LILO and patched GRUB can
>make the DOC Millennium bootable.  8MB is more than
enough space for a small system.
>I used a package called "Peewee Linux" (GPL-license)
>to set up my DOC Mil.  

> Marius is correct - both LILO and patched GRUB can
> make the DOC Millennium 
> bootable.  8MB is more than enough space for a small
> system.
> 
> I used a package called "Peewee Linux" (GPL-license)
> to set up my DOC Mil.  
> It currently uses 2.2 kernels, but it is possible to
> use a custom kernel -- 
> in my case, a 2.4.18 with the MTD drivers.
> 
> Mark



_________________________________________________________
Do You Yahoo!? 
摊开你的掌心 让我看看你
http://sweepstakes.yahoo.com/2002cnuser
