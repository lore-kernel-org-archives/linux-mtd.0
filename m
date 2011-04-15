Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QAiwK-00075u-HX
	for linux-mtd@lists.infradead.org; Fri, 15 Apr 2011 13:20:01 +0000
Received: by eyh6 with SMTP id 6so874144eyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Apr 2011 06:19:58 -0700 (PDT)
Subject: Re: UBI memory usage on large page nand
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Nicholas <ciliwung36@gmail.com>
In-Reply-To: <1302873226.3220.43.camel@localhost>
References: <AANLkTi=GsmJOjurETG930t-TW7uXLR1M6yKXWBSk7ebV@mail.gmail.com>
	<AANLkTik5qKMM3onfv=wsJFFHhO4t0C_8gAXUoGca2fKE@mail.gmail.com>
	<1301671910.2789.98.camel@localhost>
	<BANLkTi=pZqEwWYy=7mYQ_p73cHQ4rA6Rbg@mail.gmail.com>
	<1302873226.3220.43.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 15 Apr 2011 16:17:03 +0300
Message-ID: <1302873423.3220.45.camel@localhost>
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

On Fri, 2011-04-15 at 16:13 +0300, Artem Bityutskiy wrote:
> On Fri, 2011-04-15 at 17:23 +0800, Nicholas wrote:
> > Dear Artem,
> > 
> > Thanks for the information. Indeed it has flexibility to be freed or consumed.
> > Due to my case, i need to use maximum memory space while in the
> > meantime i also need to write files into nand via ubi.
> > 8KB page of nand flash will consume 16MB for a single volume on a
> > single UBI MTD.
> > 
> > 1. Is there any idea to reduce the memory consumption ?
> 
> Yes. The main idea is as I described: both UBI and UBIFS have several
> multiple PEB-size buffers at attach/mount time. I did not count them,
> but I think there may be about 6 of them. All these buffers are
> allocated using vmalloc(), so you can easily fine all of them, because
> 'vmalloc()' is used only for those buffers.

And note, this is all off the top of my head, I might be mistaken
somewhere. If you need this - you need to spend time with the code and
try. I'm all yours helping you by looking at your patches and advising.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
