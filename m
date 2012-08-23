Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T4XEP-0006V8-3q
 for linux-mtd@lists.infradead.org; Thu, 23 Aug 2012 13:13:53 +0000
Received: by wibhq4 with SMTP id hq4so738834wib.0
 for <linux-mtd@lists.infradead.org>; Thu, 23 Aug 2012 06:13:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345726686.2848.241.camel@sauron.fi.intel.com>
References: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
 <1345716615.2848.229.camel@sauron.fi.intel.com>
 <20120823133655.72157b18@pixies.home.jungo.com>
 <1345725030.2848.236.camel@sauron.fi.intel.com>
 <20120823154404.51e31873@pixies.home.jungo.com>
 <1345726686.2848.241.camel@sauron.fi.intel.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Thu, 23 Aug 2012 15:13:30 +0200
Message-ID: <CACQ1gAhs6E5jHGnTy1RhbnuzKq7uAJk0DeHfi0k73jC_8noiAg@mail.gmail.com>
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

2012/8/23 Artem Bityutskiy <dedekind1@gmail.com>:
> Thanks, it is pushed now. The further things we'd need to do are:
>
> 1. Somewhat test what we ended up with.
> 2. Write some documentation.
> 3. Search for UBI users in the mtd mailing list and send them
>    an e-mail with heads-up, to make sure people have a possibility
>    to complain before this stuff is merged.
>
> I can do number 3 :-)

I could do some more tests with the final version.

I guess that the documentation to update is there:
http://www.linux-mtd.infradead.org/doc/ubi.html
The message commit of dccaefbd68ce0c4d83f1d57667726868bdc03cce (UBI:
use the whole MTD device size to get bad_peb_limit)
could be a start for the "Why?"


-- 
for me, ck means con kolivas and not calvin klein... does it mean I'm a geek ?
