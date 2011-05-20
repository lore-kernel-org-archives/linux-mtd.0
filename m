Received: from mail-yw0-f49.google.com ([209.85.213.49])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QNPiJ-0007Gs-Ml
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 13:26:00 +0000
Received: by ywf9 with SMTP id 9so1516108ywf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 20 May 2011 06:25:58 -0700 (PDT)
Subject: Re: [ubifs] "cannot parse device table file 'device_table.txt'"
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Gilles <gilles.ganault@free.fr>
In-Reply-To: <ekect6d8fta52gjlpf5faqo81fskllta5k@4ax.com>
References: <9ms9t650c8kmhe1ed5gdb7mv7cqdovcrca@4ax.com>
	<1305883637.2630.123.camel@localhost>
	<ekect6d8fta52gjlpf5faqo81fskllta5k@4ax.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 May 2011 13:27:21 +0300
Message-ID: <1305887241.2630.137.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-05-20 at 11:56 +0200, Gilles wrote:
> On Fri, 20 May 2011 12:27:17 +0300, Artem Bityutskiy
> <dedekind1@gmail.com> wrote:
> >It seems like that device table line is indeed incorrect, or what do you
> >expect mkfs.ubifs to do?
> 
> I used a sample that comes with uClinux and is considered a reference
> to use. If there's more information about what value to put in that
> column or a valid file that I could use, I'm interested. Thank you.

I do not know the right format for the device table either. In your case
you have: start = 0, increment = 1, count = -;

I do not know what "-" means, but mkfs.ubifs interprets it as "zero" and
then complains that you ask it to create zero devices starting from
number zero with increment 0.

May be this '-' means something and mkfs.ubifs does not properly handle
that?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
