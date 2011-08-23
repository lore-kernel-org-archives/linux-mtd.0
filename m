Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=TX2EHSOBE007.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvtaR-000629-9J
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2011 16:12:23 +0000
Message-ID: <4E53D15D.2050807@freescale.com>
Date: Tue, 23 Aug 2011 11:12:13 -0500
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH v3] mtd/nand : workaround for Freescale FCM to support
	large-page Nand chip
References: <1313634783-8855-1-git-send-email-b35362@freescale.com>	<4E4D3CE0.7020602@freescale.com>
	<4E5366AF.7040108@freescale.com> <4E537AC4.6000301@parrot.com>
In-Reply-To: <4E537AC4.6000301@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
	LiuShuo <b35362@freescale.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Li Yang-R58472 <r58472@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/23/2011 05:02 AM, Matthieu CASTET wrote:
> LiuShuo a =C3=A9crit :
>> We can't read the NOP from the ID on any chip. Some chips don't
>> give this infomation.(e.g. Micron MT29F4G08BAC)

Are there any 4K+ chips (especially ones with insufficient NOP) that
don't have the info?

This chip is 2K and NOP8.

Is there an easy way (without needing to have every datasheet for every
chip ever made) to determine at runtime which chips supply this informati=
on?

> Doesn't the micron chip provide it with onfi info ?

This chip doesn't appear to be ONFI.

-Scott
