Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEgAG-0002Oj-7k
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 17:05:41 +0000
Subject: =?UTF-8?B?UmU6IOWbnuWkje+8mnViaWZzOlF1ZXN0aW9ucyBBYm91dCBHYXJiYWdl?=
 =?UTF-8?Q?_Collection?=
To: =?UTF-8?B?6L6J5bCR?= <wang502742203@qq.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <tencent_6E3BACF519D6BE3A72292C36@qq.com>
 <CAFLxGvxbmUqFAq7QS=S3n0_yO4tsUHdbbL3-Fq4bHuJTBmEpPA@mail.gmail.com>
 <tencent_7ADEA65732A2B069166D1A41@qq.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <5766D0CA.3090404@nod.at>
Date: Sun, 19 Jun 2016 19:05:14 +0200
MIME-Version: 1.0
In-Reply-To: <tencent_7ADEA65732A2B069166D1A41@qq.com>
Content-Type: text/plain; charset=gb18030
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 19.06.2016 um 18:14 schrieb 辉少:
> Thanks for your kind reply！Do you mean that in synchronous/asynchronous mode GC is also finished in synchronous
> /asynchronous way as writting is? A more question is，are all dirty spaces collected in the same time in synchronous mode(at this point the caller will be blocked for a long time) while in asynchronous mode dirty spaces will be collected little by little in asynchronous mode when i do not  notice？Thank you！

Hmm, I don't fully understand your first question, can you elaborate?
As for dirty space, GC will not collect all dirty space. UBIFS tells GC how much free space an operation
will take. UBIFS calls this budget. The GC will try to produce as much free space as needed.

Thanks,
//richard

> ---原始邮件---
> *发件人:* "Richard Weinberger"<richard.weinberger@gmail.com>
> *发送时间:* 2016年6月19日 22:51:43
> *收件人:* "辉少"<wang502742203@qq.com>;
> *抄送:* "linux-mtd"<linux-mtd@lists.infradead.org>;
> *主题:* Re: ubifs:Questions About Garbage Collection
> 
> Hi!
> 
> On Sun, Jun 19, 2016 at 3:56 PM, 辉少 <wang502742203@qq.com> wrote:
>> Hi，MTD  lists
>> I meet some problems while using UBI file system recently.I make an experiment in which I write 2 files(1KB each) to UBI frequently.Normally it takes only several millseconds to
> finish writting 2 files every time，but what puzzles me is that it takes about 4 minutes to write once nearly every 20 to 30 minutes.I am wondering how can this problem
> happen？Does Garbage Collection lead to this? I mount UBIFS to a 33MiB MTD partion with "o -sync" option.By the way,if UBI is mounted in asynchronous mode, this problem never
> happens. Does GC(Garbage Collecton) differ in synchronous mode andasynchronous mode?  What I've leared from some documents is that GC thread is sleeping while writting files
> without interval until UBIFS is full in synchronous mode and at that point writing will become very slow, but in asynchronous mode, before data is  moved into flash media, GC
> thread will work when there is not enough free space, am I right?
> 
> You observe the issue only in sync mode because every write is done
> immediately and therefore the garbage collector needs to
> produce empty space. This can take some time and as you are in sync
> mode the caller (where you measure the time) will be blocked
> until GC produce some space.
> In asynchronous mode you will hardly notice since writing do the flash
> will be done in a different thread by the write back mechanism.
> 
> -- 
> Thanks,
> //richard
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
