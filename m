Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TDgH0-0000p1-IA
 for linux-mtd@lists.infradead.org; Mon, 17 Sep 2012 18:42:24 +0000
Received: by lbbgf7 with SMTP id gf7so4388797lbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 17 Sep 2012 11:42:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <6871BC8982B258468985EE735D2C57524E269AFB89@ntcex01.corp.netcomm.com.au>
References: <6871BC8982B258468985EE735D2C57524E269AFB52@ntcex01.corp.netcomm.com.au>
 <1346310033.2848.536.camel@sauron.fi.intel.com>
 <6871BC8982B258468985EE735D2C57524E269AFB54@ntcex01.corp.netcomm.com.au>
 <1346315075.2848.538.camel@sauron.fi.intel.com>
 <6871BC8982B258468985EE735D2C57524E269AFB60@ntcex01.corp.netcomm.com.au>
 <CAN8TOE_ax=8inGyZxS+nTfcSkskyNvHEh9ipnOTVu-moB4FqjA@mail.gmail.com>
 <6871BC8982B258468985EE735D2C57524E269AFB89@ntcex01.corp.netcomm.com.au>
Date: Mon, 17 Sep 2012 11:42:18 -0700
Message-ID: <CAN8TOE_fihvz0F3C9cRhXkKvePYfyRD0Qmiu1a6aDH8o4ntsOg@mail.gmail.com>
Subject: Re: [PATCH] Test for multi-bit error correction
From: Brian Norris <computersforpeace@gmail.com>
To: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Akinobu Mita <akinobu.mita@gmail.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Iwo,

On Wed, Sep 5, 2012 at 8:37 PM, Iwo Mergler
<Iwo.Mergler@netcommwireless.com> wrote:
> Please be aware that this test aims at MTD driver developers,
> so I expect the 'users' to know all about their flash geometries
> and not be surprised by whole block erases and such. :-)

Duly noted. I agree, but I also think we can do our best to make
things as easy to understand as possible.

> On Thu, 6 Sep 2012 04:19:57 +1000
> Brian Norris <computersforpeace@gmail.com> wrote:
>> On Thu, Aug 30, 2012 at 3:59 PM, Iwo Mergler
>> <Iwo.Mergler@netcommwireless.com> wrote:
>> > This tests ECC biterror recovery on a single NAND page. Mostly intended
>> > to test ECC hardware and low-level NAND driver.
>> >
>> > There are two test modes:
>>
>> Why does this test even need to be in the kernel? Can't it be done
>> easily in userspace? I think it could even be a simple script that
>> utilizes flash_erase + nandwrite / nanddump with the -n (no ECC)
>> option. And anything that's lacking in nandwrite for this
>> functionality could easily be added there (for instance, support
>> erasure in nandwrite, rather than having to use flash_erase).
>
> You are right. The same can be said about most of the other
> tests too.

Yeah, I suppose so. I don't know about all the tests, but one
exception I was thinking of: the oobtest doesn't just use user-visible
interfaces to test sanity, it tries to use the MTD interfaces
(mtd_read_oob / mtd_write_oob) to stress the driver in ways that might
not be exposed to the user normally.

> Personally, I appreciate these tests being where they are
> because they are most useful to driver developers and as
> such are more accessible in the kernel than in userspace.
>
> On new embedded systems, we often have to develop MTD drivers
> before we have a rootfs, since the rootfs is supposed to live in the MTD.
> MTD is often the first hardware driver to get ported / written for a new
> system.
>
> With the current test arrangement I can, with minimal edits,
> run any test from within the MTD driver under development.

Fair enough.

>> > +static unsigned page_offset;
>> > +module_param(page_offset, uint, S_IRUGO);
>> > +MODULE_PARM_DESC(page_offset, "Page number relative to dev start");
>>
>> Why use a page number? For erase, we'll be affecting many adjacent
>> pages, so this might be an unclear parameter to the user. Is there a
>> good reason not to use an entire eraseblock as the unit of test? Also,
>> is there a reason to use page number vs. eraseblock number vs. offset
>> as the input parameter?
>
> Mostly because loff_t isn't supported as a parameter type, so I can't
> specify offsets beyond 4G.
>
> Erase block number would work as well. There isn't much to be learned
> from applying the test to all pages of a block, but in rare circumstances
> I'd like to be able to control which page of the block to test anyway.
>
> It would of course be possible to specify the offset  as separate
> erase block numbers and page numbers. I don't have a strong
> preference either way.

I don't have a strong preference either. In the absence of a portable
module-parameter for "loff_t" address, then a page_offset or eb_offset
param is fine with me.

>> > +static loff_t   offset;     /* Offset of the page we're using. */
>> > +static unsigned eraseblock; /* Eraseblock number for our page. */
>> > +
>> > +/* We assume that the ECC can correct up to a certain number
>> > + * of biterrors per subpage. */
>> > +static unsigned subsize;  /* Size of subpages */
>> > +static unsigned subcount; /* Number of subpages per page */
>> > +
>> > +static struct mtd_info *mtd;   /* MTD device */
>> > +
>> > +static uint8_t *wbuffer; /* One page write / compare buffer */
>> > +static uint8_t *rbuffer; /* One page read buffer */
>>
>> Why are all of these globals? It seems like the read_page(),
>> write_page(), and rewrite_page() functions would be more sensible (and
>> safely extendible) if they had an extra parameter for the address. And
>> do you really need to represent the same value (offset) in three
>> different ways (offset, page offset, eraseblock)? In fact,
>
> I had to force myself ;-). My excuse is that I copied the style of
> the other tests, because of a probably misguided sense of consistency.

Yeah, I don't know if I can speak for anyone else, but I would
recommend focusing on writing clean, maintainable code and leave
consistency with other tests' style as a secondary objective. I think
it's useful for read_page(), etc., to have at least one parameter (not
global variable) for the offset (or similar; e.g., page number). The
other globals are up to you, I suppose. When a value really is a
global that won't change, it's fine to be global (e.g., the mtd_info
struct, subpage info).

Thanks for your efforts and for addressing my comments. For a v2, I
think there are some things to address in code (bad block checking,
function parameters vs. global decisions) while other issues just need
a little bit better explanation (e.g., usefulness of mtd_nandbiterrs
vs mtd_nandecctest, explaining how this can be used to generically
test real bit error correction on real MTDs).

Regards,
Brian
