Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XD2wk-0002xq-Hr
 for linux-mtd@lists.infradead.org; Fri, 01 Aug 2014 02:51:55 +0000
Message-ID: <53DB0081.1040905@huawei.com>
Date: Fri, 1 Aug 2014 10:50:41 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH RFC v2] UBI: New ioctl() to support ubidump
References: <53D7677A.6000905@huawei.com> <53D768B5.6090409@huawei.com>
 <87vbqgb4re.fsf@nbsps.com> <53D85203.7030302@huawei.com>
 <87siliu9lm.fsf@nbsps.com> <53D9B1A0.8080300@huawei.com>
 <1406813088.20616.32.camel@sauron.fi.intel.com>
In-Reply-To: <1406813088.20616.32.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Bill Pringlemeir <bpringlemeir@nbsps.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/7/31 21:24, Artem Bityutskiy wrote:
> 
> Hujianyang, AFAIU, right now you need an ability to dump UBIFS stuff.

Yes, but not all of what I want. I need this utility dumping UBI-level
stuff too. The ability, not only to dump UBIFS stuff but also to dump
UBI stuff will make it a useful tool.

> You do not really need to know PEB number. So ubidump may
> analyze /dev/ubiX_Y without knowing the PEB number, right? It can just
> read from /dev/ubiX_Y directly. And print you all the UBIFS nodes.
> 

Last version I sent to this maillist was reading data from UBI driver
directly. But our .read() function in UBI driver jump over UBI stuff, so
I read UBI stuff from an ioctl(). This isn't a common way as you said.

I have to say I am about to leave Beijing for at least 3 months and
have no time for the development of this tool. I aspire if we can push
some of my work to ubi-utils before my leaving. So we should hurry up~!

First, we can leave UBI/UBIFS format dumping behind, just dump binary
data, that will make initial submission smaller.

Then, think about what we want at this time.

1) No UBI stuff and read UBIFS stuff from UBI-driver
This is a easiest way and we don't need any ioctl either. We can't get
UBI-level stuff right now but we can put this into our design of dumping
an image file.

2) Read data from MTD-driver and find a way to get pnum
This way is basing on my v2 work. We can put an ioctl() to kernel and
if kernel don't support this ioctl(), this tool will do a full-scan on
MTD device. It's transparent to user. But we should take some time to
consider how to do this full-scan.

3) Re-design this tool about dropping UBI driver based dumping.
This way is like the exist ubiformat utility. We don't use UBI driver
and just do read/write(maybe we can do some repairing later) with MTD
device or image files. It's not small.


I think you will prefer to solution 1. Although it's not fit all my
desires, I will agree with it if you insist. Or do you have any other
suggestions?


Thanks~!

Hu
