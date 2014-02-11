Received: from mail-we0-x231.google.com ([2a00:1450:400c:c03::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDEEh-0004Uv-PI
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2014 14:22:57 +0000
Received: by mail-we0-f177.google.com with SMTP id t61so5683088wes.36
 for <linux-mtd@lists.infradead.org>; Tue, 11 Feb 2014 06:22:32 -0800 (PST)
Message-ID: <52FA3225.5010203@gmail.com>
Date: Tue, 11 Feb 2014 15:22:29 +0100
From: Boris BREZILLON <b.brezillon.dev@gmail.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [RFC PATCH] mtd: add per NAND partition ECC config
References: <1391855206-5974-1-git-send-email-b.brezillon.dev@gmail.com>
 <20140211140102.GB23150@localhost>
In-Reply-To: <20140211140102.GB23150@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

On 11/02/2014 15:01, Ezequiel Garcia wrote:
> Hi Boris,
>
> On Sat, Feb 08, 2014 at 11:26:46AM +0100, Boris BREZILLON wrote:
>> This patch aims to add per partition ECC config for NAND devices.
>> It defines a new field in the mtd struct to store the mtd ECC config and
>> thus each mtd partition device can store its config instead of using the
>> default NAND chip config.
>>
>> This feature is needed to support the sunxi boot0 paritition case:
>> Allwinner boot code (BROM) requires a specific HW ECC for its boot code
>> that may not fit the HW NAND requirements for the entire NAND chip.
>>
>> Signed-off-by: Boris BREZILLON <b.brezillon.dev@gmail.com>
>> ---
>> Hello,
>>
>> This patch is just a draft that implement per partition ECC config.
>> It's currently not properly splitted (it should be separated in several
>> patches) and not documented either.
>>
> Ah, ah...
>
>> There's at least one point that bother me in the current implementation:
>> I introduced DT notions in the nand core code by the mean of the get_ecc_ctrl
>> callback, and so far this was kept out of mtd/nand core code (I guess it was
>> on purpose).
>>
>> Please let me know if you see other drawbacks.
>>
>> If you think per partition ECC should not be implemented, could you help me
>> find a way to handle sunxi specific case decribed above ?
>>
>>   drivers/mtd/mtdpart.c          |   23 ++-
>>   drivers/mtd/nand/nand_base.c   |  428 ++++++++++++++++++++++++----------------
> I really appreciate your effort, but 428 changed lines is a too big and
> intrusive change. I must admit I'm not smart enough to review such patches.
>
> I honestly think you'll have better luck getting feedback if you take the time
> to properly split and document this.
>
> Yeah, it's annoying and time-consuming, but it's globally cheaper for you to
> invest time on making it easier for reviewers and maintainers, than for each
> of us to invest the time deciphering this :-)

Fair enough.

Anyway, this proposal does not work.

If nobody objects to this ECC per partition concept, I'll propose 
something else soon.
And this time I'll make a proper documentation and patch separation ;-).

Best Regards,

Boris

>
> Just my point of view, of course.
