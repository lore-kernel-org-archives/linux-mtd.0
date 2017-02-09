Received: from smtpout.microchip.com ([198.175.253.82]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbp7B-0001s8-RJ
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2017 13:50:27 +0000
Subject: Re: [PATCH 1/1] mtd: spi-nor: remove WARN_ONCE() message in
 spi_nor_write()
To: Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>
References: <0078578d0f5d2402ac623afabf601d25998f84a9.1481044434.git.cyrille.pitchen@atmel.com>
 <20161208163109.17429627@bbrezillon>
 <4ffbad4b-f1a5-a998-fe5b-f73b934435e4@wedev4u.fr>
 <20170209022347.GO94627@google.com>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>,
 <marek.vasut@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <richard@nod.at>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <4420829e-6d08-111f-685c-65ea7f2d215c@atmel.com>
Date: Thu, 9 Feb 2017 14:50:02 +0100
MIME-Version: 1.0
In-Reply-To: <20170209022347.GO94627@google.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

Le 09/02/2017 à 03:23, Brian Norris a écrit :
> On Tue, Dec 13, 2016 at 05:43:52PM +0100, Cyrille Pitchen wrote:
>> Le 08/12/2016 à 16:31, Boris Brezillon a écrit :
>>> On Tue, 6 Dec 2016 18:14:24 +0100
>>> Cyrille Pitchen <cyrille.pitchen@atmel.com> wrote:
>>>
>>>> This patch removes the WARN_ONCE() test in spi_nor_write().
>>>> This macro triggers the display of a warning message almost every time we
>>>> use a UBI file-system because a write operation is performed at offset 64,
>>>> which is in the middle of the SPI NOR memory page. This is a valid
>>>> operation for ubifs.
>>>>
>>>> Hence this warning is pretty annoying and useless so we just remove it.
>>>>
>>>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>>>> Suggested-by: Richard Weinberger <richard@nod.at>
>>>> Suggested-by: Andras Szemzo <szemzo.andras@gmail.com>
>>>
>>> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>>>
>> Applied to git://github.com/spi-nor/linux.git
> 
> Do you have any idea on how to handle or communicate this better? I
> recall Michal added this because he was adding new write looping that
> didn't previously exist; we might create partial-page writes because his
> SPI controller was too dumb to make larger ones.
> 
> Anyway, since this is hitting real (and more or less false positive)
> use cases, then this patch is probably good.
> 
> Brian
> 

Some people had complained and reported "bugs" about this warning during
kernel boot especially when using ubifs.
If I remember, someone even suggested that Michal's patch should be
reverted but I think except for the WARN_ONCE() his patch is good and
should be kept. So I proposed the remove only the WARN_ONCE() line.

spi_nor_scan() sets mtd->writesize to 1, so for upper mtd layers such as
ubi, it is a valid operation to write less than a page size. Besides, if we
changed the mtd->writesize value to nor->page_size for instance, it would
have an impact on existing ubi file systems which may then appear as
corrupted if I've understood correctly. Maybe Richard can confirm this point?

Also, the warning doesn't fix anything: everything works just as before.
So IF the driver was buggy before, it is still buggy today.
Displaying such an intrusive warning (backtrace and so on) "scares" people
(at the first look, we think a kernel oops/crash has occurred) but
currently we are not able to propose any solution.

In most, if not all, cases this warning is a false positive as for most
memories it is valid to write a single page with more than one Page Program
commands or to write data starting from the middle of the page.

The only hardware limitation at the SPI NOR side is that we can't cross the
page boundary. If we would do so, internally the SPI NOR memory would wrap
the address instead of incrementing it hence the additional data would be
written at the beginning of the same page and not at the beginning of the
next one.
That why Michal's patch should be kept, IMHO.

I hope those additional explanations will help you :)

Best regards,

Cyrille
