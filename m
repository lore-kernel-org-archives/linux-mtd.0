Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SynnE-0000pq-Lo
 for linux-mtd@lists.infradead.org; Tue, 07 Aug 2012 17:42:09 +0000
Received: by yenr9 with SMTP id r9so4289680yen.36
 for <linux-mtd@lists.infradead.org>; Tue, 07 Aug 2012 10:42:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1342507095-18574-1-git-send-email-computersforpeace@gmail.com>
References: <1342507095-18574-1-git-send-email-computersforpeace@gmail.com>
Date: Tue, 7 Aug 2012 10:42:05 -0700
Message-ID: <CAN8TOE-so3kRVbuo6eab7k5YZvn8ifrHfak7-2f4BPGB+zhgHw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] NAND and NAND-BBT improvements
From: Brian Norris <computersforpeace@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Mike Dunn <mikedunn@newsguy.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello maintainers,

On Mon, Jul 16, 2012 at 11:38 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> This is a v2 resubmit of part of a previous series. Some of the previous
> patches have already been accepted (and so are omitted here, of course) and
> others are still under discussion. I only include the reviewed,
> ready-for-submission ones here.
>
> Only v2 changes: comment wording + "Reviewed-by" tags

Can I get a response for these patches? They've been reviewed and
waiting for several weeks now.

> Of note: the first patch addresses a problem with mtd_read_oob() and the recent
> max_bitflips changes by Mike Dunn. If it is satisfactory, it may be worth
> merging it in the 3.5-rc cycle (along with its previously-accepted dependent
> patch), as it would help avoid an API inconsistency that recently emerged.

The 3.5-rc cycle has long passed now, and the important mtd_read_oob()
fix will probably even miss 3.6 now. Is anybody listening?

Thanks,
Brian
