Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S9YIt-0004lu-BV
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2012 08:51:00 +0000
Message-ID: <4F66F36E.9010102@parrot.com>
Date: Mon, 19 Mar 2012 09:50:54 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: [PATCH 0/3] MTD: Change meaning of -EUCLEAN return code on reads
References: <1331832353-15569-1-git-send-email-mikedunn@newsguy.com>
 <20120316111939.GA10362@parrot.com> <4F636964.3030904@newsguy.com>
 <20120316184345.GF10228@parrot.com> <4F64F17C.2070409@newsguy.com>
 <20120318100000.336c347d@pixies.home.jungo.com>
In-Reply-To: <20120318100000.336c347d@pixies.home.jungo.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Ivan Djelic <ivan.djelic@parrot.com>,
 Mike Dunn <mikedunn@newsguy.com>,
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

Shmulik Ladkani a écrit :
> Hi Mike,
> 

> The only immediate blocker for such a scheme would be those nand
> controller drivers, where the controller is responsible of the ECC
> correction, and it does not report per-step stats to the software.
> Are there any?
> (In that case, we have nothing else to do besides falling back to a
> per-page decision. For example, such driver's 'read_page' may return
> total_corrected_per_page/ecc.steps as an estimate of the number of
> per-step corrected bits, or alike)
No, they should return the worst case : max(total_corrected_per_page, ecc.strength).
Otherwise you have the same problem : case 2 in [1] will fail.
It is better to trigger false positive (do scrubbing) than having uncorrectable
error.


Matthieu


[1]
Consider the following situation:
- a NAND device with 2kB pages and 4 ecc steps per page (4 x 512 bytes)
- the driver has chip->ecc.strength = 4, and therefore mtd->ecc_strength = 16
- let's say mtd->bitflip_threshold = 16

The driver read() method could return a non-negative integer, say 4, in at least
the following cases:

1. During a single page read, each of the 4 ecc steps corrected 1 bit, with a
total variation of ecc_stats.corrected equal to 4.
=> no cleaning needed

2. During a single page read, 1 ecc step corrected 4 bits, the 3 other steps had
no correction to perform, with a total variation of ecc_stats.corrected equal
to 4.
=> cleaning is needed

In both cases, you will compare the same value 4 to mtd->bitflip_threshold (16)
and decide to return 0 (and not -EUCLEAN).
