Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12cn6K-000566-00
	for mtd-list@infradead.org; Wed, 05 Apr 2000 11:31:56 +0100
Received: from [212.25.93.158] (helo=jodie.lucid)
	by infradead.org with smtp (Exim 3.03 #1)
	id 12cn6H-00055y-00
	for mtd@infradead.org; Wed, 05 Apr 2000 11:31:54 +0100
Message-ID: <38EB172E.2126DEE0@lucidvon.com>
Date: Wed, 05 Apr 2000 10:36:30 +0000
From: Dvir Oren <dviro@lucidvon.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>, MTD <mtd@infradead.org>
Subject: ECC Error + bad access
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

I don't know what was different from yesterday, but today I seem to be able to boot
with the MTD drivers, and mount the flash, and the file system doesn't get destroyed
- this is on a 12 Mb flash.  (16Mb doesn't work yet - Anybody using a 16Mb flash and
has been able to boot?  Trevor?)

However, when I try to login I get a bad access error.  I did some checking, and the
bad access seems to be weird.  There should be 23952 blocks (998*12*2), but the error
is about block 23948, count=2, which adds up to 23950.  Ideas?
(I also don't understand why am I getting to the end of the flash.  I'm filling up
only 9Mb of 12)

Also, when I wrote the entire file system to the flash using the MTD drivers, I got a
whole lot of ECC Errors.  Why does this happen?  (I usually get "Error went away on
retry", however).

And still there is the problem with the geometry on 16Mb flashes.

-- 
Dvir Oren               <dviro@lucidvon.com>
Lucid VON Ltd.     <http://www.lucidvon.com>
9 Saloniki St.,        Tel-Aviv       Israel
Tel:  +972 3 644 3038  Fax:  +972 3 644 3039


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
