Message-ID: <4AC233D7.6070502@gmail.com>
Date: Tue, 29 Sep 2009 19:20:39 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Darwin Rambo <drambo@broadcom.com>
Subject: Re: UBIFS and hardware ECC of all FF pages of MLC NAND
References: <B125D8217ABC4B43826503DE00A2D44910D7E85DFD@SJEXCHCCR01.corp.ad.broadcom.com>	<4ABB7224.8000804@nokia.com>
	<4ABB921B.8090500@parrot.com>	<1253862309.3778.25.camel@localhost>	<B125D8217ABC4B43826503DE00A2D44910D7F2EA60@SJEXCHCCR01.corp.ad.broadcom.com>	<1254238936.3778.109.camel@localhost>
	<B125D8217ABC4B43826503DE00A2D44910D7F2EAE3@SJEXCHCCR01.corp.ad.broadcom.com>
In-Reply-To: <B125D8217ABC4B43826503DE00A2D44910D7F2EAE3@SJEXCHCCR01.corp.ad.broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "dedekind@infradead.org" <dedekind@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/29/2009 07:13 PM, Darwin Rambo wrote:
> It is a bigger problem with 512K erase blocks. In this case, my
> 6MB jffs2 image grows to over 14MB ubifs image due to padding. There are about 12
> partial blocks with little data in the first few pages, and about 4 partial
> blocks at the end. 16 partial blocks is about 8 MB of overhead on 6MB of
> real content.

Well, of course I do not object if someone implements the optimization
you mentioned, but I do not have time to do this.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
