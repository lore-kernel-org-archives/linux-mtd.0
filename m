Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SgnQc-0005MB-Pz
 for linux-mtd@lists.infradead.org; Tue, 19 Jun 2012 01:40:23 +0000
Message-ID: <4FDFD876.2000606@newsguy.com>
Date: Mon, 18 Jun 2012 18:40:06 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] mtd: nand: Use the mirror BBT descriptor when reading
 its version
References: <20120610135812.01dce4e7@pixies.home.jungo.com>
 <CAN8TOE_Li5bysfUS_MPPaBOF-vC64s3j-feTqfUJQsR6c_yb+A@mail.gmail.com>
 <1339497736.2401.24.camel@sauron.fi.intel.com>
 <CAN8TOE9icRO8t_qwn-k3R+Q1y1X39-PZU=devSW07YpDW_KqNQ@mail.gmail.com>
 <1340017963.2420.29.camel@sauron.fi.intel.com>
In-Reply-To: <1340017963.2420.29.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/18/2012 04:12 AM, Artem Bityutskiy wrote:
> Let's probe Mike and Robert and see what they say.


To be honest, I did not pay much attention to the NAND_BBT_ABSPAGE code path.
The docg4 uses the oob marker scheme for marking bad blocks, though it also has
a read-only "factory" bbt...


>>>> <shmulik.ladkani@gmail.com> wrote:
>>>>> - Not runtime tested.
>>>>
>>>> Patch looks fine, but this makes me curious: does anyone use
>>>> NAND_BBT_ABSPAGE? It looked broken to me when I tried it not too long
>>>> ago, but I didn't look too deeply. (I doubt that this typo was its
>>>> only problem, but I may try again...)


As Robert pointed out, docg3 and docg4 ship with a read-only factory bbt at a
fixed location.  If this is what NAND_BBT_ABSPAGE refers to, the docg4 doesn't
use it.  For one thing, I assumed that the format of the table on the docg4
would be different from what is assumed in the nand code for the
NAND_BBT_ABSPAGE case.  I also assumed (without much investigation) that the
fixed location table would be dynamically updated as bad blocks are detected
(which docg4 can't do), though doing this at a fixed location doesn't make much
sense now that I think about it.

FYI... in its probe function, the docg4 reads this factory bbt after
nand_scan_bbt() has built the memory-based bbt. (In the docg4 case,
nand_scan_bbt() builds a memory-based table by looking for the bb marker in the
oob bytes of the first page of each block.)  Then the docg4 driver ensures that
the memory based bbt includes the bad blocks marked in the factory bbt, and
updates it if not.  This, and the NAND_BBT_ABSPAGE code, can probably be
improved.  I'll take a closer look.

Thanks,
Mike
