Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ckp3V-0000w4-9N
 for linux-mtd@lists.infradead.org; Mon, 06 Mar 2017 09:35:51 +0000
Subject: Re: [PATCH] ubifs: fix RENAME_WHITEOUT support
To: Felix Fietkau <nbd@nbd.name>, linux-mtd@lists.infradead.org
References: <20170306090425.61855-1-nbd@nbd.name>
From: Richard Weinberger <richard@nod.at>
Message-ID: <ed7c16ef-108a-bf57-2df5-f988d52fefa3@nod.at>
Date: Mon, 6 Mar 2017 10:35:22 +0100
MIME-Version: 1.0
In-Reply-To: <20170306090425.61855-1-nbd@nbd.name>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 06.03.2017 um 10:04 schrieb Felix Fietkau:
> Remove faulty leftover check in do_rename(), apparently introduced in a
> merge that combined whiteout support changes with commit f03b8ad8d386
> ("fs: support RENAME_NOREPLACE for local filesystems")

Good find, thank you Felix.

> Fixes: 9e0a1fff8db5 ("ubifs: Implement RENAME_WHITEOUT")

Why not f03b8ad8d386?
This commit adds the check and I oversaw that. ;-\

Thanks,
//richard
