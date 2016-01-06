Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGbaL-0007Zk-Oz
 for linux-mtd@lists.infradead.org; Wed, 06 Jan 2016 00:04:18 +0000
Subject: Re: [PATCH for-4.4 1/2] mtd: spi-nor: fix Spansion regressions
 (aliased with Winbond)
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
References: <1450205301-32207-1-git-send-email-computersforpeace@gmail.com>
 <20160105022928.GF109450@google.com> <20160106000210.GJ109450@google.com>
Cc: linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>,
 Marek Vasut <marex@denx.de>, Bayi Cheng <bayi.cheng@mediatek.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
 =?UTF-8?B?TWlsdG9uIENoaWFuZyAo5rGf5piO5pmPKQ==?= <Milton.Chiang@mediatek.com>
From: Felix Fietkau <nbd@openwrt.org>
Message-ID: <568C59E3.3050005@openwrt.org>
Date: Wed, 6 Jan 2016 01:03:47 +0100
MIME-Version: 1.0
In-Reply-To: <20160106000210.GJ109450@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2016-01-06 01:02, Brian Norris wrote:
> On Mon, Jan 04, 2016 at 06:29:28PM -0800, Brian Norris wrote:
>> On Tue, Dec 15, 2015 at 10:48:20AM -0800, Brian Norris wrote:
>> > Spansion and Winbond have occasionally used the same manufacturer ID,
>> > and they don't support the same features. Particularly, writing SR=0
>> > seems to break read access for Spansion's s25fl064k. Unfortunately, we
>> > don't currently have a way to differentiate these Spansion and Winbond
>> > parts, so rather than regressing support for these Spansion flash, let's
>> > drop the new Winbond lock/unlock support for now. We can try to address
>> > Winbond support during the next release cycle.
>> > 
>> > Original discussion:
>> > 
>> > http://patchwork.ozlabs.org/patch/549173/
>> > http://patchwork.ozlabs.org/patch/553683/
>> > 
>> > Fixes: 357ca38d4751 ("mtd: spi-nor: support lock/unlock/is_locked for Winbond")
>> > Fixes: c6fc2171b249 ("mtd: spi-nor: disable protection for Winbond flash at startup")
>> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>> > Reported-by: Felix Fietkau <nbd@openwrt.org>
>> > Cc: Felix Fietkau <nbd@openwrt.org>
>> 
>> Felix,
>> 
>> Can I get a Tested-by? I'm going to send this for 4.4 still, if
>> possible.
> 
> Despite the lack of response, pushed both to linux-mtd.git, as they are
> obvious responses to the reported regressions/bugs.
Sorry for the delay, I don't have time to test that at the moment. I'll
try to find the time for it soon.

- Felix
