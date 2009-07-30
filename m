Received: from mail-gx0-f219.google.com ([209.85.217.219])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MWd4u-0007va-R0
	for linux-mtd@lists.infradead.org; Thu, 30 Jul 2009 21:22:25 +0000
Received: by gxk19 with SMTP id 19so3156987gxk.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Jul 2009 14:22:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090730202913.GB13236@buzzloop.caiaq.de>
References: <3972542e0907301124n104c9eafnc99e989d1a9f8d51@mail.gmail.com>
	<200907302036.24243.marek.vasut@gmail.com>
	<3972542e0907301314p4a8c9539uc7b5fdd80abec443@mail.gmail.com>
	<20090730202913.GB13236@buzzloop.caiaq.de>
Date: Thu, 30 Jul 2009 16:22:19 -0500
Message-ID: <3972542e0907301422m1c889dc7gc7e0b79ced28421e@mail.gmail.com>
Subject: Re: Internal error: Oops: 817 [#1]
From: E Robertson <e.robertson.svg@gmail.com>
To: Daniel Mack <daniel@caiaq.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 30, 2009 at 3:29 PM, Daniel Mack<daniel@caiaq.de> wrote:
> On Thu, Jul 30, 2009 at 03:14:43PM -0500, E Robertson wrote:
>> I got 2.6.31-rc4 and patch it which wasn't painful.
>> However, no change.
>> Here are the results: My initramfs initially mount the two nand
>> partitions and that's where the initial
>> uncorrectable error comes from.
>
> Some thoughts.
>
> Could you try running the torture test from drivers/mtd/tests? Which
> platform is that? Are you sure you're running the NAND chip well inside
> its timing specs? Does the flash access work from the bootloader?
>
> I recently had similar trouble which disappeared after I switched off
> CPU frequency scaling.
>

I see these tests but I'm not sure how they're used. is their a doc for these?
I'm on a sam9263 platform and I'm sure my timing are within spec.
Infact I stretched
my to be sure it's not timing related. When it works I can see the
files from my bootloader.
Also when it doesn't work, I can still see file fragments.
I briefly tried creating and mounting a ubi volume which worked until
I repeated it with a file
loaded. I get some uncorrectable errors but since I'm not familiar
with this fs and never
used this filesystem before, this could very well be user error.
Thanks.
