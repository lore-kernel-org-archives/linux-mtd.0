Received: from isengard.yottayotta.com ([209.115.177.37])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17wVEB-0001Q0-00
	for <linux-mtd@lists.infradead.org>; Tue, 01 Oct 2002 23:10:51 +0100
Received: from fw-edm-dmz.yottayotta.com ([192.168.1.2] helo=edm-app01.yottayotta.com)
	by isengard.yottayotta.com with esmtp (Exim 3.33 #1)
	id 17wVDe-0000EQ-00
	for linux-mtd@lists.infradead.org; Tue, 01 Oct 2002 16:10:18 -0600
Received: from thorin.edmonton.yottayotta.com ([10.0.1.144] helo=YottaYotta.com)
	by tethys.edmonton.yottayotta.com with esmtp (Exim 3.22 #2)
	id 17wVD9-000DUr-00
	for linux-mtd@lists.infradead.org; Tue, 01 Oct 2002 16:09:47 -0600
Message-ID: <3D9A1D2B.1040501@YottaYotta.com>
Date: Tue, 01 Oct 2002 16:09:47 -0600
From: Chris Morrow <cmorrow@YottaYotta.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Memory management problem?
Content-Type: text/plain; charset=us-ascii; format=flowed
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

I'm running into a problem where the linux kernel is running
out of memory and starts killing processes in an attempt to
recover. The environment is as follows.

A CDB89712 based system with 16 Meg. sdram and 16 meg CFI flash.
Linux-2.4.19-rmk1 with linux-2.4.19-pre10-shared-zlib patch.

First, on another system I create a number of files with random
contents and calculate their md5sums as follows;

#!/bin/sh

rm randFile*

numFiles=40
blockSize=1024
blocksPerFile=100

proc createFiles () {
	numFiles=$1
	blockSize=$2
	blockPerFile=$3
	fileSize=$(($blocksPerFile * $blockSize))
	while [ $numFiles -gt 0 ]; do
     		echo "creating file $numFiles"
     		dd if=/dev/urandom of=randFile.$numFiles \
			bs=$blockSize count=$blocksPerFile
     		let $((numFiles--))
		done
}

createFiles 40 1024 100

tar cf rand.tar randFile*
md5sum randFile* > rand-md5sum

Next, run the following on the test machine.

#!/bin/sh

while true; do
	date
	tar -xvf /home/yotta/crm/junk/jffs2test/rand.tar
	/home/yotta/crm/junk/jffs2test/verify.sh
done


After about 3 iterations, the kernel will start killing
processes.

There are some "deflateInit failed" warning messages during
the run.

Keeping the total size of the files to about 4 meg but changing
the size of the individual files, I have seen the memory
problem.

Anybody got any ideas?

-- 
Chris Morrow	YottaYotta Inc. email: cmorrow@yottayotta.com
phone: (780) 989 6814 web:	http:  //www.yottayotta.com
