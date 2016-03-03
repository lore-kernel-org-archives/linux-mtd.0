Received: from mail-ig0-x234.google.com ([2607:f8b0:4001:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abXeo-0001Iy-Uq
 for linux-mtd@lists.infradead.org; Thu, 03 Mar 2016 18:07:27 +0000
Received: by mail-ig0-x234.google.com with SMTP id g6so25677012igt.1
 for <linux-mtd@lists.infradead.org>; Thu, 03 Mar 2016 10:07:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAPcyv4iDMGsksCh4cHU3xooodn1e2tfSc70xTo-B_C2Ppnwsrw@mail.gmail.com>
References: <1456508053-15015-1-git-send-email-ard.biesheuvel@linaro.org>
 <CAKv+Gu_8Fggh+hnVnj6pM6PbOysWFTNt=ot6nudLur9nzs2FVg@mail.gmail.com>
 <20160303171347.GY19428@n2100.arm.linux.org.uk>
 <CAKv+Gu_5vmxsigsCfsvcjFa-hhOP6vxnMavsQ45oKgMeYzgUSg@mail.gmail.com>
 <CAPcyv4ijokZMTNPsxVOafMUCT_CHyScTkCGbR94mcYOhQOKNqA@mail.gmail.com>
 <CAKv+Gu80AJ+UDGLWpr=1sYT57J+6X8-KZ5HCYSEz9JpgWaTQxA@mail.gmail.com>
 <CAPcyv4j-Pz8uMTnz+OJZGguQqS1jOG4U+JkpsO7cBRFvs=-Ehg@mail.gmail.com>
 <CAKv+Gu_z0B9rK4NJgrZFXLXWhgi+LVj6E9555vx60LSEoRy9tg@mail.gmail.com>
 <CAPcyv4h8ez_nNUNVcOdHzjYB-Fh-VrB24p5aepN_GZ2g3jSxMQ@mail.gmail.com>
 <CAKv+Gu8U+3r-H0Oyru0J9RoS744kzbJDjYkm=_FVSRFjzR5pxQ@mail.gmail.com>
 <CAPcyv4iDMGsksCh4cHU3xooodn1e2tfSc70xTo-B_C2Ppnwsrw@mail.gmail.com>
Date: Thu, 3 Mar 2016 19:07:05 +0100
Message-ID: <CAKv+Gu8uGiy85vC=2sMuMCCP0J7e0qwnAxACR25bePC0zHw=8w@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] fix memremap on ARM
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>,
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

On 3 March 2016 at 19:01, Dan Williams <dan.j.williams@intel.com> wrote:
> On Thu, Mar 3, 2016 at 9:57 AM, Ard Biesheuvel
> <ard.biesheuvel@linaro.org> wrote:
>> On 3 March 2016 at 18:55, Dan Williams <dan.j.williams@intel.com> wrote:
>>> On Thu, Mar 3, 2016 at 9:41 AM, Ard Biesheuvel
> [..]
>>> Hmm, then what about Russell's suggestoin, if I'm not
>>> mischaracterizing, that ioremap_cache() move to its old
>>> ioremap_cached() name.  The latter has less cross-arch confusion.
>>
>> That would be appropriate as soon as we get rid of all the abuses of
>> ioremap_cache() (for some of which I am responsible myself, in the ARM
>> UEFI code). If we change it now, we're likely to break stuff.
>>
>
> Ok, sounds good.  I'll take care of the x86 ioremap_cache() removal
> and leave the eventual ARM conversion to you.


OK. But I'd still like Russell to indicate whether he agrees with all
of this, i.e., wire up memremap() to perform MT_MEMORY_RW mappings in
the vmalloc area of memory regions that may be potentially be covered
by highmem as well.
