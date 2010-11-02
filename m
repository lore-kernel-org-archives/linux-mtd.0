Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PDICL-0005n4-2Y
	for linux-mtd@lists.infradead.org; Tue, 02 Nov 2010 14:50:54 +0000
Received: by pwj2 with SMTP id 2so1988599pwj.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 02 Nov 2010 07:50:51 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <20101102143759.GA15222@nokia.com>
References: <1288697130-12772-1-git-send-email-roman.tereshonkov@nokia.com>
	<1288697130-12772-4-git-send-email-roman.tereshonkov@nokia.com>
	<AANLkTinq7HS5VHww8aq2XPKCwGnjEYSintsN4qRFJq1o@mail.gmail.com>
	<20101102143759.GA15222@nokia.com>
Date: Tue, 2 Nov 2010 23:50:51 +0900
Message-ID: <AANLkTikunPYxpG_8HONV6BnOo54GNk3wvmMasEq1G9tO@mail.gmail.com>
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

On Tue, Nov 2, 2010 at 11:37 PM, Roman Tereshonkov
<roman.tereshonkov@nokia.com> wrote:
> On Tue, Nov 02, 2010 at 03:00:41PM +0100, ext Kyungmin Park wrote:
>> Hi,
>>
>> On Tue, Nov 2, 2010 at 8:25 PM, Roman Tereshonkov
>> <roman.tereshonkov@nokia.com> wrote:
>> > Implement cache program feature for 4KB page onenand.
>> > This feature improves the write data performance.
>> > The observed 128KB data program speed change is
>> > from 8827KB/s to 14156 KB/s when the feature is enabled.
>> >
>> > Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
>> > ---
>> > =A0drivers/mtd/onenand/omap2.c =A0 =A0 =A0 =A0| =A0 12 ++++++++--
>> > =A0drivers/mtd/onenand/onenand_base.c | =A0 39 +++++++++++++++++++++++=
+++++++++++-
>> > =A02 files changed, 46 insertions(+), 5 deletions(-)
>>
>> Please make separate the two patches, one for OMAP, another is for
>> onenand_base.c
>>
>> >
>> > diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
>> > index 9f322f1..da25a90 100644
>> > --- a/drivers/mtd/onenand/omap2.c
>> > +++ b/drivers/mtd/onenand/omap2.c
>> > @@ -108,8 +108,9 @@ static void wait_warn(char *msg, int state, unsign=
ed int ctrl,
>> > =A0static int omap2_onenand_wait(struct mtd_info *mtd, int state)
>> > =A0{
>> > =A0 =A0 =A0 =A0struct omap2_onenand *c =3D container_of(mtd, struct om=
ap2_onenand, mtd);
>> > + =A0 =A0 =A0 struct onenand_chip *this =3D mtd->priv;
>> > =A0 =A0 =A0 =A0unsigned int intr =3D 0;
>> > - =A0 =A0 =A0 unsigned int ctrl;
>> > + =A0 =A0 =A0 unsigned int ctrl, ctrl_mask;
>> > =A0 =A0 =A0 =A0unsigned long timeout;
>> > =A0 =A0 =A0 =A0u32 syscfg;
>> >
>> > @@ -180,7 +181,8 @@ retry:
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (result =3D=3D 0) {
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Time=
out after 20ms */
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ctrl =
=3D read_reg(c, ONENAND_REG_CTRL_STATUS);
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ctrl=
 & ONENAND_CTRL_ONGO) {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ctrl=
 & ONENAND_CTRL_ONGO &&
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
!this->ongoing) {
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0/*
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 * The operation seems to be still going
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 * so give it some more time.
>> > @@ -269,7 +271,11 @@ retry:
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EIO;
>> > =A0 =A0 =A0 =A0}
>> >
>> > - =A0 =A0 =A0 if (ctrl & 0xFE9F)
>> > + =A0 =A0 =A0 ctrl_mask =3D 0xFE9F;
>> > + =A0 =A0 =A0 if (this->ongoing)
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ctrl_mask &=3D ~0x8000;
>> > +
>> > + =A0 =A0 =A0 if (ctrl & ctrl_mask)
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0wait_warn("unexpected controller status=
", state, ctrl, intr);
>> >
>> > =A0 =A0 =A0 =A0return 0;
>> > diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/=
onenand_base.c
>> > index 6b3a875..b2c3e97 100644
>> > --- a/drivers/mtd/onenand/onenand_base.c
>> > +++ b/drivers/mtd/onenand/onenand_base.c
>> > @@ -440,6 +440,19 @@ static int onenand_command(struct mtd_info *mtd, =
int cmd, loff_t addr, size_t le
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0default:
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ONENAND_IS_2PLANE(t=
his) && cmd =3D=3D ONENAND_CMD_PROG)
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cmd =3D=
 ONENAND_CMD_2X_PROG;
>> > +
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Exclude 1st OTP and O=
TP blocks */
>> Are there any reason? I think 1st OTP block is just block 0 so no need
>> to consider block 0 case.
>
>
> Specification tells:
> 3.9.1 Cache Program Operation
> "Note that Cache Program command cannot be performed on OTP block and 1st=
 block OTP"

Okay I'm not yet check the Spec. I will check it at office.
>
>
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ONENAND_IS_CACHE_PRO=
GRAM(this) &&
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 likely(onenand_b=
lock(this, addr) !=3D 0) &&
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ONENAND_IS_4KB_P=
AGE(this)) {
>> and I think no need to check 4KB_PAGE.
>
>
> This patch is for 4kb page onenand only. The 2kb page onenand uses differ=
ent
> commands for cache program. Also 2kb page case cache program depends on
> CONFIG_MTD_ONENAND_2X_PROGRAM.
>
>
>> > +
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (cmd =
=3D=3D ONENAND_CMD_CACHE_PROG)
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 cmd =3D ONENAND_CMD_2X_CACHE_PROG;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else if =
(cmd =3D=3D ONENAND_CMD_CACHE_PROG_LAST)
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 cmd =3D ONENAND_CMD_PROG;
>> > +
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> > +
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dataram =3D ONENAND_CUR=
RENT_BUFFERRAM(this);
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>> > @@ -1845,7 +1858,7 @@ static int onenand_write_ops_nolock(struct mtd_i=
nfo *mtd, loff_t to,
>> > =A0 =A0 =A0 =A0const u_char *buf =3D ops->datbuf;
>> > =A0 =A0 =A0 =A0const u_char *oob =3D ops->oobbuf;
>> > =A0 =A0 =A0 =A0u_char *oobbuf;
>> > - =A0 =A0 =A0 int ret =3D 0;
>> > + =A0 =A0 =A0 int ret =3D 0, cmd;
>> >
>> > =A0 =A0 =A0 =A0DEBUG(MTD_DEBUG_LEVEL3, "%s: to =3D 0x%08x, len =3D %i\=
n",
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__func__, (unsigned int) to, (int) len)=
;
>> > @@ -1954,7 +1967,25 @@ static int onenand_write_ops_nolock(struct mtd_=
info *mtd, loff_t to,
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ONENAND_SET_NEXT_BUFFER=
RAM(this);
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>> >
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->command(mtd, ONENAND_CMD_PROG, to,=
 mtd->writesize);
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->ongoing =3D 0;
>> > +
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Exclude 1st OTP and OTP blocks */
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ONENAND_IS_CACHE_PROGRAM(this) &&
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 likely(onenand_block(this, to) !=
=3D 0) &&
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ONENAND_IS_4KB_PAGE(this)) {
>> check the length here instead of 4KB_PAGE.
>
>
> This patch is for 4kb page onenand only. The 2kb page onenand uses differ=
ent
> commands for cache program.
I see, check it both 4KiB and 2KiB at office.
>
>
>> > +
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((written + thislen) =
< len) {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D =
ONENAND_CMD_CACHE_PROG;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->on=
going =3D 1;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D =
ONENAND_CMD_CACHE_PROG_LAST;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> Need to check how to pass the cmd properly. How/When send the CACHE_PROG=
_LAST?
>
>
> CACHE_PROG_LAST command must be sent for last programmed piece of data, t=
hat is
> (written + thislen) >=3D len.
Yes I know, I mean to use the CACHE program I think write size should
be more than 4KiB. e.g., 8KiB write size,
>
>
>> > +
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D ONENAND_CMD_PROG=
;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> > +
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->command(mtd, cmd, to, mtd->writesi=
ze);
>> >
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * 2 PLANE, MLC, and Flex-OneNAND wait =
here
>> > @@ -3380,6 +3411,8 @@ static void onenand_check_features(struct mtd_in=
fo *mtd)
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else if (numbufs =3D=3D 1)
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0this->options |=3D ONEN=
AND_HAS_4KB_PAGE;
>> >
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->options |=3D ONENAND_HAS_CACHE_PRO=
GRAM;
>> It also needs to set CACHE_PROGRAM option.
>
>
> Sorry. What do mean here?
Ah, Now it always set the CACHE_PROGRAM, so it should be set on each chip s=
pec.
>
>
>> > +
>> > =A0 =A0 =A0 =A0case ONENAND_DEVICE_DENSITY_2Gb:
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* 2Gb DDP does not have 2 plane */
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!ONENAND_IS_DDP(this))
>> > @@ -3415,6 +3448,8 @@ static void onenand_check_features(struct mtd_in=
fo *mtd)
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_DEBUG "Chip has 2 plane\n")=
;
>> > =A0 =A0 =A0 =A0if (this->options & ONENAND_HAS_4KB_PAGE)
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_DEBUG "Chip has 4KiB pagesi=
ze\n");
>> > + =A0 =A0 =A0 if (this->options & ONENAND_HAS_CACHE_PROGRAM)
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_DEBUG "Chip has cache progra=
m feature\n");
>> > =A0}
>>
>> Thank you,
>> Kyungmin Park
>
