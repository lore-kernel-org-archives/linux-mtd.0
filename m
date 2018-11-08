Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKlGo-0003tL-4Z
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2018 14:26:55 +0000
Date: Thu, 8 Nov 2018 15:26:42 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, juergen.lachmann@harman.com,
 linux-kernel@vger.kernel.org, thomas.roeder@harman.com
Subject: Re: [PATCH 2/2] ubi: Expose the bitrot interface
Message-ID: <20181108152642.03178c6c@bbrezillon>
In-Reply-To: <20181107221619.32498-2-richard@nod.at>
References: <20181107221619.32498-1-richard@nod.at>
 <20181107221619.32498-2-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed,  7 Nov 2018 23:16:19 +0100
Richard Weinberger <richard@nod.at> wrote:

> +/**
> + * ubi_bitflip_check - Check an eraseblock for bitflips and scrub it if needed.
> + * @ubi: UBI device description object
> + * @pnum: the physical eraseblock to schedule
> + * @force_scrub: force scrubbing if non-zero, schedule erase otherwise

Are you sure about the "schedule erase otherwise"? I'd say force_scrub
only influence when the scrub operation is done: either unconditionally
or depending on the result of ubi_io_read().

> + *
> + * This function reads the given eraseblock and checks if bitflips occured.
> + * In case of bitflips, the eraseblock is scheduled for scrubbing.
> + * If scrubbing is forced with @force_scrub, the eraseblock is not read,
> + * but scheduled for scrubbing right away.
> + *
> + * Returns:
> + * %EINVAL, PEB is out of range
> + * %ENOENT, PEB is no longer used by UBI
> + * %EBUSY, PEB cannot be checked now or a check is currently running on it
> + * %EAGAIN, bit flips happened but scrubbing is currently not possible
> + * %EUCLEAN, bit flips happened and PEB is scheduled for scrubbing
> + * %0, no bit flips detected
> + */
> +int ubi_bitflip_check(struct ubi_device *ubi, int pnum, int force_scrub)
