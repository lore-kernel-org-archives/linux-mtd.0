Subject: Re: [PATCH 2/3] drivers/mtd/maps: Eliminate use after free
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Julia Lawall <julia@diku.dk>
In-Reply-To: <Pine.LNX.4.64.1004021447160.17695@ask.diku.dk>
References: <Pine.LNX.4.64.1004021447160.17695@ask.diku.dk>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 27 Apr 2010 10:19:36 +0300
Message-ID: <1272352776.26036.0.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-04-02 at 14:47 +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Moved the debugging message before the call to map_destroy, which frees its
> argument.  The message is also slightly changed to reflect its new
> position.
> 
> A simplified version of the semantic patch that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
