Received: from 50.23.254.54-static.reverse.softlayer.com ([50.23.254.54]
	helo=softlayer.compulab.co.il)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTqgS-0003h1-P4
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 07:26:41 +0000
Message-ID: <4DEDD2A3.8030408@compulab.co.il>
Date: Tue, 07 Jun 2011 10:26:27 +0300
From: Igor Grinberg <grinberg@compulab.co.il>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: generalized error messages with __func__
References: <1306360741-12770-1-git-send-email-computersforpeace@gmail.com>	<4DDDE19D.9010505@compulab.co.il>	<1306387008.2785.138.camel@localhost>	<BANLkTimsTWAcR4HgOoHguDMv9P-Eox=kbg@mail.gmail.com>	<1306924235.4405.102.camel@localhost>
	<BANLkTi=BYeQ+cBMpRodDDY_KapjEoHVA+A@mail.gmail.com>
In-Reply-To: <BANLkTi=BYeQ+cBMpRodDDY_KapjEoHVA+A@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/01/11 21:37, Brian Norris wrote:

> On Wed, Jun 1, 2011 at 3:30 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>>> or should we define our own pr_fmt in include/linux/mtd.h?
>> Yes, before you include files.
> Well, I've tried this, and as I suspected, I can't just include it in
> mtd.h at the top, since we can't guarantee that <linux/mtd/mtd.h> is
> going to be the first included header in other files. Specifically, in
> include/linux/mtd/nand.h, we include other headers before mtd.h and so
> printk.h has already defined pr_fmt() for us, so this doesn't work.
> I'm not sure if there's a nice place to define pr_fmt() right now...

You should not define pr_fmt() in .h file.
pr_fmt() should be defined in _.c_ file at the top - _before any include is done_.
And yes, like Artem already said, _only_ in those _.c_ files where we want to use it.


-- 
Regards,
Igor.
