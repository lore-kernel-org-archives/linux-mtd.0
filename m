Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YhLGR-0006wy-T4
 for linux-mtd@lists.infradead.org; Sun, 12 Apr 2015 17:01:44 +0000
Date: Sun, 12 Apr 2015 19:01:19 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 4/4] UBI: Implement bitrot checking
Message-ID: <20150412190119.7f0f7c64@bbrezillon>
In-Reply-To: <1427631197-23610-5-git-send-email-richard@nod.at>
References: <1427631197-23610-1-git-send-email-richard@nod.at>
 <1427631197-23610-5-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

After the 'coding style related'/'useless' comments, now comes a real
question related to the approach you've taken :-).

On Sun, 29 Mar 2015 14:13:17 +0200
Richard Weinberger <richard@nod.at> wrote:

[...]
> +
> +/**
> + * ubi_wl_trigger_bitrot_check - triggers a re-read of all physical erase
> + * blocks.
> + * @ubi: UBI device description object
> + */
> +void ubi_wl_trigger_bitrot_check(struct ubi_device *ubi)
> +{
> +	int i;
> +	struct ubi_wl_entry *e;
> +
> +	ubi_msg(ubi, "Running a full read check");
> +
> +	for (i = 0; i < ubi->peb_count; i++) {
> +		spin_lock(&ubi->wl_lock);
> +		e = ubi->lookuptbl[i];
> +		spin_unlock(&ubi->wl_lock);
> +		if (e) {
> +			atomic_inc(&ubi->bit_rot_work);
> +			schedule_bitrot_check(ubi, e);
> +		}
> +	}

Do we really need to create a ubi_work per PEB ?
Couldn't we create a single work being rescheduled inside the worker
function (after updating the ubi_wl_entry of course).

I'm pretty sure I'm missing something obvious that you'll probably
point out ;-).


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
