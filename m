Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkrUU-0001WX-Nr
 for linux-mtd@lists.infradead.org; Fri, 16 Sep 2016 11:39:35 +0000
Subject: Re: [PATCH v2 17/17] UBI: introduce the VID buffer concept
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
References: <1473087908-27862-1-git-send-email-boris.brezillon@free-electrons.com>
 <1473087908-27862-18-git-send-email-boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <d371d725-8bde-5347-445c-5849c22b5b7a@nod.at>
Date: Fri, 16 Sep 2016 13:38:27 +0200
MIME-Version: 1.0
In-Reply-To: <1473087908-27862-18-git-send-email-boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris,

On 05.09.2016 17:05, Boris Brezillon wrote:
> +/**
> + * ubi_get_vid_hdr - Get the VID header attached to a VID buffer
> + * @vidb: the VID buffer to free

Copy paste error?

> + */
> +static inline struct ubi_vid_hdr *ubi_get_vid_hdr(struct ubi_vid_io_buf *vidb)
> +{
> +	return vidb->hdr;

I guess in future there will be a second parameter to return the nth header located
on the buffer?

Thanks,
//richard
