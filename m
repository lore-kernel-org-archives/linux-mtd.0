Received: from ra.se.axis.com ([195.60.68.13])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RKmqq-0000P5-Ug
	for linux-mtd@lists.infradead.org; Mon, 31 Oct 2011 08:04:14 +0000
Date: Mon, 31 Oct 2011 09:04:06 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Jon Povey <Jon.Povey@racelogic.co.uk>
Subject: RE: [RFC] Change ECC algorithm from userspace
In-Reply-To: <70E876B0EA86DD4BAF101844BC814DFE0BF244FAD1@Cloud.RL.local>
Message-ID: <Pine.LNX.4.64.1110310856560.30940@lnxricardw.se.axis.com>
References: <70E876B0EA86DD4BAF101844BC814DFE0BF244FAD1@Cloud.RL.local>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Enric Balletbo i Serra <eballetbo@iseebcn.com>,
	Javier Martinez Canillas <martinez.javier@gmail.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 28 Oct 2011, Jon Povey wrote:

> linux-mtd-bounces@lists.infradead.org wrote:
>> I want to be able to use 1-bit ECC for the first partition where I
>> save the loader binary and has to be accessed by the ROM boot but use
>> a 4-bit ECC for my rootfs partition.
>>
>> Does anyone have this same issue?
>
> DM355 and DM365 has similar issues as the RBL expects a different OOB/ECC
> layout to Linux.

Slightly off-topic, but in the 355/365 (etc) case it's possible to modify=
=20
the Linux driver so it uses the RBL ECC layout. For us, it seemed the=20
easiest thing to do, as having different ECC layouts in different parts
of the flash proved to be a pain. If you need different ECC algorithms in
different parts of the flash this wouldn't work of course.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
