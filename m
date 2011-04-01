Received: from ra.se.axis.com ([195.60.68.13])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5g0l-0002u7-6o
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 15:11:43 +0000
Date: Fri, 1 Apr 2011 17:11:36 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 0/2] do not select KALLSYMS_ALL
In-Reply-To: <1301670104.2789.94.camel@localhost>
Message-ID: <Pine.LNX.4.64.1104011710460.18181@lnxricardw.se.axis.com>
References: <1301474416-8202-1-git-send-email-dedekind1@gmail.com>
	<4D948D52.4040708@grupopie.com>  <1301669776.2789.92.camel@localhost>
	<1301670104.2789.94.camel@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Randy Dunlap <randy.dunlap@oracle.com>,
	MTD list <linux-mtd@lists.infradead.org>,
	Paulo Marques <pmarques@grupopie.com>, lkml <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 1 Apr 2011, Artem Bityutskiy wrote:

> > On Fri, 2011-04-01 at 17:56 +0300, Artem Bityutskiy wrote:
> > Well, ok, I've measured how much is this "a lot". On an embedded arm
> > platform this makes the kernel only 1.5% larger.=20
>
> But in absolute numbers this is 70KiB in my case, which is indeed
> considerable amount. So, I agree that it makes sense to keep this as a
> separate option.

Yes there are platforms where space is tight and 70 KiB could make or=20
break a given setup.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
