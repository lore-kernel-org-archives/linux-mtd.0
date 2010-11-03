Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PDaES-00078f-E9
	for linux-mtd@lists.infradead.org; Wed, 03 Nov 2010 10:06:18 +0000
Received: by pwi3 with SMTP id 3so149830pwi.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 03 Nov 2010 03:06:14 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <AANLkTi=VWG3wCbmW1JLVpLMweRDZZw6w6ZsNerz=VFNL@mail.gmail.com>
References: <1288697130-12772-1-git-send-email-roman.tereshonkov@nokia.com>
	<1288697130-12772-4-git-send-email-roman.tereshonkov@nokia.com>
	<AANLkTinq7HS5VHww8aq2XPKCwGnjEYSintsN4qRFJq1o@mail.gmail.com>
	<20101102143759.GA15222@nokia.com>
	<AANLkTikunPYxpG_8HONV6BnOo54GNk3wvmMasEq1G9tO@mail.gmail.com>
	<20101102165316.GA15304@nokia.com>
	<AANLkTi=VWG3wCbmW1JLVpLMweRDZZw6w6ZsNerz=VFNL@mail.gmail.com>
Date: Wed, 3 Nov 2010 19:06:13 +0900
Message-ID: <AANLkTimVpw5eHPjOMjjdkTi2c9yNK1w6wvDRKXi+PBv2@mail.gmail.com>
Subject: Re: [PATCH 3/3] mtd: onenand: implement cache program feature for 4kb
	page onenand
From: Kyungmin Park <kmpark@infradead.org>
To: Roman Tereshonkov <roman.tereshonkov@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 3, 2010 at 4:34 PM, Kyungmin Park <kmpark@infradead.org> wrote:
> On Wed, Nov 3, 2010 at 1:53 AM, Roman Tereshonkov
> <roman.tereshonkov@nokia.com> wrote:
>> On Tue, Nov 02, 2010 at 03:50:51PM +0100, ext Kyungmin Park wrote:
>>> On Tue, Nov 2, 2010 at 11:37 PM, Roman Tereshonkov
>>> <roman.tereshonkov@nokia.com> wrote:
>>> > On Tue, Nov 02, 2010 at 03:00:41PM +0100, ext Kyungmin Park wrote:
>>> >> Hi,
>>> >>
>>> >> On Tue, Nov 2, 2010 at 8:25 PM, Roman Tereshonkov
>>> >> <roman.tereshonkov@nokia.com> wrote:
>>> >> > Implement cache program feature for 4KB page onenand.
>>> >> > This feature improves the write data performance.
>>> >> > The observed 128KB data program speed change is
>>> >> > from 8827KB/s to 14156 KB/s when the feature is enabled.
>>> >> >
>>> >> > Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
>>> >> > ---
>>> >> > =A0drivers/mtd/onenand/omap2.c =A0 =A0 =A0 =A0| =A0 12 ++++++++--
>>> >> > =A0drivers/mtd/onenand/onenand_base.c | =A0 39 +++++++++++++++++++=
+++++++++++++++-
>>> >> > =A02 files changed, 46 insertions(+), 5 deletions(-)
>>> >>
>>> >> Please make separate the two patches, one for OMAP, another is for
>>> >> onenand_base.c
>>> >>
>>> >> >
>>> >> > diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/oma=
p2.c
>>> >> > index 9f322f1..da25a90 100644
>>> >> > --- a/drivers/mtd/onenand/omap2.c
>>> >> > +++ b/drivers/mtd/onenand/omap2.c
>>> >> > @@ -108,8 +108,9 @@ static void wait_warn(char *msg, int state, un=
signed int ctrl,
>>> >> > =A0static int omap2_onenand_wait(struct mtd_info *mtd, int state)
>>> >> > =A0{
>>> >> > =A0 =A0 =A0 =A0struct omap2_onenand *c =3D container_of(mtd, struc=
t omap2_onenand, mtd);
>>> >> > + =A0 =A0 =A0 struct onenand_chip *this =3D mtd->priv;
>>> >> > =A0 =A0 =A0 =A0unsigned int intr =3D 0;
>>> >> > - =A0 =A0 =A0 unsigned int ctrl;
>>> >> > + =A0 =A0 =A0 unsigned int ctrl, ctrl_mask;
>>> >> > =A0 =A0 =A0 =A0unsigned long timeout;
>>> >> > =A0 =A0 =A0 =A0u32 syscfg;
>>> >> >
>>> >> > @@ -180,7 +181,8 @@ retry:
>>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (result =3D=3D 0=
) {
>>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* =
Timeout after 20ms */
>>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ctr=
l =3D read_reg(c, ONENAND_REG_CTRL_STATUS);
>>> >> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (=
ctrl & ONENAND_CTRL_ONGO) {
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (=
ctrl & ONENAND_CTRL_ONGO &&
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 !this->ongoing) {
>>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0/*
>>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 * The operation seems to be still going
>>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 * so give it some more time.
>>> >> > @@ -269,7 +271,11 @@ retry:
>>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EIO;
>>> >> > =A0 =A0 =A0 =A0}
>>> >> >
>>> >> > - =A0 =A0 =A0 if (ctrl & 0xFE9F)
>>> >> > + =A0 =A0 =A0 ctrl_mask =3D 0xFE9F;
>>> >> > + =A0 =A0 =A0 if (this->ongoing)
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ctrl_mask &=3D ~0x8000;
>>> >> > +
>>> >> > + =A0 =A0 =A0 if (ctrl & ctrl_mask)
>>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0wait_warn("unexpected controller st=
atus", state, ctrl, intr);
>
> We have to implement the onenand_wait also. it's only for working for OMA=
P.
>
>>> >> >
>>> >> > =A0 =A0 =A0 =A0return 0;
>>> >> > diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onen=
and/onenand_base.c
>>> >> > index 6b3a875..b2c3e97 100644
>>> >> > --- a/drivers/mtd/onenand/onenand_base.c
>>> >> > +++ b/drivers/mtd/onenand/onenand_base.c
>>> >> > @@ -440,6 +440,19 @@ static int onenand_command(struct mtd_info *m=
td, int cmd, loff_t addr, size_t le
>>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0default:
>>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ONENAND_IS_2PLA=
NE(this) && cmd =3D=3D ONENAND_CMD_PROG)
>>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cmd=
 =3D ONENAND_CMD_2X_PROG;
>>> >> > +
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Exclude 1st OTP a=
nd OTP blocks */
>>> >> Are there any reason? I think 1st OTP block is just block 0 so no ne=
ed
>>> >> to consider block 0 case.
>>> >
>>> >
>>> > Specification tells:
>>> > 3.9.1 Cache Program Operation
>>> > "Note that Cache Program command cannot be performed on OTP block and=
 1st block OTP"
>>>
>>> Okay I'm not yet check the Spec. I will check it at office.
>>> >
>>> >
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ONENAND_IS_CACHE=
_PROGRAM(this) &&
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 likely(onena=
nd_block(this, addr) !=3D 0) &&
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ONENAND_IS_4=
KB_PAGE(this)) {
>>> >> and I think no need to check 4KB_PAGE.
>>> >
>>> >
>>> > This patch is for 4kb page onenand only. The 2kb page onenand uses di=
fferent
>>> > commands for cache program. Also 2kb page case cache program depends =
on
>>> > CONFIG_MTD_ONENAND_2X_PROGRAM.
>>> >
>>> >
>>> >> > +
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (=
cmd =3D=3D ONENAND_CMD_CACHE_PROG)
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 cmd =3D ONENAND_CMD_2X_CACHE_PROG;
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else=
 if (cmd =3D=3D ONENAND_CMD_CACHE_PROG_LAST)
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 cmd =3D ONENAND_CMD_PROG;
>>> >> > +
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>>> >> > +
>>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dataram =3D ONENAND=
_CURRENT_BUFFERRAM(this);
>>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
>>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>>> >> > @@ -1845,7 +1858,7 @@ static int onenand_write_ops_nolock(struct m=
td_info *mtd, loff_t to,
>>> >> > =A0 =A0 =A0 =A0const u_char *buf =3D ops->datbuf;
>>> >> > =A0 =A0 =A0 =A0const u_char *oob =3D ops->oobbuf;
>>> >> > =A0 =A0 =A0 =A0u_char *oobbuf;
>>> >> > - =A0 =A0 =A0 int ret =3D 0;
>>> >> > + =A0 =A0 =A0 int ret =3D 0, cmd;
>>> >> >
>>> >> > =A0 =A0 =A0 =A0DEBUG(MTD_DEBUG_LEVEL3, "%s: to =3D 0x%08x, len =3D=
 %i\n",
>>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__func__, (unsigned int) to, (int) =
len);
>>> >> > @@ -1954,7 +1967,25 @@ static int onenand_write_ops_nolock(struct =
mtd_info *mtd, loff_t to,
>>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ONENAND_SET_NEXT_BU=
FFERRAM(this);
>>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>>> >> >
>>> >> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->command(mtd, ONENAND_CMD_PROG,=
 to, mtd->writesize);
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->ongoing =3D 0;
>>> >> > +
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Exclude 1st OTP and OTP blocks */
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ONENAND_IS_CACHE_PROGRAM(this) &=
&
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 likely(onenand_block(this, t=
o) !=3D 0) &&
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ONENAND_IS_4KB_PAGE(this)) {
>>> >> check the length here instead of 4KB_PAGE.
>>> >
>>> >
>>> > This patch is for 4kb page onenand only. The 2kb page onenand uses di=
fferent
>>> > commands for cache program.
>>> I see, check it both 4KiB and 2KiB at office.
>>> >
>>> >
>>> >> > +
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((written + thisl=
en) < len) {
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =
=3D ONENAND_CMD_CACHE_PROG;
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 this=
->ongoing =3D 1;
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =
=3D ONENAND_CMD_CACHE_PROG_LAST;
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>>> >> Need to check how to pass the cmd properly. How/When send the CACHE_=
PROG_LAST?
>>> >
>>> >
>>> > CACHE_PROG_LAST command must be sent for last programmed piece of dat=
a, that is
>>> > (written + thislen) >=3D len.
>>> Yes I know, I mean to use the CACHE program I think write size should
>>> be more than 4KiB. e.g., 8KiB write size,
>>
>> Considering 4KB page onenand, for each program command the 4KB data is w=
ritten at once.
>> If the condition ((written + thislen) < len) is true it means that there=
 is more
>> than 4KB data to written. That means at least one more data program comm=
and.
>> Otherwise the ONENAND_CMD_CACHE_PROG_LAST is used which is normal progra=
m command.
>
> Right, then do you need the pseudo command? how about to set the real
> command at write function?
>>
>>
>>> >
>>> >
>>> >> > +
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D ONENAND_CMD_=
PROG;
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>>> >> > +
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->command(mtd, cmd, to, mtd->wri=
tesize);
>>> >> >
>>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
>>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * 2 PLANE, MLC, and Flex-OneNAND w=
ait here
>>> >> > @@ -3380,6 +3411,8 @@ static void onenand_check_features(struct mt=
d_info *mtd)
>>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else if (numbufs =3D=3D 1)
>>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0this->options |=3D =
ONENAND_HAS_4KB_PAGE;
>>> >> >
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->options |=3D ONENAND_HAS_CACHE=
_PROGRAM;
>>> >> It also needs to set CACHE_PROGRAM option.
>>> >
>>> >
>>> > Sorry. What do mean here?
>>> Ah, Now it always set the CACHE_PROGRAM, so it should be set on each ch=
ip spec.
>>
>> Is there any problem that CACHE_PROGRAM feature is set for each 4Gb chip=
?
>> I suppose each of them supports cache program either as 4KB page cache o=
r
>> 2KB page 2x cache program feature.
> For clear, how about to set the 4KiB pagesize only? I'm not yet check
> the 4Gib DDP chip.
>
> Thank you,
> Kyungmin Park
>
>>
>>> >
>>> >
>>> >> > +
>>> >> > =A0 =A0 =A0 =A0case ONENAND_DEVICE_DENSITY_2Gb:
>>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* 2Gb DDP does not have 2 plane */
>>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!ONENAND_IS_DDP(this))
>>> >> > @@ -3415,6 +3448,8 @@ static void onenand_check_features(struct mt=
d_info *mtd)
>>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_DEBUG "Chip has 2 plane=
\n");
>>> >> > =A0 =A0 =A0 =A0if (this->options & ONENAND_HAS_4KB_PAGE)
>>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_DEBUG "Chip has 4KiB pa=
gesize\n");
>>> >> > + =A0 =A0 =A0 if (this->options & ONENAND_HAS_CACHE_PROGRAM)
>>> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_DEBUG "Chip has cache pr=
ogram feature\n");
>>> >> > =A0}
>>> >>

One more can you show your speedtest result?

Here's my results.
* Before
[    2.490000] mtd_speedtest: testing eraseblock write speed
[   10.005000] mtd_speedtest: eraseblock write speed is 8147 KiB/s
[   10.010000] mtd_speedtest: testing eraseblock read speed
[   11.660000] mtd_speedtest: eraseblock read speed is 37171 KiB/s
[   11.920000] mtd_speedtest: testing page write speed
[   19.440000] mtd_speedtest: page write speed is 8138 KiB/s
[   19.445000] mtd_speedtest: testing page read speed
[   21.115000] mtd_speedtest: page read speed is 36725 KiB/s
[   21.375000] mtd_speedtest: testing 2 page write speed
[   28.885000] mtd_speedtest: 2 page write speed is 8151 KiB/s
[   28.890000] mtd_speedtest: testing 2 page read speed
[   30.550000] mtd_speedtest: 2 page read speed is 36924 KiB/s
[   30.555000] mtd_speedtest: Testing erase speed
[   30.815000] mtd_speedtest: erase speed is 240881 KiB/s
* After
[   73.385000] mtd_speedtest: scanned 240 eraseblocks, 1 are bad
[   73.645000] mtd_speedtest: testing eraseblock write speed
[   78.820000] mtd_speedtest: eraseblock write speed is 11834 KiB/s
[   78.825000] mtd_speedtest: testing eraseblock read speed
[   80.475000] mtd_speedtest: eraseblock read speed is 37193 KiB/s
[   80.735000] mtd_speedtest: testing page write speed
[   88.255000] mtd_speedtest: page write speed is 8138 KiB/s
[   88.260000] mtd_speedtest: testing page read speed
[   89.930000] mtd_speedtest: page read speed is 36725 KiB/s
[   90.190000] mtd_speedtest: testing 2 page write speed
[   96.515000] mtd_speedtest: 2 page write speed is 9676 KiB/s
[   96.520000] mtd_speedtest: testing 2 page read speed
[   98.180000] mtd_speedtest: 2 page read speed is 36924 KiB/s
[   98.185000] mtd_speedtest: Testing erase speed
[   98.445000] mtd_speedtest: erase speed is 240881 KiB/s
[   98.445000] mtd_speedtest: finished

Thank you,
Kyungmin Park
