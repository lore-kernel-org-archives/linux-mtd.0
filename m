Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SjWlL-0001J4-L2
 for linux-mtd@lists.infradead.org; Tue, 26 Jun 2012 14:29:04 +0000
Date: Tue, 26 Jun 2012 16:28:55 +0200
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: Re: UBIFS: unlink failure
Message-ID: <20120626162855.7934f0fa@spider.haslach.nod.at>
In-Reply-To: <1340720760.3119.142.camel@sauron.fi.intel.com>
References: <332997dc8907401d45f417c18fd2aace@radon2.swed.at>
 <1340720760.3119.142.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Tue, 26 Jun 2012 17:26:00 +0300
schrieb Artem Bityutskiy <dedekind1@gmail.com>:

> On Tue, 2012-06-12 at 23:56 +0200, Richard Weinberger wrote:
> >         dd if=/dev/urandom of=/mnt/x bs=1M count=1
> >         dd if=/dev/urandom of=/mnt/x bs=1M count=2
> >         dd if=/dev/urandom of=/mnt/x bs=1M count=10
> >         dd if=/dev/urandom of=/mnt/x bs=1M count=30
> >         rm x
> 
> rm /mnt/x, not rm x. Then it works.

Hmmmmmmmmmm, I quite sure this is just a typo in the mail.
Anyway, I'll retest :-D

Thanks,
//richard
