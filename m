Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHr9t-0007uk-RI
 for linux-mtd@lists.infradead.org; Wed, 31 Oct 2018 14:07:51 +0000
Date: Wed, 31 Oct 2018 10:07:33 -0400
From: Sasha Levin <sashal@kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [4.4/4.9/4.14 patch] mtd: spi-nor: Add support for is25wp series
 chips
Message-ID: <20181031140733.GJ194472@sasha-vm>
References: <20181020194442.13769-1-bunk@kernel.org>
 <20181021071117.GA11176@kroah.com>
 <20181021074331.GA8410@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20181021074331.GA8410@localhost>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Oct 21, 2018 at 10:43:31AM +0300, Adrian Bunk wrote:
>On Sun, Oct 21, 2018 at 09:11:17AM +0200, Greg KH wrote:
>> On Sat, Oct 20, 2018 at 10:44:42PM +0300, Adrian Bunk wrote:
>> > From: Kimmo Rautkoski <ext-kimmo.rautkoski@vaisala.com>
>> >
>> > Added support for is25wp032, is25wp064 and is25wp128.
>> >
>> > Signed-off-by: Kimmo Rautkoski <ext-kimmo.rautkoski@vaisala.com>
>> > Reviewed-by: Marek Vasut <marek.vasut@gmail.com>
>> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
>> > [ Adrian Bunk: Trivial adaption to changed context. ]
>> > Signed-off-by: Adrian Bunk <bunk@kernel.org>
>> > ---
>> >  drivers/mtd/spi-nor/spi-nor.c | 6 ++++++
>> >  1 file changed, 6 insertions(+)
>>
>> What is the git commit id of this patch in Linus's tree?
>
>Apologies for forgetting that, it is
>d616f81cdd2a21edfa90a595a4e9b143f5ba8414

I've queued this patch for 4.14, 4.9, and 4.4. Thank you.

--
Thanks,
Sasha
