Received: from mail-we0-f177.google.com ([74.125.82.177])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8bK7-0007VU-GP
 for linux-mtd@lists.infradead.org; Tue, 06 Jan 2015 21:05:56 +0000
Received: by mail-we0-f177.google.com with SMTP id q59so54441wes.8
 for <linux-mtd@lists.infradead.org>; Tue, 06 Jan 2015 13:05:32 -0800 (PST)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Message-ID: <54AC4D9D.2050900@imgtec.com>
Date: Tue, 06 Jan 2015 18:03:25 -0300
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 0/6] SPI NAND for everyone
References: <1417525136-25731-1-git-send-email-ezequiel.garcia@imgtec.com>
 <20150106033012.GH9759@ld-irv-0074>
In-Reply-To: <20150106033012.GH9759@ld-irv-0074>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: bpqw@micron.com, =?UTF-8?B?UWkgV2FuZyDnjovotbc=?= <qiwang@micron.com>,
 Ionela Voinescu <ionela.voinescu@imgtec.com>, frankliu@micron.com,
 Andrew Bresticker <abrestic@chromium.org>, linux-mtd@lists.infradead.org,
 arnaud.mouiche@invoxia.com, James Hartley <james.hartley@imgtec.com>,
 =?UTF-8?B?IlBldGVyIFBhbiDmvZjmoIsgKHBldGVycGFuZG9uZw==?= =?UTF-8?B?KSI=?=
 <peterpandong@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 01/06/2015 12:30 AM, Brian Norris wrote:
> Hi Ezequiel,
> 
> On Tue, Dec 02, 2014 at 09:58:50AM -0300, Ezequiel Garcia wrote:
>> During the discussion of Ionela Voinescu's patch to support GD5F SPI NAND
>> devices [1], it was decided that a proper SPI NAND framework was needed
>> to support the mt29f device (driver currently in staging area) and the new
>> gd5f.
>>
>> This patchset is a first attempt to address this.
> 
> Thanks for this effort. I've finally had a better chance to look through
> your implementation and to give it some better thought.
> 

Great, thanks for the review.

>> The SPI NAND framework allows devices to register as NAND drivers. This is
>> useful to take advantage of the bad block management code.
> 
> I'm not so sure about this choice, but then I'm not so sure about the
> alternatives earlier. I understand that you and Qi Wang might have had
> some discussion off-list (please feel free to fill me and others in
> here, and I can add my thoughts).
> 

Indeed, I believe Qi Wang have these same concerns.

> The BBT code is something we definitely want to share, but it's actually
> not very closely tied to nand_base.c, and it looks pretty easy to adapt
> to any MTD that implements mtd_read_oob()/mtd_write_oob(). We'd just
> need to parameterize a few relevant device details into a new nand_bbt
> struct, rather than using struct nand_chip directly.
> 
> It also looks like the identification code (read ID, ONFI / JEDEC
> parameter pages) may differ, and SPI NAND may continue to evolve
> differently. For instance, I see that Micron SPI NAND has a
> (non-standardized) ONFI-like parameter page. It's mostly compatible with
> ONFI, except it leaves out N/A fields and doesn't use an official
> 'revision' bitfield. This probably isn't 100% shareable with parallel
> NAND code, if we use it at all.
> 
> So, I think we'll need to weigh the options of which one gives more bang
> for the buck.
> 
> FWIW, I don't think the implementation in this series is that bad. Even
> if we want to migrate to have less dependence on the current nand_base
> implementation for non-parallel-NAND code, I think it's doable after
> merging. We'd just need to keep the drivers/spi/ and DT binding formats
> stable, while remaining free to refactor internally.
> 

Well, the DT binding itself looks pretty simple, it's just a compatible
and the usual SPI child properties. Regarding the SPI interface, that's
not related to the "based on NAND or not" discussion.

The SPI API is called only in the spi-nand-device.c file, through the
spi-nand hooks. These hooks would remain, as they mirror the SPI NAND
commands I've seen in Micron and Gigadevice flashes.

On the other side, I'm not convinced about merging the driver knowing
we will have to refactor it to make it independent of the NAND core.
Perhaps I should give it a shot and see how hard is it to make it
based on MTD, yet use the BBT code.

>> Given the
>> SPI NAND and the bare NAND commands are different, the SPI NAND framework
>> implements its own .cmdfunc callback, which is in charge of calling
>> device-specific hooks for each of the flash operations (read, program, erase,
>> etc).
> 
> I'm not really a big fan of the switch/case remapping of one command set
> into another (in this case, translating parallel NAND commands into
> their SPI NAND equivalents). At times they may be necessary, but as food
> for thought, we might consider alternatives, like additional replaceable
> hooks in struct nand_chip.
> 
>> The SPI NAND framework does not deal with SPI transactions per-se. Instead,
>> the SPI messages should be prepared by the users of the SPI NAND framework
>> (those that implement the device-specific hooks).
> 
> Sounds reasonable. Does this leave room for hardware that is optimized
> for SPI NAND, without implementing a full SPI controller, and therefore
> does not use the drivers/spi/ infrastructure? Not sure if such a thing
> exists yet (or will exist), but it does pop up in SPI NOR.
> 

Exactly, this separation is meant not only to properly split
responsabilities, but also to allow to introduce such drivers in an
elegante fashion.

>> The result can be expressed in the following hierarchy:
>>
>>     Userspace
>>   ------------------
>>     MTD
>>   ------------------
>>     NAND core
>>   ------------------
>>     SPI NAND core
>>   ------------------
>>     SPI NAND device
>>   ------------------
>>     SPI core
>>   ------------------
>>     SPI master
>>   ------------------
>>     Hardware
> 
> This is a pretty good description, but some details are not quite right.
> e.g., "userspace" should probably be removed or elaborated -- the
> hierarchy could just stop at the "MTD API" (mtd_read(), mtd_write(),
> mtd_erase(), etc.). Its users might be user-space (via mtdchar) or UBI,
> JFFS2, etc.
> 
> Also, it might help to either flesh out what these hierarchies actually
> mean by pointing to specific files, by additional commentary, or both.
> It helps if you can also use the same language as the SPI documentation
> for the lower levels of this hierarchy.
> 
> We might want to add something like this as official documentation,
> possibly to Documentation/mtd/. Short and sweet is fine (i.e., not much
> more than a cleaned up version of this cover letter).
> 

OK, that's certainly doable, once we agree on the overall approach.

[..]
> 
> I have some more code review comments, but those aren't as important at
> the moment if we're still not sure about the overall approach.
> 

Sure.

BTW, regarding the compatible string, I was thinking about using
a generic spi-nand compatible, if at all possible, and let the probe
routine detect the specific device and pick hooks, set flags, etc.

How does this sound?
-- 
Ezequiel
