Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T49km-000590-4a
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 12:09:46 +0000
Received: by lbbgf7 with SMTP id gf7so550848lbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 22 Aug 2012 05:09:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345625343.2848.129.camel@sauron.fi.intel.com>
References: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
 <1345478416-23900-5-git-send-email-richard.genoud@gmail.com>
 <1345557295.2848.112.camel@sauron.fi.intel.com>
 <CACQ1gAiEBmUMWXr=FWmXqJUZ=ZwyLTCqKmUAMYpfJZBNJTPYSA@mail.gmail.com>
 <1345625343.2848.129.camel@sauron.fi.intel.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Wed, 22 Aug 2012 14:09:20 +0200
Message-ID: <CACQ1gAhFrd87dSQFQ=YnMg-WfgNKq8jx9B1i9JNDuFZQ3+=TCA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] UBI: replace MTD_UBI_BEB_LIMIT with module
 parameter
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

2012/8/22 Artem Bityutskiy <dedekind1@gmail.com>:
> Well, now I am talking about consistency within UBI only, withing the
> project. I think that function is the only one which uses plain printk
> in UBI. I do not remember the details, but there were some issues using
> the UBI wrappers like 'ubi_msg' in this function because it is called
> very early during boot time (when UBI is compiled-in). And I just did
> not know about pr_err() that time, or pr_err() did not exist. So you can
> just amend this single function if you wish.

(for the record, pr_err didn't exists at the time UBI got into the kernel)
I tested this function with pr_err and ubi_err, and both are working.
(by using  ubi.mtd= ubi.mtd=2,0,toto ubi.mtd=1,2,3,4)
It should be better to use ubi_err don't you think ?
(or I missed a corner case ?)


Richard.

-- 
for me, ck means con kolivas and not calvin klein... does it mean I'm a geek ?
