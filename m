Received: from web14401.mail.yahoo.com ([216.136.174.58])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17BoOT-0005r7-00
	for <linux-mtd@lists.infradead.org>; Sun, 26 May 2002 04:08:30 +0100
Message-ID: <20020526030828.98488.qmail@web14401.mail.yahoo.com>
Date: Sun, 26 May 2002 11:08:28 +0800 (CST)
From: =?gb2312?q?cytang?= <cytang_cn@yahoo.com.cn>
Subject: Re: how to make a bootable linux on doc
To: Jasmine Strong <jasmine@regolith.co.uk>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <EDBBAB8E-6FD0-11D6-9D6D-000502893FA1@regolith.co.uk>
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

> Here's a clue or two:
> 
> 1)  You are using the M-Systems firmware in your
> DiskOnChip.
>      This is your first mistake.  It's crap.
 
yes , in dos my step is :
dinfo #then I get the driver letter of doc 
dformat d: /s:doc2.fff  # make a dummy firmware to
make it can boot from harddisk
so ,of course , I have M-system firmware .
If it is not recommended , what shall I do ?
what firmware can I use?


 
> 2)  You are trying to use M-Systems' hacked LILO to
> load linux.
>      This is your second mistake.  It's crap too.

 I have tried lilo-mtd ,but it also doesnot work.
 
> Do yourself a favour and use a patched Grub to load
> the system.
> It doesn't need the M-Systems crap and is much nicer
> than LILO
> anyway.

  I cannot find anything like howto . can you provide
me some information ?
 
After several days ,I still cannot find a example in
the maillist .


_________________________________________________________
Do You Yahoo!? 
摊开你的掌心 让我看看你
http://sweepstakes.yahoo.com/2002cnuser
