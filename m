Received: from an-out-0708.google.com ([209.85.132.240])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I5NVJ-0007Qm-4Y
	for linux-mtd@lists.infradead.org; Mon, 02 Jul 2007 11:07:54 -0400
Received: by an-out-0708.google.com with SMTP id c3so309929ana
	for <linux-mtd@lists.infradead.org>;
	Mon, 02 Jul 2007 08:07:51 -0700 (PDT)
Message-ID: <fe810cf0707020807j310c827esfbc3b717ced207d9@mail.gmail.com>
Date: Mon, 2 Jul 2007 19:07:51 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: kmpark@infradead.org
Subject: Re: [PATCH] [JFFS2] Fix unreasonable jffs2_do_reserve_space() failure
In-Reply-To: <fe810cf0706290431t7a86c151pf1e38d9837ece37d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <fe810cf0706282325k536bf24ct6ad216f0c980e97c@mail.gmail.com>
	<001201c7ba2c$aa54a5b0$e1ac580a@swcenter.sec.samsung.co.kr>
	<fe810cf0706290231l473bfcf3s86b0db49c09d39f8@mail.gmail.com>
	<001301c7ba31$c6da0810$e1ac580a@swcenter.sec.samsung.co.kr>
	<fe810cf0706290431t7a86c151pf1e38d9837ece37d@mail.gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/29/07, Alexander Belyakov <abelyako@googlemail.com> wrote:
> On 6/29/07, Kyungmin Park <kyungmin.park@samsung.com> wrote:
> >
> > What's pre patch? Could you link the pre-patch?
> >
>
> I've just tried it with the latest stable kernel version 2.6.21.5. The
> bug I've mentioned does exist w/o patch and disappears after the patch
> is applied. I do not expect/observe any side effects.
>

Hi!

Do you still feel this small patch brings troubles?

If not, probably it is worth to include it, because bug does exist in
current JFFS2 source anyway. I've described it in details in my first
message.

Thanks,
Alexander
