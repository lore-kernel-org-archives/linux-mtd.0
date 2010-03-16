Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NrQSA-0003Q5-Vs
	for linux-mtd@lists.infradead.org; Tue, 16 Mar 2010 06:40:39 +0000
Subject: Re: running mtd_stresstest
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Murali N <nalajala.murali@gmail.com>
In-Reply-To: <630851df1003152332v69c49385g10e9202a0b5c0147@mail.gmail.com>
References: <630851df1003152332v69c49385g10e9202a0b5c0147@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 16 Mar 2010 08:41:08 +0200
Message-ID: <1268721668.20017.38.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Tue, 2010-03-16 at 12:02 +0530, Murali N wrote:
> Hi,
> I am trying to run 'mtd_stresstest' on my nand driver.But it is
> failing currently.
> I have a query that what is the size of the "len" that is being
> request while read/write data in this test case?
> As far my understanding it is not generating the 'len' ( rand_len() )
> as multiple of underlying flash page size!!!
> My driver assumes/expected the 'len' field as multiple size of pages?
> To make it run the "mtd_stresstest" on my driver do i need tweak the code?
> Is test should pass ( without making any modifications ) on nand
> driver which is compliance to the MTD specification?
> 
> can anyone clarify my doubts

Please, fix your driver.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
