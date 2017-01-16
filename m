Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cT2M8-0005ZC-Ap
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 08:09:34 +0000
Subject: Re: Buildroot fastmap attaching
To: Travis Waters <Travis.Waters@sdl.usu.edu>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <200126964.110948.1484244422358.JavaMail.administrator@mtom.nabble.com>
 <cfb48c7f-f1ca-2016-aa62-e22153f50f8f@nod.at>
 <007972525797451588d3774e9c93586e@Ek.usurf.usu.edu>
From: Richard Weinberger <richard@nod.at>
Message-ID: <84d71ba6-5586-8af9-4b97-3d0c7b7bc980@nod.at>
Date: Mon, 16 Jan 2017 09:09:02 +0100
MIME-Version: 1.0
In-Reply-To: <007972525797451588d3774e9c93586e@Ek.usurf.usu.edu>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Travis,

Am 12.01.2017 um 22:48 schrieb Travis Waters:
> Richard,
> 
> I'm sorry I e-mailed you directly...I didn't see the list address until later (I've since e-mailed the list from a personal account).
> 
>> Hmm, fastmap saw a lot of fixes since it got merged, did you backport all of them?
> 
> Not yet, I haven't been able to find a list of what I'm missing.   Which repo/branch should I use to compare and merge in commits?

I'd backport the whole UBI subsystem.
Usually we mark critical fixes with the stable tag, but in the early
days of fastmap we didn't because of reasons.

Thanks,
//richard
