Received: from mx.dave-tech.it ([2.229.21.40])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ydj1N-0002LT-Ep
 for linux-mtd@lists.infradead.org; Thu, 02 Apr 2015 17:35:14 +0000
Message-ID: <551D7DB4.9010607@dave-tech.it>
Date: Thu, 02 Apr 2015 19:34:44 +0200
From: Andrea Scian <rnd4@dave-tech.it>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 4/4] UBI: Implement bitrot checking
References: <mailman.38750.1427638218.22890.linux-mtd@lists.infradead.org>
 <mailman.38750.1427638218.22890.linux-mtd.{0bb8c466-de6c-4e79-8b63-7fc7efaf6273}.0@lists.infradead.org>
 <1427631197-23610-5-git-send-email-richard@nod.at>
In-Reply-To: <1427631197-23610-5-git-send-email-richard@nod.at>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Richard,

Il 29/03/2015 14:13, Richard Weinberger ha scritto:
> +	mutex_lock(&ubi->buf_mutex);
> +	err = ubi_io_read(ubi, ubi->peb_buf, e->pnum, 0, ubi->peb_size);
> +	mutex_unlock(&ubi->buf_mutex);
> +	if (err == UBI_IO_BITFLIPS) {
> +		dbg_wl("found bitflips in PEB %d", e->pnum);
> +		spin_lock(&ubi->wl_lock);
> +

IIUC you trigger the action as soon as you have a bitflip error, is this
correct?

Isn't this too much conservative? You usually have a RBER on MLC devices
that's between 1E-7 (for brand new devices) and 1E-4 (for devices with
1k-2k P/E cycle after 100k-300k read-without-P/E)

Having a few bitflips on a block read is more that usual and current ECC
can correct more that 16 bit error over 512/1KiB.

WDYT?

Kind Regards,

-- 

Andrea SCIAN

DAVE Embedded Systems
