Received: from mail-io0-x22b.google.com ([2607:f8b0:4001:c06::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abZ8l-0006zt-Gf
 for linux-mtd@lists.infradead.org; Thu, 03 Mar 2016 19:42:28 +0000
Received: by mail-io0-x22b.google.com with SMTP id m184so39135533iof.1
 for <linux-mtd@lists.infradead.org>; Thu, 03 Mar 2016 11:42:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20160303193625.GZ19428@n2100.arm.linux.org.uk>
References: <20160303171347.GY19428@n2100.arm.linux.org.uk>
 <CAKv+Gu_5vmxsigsCfsvcjFa-hhOP6vxnMavsQ45oKgMeYzgUSg@mail.gmail.com>
 <CAPcyv4ijokZMTNPsxVOafMUCT_CHyScTkCGbR94mcYOhQOKNqA@mail.gmail.com>
 <CAKv+Gu80AJ+UDGLWpr=1sYT57J+6X8-KZ5HCYSEz9JpgWaTQxA@mail.gmail.com>
 <CAPcyv4j-Pz8uMTnz+OJZGguQqS1jOG4U+JkpsO7cBRFvs=-Ehg@mail.gmail.com>
 <CAKv+Gu_z0B9rK4NJgrZFXLXWhgi+LVj6E9555vx60LSEoRy9tg@mail.gmail.com>
 <CAPcyv4h8ez_nNUNVcOdHzjYB-Fh-VrB24p5aepN_GZ2g3jSxMQ@mail.gmail.com>
 <CAKv+Gu8U+3r-H0Oyru0J9RoS744kzbJDjYkm=_FVSRFjzR5pxQ@mail.gmail.com>
 <CAPcyv4iDMGsksCh4cHU3xooodn1e2tfSc70xTo-B_C2Ppnwsrw@mail.gmail.com>
 <CAKv+Gu8uGiy85vC=2sMuMCCP0J7e0qwnAxACR25bePC0zHw=8w@mail.gmail.com>
 <20160303193625.GZ19428@n2100.arm.linux.org.uk>
Date: Thu, 3 Mar 2016 20:42:06 +0100
Message-ID: <CAKv+Gu-UCLeeCU57s3K4-RqXX2h0HxowqUOkrof6XYu3vypOdQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] fix memremap on ARM
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Dan Williams <dan.j.williams@intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 linux-mtd@lists.infradead.org, Robert Jarzmik <robert.jarzmik@free.fr>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3 March 2016 at 20:36, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Thu, Mar 03, 2016 at 07:07:05PM +0100, Ard Biesheuvel wrote:
>> OK. But I'd still like Russell to indicate whether he agrees with all
>> of this, i.e., wire up memremap() to perform MT_MEMORY_RW mappings in
>> the vmalloc area of memory regions that may be potentially be covered
>> by highmem as well.
>
> I'm happy to go that way: go back to ioremap_cached() for pxa2xx-flash
> and switch memremap() to MT_MEMORY_RW - I think that makes total sense.
>
> I think it is worth putting a comment against ioremap_cached() saying
> that it's for pxa2xx-flash.c though, and deprecated for new uses.
>

OK, I will respin the series, and replace patch #1 with two patches that

a) reintroduce ioremap_cached() (with the comment, as you say)
b) move pxa2xx-flash from memremap to ioremap_cached()
