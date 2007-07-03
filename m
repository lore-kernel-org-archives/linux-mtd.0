From: "Kyungmin Park" <kyungmin.park@samsung.com>
To: "'Alexander Belyakov'" <abelyako@googlemail.com>
References: <fe810cf0706282325k536bf24ct6ad216f0c980e97c@mail.gmail.com>
	<001201c7ba2c$aa54a5b0$e1ac580a@swcenter.sec.samsung.co.kr>
	<fe810cf0706290231l473bfcf3s86b0db49c09d39f8@mail.gmail.com>
	<001301c7ba31$c6da0810$e1ac580a@swcenter.sec.samsung.co.kr>
	<fe810cf0706290431t7a86c151pf1e38d9837ece37d@mail.gmail.com>
	<fe810cf0707020807j310c827esfbc3b717ced207d9@mail.gmail.com>
Subject: RE: [PATCH] [JFFS2] Fix unreasonable jffs2_do_reserve_space() failure
Date: Tue, 3 Jul 2007 14:57:47 +0900
Message-ID: <001001c7bd37$195c7890$e1ac580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-reply-to: <fe810cf0707020807j310c827esfbc3b717ced207d9@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, 'David Woodhouse' <dwmw2@infradead.org>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > >
> > > What's pre patch? Could you link the pre-patch?
> > >
> >
> > I've just tried it with the latest stable kernel version 2.6.21.5. The
> > bug I've mentioned does exist w/o patch and disappears after the patch
> > is applied. I do not expect/observe any side effects.
> >
> 
> Do you still feel this small patch brings troubles?
> 
> If not, probably it is worth to include it, because bug does exist in
> current JFFS2 source anyway. I've described it in details in my first
> message.

The same situation happens without the patch.
I think I try to find the reason.

Thank you,
Kyungmin Park
