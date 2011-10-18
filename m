Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RG53j-0004QM-Dr
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2011 08:30:03 +0000
Date: Tue, 18 Oct 2011 10:29:55 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBIFS recovery fails
Message-ID: <20111018082955.GB5997@parrot.com>
References: <4E9C2DAC.7090109@swissonline.ch> <1318882668.2172.10.camel@koala>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1318882668.2172.10.camel@koala>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Daniel Kuhn <cheeef@swissonline.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 17, 2011 at 09:17:48PM +0100, Artem Bityutskiy wrote:
> 
> If someone wants to see UBIFS 100% or near 100% power-cut safe on
> MLC or one of shitty modern SLCs - he needs to invest men-hours.
> I can help by suggesting and reviewing. Although the funny thing is
> that eMMCs die and lose data in case of power cuts very often :-)

Hi Artem,

That's interesting... Do you have more details or any data on those eMMC
power-cut failures ?

I plan to be working soon (December) on UBIFS robustness issues with unstable
modern SLCs; besides using nandsim to simulate SLC (and maybe MLC) issues,
I also have real hardware with a power-cutting framework ready for testing.

Best Regards,
--
Ivan
