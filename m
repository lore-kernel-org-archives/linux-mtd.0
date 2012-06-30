Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sl3sn-0002wU-59
 for linux-mtd@lists.infradead.org; Sat, 30 Jun 2012 20:03:06 +0000
Received: by werb13 with SMTP id b13so50515wer.36
 for <linux-mtd@lists.infradead.org>; Sat, 30 Jun 2012 13:03:01 -0700 (PDT)
Date: Sat, 30 Jun 2012 23:02:52 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [RFC] nand_btt : use nand chip->block_bad
Message-ID: <20120630230252.58ca6bb4@halley>
In-Reply-To: <4FED6A2E.9010603@parrot.com>
References: <1340898442-1585-1-git-send-email-matthieu.castet@parrot.com>
 <20120628213146.7d929204@halley> <4FED6A2E.9010603@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, 29 Jun 2012 10:41:18 +0200 Matthieu CASTET <matthieu.castet@parrot.com> wrote:
> > - The new scheme lacks the potential error correction offered by the
> >   mtd_read_oob call (invoked from the original scan functions).
> >   OTOH, currently, AFAIK, it is only offered by an out-of-tree driver.
> Could you explain more here ?
> The current scheme doesn't handle bitflip in bad block. We don't care about
> error correction : bad block are not protected by ecc !

I was refering to utilizing the ECC when reading the OOB, so we won't
get a false "bad" indication when reading the BBM from the OOB.

See this post (and subsequent ones):
http://lists.infradead.org/pipermail/linux-mtd/2012-June/042203.html

Regards,
Shmulik
