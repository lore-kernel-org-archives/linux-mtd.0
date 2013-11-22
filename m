Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjpAx-0004GB-CQ
 for linux-mtd@lists.infradead.org; Fri, 22 Nov 2013 11:45:32 +0000
Date: Fri, 22 Nov 2013 08:45:10 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Hans Zhang <zhanghonghui@innofidei.com>
Subject: Re: [PATCH] Make the mtdblock read/write skip the bad nand sector
Message-ID: <20131122114509.GB2414@localhost>
References: <1385024065-29965-1-git-send-email-zhanghonghui@innofidei.com>
 <CACQ1gAiLesYEWmHkivAF=t8ekCFM=yDDyzkJTtduavNjp1g6wA@mail.gmail.com>
 <528EB1E3.7030101@innofidei.com> <20131122015237.GB3509@localhost>
 <528EBD0B.5010006@innofidei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <528EBD0B.5010006@innofidei.com>
Cc: Richard Genoud <richard.genoud@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 zhouguangming@innofidei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 22, 2013 at 10:10:19AM +0800, Hans Zhang wrote:
> On 2013/11/22 9:52, Ezequiel Garcia wrote:
> > On Fri, Nov 22, 2013 at 09:22:43AM +0800, Hans Zhang wrote:
> >> On 2013/11/21 18:59, Richard Genoud wrote:
> >>
> >> Here's my scenario, I want to write nand through mtdblock by dd command
> > You could get some better support by explaining why do you want to write
> > to a NAND through mtdblock. It sounds a bit ackward to me, but I'm sure
> > you have a good reason for it!
> >
> > Let's hear it :-)
> 
> Thanks for your reply.
> This is for my embed system upgrade, I reserved one nand partition for filesystem
> environment which will load to DDR while uboot booting.
> This filesystem.uboot file should be able to read both by uboot and kernel, and
> maybe written by uboot and kernel. There will be no filesystems upon the nand in
> case the loader may not support some filesystem types while uboot booting.
> 
> Seems that the trimmed environment of OS has get rid of the mtd-tools, So the dd
> command was the most convenience tools to use by hand.
> 

I still don't understand why are you using mtdblock. Why can't you write
through the char device?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
