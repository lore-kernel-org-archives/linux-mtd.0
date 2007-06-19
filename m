Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I0Ykp-0005Wt-CD
	for linux-mtd@lists.infradead.org; Tue, 19 Jun 2007 04:08:11 -0400
Subject: Re: [PATCH/RFC] oops and panic message logging to MTD
From: Artem Bityutskiy <dedekind@infradead.org>
To: Richard Purdie <rpurdie@openedhand.com>
In-Reply-To: <1182184301.6074.62.camel@localhost.localdomain>
References: <1182184301.6074.62.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Tue, 19 Jun 2007 11:07:35 +0300
Message-Id: <1182240455.4403.52.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-06-18 at 17:31 +0100, Richard Purdie wrote:
> +static int mtdoops_erase_block(struct mtd_info *mtd, int offset)
> +{
> +	struct erase_info erase;
> +	DECLARE_WAITQUEUE(wait, current);
> +	wait_queue_head_t wait_q;
> +	int ret;
> +
> +	init_waitqueue_head(&wait_q);
> +	erase.mtd =3D mtd;
> +	erase.callback =3D mtdoops_erase_callback;
> +	erase.addr =3D offset;
> +	if (mtd->erasesize < OOPS_PAGE_SIZE)
> +		erase.len =3D OOPS_PAGE_SIZE;
> +	else
> +		erase.len =3D mtd->erasesize;
> +	erase.priv =3D (u_long)&wait_q;
> +
> +	set_current_state(TASK_INTERRUPTIBLE);
> +	add_wait_queue(&wait_q, &wait);
> +
> +	ret =3D mtd->erase(mtd, &erase);
> +	if (ret) {
> +		set_current_state(TASK_RUNNING);
> +		remove_wait_queue(&wait_q, &wait);
> +		printk(KERN_WARNING "mtdoops: erase of region [0x%x, 0x%x] "
> +				     "on \"%s\" failed\n",
> +			erase.addr, erase.len, mtd->name);
> +		return ret;
> +	}
> +
> +	schedule();  /* Wait for erase to finish. */
> +	remove_wait_queue(&wait_q, &wait);
> +
> +	return 0;
> +}

Also, could you please use wait_event_interruptible() instead of
set_current_state() which looks better (indeed, you have wait queue, so
use wq calls).

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
