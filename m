Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XoHcq-0000lq-PZ
 for linux-mtd@lists.infradead.org; Tue, 11 Nov 2014 20:01:17 +0000
Message-ID: <54626AF4.4090306@nod.at>
Date: Tue, 11 Nov 2014 21:00:52 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: gpmi: Remove noisy error message
References: <1415721691-14073-1-git-send-email-fabio.estevam@freescale.com>	<CAFLxGvwgy-+5K63re678JwcSy2-bNRtDHXiW-1Ve+1En5xHFYg@mail.gmail.com>
 <CAOMZO5A2JJ+HAomy6qDZ6xLf2Bep8R6Jd7O5+N2GkQvtHhm8fg@mail.gmail.com>
In-Reply-To: <CAOMZO5A2JJ+HAomy6qDZ6xLf2Bep8R6Jd7O5+N2GkQvtHhm8fg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 11.11.2014 um 20:57 schrieb Fabio Estevam:
> On Tue, Nov 11, 2014 at 5:45 PM, Richard Weinberger
> <richard.weinberger@gmail.com> wrote:
>> On Tue, Nov 11, 2014 at 5:01 PM, Fabio Estevam
>> <fabio.estevam@freescale.com> wrote:
>>> mx28evk board has a socket for NAND flash that comes with no NAND flash
>>
>> Wouldn't it make more sense to fix your board's devicetree/boardfile
>> to not load the gpmi driver?
> 
> Then the people who populated the NAND flash in the socket would not
> be able to use the NAND driver.

By fixing your devicetree/boardfile I meant fixing *your* devicetree/boardfile
for *your* board and not for all others. :-)

Thanks,
//richard
