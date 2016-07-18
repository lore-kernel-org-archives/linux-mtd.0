Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPDKx-000391-7O
 for linux-mtd@lists.infradead.org; Mon, 18 Jul 2016 18:32:16 +0000
Subject: Re: [PATCH mtd-utils] nanddump: check write function result for errors
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
References: <1468833493-28311-1-git-send-email-zajec5@gmail.com>
 <CAFLxGvxpB-sAS4tsZu4fFVp4OxGdg1nccip-y6fh-V1ffdXQdQ@mail.gmail.com>
 <CACna6ry-AdRH9Yk02piJoc0N4VSWom=_N4dE9_-NDjV4gQQi4g@mail.gmail.com>
 <578CE371.9090604@nod.at>
 <CACna6rxNhDMxbE3fnbiko8eKJXWAQ+5GsXPZYdE8iT1LFJV_fQ@mail.gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <578D2096.9030901@nod.at>
Date: Mon, 18 Jul 2016 20:31:50 +0200
MIME-Version: 1.0
In-Reply-To: <CACna6rxNhDMxbE3fnbiko8eKJXWAQ+5GsXPZYdE8iT1LFJV_fQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rafał,

Am 18.07.2016 um 16:51 schrieb Rafał Miłecki:
> On 18 July 2016 at 16:10, Richard Weinberger <richard@nod.at> wrote:
>> My patch too since it uses mtd-util's logging functions.
>> sys_errmsg(...)
>>
>> Could you please merge both patches and resend?
> 
> Oh, I didn't realize sys_errmsg does that. I assumed it logs into
> system log (which seemed like a weird idea to do). A bit confusing
> name. Thanks, I'll send V2.
> 

The sys_ prefix denotes that this function is used for syscall
errors. :-)

Thanks,
//richard
