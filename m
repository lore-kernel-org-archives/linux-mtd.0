Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EINjI-0001Uw-Jf
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 05:51:12 -0400
Message-ID: <43327E5E.5090701@yandex.ru>
Date: Thu, 22 Sep 2005 13:50:22 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <20050921211326.GK8421@lunn.ch>
	<43324D42.5060407@yandex.ru>	<20050922064104.GM8421@lunn.ch>
	<43325439.1060307@yandex.ru> <43327C07.6020506@inf.u-szeged.hu>
In-Reply-To: <43327C07.6020506@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Andrew Lunn <andrew@lunn.ch>, Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: Another compiler error: sumtool.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Ferenc,

Ferenc Havasi wrote:
>>EBS makes mount really faster. But then the JFFS2 checker is working,
>>and in case of NOR+EBS it will work longer and eat more CPU. JFFS2
>>writers are blocked while the checker is working, so it may slow down
>>the boot process. That's the theory, experiments are needed.
> 
> Artem, I think you have a little bit negative attitude against
> summary/EBS. :) You are right, we should write docs for summary, and we
> will do it soon.
No, beleave me! :-) I am actually fond of it as it improves JFFS2 
scalability. I'm just being strict.

> Just for information: EBS was mainly designed for NAND, because JFFS2
> was designed for NOR, and produces very very slow mounting on big NAND
> chips. The idea is simple, and it seems to cause mount speed up at NOR,
> too. We've got many positive feedbacks. The price of the using EBS at
> NOR is to disable the obsolating method of NOR and apply the one used on
> NAND. I don't think it cause too much CPU penalty in normal usage, at
> least nobody complained of it.
May be you did not notice, I said EBS *may* be slow for *small* NOR 
flashes. This means it should be OK for large ones. How small - no idea. 
Just off the top of my head - may be 8-16 MB. I explained why I think so 
- if you don't agree - complain please :-). Don't take any offense 
please :-)

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
