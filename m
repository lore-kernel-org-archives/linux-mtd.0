Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSOCv-0000eP-N2
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 11:40:35 +0000
Subject: Re: [PATCH 2/2] ubifs: Allow O_DIRECT
To: dedekind1@gmail.com, Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 linux-mtd@lists.infradead.org
References: <1440016553-26481-1-git-send-email-richard@nod.at>
 <1440016553-26481-2-git-send-email-richard@nod.at>
 <55D542C5.6040500@cn.fujitsu.com> <1440070300.31419.202.camel@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <55D5BC92.8050903@nod.at>
Date: Thu, 20 Aug 2015 13:40:02 +0200
MIME-Version: 1.0
In-Reply-To: <1440070300.31419.202.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

Am 20.08.2015 um 13:31 schrieb Artem Bityutskiy:
> On Thu, 2015-08-20 at 11:00 +0800, Dongsheng Yang wrote:
>> On 08/20/2015 04:35 AM, Richard Weinberger wrote:
>>> Currently UBIFS does not support direct IO, but some applications
>>> blindly use the O_DIRECT flag.
>>> Instead of failing upon open() we can do better and fall back
>>> to buffered IO.
>>
>> Hmmmm, to be honest, I am not sure we have to do it as Dave
>> suggested. I think that's just a work-around for current fstests.
>>
>> IMHO, perform a buffered IO when user request direct IO without
>> any warning sounds not a good idea. Maybe adding a warning would
>> make it better.
>>
>> I think we need more discussion about AIO&DIO in ubifs, and actually
>> I have a plan for it. But I have not listed the all cons and pros of
>> it so far.
>>
>> Artem, what's your opinion?
> 
> Yes, this is my worry too.
> 
> Basically, we need to see what is the "common practice" here, and
> follow it. This requires a small research. What would be the most
> popular Linux FS which does not support direct I/O? Can we check what
> it does?

All popular filesystems seem to support direct IO.
That's the problem, application do not expect O_DIRECT to fail.

My intention was to do it like exofs:

commit d83c7eb65d9bf0a57e7d5ed87a5bd8e5ea6b1fb6
Author: Boaz Harrosh <bharrosh@panasas.com>
Date:   Mon Jan 13 23:45:43 2014 +0200

    exofs: Allow O_DIRECT open

    With this minimal do nothing patch an application can open O_DIRECT
    and then actually do buffered sync IO instead. But the aio API is
    supported which is a good thing

    Signed-off-by: Boaz Harrosh <bharrosh@panasas.com>

diff --git a/fs/exofs/inode.c b/fs/exofs/inode.c
index a52a5d2..7e7ba9a 100644
--- a/fs/exofs/inode.c
+++ b/fs/exofs/inode.c
@@ -961,6 +961,14 @@ static void exofs_invalidatepage(struct page *page, unsigned int offset,
 	WARN_ON(1);
 }

+
+ /* TODO: Should be easy enough to do proprly */
+static ssize_t exofs_direct_IO(int rw, struct kiocb *iocb,
+		const struct iovec *iov, loff_t offset, unsigned long nr_segs)
+{
+	return 0;
+}
+
 const struct address_space_operations exofs_aops = {
 	.readpage	= exofs_readpage,
 	.readpages	= exofs_readpages,
@@ -974,7 +982,7 @@ const struct address_space_operations exofs_aops = {

 	/* Not implemented Yet */
 	.bmap		= NULL, /* TODO: use osd's OSD_ACT_READ_MAP */
-	.direct_IO	= NULL, /* TODO: Should be trivial to do */
+	.direct_IO	= exofs_direct_IO,

 	/* With these NULL has special meaning or default is not exported */
 	.get_xip_mem	= NULL,

Thanks,
//richard
