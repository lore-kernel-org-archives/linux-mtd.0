Received: from smtp4.nedap.com ([213.160.213.85] helo=smtp.nedap.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkrQ4-0007ec-UO
 for linux-mtd@lists.infradead.org; Fri, 16 Sep 2016 11:35:02 +0000
To: <linux-mtd@lists.infradead.org>
From: Jaap de Jong <jaap.dejong@nedap.com>
Subject: Nandflash lifetime calculation
Message-ID: <c763ec82-85e9-172b-2bf3-62859b24d9f0@nedap.com>
Date: Fri, 16 Sep 2016 13:34:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All!

I'm wondering if my expected nandflash lifetime calculation is, well at 
least, a bit accurate.

So I have this nandflash and about half of it is occupied by static 
files. It will not change.
The other half will be used by logs and databases, the dynamic part of 
this UBI filesystem.
Their length will not change because they sort of act as circular buffers.
Let's say this system ran a year and the maximum erase counter is now at 
1.000.
The nandflash is specified at 100.000 cycles and is 512MB in size.
I added a factor of 0.7 for overhead.

So I have a few assumptions, please correct me when and where I'm wrong:

     1 - total space available for writing such a nandflash = 0.7 * 
100.000 * 512MB before it reaches
         its maximum if wear levelling is across the full device 
(global, which UBI claims)
         --> 35840 GB

     2 - when the maximum erase counter is at 1.000 in 1 year and 256MB 
is being used for that,
         a total of about 1.000 * 256MB is written in 1 year
         --> 256 GB

     3 - the expected lifetime of this nandflash with this usage then 
would be 35840 / 256
         --> 140 yr

Would that make any sense? (Except that it is far too long to even get 
close to that....)

Thanks!
Jaap
