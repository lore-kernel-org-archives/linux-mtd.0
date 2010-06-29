Subject: Re: [PATCH] ixp4xx: add support for static flash partitions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Cochran <richardcochran@gmail.com>
In-Reply-To: <20100614161519.GB24877@riccoc20.at.omicron.at>
References: <20100531162434.GA4599@riccoc20.at.omicron.at>
	<1276420566.19028.184.camel@localhost>
	<20100614161519.GB24877@riccoc20.at.omicron.at>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 29 Jun 2010 09:47:48 +0300
Message-ID: <1277794068.1041.971.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof Halasa <khc@pm.waw.pl>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-06-14 at 18:15 +0200, Richard Cochran wrote:
> On Sun, Jun 13, 2010 at 12:16:06PM +0300, Artem Bityutskiy wrote:
> > I could fix your patch up myself, but I do not know the code, so please,
> > re-send a patch against the latest mtd-2.6 tree.
> 
> Okay, here it is again, this time against today's master branch of 
> git://git.infradead.org/mtd-2.6.git
> 
> Thanks,
> Richard
> 
> 
> This patch adds support for static flash partitioning from a platform
> device. Also, we clean up some weirdness where statements were separated
> by commas instead of semicolons. While we are at it, fix some minor bad
> white space, too.
> 
> Signed-off-by: Richard Cochran <richard.cochran@omicron.at>

Pushed to l2-mtd-2.6.git / dunno.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
