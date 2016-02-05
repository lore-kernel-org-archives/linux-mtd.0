Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aRmgP-00057l-I5
 for linux-mtd@lists.infradead.org; Fri, 05 Feb 2016 20:08:46 +0000
Received: by mail-wm0-x22d.google.com with SMTP id 128so85150747wmz.1
 for <linux-mtd@lists.infradead.org>; Fri, 05 Feb 2016 12:08:25 -0800 (PST)
MIME-Version: 1.0
Sender: pku.leo@gmail.com
In-Reply-To: <1454696631.2486.33.camel@buserror.net>
References: <1454481372-10288-1-git-send-email-raghav@freescale.com>
 <CADRPPNTKFA8rkynJR4wCNgAmqvmiwYwTi2Uk9hDUMB4+N7ST_Q@mail.gmail.com>
 <1454635050.2486.25.camel@buserror.net>
 <CADRPPNQc1gPPSa-ELFhpCJ-V-kAcP02B1K-pr0M66Fe8mgDSDg@mail.gmail.com>
 <1454696631.2486.33.camel@buserror.net>
Date: Fri, 5 Feb 2016 14:08:23 -0600
Message-ID: <CADRPPNQYpW3kq_gD1gXEMr0OCpr-wHbz+z1+scf_ZnxrwhWxeg@mail.gmail.com>
Subject: Re: [PATCH] mtd/ifc: Add support for IFC controller version 2.0
From: Li Yang <leoli@freescale.com>
To: Scott Wood <oss@buserror.net>
Cc: prabhakar.kushwaha@nxp.com, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Raghav Dogra <raghav@freescale.com>, Jaiprakash Singh <b44839@freescale.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 5, 2016 at 12:23 PM, Scott Wood <oss@buserror.net> wrote:
> On Fri, 2016-02-05 at 12:05 -0600, Li Yang wrote:
>> On Thu, Feb 4, 2016 at 7:17 PM, Scott Wood <oss@buserror.net> wrote:
>> > On Thu, 2016-02-04 at 17:07 -0600, Li Yang wrote:
>> > > On Wed, Feb 3, 2016 at 12:36 AM, Raghav Dogra <raghav@freescale.com>
>> > > wrote:
>> > > > The new IFC controller version 2.0 has a different memory map page.
>> > > > Upto IFC 1.4 PAGE size is 4 KB and from IFC2.0 PAGE size is 64KB.
>> > > > This patch segregates the IFC global and runtime registers to
>> > > > appropriate
>> > > > PAGE sizes.
>> > >
>> > > If the global registers and the runtime registers are so independent
>> > > that they have to be on different page boundaries, it would make more
>> > > sense for them to be defined as separate reg regions in the device
>> > > tree at the very beginning.  Then we would only need to change the
>> > > device tree now and it would be future proof for any page size.
>> >
>> > That's great if you have a time machine.  Otherwise, NACK.
>>
>> I didn't suggest that we need to change it now.  But we might need to
>> be more careful in the future when creating bindings for new hardware.
>
> At the time the binding was created there was no reason to believe that the
> layout would change.

Probably separate blocks that intentionally start from a page
boundary(with big gaps before it) would be a good idea?

Regards,
Leo
