Received: from web14405.mail.yahoo.com ([216.136.174.62])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17BWnu-0004ft-00
	for <linux-mtd@lists.infradead.org>; Sat, 25 May 2002 09:21:34 +0100
Message-ID: <20020525082133.75934.qmail@web14405.mail.yahoo.com>
Date: Sat, 25 May 2002 16:21:33 +0800 (CST)
From: =?gb2312?q?cytang?= <cytang_cn@yahoo.com.cn>
Subject: Re: Why cannot boot off my doc 2000 ?
To: linux-mtd@lists.infradead.org
In-Reply-To: <E17BHMf-0007bT-00@speedy.datawave.net>
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

after many experiments, I think maybe two possiblity
lead to it .
NO 1:
I miss a step :
dupdate /win:{address} /s:doc42.exb /first, 
so I boot from a DOS floppy. 
but this time, when I run "dinfo" ,it  tells me  no
diskonchip found in system . 
I am sure before my new kernel support doc , I can use
"dinfo" to view information of doc on DOS,but now I
can't .
but even now ,I still can find it in my new kernel .
run dmesg , I can find diskonchip found on 0xdc000
,and I can read/write/mount /dev/nftla1 .
however I run "dformat /win:dc000 " ,I get "no
diskonchip 2000R found at c000:0" 
NO 2:
 something is wrong with lilo-mtd in my steps. 
In the "patches" in mtd-snapshot , I find
lilo-mtd.tar.gz.
the following is my steps
  tar zxvf lilo-mtd.tar.gz 
  then I get 3 files : lilo-mtd
,boot.b-mtd,lilo21-mtd-patch
  I dont use lilo21-mtd-patch. because I dont know
what use is it for .so  I just use lilo-mtd and
boot.b-mtd
 my step is :
  lilo-mtd -v -C /etc/doc-lilo.conf -i boot.b-mtd -m
/boot/map -r /doc  
  #doc is my mount point
  nothing bad is reported . 
the output I have descript it in the above page->
http://lists.infradead.org/pipermail/linux-mtd/2002-May/005064.html


_________________________________________________________
Do You Yahoo!? 
摊开你的掌心 让我看看你
http://sweepstakes.yahoo.com/2002cnuser
