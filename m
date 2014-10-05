Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XaoCo-0001HJ-VM
 for linux-mtd@lists.infradead.org; Sun, 05 Oct 2014 15:58:43 +0000
Received: by mail-pd0-f174.google.com with SMTP id y13so2028358pdi.19
 for <linux-mtd@lists.infradead.org>; Sun, 05 Oct 2014 08:58:21 -0700 (PDT)
In-Reply-To: <54316971.90502@nod.at>
References: <e8d296e4-0194-4e0f-8f4d-1defe17bdd65@email.android.com>
 <CAFLxGvxm7RU-_5r658pA2C5EJ6NGGX2sfErNB9Hosq98QP8G2A@mail.gmail.com>
 <db3c3c22-b896-4b73-bece-99a1db7d602a@email.android.com>
 <54316971.90502@nod.at>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8
Subject: Re: Block numbers of BEB
From: Woody Wu <narkewoody@gmail.com>
Date: Sun, 05 Oct 2014 22:58:12 +0700
To: Richard Weinberger <richard@nod.at>
Message-ID: <b2771230-18b6-4029-9d1e-e9dc59f7b445@email.android.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On October 5, 2014 10:53:21 PM GMT+07:00, Richard Weinberger <richard@nod.at> wrote:
>Am 05.10.2014 17:49, schrieb Woody Wu:
>> What I said of checking /proc is wrong. What I indeed checked was
>/sys/class/ubi as you mentioned. The problem is, under the
>/sys/class/ubi, there is no information about what blocks are marked as
>bad, there is only information about the total number of bad blocks.
>
>Ah, you don't want the number of bad blocks, you want a map of bad
>blocks.

Yes, exactly!

>IIRC UBI does not expose this information.

I am afraid, some initial bad blocks actually came with the Flash manufacturer and recorded in some starting blocks of the Flash, is that right?

>
>Thanks,
>//richard

-- 
sent from mobile
