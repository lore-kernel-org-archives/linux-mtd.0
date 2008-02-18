From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Roel Kluin'" <12o3l@tiscali.nl>
References: <47B719FB.4020107@tiscali.nl>
Subject: RE: [PATCH] drivers/mtd/onenand/onenand_base.c unlikely(x) ||
	unlikely(y) => unlikely(x || y)
Date: Mon, 18 Feb 2008 16:48:52 +0900
Message-ID: <007701c87202$b87c8b10$1fa9580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-reply-to: <47B719FB.4020107@tiscali.nl>
Cc: linux-mtd@lists.infradead.org, 'lkml' <linux-kernel@vger.kernel.org>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Not yet tested.
> ---
> Replace unlikely(x) || unlikely(y) by unlikely(x || y)
> 
> Signed-off-by: Roel Kluin <12o3l@tiscali.nl>
Ack-by: Kyungmin Park <kyungmin.park@samsung.com>
