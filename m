Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLwhs-0000kA-Eo
 for linux-mtd@lists.infradead.org; Thu, 24 May 2018 20:19:29 +0000
Received: by mail-wr0-x229.google.com with SMTP id j1-v6so5368325wrm.1
 for <linux-mtd@lists.infradead.org>; Thu, 24 May 2018 13:19:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1638856b945.101c6b59a6973.7576653443668587481@embedjournal.com>
References: <1638856b945.101c6b59a6973.7576653443668587481@embedjournal.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 24 May 2018 22:19:15 +0200
Message-ID: <CAFLxGvyqovAqRi957gAEe+hBzMr_im2x3CWo+M5-ptaeyMKhjg@mail.gmail.com>
Subject: Re: NOR Flash Test Utility
To: Siddharth Chandrasekaran <siddharth@embedjournal.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 David Oberhollenzer <goliath@sigma-star.at>,
 Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sid,

On Tue, May 22, 2018 at 4:52 PM, Siddharth Chandrasekaran
<siddharth@embedjournal.com> wrote:
> Hello,
>
> I'm trying to test some NOR flashes to for manufacturing defects. I see there
> is a test utility that reads and writes sequentially for NAND flash under
> `nand-utils`, but `nor-utils` doesn't seem to have anything similar.
>
> Where can I find one for NOR? If I have to write my own, will you be interested
> in a patch?

I'm not aware of a NOR specific test, what properties do you want to test?
Non-NAND mtd tests should do the job.
Is it SPI-NOR?

Maybe Marek has some input.
Patches for new test tools are, of course, very welcome!
