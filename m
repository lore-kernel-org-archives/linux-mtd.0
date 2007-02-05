From: "Kyungmin Park" <kmpark@infradead.org>
To: <dedekind@infradead.org>,
	<kmpark@infradead.org>
References: <20070202164729.11475.8623.sendpatchset@localhost.localdomain>
	<003b01c748f5$55ae1d50$c7a3580a@swcenter.sec.samsung.co.kr>
	<1170663136.3628.45.camel@sauron>
Subject: RE: [PATCH] [JFFS2] use MTD_OOB_AUTO
Date: Mon, 5 Feb 2007 17:27:45 +0900
Message-ID: <003e01c748ff$8822c970$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <1170663136.3628.45.camel@sauron>
Cc: linux-mtd@lists.infradead.org
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> > const static => static const
> 
> You keep me busy :-)
> 
> const is "type qualifier", static is "storage class 
> specifier" (C99, 6.7). The order may be arbitrary.
> 

Yes, I know it. In fact. it's minor issue.
I just saw the some works convert from "const static" to "static const" in
LKML.

Ah, there are some "const static"s :)

$ grep "const static" -R *
arch/powerpc/kernel/rtas.c:     const static int *row_width;
arch/sh/kernel/cpu/sh2a/clock-sh7206.c:const static int pll1rate[]={1,2,3,4,
6,8};
arch/sh/kernel/cpu/sh2a/clock-sh7206.c:const static int pfc_divisors[]={1,2,
3,4,6,8,12};
arch/sh/kernel/cpu/sh2/clock-sh7619.c:const static int pll1rate[]={1,2};
arch/sh/kernel/cpu/sh2/clock-sh7619.c:const static int
pfc_divisors[]={1,2,0,4};
drivers/input/serio/libps2.c:   const static char keyboard_ids[] = {
drivers/ieee1394/ohci1394.c:const static size_t hdr_sizes[] = {
drivers/media/video/pvrusb2/pvrusb2-video-v4l.c:const static struct
pvr2_i2c_handler_functions hfuncs = {
drivers/media/video/pvrusb2/pvrusb2-wm8775.c:const static struct
pvr2_i2c_handler_functions hfuncs = {
drivers/media/video/pvrusb2/pvrusb2-tuner.c:const static struct
pvr2_i2c_handler_functions tuner_funcs = {
drivers/media/video/pvrusb2/pvrusb2-audio.c:const static struct
pvr2_i2c_handler_functions msp3400_funcs = {
drivers/media/video/pvrusb2/pvrusb2-std.c:const static struct std_name
std_groups[] = {
drivers/media/video/pvrusb2/pvrusb2-std.c:const static struct std_name
std_items[] = {
drivers/media/video/pvrusb2/pvrusb2-cx2584x-v4l.c:const static struct
pvr2_i2c_handler_functions hfuncs = {
fs/cifs/cifssmb.c:const static struct cifs_sid sid_everyone =
fs/cifs/cifssmb.c:const static struct cifs_sid sid_user =

Thank you,
Kyungmin Park
