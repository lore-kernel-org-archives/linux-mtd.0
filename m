Received: from elproma-gw.hbz.pl ([213.77.124.176] helo=elproma.com.pl)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17wjhk-0002gj-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2002 14:38:20 +0100
Received: from ptroja by elproma.com.pl with local (Exim 3.35 #1 (Debian))
	id 17wjh2-00052m-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2002 15:37:36 +0200
Date: Wed, 2 Oct 2002 15:37:35 +0200
From: Piotr Trojanek <ptroja@elproma.com.pl>
To: linux-mtd@lists.infradead.org
Subject: Re: Memory management problem?
Message-ID: <20021002133735.GB12433@elproma.com.pl>
References: <3D9A1D2B.1040501@YottaYotta.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3D9A1D2B.1040501@YottaYotta.com>
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

there are two issues about out of memory:
1) you get malloc() with null
2) kernel decides to kill something

1: this should be checked in program code
2: look in /usr/src/linux/mm/oom.c

On Tue, Oct 01, 2002 at 04:09:47PM -0600, Chris Morrow wrote:
> 
> I'm running into a problem where the linux kernel is running
> out of memory and starts killing processes in an attempt to
> recover. The environment is as follows.
> 
> A CDB89712 based system with 16 Meg. sdram and 16 meg CFI flash.
> Linux-2.4.19-rmk1 with linux-2.4.19-pre10-shared-zlib patch.
> 
> First, on another system I create a number of files with random
> contents and calculate their md5sums as follows;
> 
> #!/bin/sh
> 
> rm randFile*
> 
> numFiles=40
> blockSize=1024
> blocksPerFile=100
> 
> proc createFiles () {
> 	numFiles=$1
> 	blockSize=$2
> 	blockPerFile=$3
> 	fileSize=$(($blocksPerFile * $blockSize))
> 	while [ $numFiles -gt 0 ]; do
>     		echo "creating file $numFiles"
>     		dd if=/dev/urandom of=randFile.$numFiles \
> 			bs=$blockSize count=$blocksPerFile
>     		let $((numFiles--))
> 		done
> }
> 
> createFiles 40 1024 100
> 
> tar cf rand.tar randFile*
> md5sum randFile* > rand-md5sum
> 
> Next, run the following on the test machine.
> 
> #!/bin/sh
> 
> while true; do
> 	date
> 	tar -xvf /home/yotta/crm/junk/jffs2test/rand.tar
> 	/home/yotta/crm/junk/jffs2test/verify.sh
> done
> 
> 
> After about 3 iterations, the kernel will start killing
> processes.
> 
> There are some "deflateInit failed" warning messages during
> the run.
> 
> Keeping the total size of the files to about 4 meg but changing
> the size of the individual files, I have seen the memory
> problem.
> 
> Anybody got any ideas?
> 
> -- 
> Chris Morrow	YottaYotta Inc. email: cmorrow@yottayotta.com
> phone: (780) 989 6814 web:	http:  //www.yottayotta.com
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Z powazaniem,
Piotr Trojanek
Zespol Informatyki
ELPROMA Elektronika
