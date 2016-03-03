Received: from mail-ob0-x235.google.com ([2607:f8b0:4003:c01::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abXZQ-0005od-IW
 for linux-mtd@lists.infradead.org; Thu, 03 Mar 2016 18:01:53 +0000
Received: by mail-ob0-x235.google.com with SMTP id rt7so27285961obb.3
 for <linux-mtd@lists.infradead.org>; Thu, 03 Mar 2016 10:01:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu8U+3r-H0Oyru0J9RoS744kzbJDjYkm=_FVSRFjzR5pxQ@mail.gmail.com>
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
Date: Thu, 3 Mar 2016 10:01:31 -0800
Message-ID: <CAPcyv4iDMGsksCh4cHU3xooodn1e2tfSc70xTo-B_C2Ppnwsrw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] fix memremap on ARM
From: Dan Williams <dan.j.williams@intel.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
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

On Thu, Mar 3, 2016 at 9:57 AM, Ard Biesheuvel
<ard.biesheuvel@linaro.org> wrote:
> On 3 March 2016 at 18:55, Dan Williams <dan.j.williams@intel.com> wrote:
>> On Thu, Mar 3, 2016 at 9:41 AM, Ard Biesheuvel
[..]
>> Hmm, then what about Russell's suggestoin, if I'm not
>> mischaracterizing, that ioremap_cache() move to its old
>> ioremap_cached() name.  The latter has less cross-arch confusion.
>
> That would be appropriate as soon as we get rid of all the abuses of
> ioremap_cache() (for some of which I am responsible myself, in the ARM
> UEFI code). If we change it now, we're likely to break stuff.
>

Ok, sounds good.  I'll take care of the x86 ioremap_cache() removal
and leave the eventual ARM conversion to you.
