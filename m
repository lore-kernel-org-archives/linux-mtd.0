Received: from yx-out-1718.google.com ([74.125.44.154])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKXgi-00018j-5v
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 12:39:10 +0000
Received: by yx-out-1718.google.com with SMTP id 3so2979360yxi.72
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 Jan 2009 04:39:04 -0800 (PST)
Message-ID: <52e42efe0901070439s223d8bb3hae377c2c0584c3ec@mail.gmail.com>
Date: Wed, 7 Jan 2009 13:39:04 +0100
From: "Sidney Amani" <amani_s@epitech.net>
Sender: seed95@gmail.com
Subject: Re: [PATCH 0/2] mtd-utils export libraries
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <8bd0f97a0901060716h5c518faau77a7af884f5133c2@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <52e42efe0812180615u19344697la740e4ca1a060aff@mail.gmail.com>
	<1229611038.30575.11.camel@sauron>
	<8bd0f97a0812181224w450cb529l9108eaddbf66081c@mail.gmail.com>
	<8bd0f97a0901060716h5c518faau77a7af884f5133c2@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mike,

What we are trying to do is an UBI based userspace filesystem (using fuse).
We use the libubi to get volumes and devices info (ubi_get_dev_info,
ubi_get_vol_info, ubi_get_dev_info1, ubi_get_vol_info1).
Otherwise we communicate with the UBI volume through the cdev driver.
I am not sure a shared library is really desirable, probably not,
anyway it's not fundamental for us...
I particularly though that it could be useful for ubi-tools but I also
realize that it's much more restrictive to have shared libraries.

On Tue, Jan 6, 2009 at 4:16 PM, Mike Frysinger <vapier.adi@gmail.com> wrote:
> On Thu, Dec 18, 2008 at 15:24, Mike Frysinger wrote:
>> On Thu, Dec 18, 2008 at 09:37, Artem Bityutskiy wrote:
>>> On Thu, 2008-12-18 at 15:15 +0100, Sidney Amani wrote:
>>>> We are currently working on an UBI based userspace filesystem.
>>>>
>>>> We wanted to use libubi. So here is our patch to export shared
>>>> libraries and headers. This is done for each library in LIBS.
>>>
>>> Hi, thanks for the patches. However, Mike (CCed) sent a major build
>>> system rework patch recently, but there was an issue and I am waiting
>>> for a new patch from him. Mike, could you please let me know if I
>>> should wait for a new version of your patch or try to apply these
>>> ones?
>>
>> i think the first question is, is this actually desirable.  a shared
>> library implies stable ABI and a thought out API.  if neither of these
>> have been done, but you still want to export the libs, the first thing
>> to do would be to just export PIC static libs.
>
> any feedback ?  the build cleanup was merged, but i think we need to
> chat about what you're actually trying to accomplish before we export
> shared libraries willy nilly ...
> -mike
>



-- 
Sidney Amani
