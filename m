Received: from antispam01.maxim-ic.com ([205.153.101.182])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MkzcX-0008I3-Q1
	for linux-mtd@lists.infradead.org; Tue, 08 Sep 2009 12:16:30 +0000
Message-ID: <4AA64B13.70306@maxim-ic.com>
Date: Tue, 8 Sep 2009 17:46:19 +0530
From: JerinJacob <jerin.jacob@maxim-ic.com>
MIME-Version: 1.0
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: Re: UBIFS Error
References: <4AA5F37F.4050307@maxim-ic.com> <4AA60E6C.6060307@nokia.com>
In-Reply-To: <4AA60E6C.6060307@nokia.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Bityutskiy Artem \(Nokia-M/Helsinki\)" <Artem.Bityutskiy@nokia.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Please find below the actual test script:

--------------------------start---------------------------------------------------------------
#!/bin/sh

sizecount=0
localcount=0

deletelimit=`expr 500 \* 1024 \* 1024` # 500 MB
FILENAME="1 2 3 4 5 6 7 8 9 10"

rm -rf /ubifs_rootfs/*

while [ 1 ]
do

        for filename in $FILENAME
        do
            size=`expr 4096 \* 10`

            dd if=/dev/urandom of=/ubifs_rootfs/foo1${filename} bs=1024 
count=4 2> /dev/null ;
            dd if=/dev/urandom of=/ubifs_rootfs/foo2${filename} bs=1024 
count=4 2> /dev/null ;
            dd if=/dev/urandom of=/ubifs_rootfs/foo3${filename} bs=1024 
count=4 2> /dev/null ;
            dd if=/dev/urandom of=/ubifs_rootfs/foo4${filename} bs=1024 
count=4 2> /dev/null ;
            dd if=/dev/urandom of=/ubifs_rootfs/foo5${filename} bs=1024 
count=4 2> /dev/null ;
            dd if=/dev/urandom of=/ubifs_rootfs/foo6${filename} bs=1024 
count=4 2> /dev/null ;
            dd if=/dev/urandom of=/ubifs_rootfs/foo7${filename} bs=1024 
count=4 2> /dev/null ;
            dd if=/dev/urandom of=/ubifs_rootfs/foo8${filename} bs=1024 
count=4 2> /dev/null ;
            dd if=/dev/urandom of=/ubifs_rootfs/foo9${filename} bs=1024 
count=4 2> /dev/null ;
            dd if=/dev/urandom of=/ubifs_rootfs/foo10${filename} bs=1024 
count=4 2> /dev/null ;

            localcount=`expr $localcount + $size`
            sizecount=`expr $sizecount + $size`
        done

        if [ $localcount -gt $deletelimit ] ; then
                echo "Clean up!!!"
                localcount=0
                rm -rf /ubifs_rootf/* ; sync
        fi

        date ; sync
        echo "Bytes Written to Nand flash:`expr $sizecount / 1048576 ` MB"

done
-----------------------------End-----------------------------------------------------------------


Adrian Hunter wrote:
> JerinJacob wrote:
>   
>> Hi All,
>>
>> Got an UBIFS error while performing a regression write test on UBIFS 
>> file system.
>>
>>
>> [Issue]
>> =======
>>
>> While performing a regression write test on UBIFS file system,the UBIFS 
>> file system becomes read-only mode.
>> pseudo code for the regression write test as follows:
>>
>> while(1)
>> {
>> create and write a random image(with different block size using dd 
>> command) to nand flash
>>
>> if "disk space is reached maxim size"
>>     delete all the files
>>
>> }
>>     
>
> Can you provide the actual test?
>
>
> .
>
>   
