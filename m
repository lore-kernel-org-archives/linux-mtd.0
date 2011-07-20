Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QjO4a-0003wg-1U
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2011 04:07:48 +0000
Received: by iwn35 with SMTP id 35so5255521iwn.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Jul 2011 21:07:41 -0700 (PDT)
Subject: Re: Attaching ubifs on a NOR flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Alex Levin <s.alex.levin@gmail.com>
Date: Wed, 20 Jul 2011 07:09:04 +0300
In-Reply-To: <CAALhOvC0tOoCcuxC2Z9FTOQgRj2tf_CduoUXGtBVMDUBZrz3vA@mail.gmail.com>
References: <CAALhOvBcocpY7igrzcsTyUPdPFZoJ+AkJ+X1LrWVBMjHs0CQLg@mail.gmail.com>
	<1310020422.3149.107.camel@sauron>
	<CAALhOvC2nXqfFcx=-hgwCs5gJcACeyX7TmBSJq9MS11PtVsqQA@mail.gmail.com>
	<1310096775.32086.1.camel@sauron>
	<CAALhOvC0tOoCcuxC2Z9FTOQgRj2tf_CduoUXGtBVMDUBZrz3vA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1311134948.20738.123.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry for late reply, I'm very busy now.
On Sun, 2011-07-10 at 11:14 +0300, Alex Levin wrote:
> What is the build debugging message? the kernel build? (where do I
> enable it? I run a SoC - host or target?)

I meant UBI debugging messages. UBI debugging messages are split into
several classes, and one of them is called "build". Basically, this is
about making "dbg_bld()" UBI macro print. I do not know which kernel you
use, so I cannot say for sure, but in older kernels they could be
enabled in the kernel configuration menu, while in newer kernels - via
module parameters and sysfs, in the newest - they are enabled using the
standard dynamic debug interface.

I will amend the docs in the web site, but current docs describe older
kernel: http://www.linux-mtd.infradead.org/faq/ubi.html#L_how_debug

-- 
Best Regards,
Artem Bityutskiy
