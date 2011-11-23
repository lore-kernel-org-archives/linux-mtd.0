Received: from hqemgate03.nvidia.com ([216.228.121.140])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RTCsa-0007aP-N9
 for linux-mtd@lists.infradead.org; Wed, 23 Nov 2011 13:28:49 +0000
From: Bhavesh Parekh <bparekh@nvidia.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Wed, 23 Nov 2011 18:58:43 +0530
Subject: [UBI] Missing scrub when there is a bit-flip
Message-ID: <6F5E0EB93579CE4A99BFB2D6A9D015057D9CA89078@BGMAIL01.nvidia.com>
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,
I have found a possible problem in the handling of the scrubbing when the=
re is a bit-flip.

We have modified the Nand driver to verify if proper scrubbing is done wh=
en bit-flip has happened. For this we injected the bit-flip error from th=
e driver(for a particular block). And we match with corresponding erase c=
all from the upper layer.

We see that some-time when there is a bit-flip we don't found the corresp=
onding erase call. On debugging, we root-cause it to function leb_write_t=
rylock(), where if we don't get the mutex we will return the error and th=
e caller eba_copy_leb will return the error MOVE_CANCEL_RACE to wear_leve=
ling_worker function.

In function wear_leveling_worker, instead of adding back the leb for scru=
bbing again we are adding that to the protect queue to avoid wear-levelin=
g of this LEB.  So in the current implementation we are losing the leb wh=
ich needs to be scrubbed unless upper layer issues a read for that LEB ag=
ain and we get the bit-flip again, in that case code is removing the LEB =
from the protect queue and scheduling a scrubbing.

When we used leb_write_lock instead of leb_write_trylock() then we are se=
eing matching erase-call for the bit-flips.

So, we are currently thinking 2 possible approaches to fix this:
1. Use leb_write_lock instead of leb_write_trylock(), but leb_write_trylo=
ck was used to avoid contention. Will adding back will have side-effect ?=

2. Add the leb again in the scrubbing list for scrubbing. There is alread=
y code for the same in the implementation, (in out_not_moved case where s=
crubbed=3D1 if condition),  but since we have set protect=3D1 we won't go=
=20in this condition.   We are thinking to return two different error cod=
e from the eba_copy_leb base for two different cases in the function (one=
=20where volume is removed and another is contention).  And only in case =
of contention set scrubbing=3D1 and call goto out_not_moved which will ad=
d this LEB for scrubbing again.

Which approach we should use in our system ? As we want to guarantee if t=
here is a bit-flip, ubi handles it properly in our system.

Thanks!
Bhavesh

-------------------------------------------------------------------------=
----------
This email message is for the sole use of the intended recipient(s) and m=
ay contain
confidential information.  Any unauthorized review, use, disclosure or di=
stribution
is prohibited.  If you are not the intended recipient, please contact the=
=20sender by
reply email and destroy all copies of the original message.
-------------------------------------------------------------------------=
----------
