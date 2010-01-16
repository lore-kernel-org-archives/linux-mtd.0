Received: from mail-yx0-f177.google.com ([209.85.210.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NW2GR-0008OG-9D
	for linux-mtd@lists.infradead.org; Sat, 16 Jan 2010 06:36:08 +0000
Received: by yxe7 with SMTP id 7so1053643yxe.25
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Jan 2010 22:35:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <8bd0f97a1001150234u1080572bx89a34221770bb93c@mail.gmail.com>
References: <1263541814-6642-1-git-send-email-21cnbao@gmail.com>
	<1263551364.26767.4.camel@macbook.infradead.org>
	<8bd0f97a1001150234u1080572bx89a34221770bb93c@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Sat, 16 Jan 2010 14:35:36 +0800
Message-ID: <3c17e3571001152235o2a77d5b5i8300ce888df3515@mail.gmail.com>
Subject: Re: [Uclinux-dist-devel] [PATCH 1/2] let MTD_XIP depend on XIP_KERNEL
	or ROMKERNEL
To: Mike Frysinger <vapier.adi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: uclinux-dist-devel@blackfin.uclinux.org,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 15, 2010 at 6:34 PM, Mike Frysinger <vapier.adi@gmail.com> wrote:
> On Fri, Jan 15, 2010 at 05:29, David Woodhouse wrote:
>> On Fri, 2010-01-15 at 15:50 +0800, Barry Song wrote:
>>> Some architectures like blackfin,h8300,m68k use ROMKERNEL to describe
>>> kernel XIP, not like arm which uses XIP_KERNEL
>>
>> Surely the appropriate response to that realisation is to _fix_ the
>> inconsistency, not just work around it?
>
> agree, but this is a lot easier than trying to tell RMK to change all
> the ARM references ;)
Yes. It will be really difficult to ask the related architectures to change.
>
> this is the only place outside of the respective arch/$ARCH/ where
> either XIP_KERNEL or ROMKERNEL is utilized ...
> -mike
>
