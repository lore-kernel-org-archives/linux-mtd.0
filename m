Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S4ZPx-0008Bz-E9
 for linux-mtd@lists.infradead.org; Mon, 05 Mar 2012 15:01:42 +0000
From: "Stern, Eli" <eli.stern@intel.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: jffs2: False report of "No space left on device"
Date: Mon, 5 Mar 2012 14:58:31 +0000
Message-ID: <2F2D37999334844EBB941E4D6CB428B507FA8C@HASMSX104.ger.corp.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I came across a scenario that reaches "No space left on device".=20
IMHO this is a false conclusion, since after reboot there is plenty of spac=
e.

This is the setup:
- Kernel 2.6.39.2
- ARM 11
# cat /proc/mtd | grep nvram
mtd8: 00040000 00001000 "nvram"
# mount | grep nvram
/dev/mtdblock8 on /nvram type jffs2 (rw)
- The "nvram" device is quite empty.=20
    I managed to copy 8 zipped files of size ~11Kbytes (compressed) before =
the=20
    filesystem complained that it is full. (and then removed them. And rebo=
oted.)

this is the test:
# ### Start at 13:20:40
# while [ 1 ] ; do echo 0 > /nvram/eli/full/b; echo 1 > /nvram/eli/full/b; =
done
Newly-erased block contained word 0x2688eeac at offset 0x000295c0
... Some more of these
Newly-erased block contained word 0x2d2ebc71 at offset 0x000265c0
/bin/sh: can't create /nvram/eli/full/b: No space left on device
/bin/sh: can't create /nvram/eli/full/b: No space left on device
/bin/sh: can't create /nvram/eli/full/b: No space left on device
/bin/sh: can't create /nvram/eli/full/b: No space left on device
^C
# ### End at 13:21:09
# echo 0 > /nvram/eli/full/b
/bin/sh: can't create /nvram/eli/full/b: No space left on device

This persists after ~1 Hour.

Everything goes back to normal after Reboot.

I would have expected the garbage collector to kick in and free space, but =
it seems this does not happen.

Running the same test on a similar board, but with
# cat /proc/mtd |grep nvram
mtd8: 00050000 00010000 "nvram"
#
Produces similar results, but it takes 10 Minutes instead of 30 Seconds.

Running both tests on Kernel 2.6.18 does NOT fail! Ran for several hours.

Can anyone shed some light on this behavior?

Thanx

Eli Stern

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.
