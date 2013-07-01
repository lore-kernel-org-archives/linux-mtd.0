Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UtY80-00011s-G8
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2013 07:02:25 +0000
Message-ID: <1372662331.22014.27.camel@sauron.fi.intel.com>
Subject: Re: UBI leb_write_unlock NULL pointer Oops
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brent Taylor <motobud@gmail.com>
Date: Mon, 01 Jul 2013 10:05:31 +0300
In-Reply-To: <CAP+RiCCTo-_iH=bXuZMYY_BCMZjZzAkTB7Nm0_B0i2FErv+VAQ@mail.gmail.com>
References: <CAP+RiCCTo-_iH=bXuZMYY_BCMZjZzAkTB7Nm0_B0i2FErv+VAQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-05-13 at 18:09 -0500, Brent Taylor wrote:
> I'm working with an atmel at91sam9g20 evaluation board
> (http://www.atmel.com/Images/doc6413.pdf) running the Linux kernel
> version 3.6.9.  On two occasions I have had the following Oops
> reported:

Looks like some kind of memory corruption, or use after free. I do not
have other ideas.

Well, another comment I could give is that the LEB locking in UBI is
over-engineered, and could be simplified.

> I have found the ubifs-v3.6.git tree but since I'm using version
> 3.6.9, how can I easily apply all the patches from 3.6 to the current
> release since some of the patches seem to have already made it into
> the 3.6.9 release.

We discovered a bug recently which may cause memory corruptions. I do
not know if it is accountable for this problem or not, but it is worth
having it. See these patches in the l2-mtd.git tree:

605c912bb843c024b1ed173dc427cd5c08e5d54d UBIFS: fix a horrid bug
33f1a63ae84dfd9ad298cf275b8f1887043ced36 UBIFS: prepare to fix a horrid bug

-- 
Best Regards,
Artem Bityutskiy
