Received: from gateway.prograde.net ([66.92.163.78] helo=sol.prograde.net)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PmUjy-00022I-Sx
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2011 17:19:09 +0000
Subject: Re: [PATCH] mtd: fix race in cfi_cmdset_0001 driver
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Type: text/plain; charset=us-ascii
From: Michael Cashwell <mboards@prograde.net>
In-Reply-To: <1297094831-10330-1-git-send-email-Joakim.Tjernlund@transmode.se>
Date: Mon, 7 Feb 2011 12:20:06 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <4E2BA31F-0468-4CA0-BB9B-89A004B98FC3@prograde.net>
References: <1297094831-10330-1-git-send-email-Joakim.Tjernlund@transmode.se>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Cc: Stefan Bigler <stefan.bigler@keymile.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Feb 7, 2011, at 11:07 AM, Joakim Tjernlund wrote:

> As inval_cache_and_wait_for_operation() drop and reclaim the lock
> to invalidate the cache, some other thread may suspend the operation
> before reaching the for(;;) loop. Therefore the loop must start with
> checking the chip->state before reading status from the chip.
>=20
> Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> ---
>=20
> David, I think this should go to Linus asap.
> Stefan and Michael, would be great if you could
> reply with a Acked-By: too.
>=20
> drivers/mtd/chips/cfi_cmdset_0001.c |   43 =
++++++++++++++++++-----------------
> 1 files changed, 22 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c =
b/drivers/mtd/chips/cfi_cmdset_0001.c
> index e89f2d0..9772a62 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> @@ -1245,10 +1245,32 @@ static int inval_cache_and_wait_for_operation(
> 	sleep_time =3D chip_op_time / 2;
>=20
> 	for (;;) {
> +		if (chip->state !=3D chip_state) {
> +			/* Someone's suspended the operation: sleep */
> +			DECLARE_WAITQUEUE(wait, current);
> +			set_current_state(TASK_UNINTERRUPTIBLE);
> +			add_wait_queue(&chip->wq, &wait);
> +			mutex_unlock(&chip->mutex);
> +			schedule();
> +			remove_wait_queue(&chip->wq, &wait);
> +			mutex_lock(&chip->mutex);
> +			continue;
> +		}
> +
> 		status =3D map_read(map, cmd_adr);
> 		if (map_word_andequal(map, status, status_OK, =
status_OK))
> 			break;
>=20
> +		if (chip->erase_suspended && chip_state =3D=3D =
FL_ERASING)  {
> +			/* Erase suspend occured while sleep: reset =
timeout */
> +			timeo =3D reset_timeo;
> +			chip->erase_suspended =3D 0;
> +		}
> +		if (chip->write_suspended && chip_state =3D=3D =
FL_WRITING)  {
> +			/* Write suspend occured while sleep: reset =
timeout */
> +			timeo =3D reset_timeo;
> +			chip->write_suspended =3D 0;
> +		}
> 		if (!timeo) {
> 			map_write(map, CMD(0x70), cmd_adr);
> 			chip->state =3D FL_STATUS;
> @@ -1272,27 +1294,6 @@ static int inval_cache_and_wait_for_operation(
> 			timeo--;
> 		}
> 		mutex_lock(&chip->mutex);
> -
> -		while (chip->state !=3D chip_state) {
> -			/* Someone's suspended the operation: sleep */
> -			DECLARE_WAITQUEUE(wait, current);
> -			set_current_state(TASK_UNINTERRUPTIBLE);
> -			add_wait_queue(&chip->wq, &wait);
> -			mutex_unlock(&chip->mutex);
> -			schedule();
> -			remove_wait_queue(&chip->wq, &wait);
> -			mutex_lock(&chip->mutex);
> -		}
> -		if (chip->erase_suspended && chip_state =3D=3D =
FL_ERASING)  {
> -			/* Erase suspend occured while sleep: reset =
timeout */
> -			timeo =3D reset_timeo;
> -			chip->erase_suspended =3D 0;
> -		}
> -		if (chip->write_suspended && chip_state =3D=3D =
FL_WRITING)  {
> -			/* Write suspend occured while sleep: reset =
timeout */
> -			timeo =3D reset_timeo;
> -			chip->write_suspended =3D 0;
> -		}
> 	}
>=20
> 	/* Done and happy. */

Acked-by: Michael Cashwell <mboards@prograde.net>

-Mike
