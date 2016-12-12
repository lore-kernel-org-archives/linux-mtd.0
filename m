Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGVCV-0004GN-3B
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2016 18:19:47 +0000
Received: by mail-oi0-x244.google.com with SMTP id v84so12052888oie.2
 for <linux-mtd@lists.infradead.org>; Mon, 12 Dec 2016 10:19:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <a09b8dbc-ca4b-000e-e5c2-5039119e99ba@gmail.com>
References: <1481479310-2698-1-git-send-email-arvind.yadav.cs@gmail.com>
 <a09b8dbc-ca4b-000e-e5c2-5039119e99ba@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 12 Dec 2016 16:19:24 -0200
Message-ID: <CAOMZO5DsH_4oLOjWjuJH0Z_OD-TYU42b9MkGh7AJ6N=ODt=DTw@mail.gmail.com>
Subject: Re: [V1] mtd: devices: docg3:- Handle return value of devm_ioremap.
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Arvind Yadav <arvind.yadav.cs@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 11, 2016 at 5:15 PM, Marek Vasut <marek.vasut@gmail.com> wrote:

>>       ret = -ENOMEM;
>> +     base = devm_ioremap(dev, ress->start, DOC_IOSPACE_SIZE);
>> +     if (!base)
>> +             return ret;
>
> I think return -ENOMEM right away won't hurt here. Also, dev_err()
> explaining the failure would be nice to add.

There is no need to add dev_err() message as the mm core will complain
loudly if devm_ioremap() fails.
