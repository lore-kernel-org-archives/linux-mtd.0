Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7KzH-0004Sj-DG
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 08:54:55 +0000
Message-ID: <53C63DA2.5080200@huawei.com>
Date: Wed, 16 Jul 2014 16:53:54 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH 6/7] New utility ubidump
References: <53BA491E.8060502@huawei.com> <53BA4B98.1080000@huawei.com>
 <1405497907.1920.27.camel@sauron.fi.intel.com>
In-Reply-To: <1405497907.1920.27.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I envision that in the future people may want to specify PEB number
> instead of LEB number, and '-n' becomes a confusing name for the option.
> Could you please only support '--lnum', and drop '-n' altogether. Then
> in the future someone may add '--pnum' support.

Yes, you are right. I'll change it in next version.

> 
>> +"-i, --info		show explicit information about NODEs\n"
> 
> I do not understand what this means from the description. Would you
> please try to describe it better in the help text?
> 
>> +"-H, --header		show only header information\n"
>> +"-N, --node		show only NODEs information\n"
> 
> Same for these.
> 
> Thanks!
> 

-H for UBI-level info and -N for UBIFS-level info.
-i means dump UBIFS Nodes by function ubifs_dump_node, not just
scan them.

I will re-describe them.

Thanks.
