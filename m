Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YlMqM-0001dA-AP
 for linux-mtd@lists.infradead.org; Thu, 23 Apr 2015 19:31:27 +0000
Message-ID: <5539486F.60407@nod.at>
Date: Thu, 23 Apr 2015 21:30:55 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Josh Cartwright <joshc@ni.com>,
 Iwo Mergler <Iwo.Mergler@netcommwireless.com>
Subject: Re: Adding subpage support to NAND driver -- backwards compatibility
 concerns
References: <20150422172944.GA4134@bshelton-desktop>
 <EACD232272DA4849B060F0828564D13B95342BDE78@ntcex01.corp.netcomm.com.au>
 <20150423183957.GR27115@jcartwri.amer.corp.natinst.com>
In-Reply-To: <20150423183957.GR27115@jcartwri.amer.corp.natinst.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Cc: "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Ben Shelton <ben.shelton@ni.com>, "xander.huff@ni.com" <xander.huff@ni.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "punnaiah.choudary.kalluri@xilinx.com" <punnaiah.choudary.kalluri@xilinx.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 23.04.2015 um 20:39 schrieb Josh Cartwright:
> +Richard, who, when not being trolled on IRC, has been working on
> UBI(FS) stuff.

Yeah, being on #kernelnewbeis is always "fun". ;-)

> On Thu, Apr 23, 2015 at 12:48:53PM +1000, Iwo Mergler wrote:
>> On Thu, 23 Apr 2015 03:29:44 +1000
>> Ben Shelton <ben.shelton@ni.com> wrote:
>>> We'd like to upstream our patch, but my concern is that UBIFS behaves
>>> differently when it knows that the flash device supports subpages.  I
>>> have a couple of questions related to that:
>>>
>>> - I know from experience that bad things happen when you use a kernel
>>>   without subpage support with an UBIFS filesystem that was formatted
>>>   with subpage support.  Is it safe to do the opposite (kernel with
>>>   subpage support / UBIFS filesystem formatted without subpage
>>> support)?
>>>
>>> - Assuming that it isn't safe, what's the best way to add subpage
>>>   support to this driver in an upstreamable way / without breaking
>>>   people?  Would it be sufficient to add subpage support as a Kconfig
>>>   option that's disabled by default with a strongly-worded message
>>>   describing the consequences of enabling it?
> [..]
>> from what I understand, the only part of the UBI/UBIFS stack that
>> uses / cares about subpages are the UBI EC and VID headers.
> 
> Are the locations of both headers changed when subpage accesses are
> supported?  I was under the impression that EC was always at the
> beginning of the page, with the VID headers at the next min IO boundary.
> (So, only the location of the VID header would be changed).

This is correct. Only the VID header should be changed.
Using ubiattach'S --vid-hdr-offset you can tell UBI about
subpages.

>> If you have subpage access, the two headers will share a page, if not,
>> they live in separate pages. With subpages, you half your UBI
>> overhead.
>>
>> This affects the LEB size for UBIFS as well as the UBI header and data
>> locations within the PEB, so the filesystems are incompatible.
>>
>> If you add subpage support to a system that previously had none, and
>> presumably want to use the old file systems, you need to force the
>> ubiattach command to use the page size as the VID header offset.
> 
> Okay, well; I would expect that for some systems that are using UBIFS as
> root, tweaking the commandline to add 'ubi.mtd=0,<size>' would require a
> bootloader change.
> 
> Anyway, I think we're talking only about theoretical breakage here, so
> it's reasonable to ask whether or not we should even care about this at
> all.
> 
>> Something like
>>
>> 	PAGESIZE=`cat /sys/class/mtd/mtd0/writesize`
>> 	ubiattach /dev/ubi_ctrl -O $PAGESIZE ...
>>
>> Same applies to any ubiformat commands.
>>
>> This stops UBI from using the subpage capability. You also don't
>> get the benefit of the lower overhead, of course.
>>
>> Traditionally, if someone changes the kernel config, breaking things
>> is definitely expected consequences. So, making subpage support
>> a default-off option for the driver has my vote.
> 
> Is there no metadata in the UBI data structures in flash that indicate
> the min IO boundary?  Assuming no, is another option to, at the time of
> attach, try both the min IO access size, and, if that doesn't work, try
> the page size?

Correct. UBI has no information about that.
If you add subpage support to the driver I'd make it opt-in such that
existing setups won't break.

Thanks,
//richard
