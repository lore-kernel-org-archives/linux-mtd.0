Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNyZv-0004qD-6j
 for linux-mtd@lists.infradead.org; Thu, 13 Mar 2014 05:53:16 +0000
Received: by mail-pd0-f172.google.com with SMTP id p10so596858pdj.31
 for <linux-mtd@lists.infradead.org>; Wed, 12 Mar 2014 22:52:52 -0700 (PDT)
Date: Wed, 12 Mar 2014 22:52:49 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v3 2/3] mtd: nand: add new parsing rule for Hynix's
 H27UBG8T2CTR
Message-ID: <20140313055249.GS31517@norris-Latitude-E6410>
References: <1388736518-5934-1-git-send-email-b32955@freescale.com>
 <1388736518-5934-3-git-send-email-b32955@freescale.com>
 <20140307074657.GF31517@norris-Latitude-E6410>
 <53197C8D.3010604@freescale.com>
 <20140307080845.GJ31517@norris-Latitude-E6410>
 <5319801C.9040207@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5319801C.9040207@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 07, 2014 at 04:15:24PM +0800, Huang Shijie wrote:
> 于 2014年03月07日 16:08, Brian Norris 写道:
> >I'll try to remember to take a look tomorrow to see how this matches
> >with the Hynix parts I've seen.
> Please check it.
>  you maybe have some other Hynix datatsheets which I do not have.

FYI, I did actually check the day I promised, but the results were
inconsistent (and diasppointing) so I wasn't sure what to say...

I had a datasheet for at least one >20nm and one =20nm with the old
table. I don't think I had any with the new table.

Maybe we can just punt for now and stick some of the new part numbers in
the full-ID table?

Do you have any Hynix engineering contact that you could ask about this?
I had to pressue Toshiba a bit for info about their 24nm SLC NAND when I
added support for their bad ID decode table (commit 60c673824561).

Brian
