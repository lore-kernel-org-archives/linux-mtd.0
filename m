Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WR9Jn-0005QM-6k
 for linux-mtd@lists.infradead.org; Fri, 21 Mar 2014 23:57:44 +0000
Message-ID: <532CD1CB.4070707@nod.at>
Date: Sat, 22 Mar 2014 00:56:59 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Mike Snitzer <snitzer@redhat.com>
Subject: Re: [RFC PATCH] UBI: fix rb_tree node comparison in add_map
References: <20140321195403.GA32529@redhat.com>
In-Reply-To: <20140321195403.GA32529@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 21.03.2014 20:54, schrieb Mike Snitzer:
> The comparisons used in add_vol() shouldn't be identical.  Pretty sure
> the following is correct but it is completely untested.
> 
> Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> ---
>  drivers/mtd/ubi/fastmap.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> NOTE: I stumbled upon this code while implementing some rb_tree code
>       (and looking for some existing rb_tree code as a reference).

Thanks a lot for pointing this out!

Acked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
