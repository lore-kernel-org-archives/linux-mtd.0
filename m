Received: from sender-of-o51.zoho.com ([135.84.80.216])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fMIBm-0006h3-Re
 for linux-mtd@lists.infradead.org; Fri, 25 May 2018 19:15:48 +0000
Date: Sat, 26 May 2018 00:45:32 +0530
From: Siddharth Chandrasekaran <siddharth@embedjournal.com>
To: "Richard Weinberger" <richard.weinberger@gmail.com>
Cc: "linux-mtd" <linux-mtd@lists.infradead.org>,
 "David Oberhollenzer" <goliath@sigma-star.at>,
 "Marek Vasut" <marek.vasut@gmail.com>
Message-ID: <16398ba3c2c.f0e4914a66261.6166838610145608343@embedjournal.com>
In-Reply-To: <CAFLxGvyqovAqRi957gAEe+hBzMr_im2x3CWo+M5-ptaeyMKhjg@mail.gmail.com>
References: <1638856b945.101c6b59a6973.7576653443668587481@embedjournal.com>
 <CAFLxGvyqovAqRi957gAEe+hBzMr_im2x3CWo+M5-ptaeyMKhjg@mail.gmail.com>
Subject: Re: NOR Flash Test Utility
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 > On Fri, 25 May 2018 01:49:15 +0530 Richard Weinberger 
 > <richard.weinberger@gmail.com> wrote:
 > Sid, 
 >  
 > On Tue, May 22, 2018 at 4:52 PM, Siddharth Chandrasekaran 
 > <siddharth@embedjournal.com> wrote: 
 > > Hello, 
 > > 
 > > I'm trying to test some NOR flashes to for manufacturing defects. I see there 
 > > is a test utility that reads and writes sequentially for NAND flash under 
 > > `nand-utils`, but `nor-utils` doesn't seem to have anything similar. 
 > > 
 > > Where can I find one for NOR? If I have to write my own, will you be interested 
 > > in a patch? 
 >  
 > I'm not aware of a NOR specific test, what properties do you want to test? 

For now, I have some basic write-and-verify operation with an option to preserve
existing data. Do you have any particular property you might be interested in
testing? If so, I can put that in too.

 > Non-NAND mtd tests should do the job.

Really? can you point me to something  specific?

 > Is it SPI-NOR? 

No, the one I have a parallel NOR.

 >  
 > Maybe Marek has some input. 
 > Patches for new test tools are, of course, very welcome! 
 >

Thanks!
