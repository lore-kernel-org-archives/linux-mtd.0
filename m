Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dOSvf-0006am-TU
 for linux-mtd@lists.infradead.org; Fri, 23 Jun 2017 18:03:37 +0000
Subject: Re: [PATCH][mtd-next] mtd: parser: print hex size_t value using
 correct %zx printk format specifier
To: Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20170623090023.9482-1-colin.king@canonical.com>
 <e8cf8fb56ef0b56cca3dce61302a1099@milecki.pl>
 <20170623175124.GI14148@google.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
From: Colin Ian King <colin.king@canonical.com>
Message-ID: <c8049ec7-74c6-3a44-dbe3-b9f4b02c8666@canonical.com>
Date: Fri, 23 Jun 2017 19:03:11 +0100
MIME-Version: 1.0
In-Reply-To: <20170623175124.GI14148@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 23/06/17 18:51, Brian Norris wrote:
> On Fri, Jun 23, 2017 at 12:02:34PM +0200, Rafał Miłecki wrote:
>> On 2017-06-23 11:00, Colin King wrote:
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> Use %zx instead of %X for size_t variable offset, fixes build warning:
>>>
>>> warning: format '%X' expects argument of type 'unsigned int', but
>>> argument
>>> 2 has type 'size_t {aka long unsigned int}' [-Wformat=]
>>>
>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>
>> I sent similar patch few hours earlier:
>> [PATCH] mtd: parsers: trx: fix pr_err format for printing offset
>> https://patchwork.ozlabs.org/patch/779789/
>>
>> Brian: you may pick the one with nicer commit message, whichever one you
>> prefer :)
> 
> I'll go with:
> (a) the earlier one and
> (b) the one that doesn't change 'X' to 'x'
> 
> That means Rafał, you're our lucky winner today! Thanks for playing,
> Colin.

FYI, I used %zx rather than %zX as couldn't find any instances of it in
the kernel and I wasn't 100% sure if it was supported or not.

linux-next:

$ git grep "%zx" | wc -l
161

$ git grep "%zX" | wc -l
0

Colin

> 
> Regards,
> Brian
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
