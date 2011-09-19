Received: from smtp1-g21.free.fr ([212.27.42.1])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R5i9p-0001er-3I
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2011 18:01:30 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: dedekind1@gmail.com
Subject: Re: DocG3 patch
References: <87ipoq417s.fsf@free.fr> <1316409280.24366.60.camel@sauron>
Date: Mon, 19 Sep 2011 20:01:14 +0200
In-Reply-To: <1316409280.24366.60.camel@sauron> (Artem Bityutskiy's message of
	"Mon, 19 Sep 2011 08:14:34 +0300")
Message-ID: <877h544djp.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1@gmail.com> writes:

> On Sun, 2011-09-18 at 12:03 +0200, Robert Jarzmik wrote:
>> Hello Artem,
>> 
>> It's been 2 months, and I had no news.
>> The DocG3 driver was submitted and not reviewed in [1] and [2].
>> 
>> Could you merge the patch into your tree please (patch in [2]) ?
>
> Oh, I missed your v2 completely.
>
> The problem I see with this driver is that it uses sysfs interfaces for
> debugging purposes. You should not do this - we have debugfs for stuff
> like that.  I suggest you to just kill sysfs interfaces and re-send your
> patch. You can later add debugfs interfaces instead.

Converted sysfs -> debufs, and resent in V3.

Cheers.

-- 
Robert
