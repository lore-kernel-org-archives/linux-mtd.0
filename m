Received: from mail-wi0-x235.google.com ([2a00:1450:400c:c05::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VKZZs-0005zQ-A8
 for linux-mtd@lists.infradead.org; Fri, 13 Sep 2013 20:02:53 +0000
Received: by mail-wi0-f181.google.com with SMTP id ex4so1310347wid.2
 for <linux-mtd@lists.infradead.org>; Fri, 13 Sep 2013 13:02:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20130913185610.GG4550@ld-irv-0074.broadcom.com>
References: <1379090297-2880-1-git-send-email-zajec5@gmail.com>
 <20130913185610.GG4550@ld-irv-0074.broadcom.com>
Date: Fri, 13 Sep 2013 22:02:30 +0200
Message-ID: <CACna6rwXxZMzd0CyvS2tEvtJhcB3F7kyVu6BerLgjLW8nHuEnw@mail.gmail.com>
Subject: Re: [PATCH] mtd: bcm47xxpart: detect Squashfs partition
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/9/13 Brian Norris <computersforpeace@gmail.com>:
> On Fri, Sep 13, 2013 at 06:38:17PM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>> ---
>>  drivers/mtd/bcm47xxpart.c |    8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
>> index 9279a91..96f821a 100644
>> --- a/drivers/mtd/bcm47xxpart.c
>> +++ b/drivers/mtd/bcm47xxpart.c
>> @@ -32,6 +32,7 @@
>>  #define ML_MAGIC1                    0x39685a42
>>  #define ML_MAGIC2                    0x26594131
>>  #define TRX_MAGIC                    0x30524448
>> +#define SQSH_MAGIC                   0x71736873      /* shsq */
>
> s/shsq/sqsh/
>
> Or really, the "sqsh" comment doesn't add much to the SQSH_MAGIC macro.
> Maybe this instead?
>
> s/shsq/SquashFS/

This is really a "shsq". If you read 0x71736873 in LE, you get:
1) 0x73 (s)
2) 0x68 (h)
3) 0x73 (s)
4) 0x71 (q)

This is way I put the comment. To underline that this is a "shsq" in
LE, that means SQSH (SQuaSHfs).
