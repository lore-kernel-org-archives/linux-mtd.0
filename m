Received: from mail-eopbgr20092.outbound.protection.outlook.com ([40.107.2.92]
 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1elb8I-0001GT-Ff
 for linux-mtd@lists.infradead.org; Tue, 13 Feb 2018 14:00:33 +0000
Subject: Re: UBI assert failed in ubi_wl_init
To: Richard Weinberger <richard@sigma-star.at>
Cc: linux-mtd@lists.infradead.org
References: <50443554-3f18-ce1b-70e7-a8092b39f5f5@exertus.fi>
 <2543021.LZhlqz2gkU@blindfold>
 <b5eb17b7-14f1-7ec4-a590-d486dd0b89b6@exertus.fi>
 <63275670.WCUj5TjS3v@blindfold>
From: Timo Ketola <timo@exertus.fi>
Message-ID: <180bb6ee-51db-ddff-207b-e76580dab687@exertus.fi>
Date: Tue, 13 Feb 2018 16:00:07 +0200
MIME-Version: 1.0
In-Reply-To: <63275670.WCUj5TjS3v@blindfold>
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

On 13.02.2018 14:42, Richard Weinberger wrote:
> So, this is not what you have described in your problem report.
> Can you please double check?

Hmm, how?

To get those images, I burned a fresh empty image again into the NAND.
On the first boot there was again in the dmesg this:


> [   18.804716] ubi1 error: ubi_update_fastmap: could not get any free erase block
> [   18.810745] ubi1 warning: ubi_update_fastmap: Unable to write new fastmap, err=-28

And then I took the first image. Then I rebooted and this time there was
in the dmesg this:

> [    4.231126] UBI assert failed in ubi_wl_init at 1666 (pid 1)

and backtrace. Then I took the second image.

Every boot after the first one generates the failed assertion into the
dmesg.

What should I do next?

--

Timo
