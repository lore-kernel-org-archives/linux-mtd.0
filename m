Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d8LoS-0004K0-Rt
 for linux-mtd@lists.infradead.org; Wed, 10 May 2017 07:13:34 +0000
Subject: Re: a bug detected in ubifs
To: ZHANG Hui P <Hui.P.Zhang@alcatel-sbell.com.cn>
References: <889DB31BAC79B0408EC03BEFCB9A558011602AF6@cnshjmbx04>
 <CAFLxGvyVPig6oJpkQia8bSQ7sGtV6VhHA=ZPTur3Kr2YBKJvWg@mail.gmail.com>
 <889DB31BAC79B0408EC03BEFCB9A558011603BF0@cnshjmbx04>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <c6419864-4050-4fdf-33bb-4718f16e46b7@nod.at>
Date: Wed, 10 May 2017 09:13:05 +0200
MIME-Version: 1.0
In-Reply-To: <889DB31BAC79B0408EC03BEFCB9A558011603BF0@cnshjmbx04>
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

Am 10.05.2017 um 02:21 schrieb ZHANG Hui P:
> Hi Richard:
>     The kernel version is quite old: 2.6.34.8 

Wow.
So, first thing would be back-porting all UBIFS fixes to this
kernel. Maybe Artem fixed this a long time ago...

Thanks,
//richard
