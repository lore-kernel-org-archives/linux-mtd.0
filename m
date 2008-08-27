Message-ID: <48B4FD5E.8000103@yandex.ru>
Date: Wed, 27 Aug 2008 10:08:14 +0300
From: Artem Bityutskiy <dedekind@yandex.ru>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: [PATCH 2/2][MTD] Add support for > 2GiB MTD devices
References: <000201c9080d$0bce0d20$6b01a8c0@mvista.com>
	<1219818923.7107.106.camel@pmac.infradead.org>
	<Pine.LNX.4.64.0808270847350.17432@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.0808270847350.17432@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd-bounces@lists.infradead.org"
	<linux-mtd-bounces@lists.infradead.org>,
	'Bruce Leonard' <brucle@earthlink.net>,
	"Bruce_Leonard@selinc.com" <Bruce_Leonard@selinc.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Tim Anderson <tanderson@mvista.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	'Andrew Morton' <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ricard Wanderlof wrote:
>> I'm not sure I'd say I _vetoed_ new ioctls, but I certainly expressed a
>> desire to do all the information stuff through sysfs. We would need a
>> new MEMERASE64 ioctl though.
> 
> If the (lack of) sysfs stuff is standing between us and a nice >4GiB mtd 
> I for one would think that a set of 64-bit ioctls would be a reasonable 
> halfway house.

On the other hand we'll stay with half-solutions forever if we allow them.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
