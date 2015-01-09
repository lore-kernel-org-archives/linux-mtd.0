Received: from mail-ie0-x235.google.com ([2607:f8b0:4001:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9Rlt-0002TK-5R
 for linux-mtd@lists.infradead.org; Fri, 09 Jan 2015 05:06:05 +0000
Received: by mail-ie0-f181.google.com with SMTP id rl12so13274950iec.12
 for <linux-mtd@lists.infradead.org>; Thu, 08 Jan 2015 21:05:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <54A8F6BE.50708@atmel.com>
References: <CALupW3DMys5qLTw_3t9P0JG64oPgQXa4Lh9M7X5_0yUmLhqGdg@mail.gmail.com>
 <54A8F6BE.50708@atmel.com>
Date: Thu, 8 Jan 2015 21:05:41 -0800
Message-ID: <CALupW3ALswbKCPJGbzefQidPfWE0xM0DwY83-CRT1+pNTZe_iQ@mail.gmail.com>
Subject: Re: help with mtd-test failures?
From: Steve deRosier <derosier@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks Josh,


On Sun, Jan 4, 2015 at 12:15 AM, Josh Wu <josh.wu@atmel.com> wrote:
> Hi, Steve
>
> On 1/3/2015 10:34 AM, Steve deRosier wrote:
>>
>> Hi all,
>>
>> In doing my due dillegence on my system, I decided to run the
>> mtd-tests. I'm getting a few failures that I'd like your help in
>> understanding.
>>
>> The one that worries me comes from mtd_oobtest:
>>
>>      # modprobe mtd_oobtest dev=7
>>      mtd_oobtest: error: verify failed at 0x880000
>>      mtd_oobtest: error: verify failed at 0xe80000
>>
>> The most worrysome thing about this is the fact that the result isn't
>> consistant. sometimes I get no failures, and sometimes they're at
>> different spots.
>
> I think this should be related with nand flash's bitflips. As atmel nand
> driver just use standard oob write/read functions from nand_base.c.
> That means there is no ecc protection for mtd_oobtest.
> So if there has any nand bitflip happens in the oob area, then mtd-oobtest
> will be failed.
>
> How often does the failures comes?
> I tested on my at91sam9g25ek board (nand is: 29F2G08AAD) about 20 times, no
> error happened.
>

On our board, it happens more or less every other run.  0x880000 is
most frequent, followed by a few others at random times.

Your other email and this one made me worry about bitflips in the OOB
area, so I decided to test those.  The results are on the other
thread, but the important one here is the checking what happens to a
bit flip on the ECC data.  I did this manually and the ECC code was
able to successfully correct for this problem. I'm calling that good!

Thanks,
- Steve
