Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O7NZR-0000po-Kk
	for linux-mtd@lists.infradead.org; Thu, 29 Apr 2010 06:50:02 +0000
Subject: Re: [PATCH] ubifs: add update vfs super block infomation when
	remount  to ro mode
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Zhang JieJing <kzjeef@gmail.com>
In-Reply-To: <g2vcf7b913c1004282336re0598245v28a74882990074b8@mail.gmail.com>
References: <i2ncf7b913c1004152036t3b23af53h339b16092ecdd812@mail.gmail.com>
	<1272439453.7750.20.camel@localhost>
	<i2rcf7b913c1004281914kbe0c0c18xeee2e1bbcc375012@mail.gmail.com>
	<1272512811.2593.2.camel@localhost.localdomain>
	<g2vcf7b913c1004282336re0598245v28a74882990074b8@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 29 Apr 2010 09:44:45 +0300
Message-ID: <1272523485.7750.75.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-04-29 at 14:36 +0800, Zhang JieJing wrote:
> 2010/4/29 Artem Bityutskiy <dedekind1@gmail.com>:
> > On Thu, 2010-04-29 at 10:14 +0800, Zhang JieJing wrote:
> >> (resend since HTML mail rejected by linux-fsdevel.)
> >> Hi Artem,
> >>
> >> I just clone the  git://git.infradead.org/ubifs-2.6.git, and git am my
> >> patch, It is very clean patched, so, maybe your git repo code is very
> >> new, so the patch can't cleaned apply.
> >>
> >> This is my first patch give back to upstream, even I read the kernel
> >> document 'how-to send patch' but still something leaked.
> >> If I did something wrong, Please show me the right way or something like that,
> >> Thanks for your time.
> >
> > Did you save your own mail _from the mailing_ list and apply it with git
> > am ?
> 
> Really sorry for that, I tried use my mail sent to mailing list, I
> found it appear the same error,
> I learned this important lesson, never send patch by Rich formatting.
> 
> I will send this patch by plain text after this mail, Maybe there is
> some way to send it in the same mail with patch and answer ?

I already applied your patch yesterday, you do not have to re-send.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
