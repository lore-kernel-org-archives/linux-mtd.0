Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xsqlq-0008AU-UB
 for linux-mtd@lists.infradead.org; Mon, 24 Nov 2014 10:21:27 +0000
Message-ID: <5473068F.2020508@nod.at>
Date: Mon, 24 Nov 2014 11:21:03 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Angelo Dureghello <angelo70@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: UBI 1MiB size partition
References: <5472F403.50702@gmail.com>
 <CAFLxGvzqmPwEgyD3kcEhmeGp_+kYKiKqvGMQW=+1PxzJ5+YwmA@mail.gmail.com>
 <54730602.7040207@gmail.com>
In-Reply-To: <54730602.7040207@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 24.11.2014 um 11:18 schrieb Angelo Dureghello:
> Hi Richard,
>>
>> The number depends on CONFIG_MTD_UBI_BEB_LIMIT.
>> What is your use case for UBI on such a small MTD partition?
> 
> My company uses UBI as rootfs, and jffs2 for a small partition to keep
> some system configurations.I would like to use UBI here as well.

This does not make sense.
Create one UBI for the whole MTD and then create multiple UBI volumes on it...

> CONFIG_MTD_UBI_BEB_LIMIT is system wide i guess. So changing it, it
> impacts also the main rootfs.ubi, right ?

Yes.

Thanks,
//richard
