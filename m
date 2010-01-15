Received: from mail-yx0-f202.google.com ([209.85.210.202])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NVjVu-0003jU-LI
	for linux-mtd@lists.infradead.org; Fri, 15 Jan 2010 10:34:51 +0000
Received: by yxe40 with SMTP id 40so305045yxe.28
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Jan 2010 02:34:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1263551364.26767.4.camel@macbook.infradead.org>
References: <1263541814-6642-1-git-send-email-21cnbao@gmail.com>
	<1263551364.26767.4.camel@macbook.infradead.org>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 15 Jan 2010 05:34:25 -0500
Message-ID: <8bd0f97a1001150234u1080572bx89a34221770bb93c@mail.gmail.com>
Subject: Re: [Uclinux-dist-devel] [PATCH 1/2] let MTD_XIP depend on XIP_KERNEL
	or ROMKERNEL
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Cc: uclinux-dist-devel@blackfin.uclinux.org, Barry Song <21cnbao@gmail.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 15, 2010 at 05:29, David Woodhouse wrote:
> On Fri, 2010-01-15 at 15:50 +0800, Barry Song wrote:
>> Some architectures like blackfin,h8300,m68k use ROMKERNEL to describe
>> kernel XIP, not like arm which uses XIP_KERNEL
>
> Surely the appropriate response to that realisation is to _fix_ the
> inconsistency, not just work around it?

agree, but this is a lot easier than trying to tell RMK to change all
the ARM references ;)

this is the only place outside of the respective arch/$ARCH/ where
either XIP_KERNEL or ROMKERNEL is utilized ...
-mike
