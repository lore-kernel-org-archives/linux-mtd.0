Subject: Re: [PATCH] nanddump: Support 4096+218 and 4096+224 page sizes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <fd9a371bd2bc8bea4119df47b82550901f017e10@localhost.localdomain>
References: <fd9a371bd2bc8bea4119df47b82550901f017e10@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 05 May 2010 14:25:59 +0300
Message-ID: <1273058759.3702.176.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-05-03 at 21:14 -0700, Kevin Cernekee wrote:
> Tested with Samsung K9GAG08U0D.
> 
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
> ---
>  nanddump.c |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)

Pushed to mtd-utils.git

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
