From: chaffmanus@yahoo.com (tony Tong)
Date: Sat, 8 Feb 2003 05:49:32 -0800 (PST)
Subject: How can I save my DoC ?
In-Reply-To: <20030207090602.24812.16377.Mailman@localhost.localdomain>
Message-ID: <20030208134932.3649.qmail@web20810.mail.yahoo.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

After many failures ,I select to turn to old patch of
grub-doc  
because about half  year ,I have managed our DOC2000 
successfully according to
http://lists.infradead.org/pipermail/linux-mtd/2001-October/003475.html.
It is very old ,but it does work then.

But this time , I dont konw why I failed .
I use grub-0.90 and the grub-0.90-patch ,mtd is
0501snapshot
This time I just get grub shell ,but it cannot
recognize DoC.
so I enter hard image ,redo this process.
but this time, worse of all,my DOC was corrupted .
When I  use "./eraseall /dev/mtd0",I get many errors .
Then in the following "./nftl_format /dev/mtd0 98034"
,I get info which tells bad block table corrupted
Then How can I save my DoC?
Help urgently needed!
Can you experienced guys give me a advice  ?




__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
