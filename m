Received: from mail-yw0-f49.google.com ([209.85.213.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pns4u-0006Mq-Gf
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 12:26:25 +0000
Received: by ywf7 with SMTP id 7so1017866ywf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Feb 2011 04:26:23 -0800 (PST)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <20110211130413.1de915e5@wker>
References: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
	<1297350106-16383-3-git-send-email-agust@denx.de>
	<AANLkTi=Jtc7cUZ3puU_krmxm34P1LB605i8FE6Rti1jp@mail.gmail.com>
	<20110211130413.1de915e5@wker>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Fri, 11 Feb 2011 13:25:42 +0100
Message-ID: <AANLkTinaXUqdPsSyqa9aKi1JOWXHVgBrFQvA=3-Pzanj@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: cfi: fix writebufsize initialization
To: Anatolij Gustschin <agust@denx.de>
Content-Type: text/plain; charset=UTF-8
Cc: Adrian Hunter <adrian.hunter@nokia.com>, linux-mtd@lists.infradead.org,
	Detlev Zundel <dzu@denx.de>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Anatolij.

2011/2/11 Anatolij Gustschin <agust@denx.de>:
> Currently we are seeing two other issues with UBIFS recovery after
> power cuts, but these seem not to be caused by to big write buffer.
> I'm looking for the reason for the observed corruptions now and
> will look at your patches later.

There is no hurry for you to review my patch, as it is just a
simplification over your modifications.
BTW I will resend it once yours is in.


-- 
Guillaume LECERF
GeeXboX developer - www.geexbox.org
