Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19AvAJ-0003YS-JO
	for <linux-mtd@lists.infradead.org>; Wed, 30 Apr 2003 18:14:43 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HE600B9I2JYEV@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Wed, 30 Apr 2003 19:14:23 +0200 (MEST)
Date: Wed, 30 Apr 2003 20:13:41 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <000d01c30f39$3a05d880$1a00a8c0@itc.intrinsyc.com>
To: Alex Samoutin <samoutin@hotbox.ru>, Thayne Harbaugh <tharbaugh@lnxi.com>
Message-id: <200304302013.41845.tglx@linutronix.de>
MIME-version: 1.0
References: <000d01c3090a$4b822850$1a00a8c0@itc.intrinsyc.com>
 <1051312243.1172.388.camel@tubarao>
 <000d01c30f39$3a05d880$1a00a8c0@itc.intrinsyc.com>
Content-type: text/plain; charset=windows-1251
Content-transfer-encoding: quoted-printable
cc: linux-mtd@lists.infradead.org
Subject: Re: Fw: corrupt my NAND flash device
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 30 April 2003 18:54, Alex Samoutin wrote:

> Yes I had absolutely the same problem. Some times first write command w=
as
> ignored, but second always successful. However I have no problem with e=
rase
> operations, only write some times was ignored.
>
> (For Thomas) It=92s not a bad H/W or incorrect timing. I=92ve played wi=
th
> timing and result was the same. Also I have 5 boards with Toshiba NAND =
chip
> and 2 of them are working fine without retry, but other 3 need retry fo=
r
> normal operation.

What timing params did you play with ?
Are CLE/ALE connected to GPIO pins ?
Do you use a ready function, which reads the R/B hardware pin ?

Can you please check the following:=20

1. Add a delay into nand_wait and play with the time=20

--- nand.c=0914 Apr 2003 07:00:39 -0000=091.43
+++ nand.c=0930 Apr 2003 17:05:26 -0000
@@ -226,6 +226,8 @@
 =09=09this->hwcontrol (NAND_CTL_CLRALE);
 =09}
 =09
+=09udelay (500);
+=09
 =09/*=20
 =09 * program and erase have their own busy handlers=20
 =09 * status and sequential in needs no delay

2.. Report if that helps or changes anything

3. Remove the erase abort in nand_get_chip
--- nand.c=0914 Apr 2003 07:00:39 -0000=091.43
+++ nand.c=0930 Apr 2003 17:08:23 -0000
@@ -287,16 +287,6 @@
 =09=09return;
 =09}
=20
-=09if (this->state =3D=3D FL_ERASING) {
-=09=09if (new_state !=3D FL_ERASING) {
-=09=09=09this->state =3D new_state;
-=09=09=09spin_unlock_bh (&this->chip_lock);
-=09=09=09nand_select ();=09/* select in any case */
-=09=09=09this->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
-=09=09=09return;
-=09=09}
-=09}
-
 =09set_current_state (TASK_UNINTERRUPTIBLE);
 =09add_wait_queue (&this->wq, &wait);
 =09spin_unlock_bh (&this->chip_lock);

4.. Report if that helps or changes anything

Thanks

--=20
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
