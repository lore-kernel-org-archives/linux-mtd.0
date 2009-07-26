Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MV1fU-0000eN-0U
	for linux-mtd@lists.infradead.org; Sun, 26 Jul 2009 11:13:32 +0000
Message-ID: <4A6C38F2.1040607@gmail.com>
Date: Sun, 26 Jul 2009 14:07:30 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Erno Kuusela <erno@gulp.u--3.com>
Subject: Re: UBIFS fails & crashes on SheevaPlug
References: <20090723185928.GA1612@gulp.u--3.com> <4A694C3C.4010108@gmail.com>
	<20090724131241.GC1792@gulp.u--3.com>
In-Reply-To: <20090724131241.GC1792@gulp.u--3.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: debian-arm@lists.debian.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/24/2009 04:12 PM, Erno Kuusela wrote:
> Also, ubiformat mentioned 1400+ "bad" eraseblocks, what should I make of
> that? Is it really failed flash cells, just some blocks reserved for
> u-boot and stuff, or blocks traumatized from my earlier misadventures
> with ubiformat parameters?

Oh, I've just got it. When ubiformat prints:

ubiformat: bad eraseblocks: 1400

this means that you have 1 eraseblock, and it is eraseblock number 1400.
Nothing to worry about. But it is confusing, so I'll change this to

ubiformat: bad eraseblock numbers: A, B, C

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
