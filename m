Received: from mail-yk0-x22f.google.com ([2607:f8b0:4002:c07::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WueEJ-0004vv-JP
 for linux-mtd@lists.infradead.org; Wed, 11 Jun 2014 08:50:00 +0000
Received: by mail-yk0-f175.google.com with SMTP id 9so3158426ykp.34
 for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2014 01:49:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140610231719.GJ3599@ld-irv-0074>
References: <1402439742-31999-1-git-send-email-ryazanov.s.a@gmail.com>
 <20140610231719.GJ3599@ld-irv-0074>
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Date: Wed, 11 Jun 2014 12:49:17 +0400
Message-ID: <CAHNKnsS8h18Tha+7C8W_hQ5n-fSA-hMaUS-B+-MTrWet5F2SCg@mail.gmail.com>
Subject: Re: [PATCH] mtd: m25p80: add support for EON EN25QH128
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Linux MTD list <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

2014-06-11 3:17 GMT+04:00 Brian Norris <computersforpeace@gmail.com>:
> Hi Sergey,
>
> On Wed, Jun 11, 2014 at 02:35:42AM +0400, Sergey Ryazanov wrote:
>> Signed-off-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>
>> ---
>>  drivers/mtd/devices/m25p80.c | 1 +
>>  1 file changed, 1 insertion(+)
>
> Please rebase on l2-mtd.git. This table has moved to
> drivers/mtd/spi-nor/
>
Ok, will sent V2.

-- 
BR,
Sergey
