Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6dzj-00083D-12
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 07:14:39 +0000
Received: by ewy3 with SMTP id 3so1707350ewy.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Apr 2011 00:14:37 -0700 (PDT)
Subject: Re: [PATCH 0/2] do not select KALLSYMS_ALL
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Paulo Marques <pmarques@grupopie.com>
In-Reply-To: <4D95F54D.8020802@grupopie.com>
References: <1301474416-8202-1-git-send-email-dedekind1@gmail.com>
	<4D948D52.4040708@grupopie.com>  <1301669776.2789.92.camel@localhost>
	<1301670104.2789.94.camel@localhost>  <4D95F092.4080604@grupopie.com>
	<1301672549.2789.107.camel@localhost> <4D95F54D.8020802@grupopie.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 04 Apr 2011 10:12:09 +0300
Message-ID: <1301901129.2760.9.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Randy Dunlap <randy.dunlap@oracle.com>,
	MTD list <linux-mtd@lists.infradead.org>,
	lkml <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-04-01 at 16:54 +0100, Paulo Marques wrote:
> Artem Bityutskiy wrote:
> > On Fri, 2011-04-01 at 16:34 +0100, Paulo Marques wrote:
> >>[...]
> >> With an automatic makefile mechanism, the problem would go unnoticed and
> >> it just wouldn't be fixed, increasing the kernel compile time for
> >> everyone who hits the same troublesome configuration.
> > 
> > Yes, the build system may print a message:
> > 
> > Your symbols table is screwed, this is a bug, report about it. As a
> > temporary workaround use "make KALLSYMS_EXTRA_PASS=1"
> > 
> > Or something like that.
> 
> Yes, I think that would work too, and it would even prevent the option
> from being on for no good reason.

I'll try to find some time and cook a patch.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
