Received: from mail-he1eur01on0093.outbound.protection.outlook.com
 ([104.47.0.93] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exozG-0005dY-O7
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2018 07:13:49 +0000
Subject: Re: UBI assert failed in ubi_wl_init
From: Timo Ketola <timo@exertus.fi>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Richard Weinberger <richard@sigma-star.at>, linux-mtd@lists.infradead.org
References: <50443554-3f18-ce1b-70e7-a8092b39f5f5@exertus.fi>
 <2543021.LZhlqz2gkU@blindfold>
 <b5eb17b7-14f1-7ec4-a590-d486dd0b89b6@exertus.fi>
 <63275670.WCUj5TjS3v@blindfold>
 <180bb6ee-51db-ddff-207b-e76580dab687@exertus.fi>
 <CAFLxGvx35u-5Z83m_21Q73QPf7e8ZeoMsxU-B2jdzY2-BrWamw@mail.gmail.com>
 <7002f6eb-f177-0929-79da-62f42551459f@exertus.fi>
Message-ID: <34879442-9a7a-6776-7856-ee97d23c0509@exertus.fi>
Date: Mon, 19 Mar 2018 09:13:07 +0200
MIME-Version: 1.0
In-Reply-To: <7002f6eb-f177-0929-79da-62f42551459f@exertus.fi>
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

Hi again,

One further detail:

I tried to increase the UBI volume size from 48M to 64M. It didn't
affect the borderline, where the issue starts to manifest.

I already mixed up some terms and numbers so I try to wrap up everything
here:

           | UBI volume size MiB:
  mtd size |   48 |   64 | 1800
-----------+------+------+------
0x04000000 |      |  na  |  na
0x4E680000 |      |      |  na
0x4E6A0000 |   X  |   X  |  na
0x7C000000 |   X  |   X  |   X

X: The issue is there
na: obviously not possible

UBI volume size is what I put into ubinize.cfg vol_size variable.

By 'the issue' I mean specifically the assertion failure:

> UBI assert failed in ubi_wl_init at 1666 (pid 1)

--

Timo
