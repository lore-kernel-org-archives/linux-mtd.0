Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XCqN8-0003zE-DY
 for linux-mtd@lists.infradead.org; Thu, 31 Jul 2014 13:26:18 +0000
Message-ID: <1406813154.20616.33.camel@sauron.fi.intel.com>
Subject: Re: [PATCH RFC v2] UBI: New ioctl() to support ubidump
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Bill Pringlemeir <bpringlemeir@nbsps.com>
Date: Thu, 31 Jul 2014 16:25:54 +0300
In-Reply-To: <87siliu9lm.fsf@nbsps.com>
References: <53D7677A.6000905@huawei.com> <53D768B5.6090409@huawei.com>
 <87vbqgb4re.fsf@nbsps.com> <53D85203.7030302@huawei.com>
 <87siliu9lm.fsf@nbsps.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, hujianyang <hujianyang@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-07-30 at 11:53 -0400, Bill Pringlemeir wrote:
> I think others don't understand why you would want the 'ubidump' to run
> on an active file system?  At least, I don't understand this?  Is there
> some use case we are missing?  I am quite sure that you can perform
> better diagnostics on a 'frozen' image where you can look at the whole
> image state.

I think you are right that in ideal world ubidump should be able to
figure out the LEB->PEB mapping without asking the driver. It should be
able to scan the image and figure everything out itself.

However, writing such a toll is _hard_. Maintaining it is _hard too_.
You basically need to copy part of the driver to user-space, and
maintain it there. Whenever someone adds a new UBI feature like
"fastmap", you need to port that to the tool too.

This is doable, e.g., e2fsprogs project basically does this. But so far,
no one did this for UBI/UBIFS. And the UBIFS user-base is relatively
small. Many people expressed a desire to have a 'chkfs.ubifs' and
'ubidump', but no one went ahead ad did this - this is not easy and this
costs.

So I initially thought may be a little help from the kernel would not
hurt. But I am not 100% sure this is a good idea.

-- 
Best Regards,
Artem Bityutskiy
