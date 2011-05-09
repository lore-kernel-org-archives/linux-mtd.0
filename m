Received: from ra.se.axis.com ([195.60.68.13])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QJKHk-0000qe-KL
	for linux-mtd@lists.infradead.org; Mon, 09 May 2011 06:49:41 +0000
Date: Mon, 9 May 2011 08:49:37 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: ubirmvol:ing gluebied volumes
In-Reply-To: <1304708865.7222.106.camel@localhost>
Message-ID: <Pine.LNX.4.64.1105090848150.15966@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1105061412050.15966@lnxricardw.se.axis.com>
	<1304708865.7222.106.camel@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 6 May 2011, Artem Bityutskiy wrote:

>> Fair enough, I guess gluebi is keeping the UBI volume busy? But then how
>> do I free it up?
>
> I think the only way is to rmmod gluebi.
>
>> So is this an (unfortunate) consequence of using gluebi: that the
>> underlying UBI volumes can't be removed?
>
> In current implementation yes. But you can rmomod it, shuffle UBI
> volumes, and modprobe it again.

Aha! Hadn't thought of that. I built gluebi into the kernel, not as a=20
module, so the thought never crossed my mind. Thanks!

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
