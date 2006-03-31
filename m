Received: from wproxy.gmail.com ([64.233.184.238])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FPEKj-00072b-FG
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 02:46:19 -0500
Received: by wproxy.gmail.com with SMTP id 71so596213wri
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Mar 2006 23:46:12 -0800 (PST)
Message-ID: <9185a3fa0603302339q6a7ba5bem57c52357575f11ab@mail.gmail.com>
Date: Fri, 31 Mar 2006 16:39:25 +0900
From: "Amit Sharma" <amitsharma91@gmail.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <E1FOHYU-00007j-Kk@canuck.infradead.org>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_Part_15838_31171599.1143790765627"
References: <E1FOHYU-00007j-Kk@canuck.infradead.org>
Subject: Re: linux-mtd Digest, Vol 36, Issue 40
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

------=_Part_15838_31171599.1143790765627
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi

1. I  am trying to use JFFS2 with one nand as bootable device ,i am  facing
problem in jffs2 mount i have created jffs2 image and cat
mkjffs2.image> /dev/raw device  6 . but during mount i fail becaue it
gives message "too
many fs mounted o device ..........," this is very common message .

2. I have one more question if some answer i will be thanful to u on omap
5912. During dma transfer device if any interrupt come how mtd will maintai=
n
control data alignement if  my deice is configured for 16 bit burst length =
.

Thanks
amit


On 3/29/06, linux-mtd-request@lists.infradead.org <
linux-mtd-request@lists.infradead.org> wrote:
>
> Send linux-mtd mailing list submissions to
>        linux-mtd@lists.infradead.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
>        http://lists.infradead.org/mailman/listinfo/linux-mtd
> or, via email, send a message with subject or body 'help' to
>        linux-mtd-request@lists.infradead.org
>
> You can reach the person managing the list at
>        linux-mtd-owner@lists.infradead.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of linux-mtd digest..."
>
>
> Today's Topics:
>
>   1. [PATCH] enable mainstone MTD map driver on LogicPD PXA270
>      platform (Lennert Buytenhek)
>   2. JFFS2 on NAND (S3C2410) (Selmeci, Tamas)
>   3. Re: [PATCH] enable mainstone MTD map driver on LogicPD PXA270
>      platform (Nicolas Pitre)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Tue, 28 Mar 2006 17:12:39 +0200
> From: Lennert Buytenhek <buytenh@wantstofly.org>
> Subject: [PATCH] enable mainstone MTD map driver on LogicPD PXA270
>        platform
> To: linux-mtd@lists.infradead.org
> Message-ID: <20060328151239.GB16959@xi.wantstofly.org>
> Content-Type: text/plain; charset=3Dus-ascii
>
> The LogicPD PXA270 platform is very similar to the Intel Mainstone,
> and can use the same MTD map driver.
>
> Signed-off-by: Lennert Buytenhek <buytenh@wantstofly.org>
>
> Index: linux-2.6.16/drivers/mtd/maps/Kconfig
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.16.orig/drivers/mtd/maps/Kconfig
> +++ linux-2.6.16/drivers/mtd/maps/Kconfig
> @@ -131,7 +131,7 @@ config MTD_LUBBOCK
>
> config MTD_MAINSTONE
>        tristate "CFI Flash device mapped on Intel Mainstone XScale eval
> board"
> -       depends on MACH_MAINSTONE && MTD_CFI_INTELEXT
> +       depends on (MACH_LOGICPD_PXA270 || MACH_MAINSTONE) &&
> MTD_CFI_INTELEXT
>        select MTD_PARTITIONS
>        help
>          This provides a driver for the on-board flash of the Intel
>
>
>
> ------------------------------
>
> Message: 2
> Date: Tue, 28 Mar 2006 17:34:27 +0200
> From: "Selmeci, Tamas" <tamas.selmeci@siemens.com>
> Subject: JFFS2 on NAND (S3C2410)
> To: <linux-mtd@lists.infradead.org>
> Message-ID:
>        <38F58D7B92CB20438DF49D28B572CC6F13C4B9@budgw09a.ww300.siemens.net=
>
> Content-Type: text/plain;       charset=3D"iso-8859-1"
>
> Hi!
>
> Igor is trying to make a JFFS2 based root filesystem on his developer
> board - so do I at this time.
>
> My idea (the one and only data/root partition is JFFS2) seems not to work
> yet. If I make a jffs2 image with
>
> mkfs.jffs -U -l -e 16 KiB -o ../rootfs_jffs2
>
> the kernel identifies as jffs, not jffs2. Attempts to mount, but can
> access nothing on that (obviously, this is a jffs2 and kernel mounts as
> jffs). As I saw, struct mtd_partition has a member called mask_flags. I
> suspect this value is a kind of "partition ID", in Vivi boot loader this
> indicates JFFS2.
>
> I've attempted an other method too. I created a 5th partition (the 4th is
> still cramfs). The board successfully
> booted into the cramfs. I made a jffs2 image from the partition with
> mkfs.jffs2, and then copied:
>
> dd if=3D/tmp/jffs2_image of=3D/dev/mtd4
>
> Mounted:
>
> mount -t jffs2 /dev/mtdblock4 /tmp/mnt
>
> Displays a few error messages (CLEANMARKER node found at xxx has totlen
> 0xc !=3D normal 0x0), but after mounting,
> the directory tree seems to be OK and I can run programs from jffs2
> partition. However, if the kernel parameter
> is root=3D/dev/mtdblock4, still can't mount it.
>
> If I try this procedure for jffs filesystem, I can't copy because cp and
> dd complain: attempt to write
> not page aligned data. mkfs.jffs has no option like mkfs.jffs2's -p to pa=
d
> ...
>
> ECC check is forced to be off in this kernel (2.6.15.5).
>
> Any idea?
>
> Bye
> --
> Tamas Selmeci
> Siemens PSE HU
> Tel.   : +36-1-471-3861
> Email  : tamas.selmeci@siemens.com
> Address: H-1143 Budapest, Gizella ut 51-59
>
>
>
>
> ------------------------------
>
> Message: 3
> Date: Tue, 28 Mar 2006 11:16:13 -0500 (EST)
> From: Nicolas Pitre <nico@cam.org>
> Subject: Re: [PATCH] enable mainstone MTD map driver on LogicPD PXA270
>        platform
> To: Lennert Buytenhek <buytenh@wantstofly.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>,
>        linux-mtd@lists.infradead.org
> Message-ID: <Pine.LNX.4.64.0603281104470.14923@localhost.localdomain>
> Content-Type: TEXT/PLAIN; charset=3DUS-ASCII
>
> On Tue, 28 Mar 2006, Lennert Buytenhek wrote:
>
> > The LogicPD PXA270 platform is very similar to the Intel Mainstone,
> > and can use the same MTD map driver.
> >
> > Signed-off-by: Lennert Buytenhek <buytenh@wantstofly.org>
> >
> > Index: linux-2.6.16/drivers/mtd/maps/Kconfig
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > --- linux-2.6.16.orig/drivers/mtd/maps/Kconfig
> > +++ linux-2.6.16/drivers/mtd/maps/Kconfig
> > @@ -131,7 +131,7 @@ config MTD_LUBBOCK
> >
> >  config MTD_MAINSTONE
> >       tristate "CFI Flash device mapped on Intel Mainstone XScale eval
> board"
> > -     depends on MACH_MAINSTONE && MTD_CFI_INTELEXT
> > +     depends on (MACH_LOGICPD_PXA270 || MACH_MAINSTONE) &&
> MTD_CFI_INTELEXT
>
> The mainstone-flash.c no longer exists in the MTD repository.
>
> It has been superseded by pxa2xx-flash.c.  I adjusted the dependency in
> the CVS repo already.
>
> Thomas: when will this be sent to Linus?
>
>
> Nicolas
>
>
>
> ------------------------------
>
> ______________________________________________________
> Linux MTD discussion mailing list digest
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
> End of linux-mtd Digest, Vol 36, Issue 40
> *****************************************
>

------=_Part_15838_31171599.1143790765627
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Hi </div>
<div>&nbsp;</div>
<div>1. I&nbsp; am trying to use JFFS2 with one nand as bootable device ,i =
am&nbsp; facing problem in jffs2 mount i have created jffs2 image and cat m=
kjffs2.image &gt;&nbsp;/dev/raw device&nbsp; 6 . but during mount i fail be=
caue it gives message &quot;too many fs mounted o device ..........,&quot; =
this is very common message .
</div>
<div>&nbsp;</div>
<div>2.&nbsp;I have one more&nbsp;question if some answer i will be thanful=
 to u on omap 5912. During dma transfer&nbsp;device if any interrupt come h=
ow mtd will maintain control data alignement if&nbsp; my deice is configure=
d for 16 bit burst length .
</div>
<div>&nbsp;</div>
<div>Thanks</div>
<div>amit<br><br>&nbsp;</div>
<div><span class=3D"gmail_quote">On 3/29/06, <b class=3D"gmail_sendername">=
<a href=3D"mailto:linux-mtd-request@lists.infradead.org">linux-mtd-request@=
lists.infradead.org</a></b> &lt;<a href=3D"mailto:linux-mtd-request@lists.i=
nfradead.org">
linux-mtd-request@lists.infradead.org</a>&gt; wrote:</span>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">Send linux-mtd mailing list subm=
issions to<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"mailto:linux-=
mtd@lists.infradead.org">linux-mtd@lists.infradead.org
</a><br><br>To subscribe or unsubscribe via the World Wide Web, visit<br>&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"http://lists.infradead.org/ma=
ilman/listinfo/linux-mtd">http://lists.infradead.org/mailman/listinfo/linux=
-mtd</a><br>or, via email, send a message with subject or body 'help' to
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"mailto:linux-mtd-reques=
t@lists.infradead.org">linux-mtd-request@lists.infradead.org</a><br><br>You=
 can reach the person managing the list at<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; <a href=3D"mailto:linux-mtd-owner@lists.infradead.org">
linux-mtd-owner@lists.infradead.org</a><br><br>When replying, please edit y=
our Subject line so it is more specific<br>than &quot;Re: Contents of linux=
-mtd digest...&quot;<br><br><br>Today's Topics:<br><br>&nbsp;&nbsp;1. [PATC=
H] enable mainstone MTD map driver on LogicPD PXA270
<br>&nbsp;&nbsp;&nbsp;&nbsp; platform (Lennert Buytenhek)<br>&nbsp;&nbsp;2.=
 JFFS2 on NAND (S3C2410) (Selmeci, Tamas)<br>&nbsp;&nbsp;3. Re: [PATCH] ena=
ble mainstone MTD map driver on LogicPD PXA270<br>&nbsp;&nbsp;&nbsp;&nbsp; =
platform (Nicolas Pitre)<br><br><br>---------------------------------------=
-------------------------------
<br><br>Message: 1<br>Date: Tue, 28 Mar 2006 17:12:39 +0200<br>From: Lenner=
t Buytenhek &lt;<a href=3D"mailto:buytenh@wantstofly.org">buytenh@wantstofl=
y.org</a>&gt;<br>Subject: [PATCH] enable mainstone MTD map driver on LogicP=
D PXA270
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; platform<br>To: <a href=3D"mailto:=
linux-mtd@lists.infradead.org">linux-mtd@lists.infradead.org</a><br>Message=
-ID: &lt;<a href=3D"mailto:20060328151239.GB16959@xi.wantstofly.org">200603=
28151239.GB16959@xi.wantstofly.org
</a>&gt;<br>Content-Type: text/plain; charset=3Dus-ascii<br><br>The LogicPD=
 PXA270 platform is very similar to the Intel Mainstone,<br>and can use the=
 same MTD map driver.<br><br>Signed-off-by: Lennert Buytenhek &lt;<a href=
=3D"mailto:buytenh@wantstofly.org">
buytenh@wantstofly.org</a>&gt;<br><br>Index: linux-2.6.16/drivers/mtd/maps/=
Kconfig<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>--- linu=
x-2.6.16.orig/drivers/mtd/maps/Kconfig<br>+++ linux-2.6.16
/drivers/mtd/maps/Kconfig<br>@@ -131,7 +131,7 @@ config MTD_LUBBOCK<br><br>=
config MTD_MAINSTONE<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tristate &quot=
;CFI Flash device mapped on Intel Mainstone XScale eval board&quot;<br>-&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; depends on MACH_MAINSTONE &amp;&amp; MTD_=
CFI_INTELEXT
<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; depends on (MACH_LOGICPD_PXA270 |=
| MACH_MAINSTONE) &amp;&amp; MTD_CFI_INTELEXT<br>&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; select MTD_PARTITIONS<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; he=
lp<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This provides a driv=
er for the on-board flash of the Intel<br><br><br><br>
------------------------------<br><br>Message: 2<br>Date: Tue, 28 Mar 2006 =
17:34:27 +0200<br>From: &quot;Selmeci, Tamas&quot; &lt;<a href=3D"mailto:ta=
mas.selmeci@siemens.com">tamas.selmeci@siemens.com</a>&gt;<br>Subject: JFFS=
2 on NAND (S3C2410)
<br>To: &lt;<a href=3D"mailto:linux-mtd@lists.infradead.org">linux-mtd@list=
s.infradead.org</a>&gt;<br>Message-ID:<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &lt;<a href=3D"mailto:38F58D7B92CB20438DF49D28B572CC6F13C4B9@budgw09a.w=
w300.siemens.net">38F58D7B92CB20438DF49D28B572CC6F13C4B9@budgw09a.ww300.sie=
mens.net
</a>&gt;<br>Content-Type: text/plain;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c=
harset=3D&quot;iso-8859-1&quot;<br><br>Hi!<br><br>Igor is trying to make a =
JFFS2 based root filesystem on his developer board - so do I at this time.<=
br><br>My idea (the one and only data/root partition is JFFS2) seems not to=
 work yet. If I make a jffs2 image with
<br><br>mkfs.jffs -U -l -e 16 KiB -o ../rootfs_jffs2<br><br>the kernel iden=
tifies as jffs, not jffs2. Attempts to mount, but can access nothing on tha=
t (obviously, this is a jffs2 and kernel mounts as jffs). As I saw, struct =
mtd_partition has a member called mask_flags. I suspect this value is a kin=
d of &quot;partition ID&quot;, in Vivi boot loader this indicates JFFS2.
<br><br>I've attempted an other method too. I created a 5th partition (the =
4th is still cramfs). The board successfully<br>booted into the cramfs. I m=
ade a jffs2 image from the partition with mkfs.jffs2, and then copied:<br>
<br>dd if=3D/tmp/jffs2_image of=3D/dev/mtd4<br><br>Mounted:<br><br>mount -t=
 jffs2 /dev/mtdblock4 /tmp/mnt<br><br>Displays a few error messages (CLEANM=
ARKER node found at xxx has totlen 0xc !=3D normal 0x0), but after mounting=
,<br>
the directory tree seems to be OK and I can run programs from jffs2 partiti=
on. However, if the kernel parameter<br>is root=3D/dev/mtdblock4, still can=
't mount it.<br><br>If I try this procedure for jffs filesystem, I can't co=
py because cp and dd complain: attempt to write
<br>not page aligned data. mkfs.jffs has no option like mkfs.jffs2's -p to =
pad ...<br><br>ECC check is forced to be off in this kernel (<a href=3D"htt=
p://2.6.15.5">2.6.15.5</a>).<br><br>Any idea?<br><br>Bye<br>--<br>Tamas Sel=
meci
<br>Siemens PSE HU<br>Tel.&nbsp;&nbsp; : +36-1-471-3861<br>Email&nbsp;&nbsp=
;: <a href=3D"mailto:tamas.selmeci@siemens.com">tamas.selmeci@siemens.com</=
a><br>Address: H-1143 Budapest, Gizella ut 51-59<br><br><br><br><br>-------=
-----------------------
<br><br>Message: 3<br>Date: Tue, 28 Mar 2006 11:16:13 -0500 (EST)<br>From: =
Nicolas Pitre &lt;<a href=3D"mailto:nico@cam.org">nico@cam.org</a>&gt;<br>S=
ubject: Re: [PATCH] enable mainstone MTD map driver on LogicPD PXA270<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; platform<br>To: Lennert Buytenhek &lt;=
<a href=3D"mailto:buytenh@wantstofly.org">buytenh@wantstofly.org</a>&gt;<br=
>Cc: Thomas Gleixner &lt;<a href=3D"mailto:tglx@linutronix.de">tglx@linutro=
nix.de</a>&gt;,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"mailto:l=
inux-mtd@lists.infradead.org">
linux-mtd@lists.infradead.org</a><br>Message-ID: &lt;<a href=3D"mailto:Pine=
.LNX.4.64.0603281104470.14923@localhost.localdomain">Pine.LNX.4.64.06032811=
04470.14923@localhost.localdomain</a>&gt;<br>Content-Type: TEXT/PLAIN; char=
set=3DUS-ASCII
<br><br>On Tue, 28 Mar 2006, Lennert Buytenhek wrote:<br><br>&gt; The Logic=
PD PXA270 platform is very similar to the Intel Mainstone,<br>&gt; and can =
use the same MTD map driver.<br>&gt;<br>&gt; Signed-off-by: Lennert Buytenh=
ek &lt;
<a href=3D"mailto:buytenh@wantstofly.org">buytenh@wantstofly.org</a>&gt;<br=
>&gt;<br>&gt; Index: linux-2.6.16/drivers/mtd/maps/Kconfig<br>&gt; =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&gt; --- linux-2.6.16.orig
/drivers/mtd/maps/Kconfig<br>&gt; +++ linux-2.6.16/drivers/mtd/maps/Kconfig=
<br>&gt; @@ -131,7 +131,7 @@ config MTD_LUBBOCK<br>&gt;<br>&gt;&nbsp;&nbsp;=
config MTD_MAINSTONE<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tristate &=
quot;CFI Flash device mapped on Intel Mainstone XScale eval board&quot;
<br>&gt; -&nbsp;&nbsp;&nbsp;&nbsp; depends on MACH_MAINSTONE &amp;&amp; MTD=
_CFI_INTELEXT<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp; depends on (MACH_LOGICPD_PX=
A270 || MACH_MAINSTONE) &amp;&amp; MTD_CFI_INTELEXT<br><br>The mainstone-fl=
ash.c no longer exists in the MTD repository.
<br><br>It has been superseded by pxa2xx-flash.c.&nbsp;&nbsp;I adjusted the=
 dependency in<br>the CVS repo already.<br><br>Thomas: when will this be se=
nt to Linus?<br><br><br>Nicolas<br><br><br><br>----------------------------=
--<br>
<br>______________________________________________________<br>Linux MTD dis=
cussion mailing list digest<br><a href=3D"http://lists.infradead.org/mailma=
n/listinfo/linux-mtd/">http://lists.infradead.org/mailman/listinfo/linux-mt=
d/
</a><br><br><br>End of linux-mtd Digest, Vol 36, Issue 40<br>**************=
***************************<br></blockquote></div><br>

------=_Part_15838_31171599.1143790765627--
