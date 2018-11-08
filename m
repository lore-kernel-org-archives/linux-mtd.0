Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKlLq-00026F-D3
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2018 14:32:07 +0000
From: Richard Weinberger <richard@nod.at>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: linux-mtd@lists.infradead.org, juergen.lachmann@harman.com,
 linux-kernel@vger.kernel.org, thomas.roeder@harman.com
Subject: Re: [PATCH 2/2] ubi: Expose the bitrot interface
Date: Thu, 08 Nov 2018 15:31:53 +0100
Message-ID: <3899237.k0VKClGc8u@blindfold>
In-Reply-To: <20181108152642.03178c6c@bbrezillon>
References: <20181107221619.32498-1-richard@nod.at>
 <20181107221619.32498-2-richard@nod.at> <20181108152642.03178c6c@bbrezillon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Donnerstag, 8. November 2018, 15:26:42 CET schrieb Boris Brezillon:
> On Wed,  7 Nov 2018 23:16:19 +0100
> Richard Weinberger <richard@nod.at> wrote:
> 
> > +/**
> > + * ubi_bitflip_check - Check an eraseblock for bitflips and scrub it if needed.
> > + * @ubi: UBI device description object
> > + * @pnum: the physical eraseblock to schedule
> > + * @force_scrub: force scrubbing if non-zero, schedule erase otherwise
> 
> Are you sure about the "schedule erase otherwise"? I'd say force_scrub
> only influence when the scrub operation is done: either unconditionally
> or depending on the result of ubi_io_read().

True. As often, code and documentation diverged a little.

Thanks,
//richard
