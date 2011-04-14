Received: from mailhost.informatik.uni-hamburg.de ([134.100.9.70])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QANqH-0006K5-7e
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2011 14:48:22 +0000
Message-ID: <4DA7094D.9070002@metafoo.de>
Date: Thu, 14 Apr 2011 16:48:45 +0200
From: Lars-Peter Clausen <lars@metafoo.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/2] MTD: s3c2410_nand: Add option to disable hw ECC at
	runtime
References: <1302637672-25339-1-git-send-email-lars@metafoo.de>
	<1302782911.2796.21.camel@localhost>
In-Reply-To: <1302782911.2796.21.camel@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Holger Freyther <zecke@openmoko.org>, Kukjin Kim <kgene.kim@samsung.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/14/2011 02:08 PM, Artem Bityutskiy wrote:
> On Tue, 2011-04-12 at 21:47 +0200, Lars-Peter Clausen wrote:
>> From: Holger Freyther <zecke@openmoko.org>
>>
>> This patch adds a flag to the s3c2410_nand platform data, which configures
>> whether hardware ECC is used.
>>
>> Currently it is only possible to decide whether hw ECC should be used or not at
>> compile time through a config option. But if you want to build a kernel which
>> runs on multiple devices you might have a configuration where some devices
>> require hw ECC and some devices which want software ECC.
>>
>> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> 
> Extending platform data is kind of vetoed in arm tree, I do not think
> the MTD tree can take these changes.
> 
That is not my understanding of the situation. But what do you suggest as an
alternative for fixing this issue?

- Lars
