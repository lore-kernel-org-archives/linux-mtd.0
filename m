Subject: Re: [PATCH] [MTD] maps/ixp4xx: Use resource_size
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tobias Klauser <tklauser@distanz.ch>
In-Reply-To: <1256921673-19745-1-git-send-email-tklauser@distanz.ch>
References: <1256921673-19745-1-git-send-email-tklauser@distanz.ch>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 09 Nov 2009 11:36:03 +0200
Message-Id: <1257759363.21596.232.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-10-30 at 17:54 +0100, Tobias Klauser wrote:
> Use the resource_size inline function instead of manually calculating
> the resource size. This reduces the chance of introducing off-by-one
> errors.
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> ---
>  drivers/mtd/maps/ixp4xx.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)

Taken to l2-mtd-2.6 tree, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
