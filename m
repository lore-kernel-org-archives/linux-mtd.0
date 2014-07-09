Received: from mail-lb0-f180.google.com ([209.85.217.180])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X4mF1-00027P-Rv
 for linux-mtd@lists.infradead.org; Wed, 09 Jul 2014 07:24:36 +0000
Received: by mail-lb0-f180.google.com with SMTP id w7so4764584lbi.11
 for <linux-mtd@lists.infradead.org>; Wed, 09 Jul 2014 00:24:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53BC9221.1030708@huawei.com>
References: <53BBC39F.7010307@gmail.com> <53BC9221.1030708@huawei.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Wed, 9 Jul 2014 09:23:48 +0200
Message-ID: <CACQ1gAimr_Thv2=_jYf2s138sSqeeVzfO1bE62-a3YTor1cRUA@mail.gmail.com>
Subject: Re: ubifs error at boot "bad node type"
To: hujianyang <hujianyang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2014-07-09 2:51 GMT+02:00 hujianyang <hujianyang@huawei.com>:
>>
>> # ls -l /mnt/rfs/
>> [   87.054687] UBIFS error (pid 652): ubifs_read_node: bad node type (255 but expected 0)
>> [   87.062500] UBIFS error (pid 652): ubifs_read_node: bad node at LEB 405:39728, LEB mapping status 1
>> [   87.070312] Not a node, first 24 bytes:
>> [   87.078125] 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff                          ........................
>
> Seems LEB 405 is empty? This is not the first time I saw
> an error like this.
>
> Is this happen after an unclean umount like power cut?
I'm only guessing that it happened after a power cut, I wasn't there
when it happened...

For now, it's the 1st and only time.
I'll wait and see if it happens again.


> Artem, do you have any ideas?
>
