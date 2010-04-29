MIME-Version: 1.0
Sender: glikely@secretlab.ca
In-Reply-To: <0D753D10438DA54287A00B0270842697636E30604F@AUSP01VMBX24.collaborationhost.net>
References: <0D753D10438DA54287A00B0270842697636E305F88@AUSP01VMBX24.collaborationhost.net>
	<20100429201944.GJ4877@n2100.arm.linux.org.uk>
	<0D753D10438DA54287A00B0270842697636E30604F@AUSP01VMBX24.collaborationhost.net>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Thu, 29 Apr 2010 16:47:36 -0600
Message-ID: <n2nfa686aa41004291547wb6a1c67bq4d4c7140cb3fcddc@mail.gmail.com>
Subject: Re: Potential namespace problem for 'struct flash_platfrom_data'
To: H Hartley Sweeten <hartleys@visionengravers.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Russell King - ARM Linux <linux@arm.linux.org.uk>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 29, 2010 at 2:35 PM, H Hartley Sweeten
<hartleys@visionengravers.com> wrote:
> On Thursday, April 29, 2010 1:20 PM, Russell King wrote:
>> On Thu, Apr 29, 2010 at 03:06:37PM -0500, H Hartley Sweeten wrote:
>>> Hello all,
>>>
>>> I was looking at an issue with a spi flash device and noticed a
>>> potential namespace problem.
>>>
>>> arch/arm/include/asm/mach/flash.h has this:
>>>
>>> struct flash_platform_data {
>>> =A0 =A0 =A0const char =A0 =A0 =A0*map_name;
>>> =A0 =A0 =A0const char =A0 =A0 =A0*name;
>>> =A0 =A0 =A0unsigned int =A0 =A0width;
>>> =A0 =A0 =A0int =A0 =A0 =A0 =A0 =A0 =A0 (*init)(void);
>>> =A0 =A0 =A0void =A0 =A0 =A0 =A0 =A0 =A0(*exit)(void);
>>> =A0 =A0 =A0void =A0 =A0 =A0 =A0 =A0 =A0(*set_vpp)(int on);
>>> =A0 =A0 =A0void =A0 =A0 =A0 =A0 =A0 =A0(*mmcontrol)(struct mtd_info *mt=
d, int sync_read);
>>> =A0 =A0 =A0struct mtd_partition *parts;
>>> =A0 =A0 =A0unsigned int =A0 =A0nr_parts;
>>> };
>>>
>>> and include/linux/spi/flash.h has this:
>>>
>>> struct flash_platform_data {
>>> =A0 =A0 =A0char =A0 =A0 =A0 =A0 =A0 =A0*name;
>>> =A0 =A0 =A0struct mtd_partition *parts;
>>> =A0 =A0 =A0unsigned int =A0 =A0nr_parts;
>>>
>>> =A0 =A0 =A0char =A0 =A0 =A0 =A0 =A0 =A0*type;
>>>
>>> =A0 =A0 =A0/* we'll likely add more ... use JEDEC IDs, etc */
>>> };
>>>
>>> Should anything be done?
>>
>> How about unifying them both?
>
> That would make sense. =A0But the include location would be strange.
>
> The <asm/mach/flash.h> file is used by various arch/arm/mach-* files and =
in a
> couple of drivers/mtd/maps/*.c files.
>
> The <linux/spi/flash.h> file is also used by various arch/arm/mach-* file=
s as
> well as some arch/blackfin and arch/mips files. =A0It's also used by some
> drivers in drivers/mtd/devices and by drivers/spi/spi_butterfly.c.
>
> Because of the multi architecture use, the unifying should be done in the
> include/linux/spi/flash.h file. =A0But this include in the various platfo=
rm
> init's might seem "strange" since the flash is not "spi".
>
> I guess the other option would be to rename the spi version to something =
like:
>
> struct spi_flash_data {
> =A0 =A0 =A0 =A0...
> };
>
> Any comments from the mtd people?

Or just move the definition to an mtd include file.  Renaming the
structure probably isn't worth the effort.

g.
