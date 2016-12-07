Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEXVF-0008LI-FD
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2016 08:23:06 +0000
Subject: Re: Add --skip-all-ffs option to mtd-utils nandwrite
To: Marek Vasut <marek.vasut@gmail.com>, Kees Trommel
 <ctrommel@aimvalley.nl>, linux-mtd@lists.infradead.org
References: <82cbfdbc-c79b-01b0-bc64-a4259d7a150e@aimvalley.nl>
 <16abefc9-61e8-3b0d-c44c-6d02764ec8e9@sigma-star.at>
 <33437f45-d3e8-17ec-d5b0-0118d50ff6ec@aimvalley.nl>
 <cb18365f-4fe0-9e07-f7cc-6c2bf72018b3@sigma-star.at>
 <15c62cdb-38f7-76b8-b3fc-6b3c2766e9df@gmail.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <b2a82878-d9f8-f22b-1993-aeae926a0e40@sigma-star.at>
Date: Wed, 7 Dec 2016 09:21:26 +0100
MIME-Version: 1.0
In-Reply-To: <15c62cdb-38f7-76b8-b3fc-6b3c2766e9df@gmail.com>
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

On 12/07/2016 06:01 AM, Marek Vasut wrote:
> +               if (skipallffs)
> +               {
> +                       for (ii = 0; ii < mtd.min_io_size; ii +=
> sizeof(uint32_t))
> +                       {
> +                               if (*(uint32_t*)(writebuf + ii) !=
> 0xffffffff)
> +                                       break;
> 
> Is this memcmp()-alike function ?
> 
> +                       }
> +                       if (ii == mtd.min_io_size)
> +                               allffs = 1;
> +               }
> +               if (!allffs) {
The point of the patch is not to write a page that is filled with 0xFF bytes.
A feature that is turned off by default and can be activated via a command
line switch.

The code you are trying to replace tries to figure out if an entire block of
memory is set to 0xFF. The code path should be conditional, as this feature
is turned off unless explicitly requested.

> This could be simply turned to:
> 
> ret = 0;
> if (!memcmp(writebuf, writebuf + 1, mtd.min_io_size - 1)) {
>     ret = mtd_write(....);
> }
This does something completely different.
