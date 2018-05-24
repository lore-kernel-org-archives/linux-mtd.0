Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLwns-0000fg-Sw
 for linux-mtd@lists.infradead.org; Thu, 24 May 2018 20:25:42 +0000
Received: by mail-wm0-x231.google.com with SMTP id a67-v6so8518063wmf.3
 for <linux-mtd@lists.infradead.org>; Thu, 24 May 2018 13:25:28 -0700 (PDT)
Subject: Re: NOR Flash Test Utility
To: Richard Weinberger <richard.weinberger@gmail.com>,
 Siddharth Chandrasekaran <siddharth@embedjournal.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 David Oberhollenzer <goliath@sigma-star.at>
References: <1638856b945.101c6b59a6973.7576653443668587481@embedjournal.com>
 <CAFLxGvyqovAqRi957gAEe+hBzMr_im2x3CWo+M5-ptaeyMKhjg@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <df8543d1-7bf8-25be-3d85-0e94d5a157b0@gmail.com>
Date: Thu, 24 May 2018 22:25:25 +0200
MIME-Version: 1.0
In-Reply-To: <CAFLxGvyqovAqRi957gAEe+hBzMr_im2x3CWo+M5-ptaeyMKhjg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/24/2018 10:19 PM, Richard Weinberger wrote:
> Sid,
> 
> On Tue, May 22, 2018 at 4:52 PM, Siddharth Chandrasekaran
> <siddharth@embedjournal.com> wrote:
>> Hello,
>>
>> I'm trying to test some NOR flashes to for manufacturing defects. I see there
>> is a test utility that reads and writes sequentially for NAND flash under
>> `nand-utils`, but `nor-utils` doesn't seem to have anything similar.
>>
>> Where can I find one for NOR? If I have to write my own, will you be interested
>> in a patch?
> 
> I'm not aware of a NOR specific test, what properties do you want to test?
> Non-NAND mtd tests should do the job.
> Is it SPI-NOR?
> 
> Maybe Marek has some input.
> Patches for new test tools are, of course, very welcome!

I only have an FPGA board with sockets for SPI NORs for endurance
testing, that's easy to build really.

-- 
Best regards,
Marek Vasut
