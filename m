Received: from web14403.mail.yahoo.com ([216.136.174.60])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17BEPK-0003OX-00
	for <linux-mtd@lists.infradead.org>; Fri, 24 May 2002 13:42:58 +0100
Message-ID: <20020524124256.17838.qmail@web14403.mail.yahoo.com>
Date: Fri, 24 May 2002 20:42:56 +0800 (CST)
From: =?gb2312?q?cytang?= <cytang_cn@yahoo.com.cn>
Subject: lilo problem :dont know how to handle device ox5d01
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

lilo problem : sorry, dont know how to handle device
ox5d01

After I have make a mini system on my doc , I want to
make doc the boot disk.
I have get the doc-lilo from m-sys . but when I run
"doc-lilo -r /mnt/nftla1 " , I will get the erro
reported:
" sorry, dont know how to handle device ox5d01 "

So , I turn to lilo-mtd which can be found in
mtd-snapshot. 
This time , I run "./lilo-mtd -v -r /mnt/nftla1 " 
however , I get another erro:
" RSN; /dev/nftla1 is not a whole disk device "

the following may be some helpful 
1. my mtd code is 20020501 snapshot
  my linux is redhat 7.1 ,my doc is doc2000 ,32 m
2.
 fdisk /dev/nftla
 p
 the output is :
 Device      Boot  start   end  Blocks  id system
 /dev/nftla1  *    1       1001 32030   83 Linux 
3.fdisk /dev/nftla1
 p
 the output is :
 Device      Boot  start   end  Blocks  id system



_________________________________________________________
Do You Yahoo!? 
摊开你的掌心 让我看看你
http://sweepstakes.yahoo.com/2002cnuser
