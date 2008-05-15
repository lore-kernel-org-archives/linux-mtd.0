Received: from wf-out-1314.google.com ([209.85.200.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JwUjW-0001t4-9H
	for linux-mtd@lists.infradead.org; Thu, 15 May 2008 04:06:22 +0000
Received: by wf-out-1314.google.com with SMTP id 28so211666wfc.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 May 2008 21:06:21 -0700 (PDT)
Message-ID: <bae050c10805142106x124e01fatc02f81631988396d@mail.gmail.com>
Date: Thu, 15 May 2008 12:06:20 +0800
From: Nancy <nancydreaming@gmail.com>
To: dedekind@infradead.org
Subject: Re: ubifs image file confusion!
In-Reply-To: <1210772744.5708.77.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <bae050c10805080217r77c9724aya0777ccf5f59a293@mail.gmail.com>
	<1210243730.3645.66.camel@sauron>
	<bae050c10805090005g50b657c2jf8d471cd51244da7@mail.gmail.com>
	<bae050c10805092120u14177a03td46fa8175f89aa66@mail.gmail.com>
	<bae050c10805100031u25a233ffi65e39705ea778fcc@mail.gmail.com>
	<1210672125.5708.9.camel@sauron>
	<bae050c10805130552o351fbcb6ifc83815895fcce22@mail.gmail.com>
	<1210772744.5708.77.camel@sauron>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/14/08, Artem Bityutskiy <dedekind@infradead.org> wrote:
> I see. But it is not a good reason for an additional ioctl anyway. In
> Linux we try to keep the amount of ioctl's as low as possible.
   As low as possible, why? As I know Ioctl is a way to make function
spread of device driver. I thought the more Ioctls imply more
functional this device driver has.

> What you can do instead, is to read the volume LEB by LEB, then check
> the data against 0xFFs, and if it contains all 0xFFs - drop this data.
   Is there any choise for me if I do not add this read LEB ioctl to
finish this task?

> What you can do is to save the numbers of dropped LEBs in a file. And
> when you write the dumped image, you feed 0xFFs instead of the LEB which
> were dropped.
>
> For example, you may improve ubiupdatevol and teach it to accept a
> --unmapped=file option which would contain a list of unmapped LEB
> numbers.
How about give each Mapped LEB an header( long long lnum )? So the
image file content structure looks like:
-------------------------------------------------------------------
long long lnum |  LEB |  long long lnum | LEB | ...........................
-------------------------------------------------------------------

And "ubiupdatevol" can do:
1.  erase the volume
2.  write image file to volume, no need to skip the 0xFF

If you agree with this idea, tool mkfs.ubifs, ubinize, ubiupdatevol
should be changed.

For meeting current urgent need ,  ubidumpvol is just for dump FAT
image, cause there's no tools like mkfs.ubifs to generate a FAT image.
I have not enought knowlege to build tool like that. There are many
other filesystem may run on top of this ubiblk device layer.  It's
better to build a general tool like ubidumpvol to do this job to avoid
various differences of filesystem.

-- 
Best wishes,
Nancy
