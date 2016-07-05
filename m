Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bKU8o-0004Vp-Kr
 for linux-mtd@lists.infradead.org; Tue, 05 Jul 2016 17:28:11 +0000
Subject: Re: [RFC] ubihealthd
To: Sascha Hauer <s.hauer@pengutronix.de>, Richard Weinberger <richard@nod.at>
References: <1446764403-22742-1-git-send-email-richard@nod.at>
 <20160415062604.GA31101@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com,
 alex@nextthing.co
From: Daniel Walter <dwalter@sigma-star.at>
Message-ID: <fa514353-2a8f-7121-466e-6261b39be03d@sigma-star.at>
Date: Tue, 5 Jul 2016 19:27:41 +0200
MIME-Version: 1.0
In-Reply-To: <20160415062604.GA31101@pengutronix.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/15/2016 08:26 AM, Sascha Hauer wrote:
> Hi Richard, Daniel,
> 
> On Thu, Nov 05, 2015 at 11:59:59PM +0100, Richard Weinberger wrote:
>> ubihealthd is a tiny C program which takes care of your NAND.
>> It will trigger re-reads and scrubbing such that read-disturb and
>> data retention will be addressed before data is lost.
>> Currently the policy is rather trivial. It re-reads every PEB within
>> a given time frame, same for scrubbing and if a PEB's read counter exceeds
>> a given threshold it will also trigger a re-read.
>>
>> At ELCE some people asked why this is done in userspace.
>> The reason is that this is a classical example of kernel offers mechanism
>> and userspace the policy. Also ubihealthd is not mandatory.
>> Depending on your NAND it can help you increasing its lifetime.
>> But you won't lose data immediately if it does not run for a while.
>> It is something like smartd is for hard disks.
>> I did this also in kernel space and it was messy.
> 
> I gave ubihealthd a try and it basically works as expected. I let it run
> on a UBI device with a ton of (artificial) bitflips and the demon crawls
> over them moving the data away.
> 
> Do you have plans to further work on this and to integrate it into the
> kernel and mtd-utils?
> 
> One thing I noticed is that ubihealthd always scrubs blocks, even when
> there are no bitflips in that block. Why is that done? I would assume
> that rewriting a block when there are more bitflips than we can accept
> is enough, no?
> 
> Sascha
> 

Hi Sascha,

sorry for the late reply.

I've picked up working on ubihealthd again and after your comments and
the comments from Brian, I came to the conclusion, that we can indeed
skip the scrubbing, since it will be done by the kernel anyways as soon
as a read requests produces bitfilps.

I assume that I'll finish the work for the next version for ubihealthd
within the next few days and will send an updated RFC to the list.

daniel
