Received: from [212.105.56.244] (helo=dmz.lumentis.net)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GjawM-0008Q0-Sf
	for linux-mtd@lists.infradead.org; Mon, 13 Nov 2006 07:29:40 -0500
Received: from [192.168.1.15] (146.175.241.83.in-addr.dgcsystems.net
	[83.241.175.146]) (authenticated bits=0)
	by dmz.lumentis.net (8.12.8/8.12.8) with ESMTP id kADC2MTI006408
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Mon, 13 Nov 2006 13:02:22 +0100
Message-ID: <45585ECD.3090108@transmode.se>
Date: Mon, 13 Nov 2006 13:02:21 +0100
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
MIME-Version: 1.0
CC: linux-mtd@lists.infradead.org
Subject: Re: cfi_cmd0001.c broken w.r.t Erase Suspend solved, patch included
References: <45574BB5.5010601@transmode.se>
In-Reply-To: <45574BB5.5010601@transmode.se>
Content-Type: multipart/mixed; boundary="------------090100060609090701070004"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------090100060609090701070004
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Joakim Tjernlund wrote:
> Hi List
>
> I found some problems that I think is flash driver
> related(cfi_cmd0001.c). Somehow the
> flash is in Erase suspend when do_erase_oneblock has returned from
> INVAL_CACHE_AND_WAIT
> I have tried lots of "fixes" but the only one that works is to detect
> the Suspend in do_erase_oneblock
> and issue a new resume and go back to INVAL_CAHCE_AND_WAIT, see attached
> patch.
> I am uing Intel P30 flash and 2.6.19-rc3 on powerpc
>
> How to reproduce:
> apply patch to kernel
>
> boot to userspace and do:
> cp -a /bin /root/tt1
> cp -a /bin /root/tt2
> cp -a /bin /root/tt3
> cp -a /bin /root/tt4
> cp -a /bin /root/tt5
>
> Fill up the rest JFFS2 FS to it is full using dd to create an huge file
> until the FS is full.
> make sure syslog and klogd is running and is logging to file on the
> JFFS2 FS.
>
> Now do
> 1)
> rm -rf /root/tt5
> cp -a /root/tt1 /root/tt5
>
> wait a few secs to a minute, then go to 1)
>
> a few other observations:
>
> It is very hard to trigger a erase, seems like the gc daemon uses that
> as its last resort. Why not
> erase blocks as soon they are ready to be erased?
>
> I have seen cp consume 100% CPU sevral times
>
> Also noticed gc sleeping whil cp is running and making no progress.
> had to kick gc with a kill -HUP <gc pid> to make it run to make room for
> the cp.
>
> The above observations makes me think there is a bug or two in JFFS2 as
> well.
>
>  Jocke
>   
Found the problem, attached patch fixes the bug. I think this bug has
been there for quite some time.

While chasing down this bug I got severe FS corruption due to one write
failure. One write failure should not
corrupt the FS, managed to save this trace from the console(don't got
ksymoops handy, sorry. don't think its needed). This
problem is beyond my skills and I hope someone else can have a look.

Trace follows:

TMCU Flash Map Info: Chip not ready after erase suspended: status = 0x0
Write of 116 bytes at 0x05ea06f8 failed. returned -5, retlen 0
Not marking the space at 0x05ea06f8 as dirty because the flash driver
returned r
etlen zero
SUSPEND1: chip already suspended
resume again:c0, suspend flag:1
ERASE DONE: chip:c7f102e0 adr:6320000, status 0x80
resume again:c0, suspend flag:1
ERASE DONE: chip:c7f102e0 adr:6240000, status 0x80
resume again:c0, suspend flag:1
ERASE DONE: chip:c7f102e0 adr:6220000, status 0x80
Totlen for ref at c7a5b824 (0x05ea06f8-0x05ea076c) miscalculated as 0x0
instead
of 74
next c7a5b830 (0x05ea06f8-0x05ea076c)
jeb->wasted_size 0, dirty_size 0, used_size c, free_size 1f894
Badness in __jffs2_ref_totlen at fs/jffs2/nodelist.c:1219
Call Trace:
[C07F5980] [C0008464]  (unreliable)
[C07F59B0] [C000DEB0]
[C07F59F0] [C000F548]
--- Exception: 700[C07F5AD0] [C00CD924]
[C07F5AF0] [C00D8B3C]
[C07F5B10] [C00D8CEC]
[C07F5B60] [C00D2544]
[C07F5BE0] [C00D5194]
[C07F5C10] [C00D7110]
[C07F5C30] [C00D78BC]
[C07F5C70] [C00D7AFC]
[C07F5D00] [C005B9C8]
[C07F5D20] [C005BA64]
[C07F5D40] [C0072B68]
[C07F5EC0] [C00731F4]
[C07F5EF0] [C01F2880]
[C07F5F10] [C01F29DC]
[C07F5F60] [C01F2E90]
[C07F5F80] [C0003B10]
[C07F5FF0] [C000FDF8]
JFFS2 error: (1) jffs2_link_node_ref: Adding new ref c7a5b830 at
(0x05ea06f8-0x05ea076c) not immediately after previous
(0x05ea06f8-0x05ea076c
)
kernel BUG in jffs2_link_node_ref at fs/jffs2/nodelist.c:1098!
Oops: Exception in kernel mode, sig: 5 [#1]


NIP: C00CD95C LR: C00CD95C CTR: C00F6204
REGS: c07f5a20 TRAP: 0700   Not tainted  (2.6.19-rc3-g61b18413-dirty)
MSR: 00029032 <EE,ME,IR,DR>  CR: 24022022  XER: 00000000
TASK = c07fbb40[1] 'swapper' THREAD: c07f4000
GPR00: C00CD95C C07F5AD0 C07FBB40 00000093 00001A07 FFFFFFFF C010F934
C0215A0C
GPR08: C0210000 C0220000 00000000 C0210000 24022022 10078B2C 0FFFCD00
C03B4398
GPR16: 00000000 00000000 0000000A 05E9FFFF C7A5C735 00000006 00000000
0001CD28
GPR24: C7A5C720 C0233610 C03999C4 C03C5E48 00000074 C075D200 C03999C4
C7A5B830
Call Trace:
[C07F5AD0] [C00CD95C]  (unreliable)
[C07F5AF0] [C00D8B3C]
[C07F5B10] [C00D8CEC]
[C07F5B60] [C00D2544]
[C07F5BE0] [C00D5194]
[C07F5C10] [C00D7110]
[C07F5C30] [C00D78BC]
[C07F5C70] [C00D7AFC]
[C07F5D00] [C005B9C8]
[C07F5D20] [C005BA64]
[C07F5D40] [C0072B68]
[C07F5EC0] [C00731F4]
[C07F5EF0] [C01F2880]
[C07F5F10] [C01F29DC]
[C07F5F60] [C01F2E90]
[C07F5F80] [C0003B10]
[C07F5FF0] [C000FDF8]
Instruction dump:
7fe6fb78 80ff0004 38a55034 812b0004 54e7003a 808200a8 5529003a 7d07e214
7d491a14 3c60c01e 386394d4 4bf4e45d <0fe00000> 4bffff38 801d005c 7c00e214
 <0>Kernel panic - not syncing: Attempted to kill init!
 <0>Rebooting in 180 seconds..


--------------090100060609090701070004
Content-Type: text/plain;
 name="cfi_cmd0001.patch2"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="cfi_cmd0001.patch2"

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 2fd5cef..6c7cf95 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -1105,7 +1105,7 @@ static int inval_cache_and_wait_for_oper
 		}
 		spin_lock(chip->mutex);
 
-		if (chip->state != chip_state) {
+		while (chip->state != chip_state) {
 			/* Someone's suspended the operation: sleep */
 			DECLARE_WAITQUEUE(wait, current);
 			set_current_state(TASK_UNINTERRUPTIBLE);

--------------090100060609090701070004--
