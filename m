Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y180h-0000eI-5E
 for linux-mtd@lists.infradead.org; Wed, 17 Dec 2014 06:22:59 +0000
Message-ID: <54912109.50505@huawei.com>
Date: Wed, 17 Dec 2014 14:22:01 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: "markus.heininger@online.de" <markus.heininger@online.de>
Subject: Re: UBIFS: Is it possible to get the compressed size of a file?
References: <trinity-a1228aa8-8eaa-4950-9c14-5d6b6db5f3d7-1418371801058@3capp-1and1-bs02>
In-Reply-To: <trinity-a1228aa8-8eaa-4950-9c14-5d6b6db5f3d7-1418371801058@3capp-1and1-bs02>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/12/12 16:10, markus.heininger@online.de wrote:
> Hello,
>  
> when using compression along with UBIfs, fstat reports the uncompressed file size
> (as it should do). Is there a simple way to get the compressed file size, thus the real space
> a single file needs on the flash memory?

Why you need this?

I know *df* shows the space of a partition. Run *sync* after
a file created or appended, the space change of this partition
maybe could show you the compressed size of this file.

Is that enough for you?

>  
> Many thanks,
> Markus
> 
