Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8WqL-0006lg-3M
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 13:37:33 +0000
Received: by lbbgf7 with SMTP id gf7so2431439lbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 03 Sep 2012 06:37:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1346679068.3061.52.camel@sauron.fi.intel.com>
References: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
 <1345716615.2848.229.camel@sauron.fi.intel.com>
 <20120823133655.72157b18@pixies.home.jungo.com>
 <1345725030.2848.236.camel@sauron.fi.intel.com>
 <20120823154404.51e31873@pixies.home.jungo.com>
 <1345726686.2848.241.camel@sauron.fi.intel.com>
 <CACQ1gAhs6E5jHGnTy1RhbnuzKq7uAJk0DeHfi0k73jC_8noiAg@mail.gmail.com>
 <CACQ1gAiFQfAbKVRfhjy-K31MJP9YchzxmmCo4FJECoKuudeBtw@mail.gmail.com>
 <1346659239.3061.17.camel@sauron.fi.intel.com>
 <CACQ1gAgxnrLR-NDkiw=QUZ9r6JO30AVwX6MOYX4vV9WXoBaBiA@mail.gmail.com>
 <1346673180.3061.44.camel@sauron.fi.intel.com>
 <CACQ1gAjeNq5zNKzSbO_eeDG7ahhBc9mNvMf_s4RadrWSq-5taQ@mail.gmail.com>
 <1346679068.3061.52.camel@sauron.fi.intel.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 3 Sep 2012 15:37:09 +0200
Message-ID: <CACQ1gAjw7s0bYd0aYiqTm7jUuB881sHFrJUuvuycbmC1fY+MaQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] UBI: add max_beb_per1024 parameter / ioctl
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/9/3 Artem Bityutskiy <dedekind1@gmail.com>:
> On Mon, 2012-09-03 at 15:14 +0200, Richard Genoud wrote:
>> I finally managed to reproduced it on linux-ubi/master + only one
>> patch to make my board boot:
>> (I thought it needed much more code than that...)
>
> Hmm, you use slob... I guess this is the reason, I do not see issues
> with slub. May be there is a bug which is revealed when slob is used?
> I'll need to try slob.

Good call Artem !
I switched to slub and I can't reproduce it anymore.
