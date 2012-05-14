Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SU0wP-00089d-UT
 for linux-mtd@lists.infradead.org; Mon, 14 May 2012 19:28:22 +0000
Message-ID: <4FB15CD2.3040202@newsguy.com>
Date: Mon, 14 May 2012 12:28:18 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: Regarding latest EUCLEAN/bitflip_threshold patchset
References: <20120509132613.40db5533@pixies.home.jungo.com>
 <1336737075.2625.52.camel@sauron.fi.intel.com> <4FAEADF1.50308@newsguy.com>
In-Reply-To: <4FAEADF1.50308@newsguy.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Shmulik, still no joy.  Pasting from the archives again...


> No idea why this happens, others seem to get my posts...


Clearly.  Otherwise you'd be talking to yourself a lot :)


> I see.
> So the current bitflip_threshold scheme is probably not applicable to
> 'nand_do_read_oob' - because the strength over the OOB would probably
> differ from the page's ECC strength.


Correct.  So if for example the diskonchip docg4 implements hamming in oob, and
there are two bitflips, that's uncorrectible.  But two bitflips would not be
considered indicative of a block going bad for a full page read.


> Well, I was also surprised to see that 'nand_do_read_oob' may return
> EUCLEAN or EBADMSG at all.


Yeah, I chose to just gloss over that.


> Digging further, I found out it was a relatively recent addition:
> [041e4575 mtd: nand: handle ECC errors in OOB] by Brian Norris.


Hmmm...

Thanks,
Mike
