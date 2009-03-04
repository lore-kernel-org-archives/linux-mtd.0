Subject: Re: [PATCH] mtdoops: fix a bit of spin lock usage
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Hunter <adrian.hunter@nokia.com>
In-Reply-To: <49AE3384.6040008@nokia.com>
References: <49AE3384.6040008@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 04 Mar 2009 12:08:52 +0200
Message-Id: <1236161332.4261.79.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-03-04 at 09:53 +0200, Adrian Hunter wrote:
> - do not leave spin lock locked
> - initialise spin lock
> 
> Signed-off-by: Adrian Hunter <adrian.hunter@nokia.com>
> ---

Acked-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
