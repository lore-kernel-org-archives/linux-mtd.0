Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAUz7-0007BY-Vo
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2018 06:30:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Mon, 23 Apr 2018 11:59:46 +0530
From: Abhishek Sahu <absahu@codeaurora.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Archit Taneja
 <architt@codeaurora.org>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Andy Gross <andy.gross@linaro.org>, Brian
 Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 4/9] mtd: nand: qcom: fix null pointer access for erased
 buffer detection
In-Reply-To: <20180422182532.221747b6@xps13>
References: <1522845745-6624-1-git-send-email-absahu@codeaurora.org>
 <1522845745-6624-5-git-send-email-absahu@codeaurora.org>
 <20180410111220.3873a24c@xps13>
 <d201308d57317ff7d37d7169d7985d76@codeaurora.org>
 <20180422182532.221747b6@xps13>
Message-ID: <3699eb1ef15c63a4ea1490be7308d3dd@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2018-04-22 21:55, Miquel Raynal wrote:
> Hi Abhishek,
> 
> On Thu, 12 Apr 2018 12:24:16 +0530, Abhishek Sahu
> <absahu@codeaurora.org> wrote:
> 
>> On 2018-04-10 14:42, Miquel Raynal wrote:
>> > Hi Abhishek,
>> > > On Wed,  4 Apr 2018 18:12:20 +0530, Abhishek Sahu
>> > <absahu@codeaurora.org> wrote:
>> > >> parse_read_errors can be called with only oob buf also in which
>> >> case data_buf will be NULL.  If data_buf is NULL, then don’t
>> >> treat this page as completely erased in case of ECC uncorrectable
>> >> error.
>> >> >> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
>> >> ---
>> >>  drivers/mtd/nand/qcom_nandc.c | 7 +++++--
>> >>  1 file changed, 5 insertions(+), 2 deletions(-)
>> >> >> diff --git a/drivers/mtd/nand/qcom_nandc.c >> b/drivers/mtd/nand/qcom_nandc.c
>> >> index 57c16a6..0ebcc55 100644
>> >> --- a/drivers/mtd/nand/qcom_nandc.c
>> >> +++ b/drivers/mtd/nand/qcom_nandc.c
>> >> @@ -1607,9 +1607,11 @@ static int parse_read_errors(struct >> qcom_nand_host *host, u8 *data_buf,
>> >>  			if (host->bch_enabled) {
>> >>  				erased = (erased_cw & ERASED_CW) == ERASED_CW ?
>> >>  					 true : false;
>> > > Why the parse_read_errors() function could not be called without
>> > data_buf when using BCH? Are you sure the situation can only happen
>> > without it?
>> >
>>    host->bch_enabled case is different where controller itself tells
>>    regarding erased page in status register.
>> 
>> > Would the following apply here too, with a:
>> >
>>   erased_chunk_check_and_fixup will be used only for 4 bit RS ECC
>>   code in which there is no support from HW for erased page detection
>>   and we need to check few data bytes value.
> 
> So please explain this with a comment.
> 
> Thanks,
> Miquèl

  Sure Miquel.
  I will do the same and update the patch with more comments.

  Thanks,
  Abhishek
