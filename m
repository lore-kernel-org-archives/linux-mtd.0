Received: from smtp.transmode.se ([31.15.61.139])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ze1wA-0005lF-U7
 for linux-mtd@lists.infradead.org; Mon, 21 Sep 2015 14:19:23 +0000
Received: from exch1.transmode.se (exch1.transmode.se [192.168.201.16])
 by smtp.transmode.se (Postfix) with ESMTP id 259981187150
 for <linux-mtd@lists.infradead.org>; Mon, 21 Sep 2015 16:11:07 +0200 (CEST)
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: bug/race in mtdchar device?
Date: Mon, 21 Sep 2015 14:11:06 +0000
Message-ID: <1442844665.29498.18.camel@transmode.se>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <21FB3A3ADDF8E6438273DCE2C28E99DE@transmode.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Trying to find a falsh corretion bug I stumbled onto this in mtdchar.c:
			/*
			  FIXME: Allow INTERRUPTIBLE. Which means
			  not having the wait_queue head on the stack.

			  If the wq_head is on the stack, and we
			  leave because we got interrupted, then the
			  wq_head is no longer there when the
			  callback routine tries to wake us up.
			*/
			ret =3D mtd_erase(mtd, erase);
			if (!ret) {
				set_current_state(TASK_UNINTERRUPTIBLE);
				add_wait_queue(&waitq, &wait);
				if (erase->state !=3D MTD_ERASE_DONE &&
				    erase->state !=3D MTD_ERASE_FAILED)
					schedule();
				remove_wait_queue(&waitq, &wait);
				set_current_state(TASK_RUNNING);

				ret =3D (erase->state =3D=3D MTD_ERASE_FAILED)?-EIO:0;
			}
			kfree(erase);

Is the FIXME comment correct? If so, should not init_waitqueue_head(&waitq)=
 be
moved to after set_current_state(TASK_UNINTERRUPTIBLE) ?

Also, it feels a bit odd that mtd_erase is called before setting up the wai=
t queue
as mtd_erase can call the callback before returning.

I am contemplating a changing the code into:
			set_current_state(TASK_UNINTERRUPTIBLE);
			init_waitqueue_head(&waitq);
			add_wait_queue(&waitq, &wait);
			ret =3D mtd_erase(mtd, erase);
			if (ret) {
				remove_wait_queue(&waitq, &wait);
				set_current_state(TASK_RUNNING);
				kfree(erase);
				return ret;
			}
			schedule(); /* Wait for erase to finish. */
			remove_wait_queue(&waitq, &wait);
			ret =3D (erase->state =3D=3D MTD_ERASE_FAILED) ? -EIO : 0;
			kfree(erase);

Does that make sense?

 Jocke
