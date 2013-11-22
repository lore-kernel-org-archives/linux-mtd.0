Received: from mail-vb0-f50.google.com ([209.85.212.50])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjltU-0000Wt-GS
 for linux-mtd@lists.infradead.org; Fri, 22 Nov 2013 08:15:17 +0000
Received: by mail-vb0-f50.google.com with SMTP id 10so646707vbe.9
 for <linux-mtd@lists.infradead.org>; Fri, 22 Nov 2013 00:14:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <528EBD0B.5010006@innofidei.com>
References: <1385024065-29965-1-git-send-email-zhanghonghui@innofidei.com>
 <CACQ1gAiLesYEWmHkivAF=t8ekCFM=yDDyzkJTtduavNjp1g6wA@mail.gmail.com>
 <528EB1E3.7030101@innofidei.com> <20131122015237.GB3509@localhost>
 <528EBD0B.5010006@innofidei.com>
Date: Fri, 22 Nov 2013 09:14:52 +0100
Message-ID: <CAFLxGvyLEEyc2pFJXFU+aLb-ma3EraHLbdFwMm7bxAXJo9M=jw@mail.gmail.com>
Subject: Re: [PATCH] Make the mtdblock read/write skip the bad nand sector
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Hans Zhang <zhanghonghui@innofidei.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Richard Genoud <richard.genoud@gmail.com>, zhouguangming@innofidei.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 22, 2013 at 3:10 AM, Hans Zhang <zhanghonghui@innofidei.com> wrote:
> On 2013/11/22 9:52, Ezequiel Garcia wrote:
>> On Fri, Nov 22, 2013 at 09:22:43AM +0800, Hans Zhang wrote:
>>> On 2013/11/21 18:59, Richard Genoud wrote:
>>>
>>> Here's my scenario, I want to write nand through mtdblock by dd command
>> You could get some better support by explaining why do you want to write
>> to a NAND through mtdblock. It sounds a bit ackward to me, but I'm sure
>> you have a good reason for it!
>>
>> Let's hear it :-)
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

Instead of fixing your userspace you mess around int the kernel?
Sorry, that's a no-no.

-- 
Thanks,
//richard
