Received: from mail.kmu-office.ch ([178.209.48.109])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zqoe2-0006Wj-Q6
 for linux-mtd@lists.infradead.org; Mon, 26 Oct 2015 20:45:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Mon, 26 Oct 2015 13:44:03 -0700
From: Stefan Agner <stefan@agner.ch>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org, Bill Pringlemeir <bpringlemeir@nbsps.com>
Subject: Re: [RFC PATCH] mtd: nand: vf610_nfc: use
 nand_check_erased_ecc_chunk() helper
In-Reply-To: <20151026201252.GF13239@google.com>
References: <1443561116-139851-1-git-send-email-computersforpeace@gmail.com>
 <20150930185246.6bfdda29@bbrezillon> <20151026201252.GF13239@google.com>
Message-ID: <8912f810034ba89c5dcd8892566aa91b@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2015-10-26 13:12, Brian Norris wrote:
> On Wed, Sep 30, 2015 at 06:52:46PM +0200, Boris Brezillon wrote:
>> On Tue, 29 Sep 2015 14:11:56 -0700
>> Brian Norris <computersforpeace@gmail.com> wrote:
>>
>> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>> > ---
>> > I forgot about this feedback. How does this patch look? Just compile tested.
>>
>> Looks good to me, but I can't test it either :-).
>>
>> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> Seeing as this came up during review, and I see no objections...
> 
> Applied to l2-mtd.git

Hi Brian,

Yeah, sorry, I wanted test that patch but somehow slipped through.
Compiled l2-mtd master with that patch applied for my board, looks good
to me! Thx

--
Stefan
