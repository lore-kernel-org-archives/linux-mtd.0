Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XCqMB-0002Cu-Ba
 for linux-mtd@lists.infradead.org; Thu, 31 Jul 2014 13:25:19 +0000
Message-ID: <1406813088.20616.32.camel@sauron.fi.intel.com>
Subject: Re: [PATCH RFC v2] UBI: New ioctl() to support ubidump
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Thu, 31 Jul 2014 16:24:48 +0300
In-Reply-To: <53D9B1A0.8080300@huawei.com>
References: <53D7677A.6000905@huawei.com> <53D768B5.6090409@huawei.com>
 <87vbqgb4re.fsf@nbsps.com> <53D85203.7030302@huawei.com>
 <87siliu9lm.fsf@nbsps.com> <53D9B1A0.8080300@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
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

On Thu, 2014-07-31 at 11:01 +0800, hujianyang wrote:
> On 2014/7/30 23:53, Bill Pringlemeir wrote:
> > 
> > You can record the table if you know that the MTD is not changing.  If
> > you introduce the 'ioctl()' to the kernel, it will most likely be on an
> > active file system.  I guess this is a big decision in the tools design.
> 
> This ioctl() doesn't need UBIFS filesystem to be mounted, just needs
> UBI driver. We can keep this partition not active during this tool
> running.
> 
> But a properly configured kernel requirement you said in last mail
> worries me most. I think you are right and want to have a try. But
> I've discussed these stuff with Artem and he said, just quote:
> 
> ""
> So I envision that the tool would work like this.
> 
> $ ubidump my.img --lnum 5
>   - dump LEB 5, will need to scan the entire image.
> 
> $ ubidump /dev/ubiX_Y --lnum 5
>   - will just ask the UBI driver to give the PEB number for LEB 5, then
> find out the MTD device for this volume (should be possible by checking
> the sysfs files), and then reads the MTD device, and gets the UBI-level
> information from there.
> 
> Something like this, just quick thoughts.
> ""

Having a tool which does not need any kernel help is a lot more
preferable. I though we may have an ioctl like this if no one has time
to write full scanning support in user-space, and then maintain it.

> We can keep a temporary file to record the mapping table but that will
> make the initial submission much more complicated. But this way you
> mentioned to record the table should be considered to add into this tool
> in the future.

Hujianyang, AFAIU, right now you need an ability to dump UBIFS stuff.
You do not really need to know PEB number. So ubidump may
analyze /dev/ubiX_Y without knowing the PEB number, right? It can just
read from /dev/ubiX_Y directly. And print you all the UBIFS nodes.

I mean, if what user gives you is an UBI volume, you do not try going to
the MTD level.

-- 
Best Regards,
Artem Bityutskiy
