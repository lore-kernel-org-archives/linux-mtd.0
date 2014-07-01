Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1soc-0005mI-Gn
 for linux-mtd@lists.infradead.org; Tue, 01 Jul 2014 07:49:23 +0000
Message-ID: <53B267E6.7060708@nod.at>
Date: Tue, 01 Jul 2014 09:48:54 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: hujianyang <hujianyang@huawei.com>, Akshay Bhat <abhat@lutron.com>
Subject: Re: UBIFS Panic
References: <53AC825F.7040602@lutron.com> <53ACD890.4030805@huawei.com>
 <53B15F8E.3030309@lutron.com>
 <CAFLxGvzQpaLvLda8dXdVzvc00EYc9TpsLjJhsCjEBy28RsL=_w@mail.gmail.com>
 <53B19D09.2000007@lutron.com> <53B20A42.6020008@huawei.com>
In-Reply-To: <53B20A42.6020008@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 01.07.2014 03:09, schrieb hujianyang:
>>
>> Is enabling UBI_FASTMAP the cause for the panic? If so I can disabled the
>> feature and re-test. Do you see any compatibility issue going from:
>> Current config -> New config -> Failsafe config
>>
> 
> I don't know. But I found func ubi_wl_get_peb() in drivers/mtd/ubi/wl.c
> will return an error ENOSPC without any error messages. And this func
> seems related with fastmap feature.

I have sort of an idea what could going on.
Akshay, can you please confirm that you face the issue only with UBI_FASTMAP=y?

Thanks,
//richard
