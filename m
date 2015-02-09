Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKjCv-0002Hn-BA
 for linux-mtd@lists.infradead.org; Mon, 09 Feb 2015 07:56:38 +0000
Message-ID: <54D86819.90803@nod.at>
Date: Mon, 09 Feb 2015 08:56:09 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: hujianyang <hujianyang@huawei.com>
Subject: Re: [RFC] UBIFS recovery
References: <54D33C36.9060805@huawei.com>		
 <CALupW3CQ3YCvdx_tNeDGVo9cVTcmACyqsMRpr8+P2_4jwGgZMQ@mail.gmail.com>	
 <1423243571.8637.579.camel@sauron.fi.intel.com> <54D4FAFD.9000009@nod.at>
 <1423244437.8637.587.camel@sauron.fi.intel.com> <54D4FD5C.1040909@nod.at>
 <54D822B0.8020605@huawei.com>
In-Reply-To: <54D822B0.8020605@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: Steve deRosier <derosier@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Sheng Yong <shengyong1@huawei.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 09.02.2015 um 04:00 schrieb hujianyang:
>> This is what fsck.ubifs should to. I was talking about a debugfs.ubifs which
>> is able to extract files, ask questions, and tell the user what exactly is going
>> wrong. Like "yes, I can dump you file /foo/bar.dat but rage 5m to 10m maybe be corrupted and the xattrs are gone".
>>
> 
> Er, maybe I know what you mean.
> 
> So you think by debugfs.ubifs, we could get wanted file out from a partition
> without mounting it? and do other things like (?)

This is the use case of a debugfs. See debugfs.ext2/3/4, etc...
You can debug (analyze, get files your, etc...) from a broken filesystem
without mounting it.

> Moving less files out maybe simpler than mounting the whole partition in some
> cases. But is it acceptable for scripts? If someone want to perform some binary
> files on the corrupted ubifs. I think mounting a R/O partition is better than
> moving the request file out and then run it.

Scripts?
debugfs is meant for _manual_ forensics/recovery.
Mounting R/O is not always an option, we cannot make UBIFS that smart that you
can always turn it into a state where you can safely get everything out of it.
And as I wrote in a previous mail, the interaction between kernel and user is almost zero.
Debugfs can ask questions and give you a much better overall overview of the filesystem.
This is exactly why debugfs was invented. You can also manually fix/transform the filesystem...

Thanks,
//richard
