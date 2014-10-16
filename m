Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XejHC-0002uA-Q6
 for linux-mtd@lists.infradead.org; Thu, 16 Oct 2014 11:31:27 +0000
Message-ID: <1413459035.7906.202.camel@sauron.fi.intel.com>
Subject: Re: UBI: ignore/overwrite old data/PEBs after flashing
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Thu, 16 Oct 2014 14:30:35 +0300
In-Reply-To: <CACna6ryuPpRuxjk3FA0kfq4VGpZfmZZhv6Py2KesSjXrCOqbHw@mail.gmail.com>
References: <CACna6rxapt_J8qjMb37UnQ5iFE3DJ06U8nok_Fw=RO5UHs6Vsg@mail.gmail.com>
 <CAFLxGvzCAaixC6ahfqRfr+7SRrrrrQ8ubA3WrfqzCPwfLP=tOg@mail.gmail.com>
 <CACna6ryuPpRuxjk3FA0kfq4VGpZfmZZhv6Py2KesSjXrCOqbHw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 Felix Fietkau <nbd@openwrt.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-10-16 at 12:21 +0200, Rafał Miłecki wrote:
> I tried to explain everything, but ofc forgot about this.
> 
> The answer is:
> vol_flags=autoresize
> I create much bigger MTD partition, because I want UBI to resize my
> partition (to let user use whole flash space).

Yes, that's the feature you may find convenient, but you still need to
get rid of the "rubbish". Otherwise the UBI driver won't even reach the
code where it handles the 'autoresize' flag.
