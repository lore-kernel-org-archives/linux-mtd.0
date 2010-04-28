Subject: Re: [PATCH] mtdchar: allow mmap() on MTD RAM/ROM char devices
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
In-Reply-To: <1271432507-4280-1-git-send-email-agust@denx.de>
References: <1271432507-4280-1-git-send-email-agust@denx.de>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 28 Apr 2010 16:25:37 +0300
Message-ID: <1272461137.7750.30.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Detlev Zundel <dzu@denx.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-04-16 at 17:41 +0200, Anatolij Gustschin wrote:
> Signed-off-by: Anatolij Gustschin <agust@denx.de>
> ---
>  drivers/mtd/mtdchar.c |   29 ++++++++++++++++++++++++++++-
>  1 files changed, 28 insertions(+), 1 deletions(-)
> 

Taken this to l2-mtd-2.6.git / dunno

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
