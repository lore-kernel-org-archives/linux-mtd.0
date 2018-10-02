Received: from forward100j.mail.yandex.net ([2a02:6b8:0:801:2::100])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7GQl-0000mA-8F
 for linux-mtd@lists.infradead.org; Tue, 02 Oct 2018 08:53:35 +0000
Message-ID: <5BB331EC.60204@ircoc.vrn.ru>
Date: Tue, 02 Oct 2018 11:53:00 +0300
From: =?UTF-8?B?ItCc0Y/RgdC+0LXQtNC+0LIg0JAu0K4uIg==?=
 <myasoedovau@ircoc.vrn.ru>
MIME-Version: 1.0
To: Richard Weinberger <richard.weinberger@gmail.com>
CC: linux-mtd@lists.infradead.org
Subject: Re: How to organize UBI volumes and power crash
References: <5BB32167.1040902@ircoc.vrn.ru>
 <CAFLxGvzDTi+tU6LT7r4QpxvM=f+mg5j8VOfyV5gZihu5-UWreg@mail.gmail.com>
In-Reply-To: <CAFLxGvzDTi+tU6LT7r4QpxvM=f+mg5j8VOfyV5gZihu5-UWreg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thank ypu, Richard.

>  Both UBI and UBIFS must not corrupt upon a powercut, if you face such an
issue, please report. This could be a bug or a hardware problem.

But http://www.linux-mtd.infradead.org/doc/ubifs.html#L_unstable_bits 
says about such possible problems (unstable bits).

 >  The general recommendation is having the MTD partition and therefore 
the UBI device as large as possible such that the wear leveling large.
02.10.2018 11:41, Richard Weinberger написал:

Do you mean one MTD partition for first UBI volume, and second MTD 
partition for another one?

Andrey
