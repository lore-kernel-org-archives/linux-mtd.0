Received: from szxga01-in.huawei.com ([58.251.152.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2VX2-0005Fh-8H
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 02:14:24 +0000
Message-ID: <55779D37.9000707@huawei.com>
Date: Wed, 10 Jun 2015 10:13:11 +0800
From: Sheng Yong <shengyong1@huawei.com>
MIME-Version: 1.0
To: cyl <cyl665236@126.com>, mtd mailing list <linux-mtd@lists.infradead.org>
Subject: Re: ubifs problem
References: <2b88f8ae.15caa.14ddab0368e.Coremail.cyl665236@126.com>
 <557791DF.9040501@huawei.com>
In-Reply-To: <557791DF.9040501@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 6/10/2015 9:24 AM, Sheng Yong wrote:
...
>>
>> UBI error: ubi_io_read: error -74 while reading 258048 bytes from PEB 3029:4096, read 258048 bytes
>>
>>
>> UBI error: ubi_io_read: error -74 while reading 258048 bytes from PEB 3029:4096, read 258048 bytes
>>
>>
>> UBIFS error (pid 1): ubifs_recover_master_node: failed to recover master node
>>
> It seems you got an ECC error when reading master node. For ECC error, there is
> no easy way to recover it. Maybe you could dump the bad LEB to see what is wrong
> with `ubidump', and fix it by hand.
And of course you should backup the image before doing recovery.
> 
> thanks,
> Sheng
>>
...
