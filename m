Received: from mail-qy0-f199.google.com ([209.85.221.199])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OC8ZB-0003Sl-3m
	for linux-mtd@lists.infradead.org; Wed, 12 May 2010 09:49:26 +0000
Received: by qyk37 with SMTP id 37so9341226qyk.22
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 May 2010 02:49:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1273653341.22706.46.camel@localhost>
References: <m2l6b5362aa1005081239ne9eea253jc66c61822c4c1502@mail.gmail.com>
	<1273475736.2209.88.camel@localhost>
	<alpine.LFD.2.00.1005102011400.3401@localhost.localdomain>
	<1273650099.22706.41.camel@localhost>
	<AANLkTilSqtxewM9WNSu814FT9qsctuuxNiK4pboX2xjr@mail.gmail.com>
	<1273653341.22706.46.camel@localhost>
Date: Wed, 12 May 2010 15:19:19 +0530
Message-ID: <AANLkTikRDNia3IMCbXFs-olREPftszw-zqn3ruXCk-QE@mail.gmail.com>
Subject: Re: UBIL design doc
From: Brijesh Singh <brijesh.s.singh@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org,
	rohitvdongre@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 12, 2010 at 2:05 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Wed, 2010-05-12 at 13:33 +0530, Brijesh Singh wrote:
>> Hi,
>>
>> On Wed, May 12, 2010 at 1:11 PM, Artem Bityutskiy <dedekind1@gmail.com> =
wrote:
>> > On Tue, 2010-05-11 at 21:17 +0200, Thomas Gleixner wrote:
>> >> B1;2005;0cOn Mon, 10 May 2010, Artem Bityutskiy wrote:
>> >>
>> >> > On Sun, 2010-05-09 at 01:09 +0530, Brijesh Singh wrote:
>> >> > > Hi,
>> >> > > =A0 I am forwarding you the design document for ubi with log. Ple=
ase
>> >> > > find the ubil document at
>> >> > > http://git.infradead.org/users/brijesh/ubil_results/blob_plain/HE=
AD:/UBIL
>> >> > > design document.pdf
>> >>
>> >> @Brijesh, thanks for tackling this !
>> >>
>> >> > Hi guys,
>> >> >
>> >> > I've read the document. Looks very promising. Here some feed-back.
>> >> >
>> >> > 1. SB PEB wear-out. What if the reaseblock lifetime is, say, 10000
>> >> > erease cycles? Won't the SB PEB wear out very quickly? Why you did =
not
>> >> > go for the chaining approach which I described in the old JFFS3 des=
ign
>> >> > doc?
>> >> >
>> >> > If we do not implement chaining, we should at least design it and m=
ake
>> >> > sure UBIL can be extended later so that SB chaining could be added.
>> >>
>> >> The super block needs to be scanned for from the beginning of flash
>> >> anyway due to bad blocks. Putting it into a fixed position (first goo=
d
>> >> erase block) is a very bad design decision vs. wear leveling.
>> >>
>> >> The super block must be moveable like any other block, though we can
>> >> keep it as close to the start of flash as possible.
>> >>
>> >> Also chaining has a tradeoff. The more chains you need to walk the
>> >> closer you get to the point where you are equally bad as a full scan.
>> >
>> > Well, every new chain member reduces the superblock wear speed by orde=
r
>> > 2, so I the chain would have 2-4 eraseblocks in most cases, I guess,
>> > which is not bad.
>> >
>> > In the opposite, moving the SB 3-4 eraseblocks further only reduces th=
e
>> > load merely by factor 3-4.
>> >
>> >> > 2. SB PEB at the end. I think this is a very bad idea. Imagine you =
have
>> >> > to do UBIL images for production on the factory. With your design y=
ou
>> >> > have the following bad drawbacks:
>> >> >
>> >> > =A0 a. NAND flash has initial bad blocks, and you do not know how m=
any,
>> >> > =A0 =A0 =A0and where they sit. These may be the last 8 eraseblocks.=
 So, when
>> >> > =A0 =A0 =A0you prepare an image (say, with the ubinize user-space t=
ool), where
>> >> > =A0 =A0 =A0will you put the second SB PEB?
>> >> >
>> >> > =A0 b. Currently, UBI/UBIFS images are small. E.g., if you make an
>> >> > =A0 =A0 =A0UBI/UBIFS image for 1GiB flash, and you have just few Ki=
B of files,
>> >> > =A0 =A0 =A0your image will be few megs - it will contain the files,=
 and all
>> >> > =A0 =A0 =A0the needed UBI/UBIFS meta-data.
>> >> >
>> >> > =A0 =A0 =A0So now what will be image size for UBIL - 1GiB, and this=
 is bad.
>> >> > =A0 =A0 =A0You then will transfer 1GiB of data to the devices durin=
g flashing
>> >> > =A0 =A0 =A0or you will have to invent ways to work around this. Do =
you need
>> >> > =A0 =A0 =A0these complexities?
>> >> >
>> >> > I think the second SB PEB should not be at the end.
>> >>
>> >> I think we do not need a second SB at all. UBI should not depend on
>> >> the super block in any way. The super block is an optimization for th=
e
>> >> common case - nothing more.
>> >
>> > Yeah, if we preserve the headers we can always fall-back to scanning
>> > should something be broken.
>> >
>> >>
>> >> > 3. Backward-compatibility. In UBIL you removed EC anc VID headers i=
n
>> >> > =A0 =A0PEBs. That's fine for optimization purposes. But it has draw=
-backs:
>> >> >
>> >> > =A0 =A0a. If any of the UBIL meta-data blocks like SB, CMT or log a=
re
>> >> > =A0 =A0 =A0 corrupted - that's it - we are screwed. You cannot anym=
ore
>> >> > =A0 =A0 =A0 re-consturct the data by scanning. The robustness goes =
down.
>> >> >
>> >> > =A0 =A0c. Backward compatibility - UBI will not be able to attach U=
BIL
>> >> > =A0 =A0 =A0 images. This is not very nice.
>> >> >
>> >> > So, I think you should keep EC and VID headers in PEBs. And you sho=
uld
>> >> > make the SB/CMT/log blocks to be a new type of UBI volume with
>> >> > UBI_COMPAT_DELETE or UBI_COMPAT_PRESERVE or UBI_COMPAT_RO type. In =
this
>> >> > case UBI will attach UBIL volumes just fine.
>> >> >
>> >> > Then, you can add an _option_ to have no EC/VID headers in PEBs. Th=
is
>> >> > then can be used for performance, if one wants to sacrifice robustn=
ess.
>> >> > But this should be the second step. In this case, you will just nee=
d to
>> >> > put a VID header with UBI_COMPAT_REJECT flag to the first PEB.
>> >>
>> >> I don't think it's a good idea to kill the EC/VID headers. It not onl=
y
>> >> violates the backwards compability it also fundamentally weakens UBIs
>> >> reliability for no good reason and I doubt that the performance win i=
s
>> >> big enough to make it worth.
>> >>
>> >> The performance gain is at attach time by getting rid of the flash
>> >> scan, but not by getting rid of writing the EC/VID headers.
>> >
>> > Well, there are some space savings as well.
>> >
>> >>
>> >> The logging is a speed up / optimization for the common case, but it
>> >> needs to preserve full reconstruction via scanning all eraseblocks an=
d
>> >> checking the EC/VID headers. That also allows retrofitting on existin=
g
>> >> devices.
>> >>
>> >> I'd rather see the super block / log volume as a checkpointing
>> >> mechanism which provides a snapshot of the EC/VID headers at a given
>> >> point and a list of eraseblocks which need to be scanned at attach
>> >> time.
>> >>
>> >>
>> >> That has two main advantages:
>> >> =A01) It limits the number of log writes
>> >> =A02) It allows full backward and forward compatibility
>> >
>> > I think this is what they do, but they for some reasons removed the
>> > headers. If they add them back, it should look like you described.
>> >
>> > We should preserve the headers. It is always easy to disable them late=
r,
>> > if someone needs this for optimization purposes. E.g., we can add an
>> > ubi_compat=3D0 option or something like that.
>> >
>> >> Looking at
>> >> http://git.infradead.org/users/brijesh/ubil_results/blob/HEAD:/nand_m=
ount_time.pdf
>> >> I still see a linear - though less steep - attach time. For the 1GB
>> >> flash size it's still 0.8s which is nice progress vs. the 2s for the
>> >> non logging case. But that's surprising as one would expect that
>> >> logging would provide a more aggressive and non linear gain.
>> >>
>> >> Just doing the simple math:
>> >>
>> >> 1GB FLASH with erase block size 128K and page size 2k, that
>> >> translates to 8192 erase blocks
>> >>
>> >> So UBI scans 8192 erase block EC/VID headers in 2 seconds. That
>> >> equals to 8192 FLASH pages.
>> >>
>> >> UBIL needs 0.8 seconds. That means that UBIL still scans ~3236 FLASH
>> >> pages (or spends the equivivalent time) to achieve the same result.
>> >>
>> >> That looks wrong. Care to explain ?
>> >
>> > I suspect these are implementation issues. I did not look at the code,
>> > but I suspect they read whole CMT block and populate the all EB
>> > associations at scan time. However, they could populate them lazily,
>> > which would optimize things.
>> I am trying to summarize what I have understood.
>> I will send the patches if this is correct.
>> 1) Commit will have ec and vid headers just as any other UBI block.
>> The compat flag helps in backword compatibility,
>> 2)chained sb will locate commit. It will be part of internal volume as w=
ell.
>> 3) Commit will be called on unmount.
>> 4) Any unclean un-mount will lead to flash scanning just as UBI.
>
> No! Why you have the log then? Unclean reboots are handled by the log.
>
> Scanning happens only when you have _corrupted_ SB, or corrupted cmt, or
> log. Then you fall-back to scanning.
>
>> Any thing goes bad, normal scanning becomes recovery.
>> 5) Not sure if log is required in first place. But it could be an option=
.
>> Is that correct?
>
> No, at least I did not suggest you to get rid of the log. It is needed
> to handle unclean reboots.
Log is written for each EC or VID change. Frequency of log write is same as
the frequency of these headers. In case we keep both, there will be one log
write penalty per write/erase. So write performance will drop considerably.
