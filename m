Received: from mail-eopbgr10138.outbound.protection.outlook.com
 ([40.107.1.138] helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1elZEu-00035N-UU
 for linux-mtd@lists.infradead.org; Tue, 13 Feb 2018 11:59:15 +0000
Subject: Re: UBI assert failed in ubi_wl_init
To: Richard Weinberger <richard@sigma-star.at>
References: <50443554-3f18-ce1b-70e7-a8092b39f5f5@exertus.fi>
 <CAFLxGvwhwy8_1piyn6WnS1XsD-eifc55C8nCsv8Eh5mmLz1GMg@mail.gmail.com>
 <eb4fbb3b-897d-458e-6e0b-5cdc8599be48@exertus.fi>
 <2543021.LZhlqz2gkU@blindfold>
Cc: linux-mtd@lists.infradead.org
From: Timo Ketola <timo@exertus.fi>
Message-ID: <b5eb17b7-14f1-7ec4-a590-d486dd0b89b6@exertus.fi>
Date: Tue, 13 Feb 2018 13:58:50 +0200
MIME-Version: 1.0
In-Reply-To: <2543021.LZhlqz2gkU@blindfold>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 13.02.2018 00:49, Richard Weinberger wrote:
> I meant the image _after_ UBI failed to place the fastmap. :)

Argh, sorry, shame on me.

https://drive.google.com/open?id=1t-auduKG2bwzpzZf09rV4O9F7GUN2viJ

https://drive.google.com/open?id=1ahKl8pf3svKQSvz6VQ-7xUQsyfkVuO7k

The first one is taken after the first boot and the second after the
second boot.

I took them with:

# dd if=/dev/mtd1 of=/media/sda1/ubi1.bin bs=1M

--

Timo
