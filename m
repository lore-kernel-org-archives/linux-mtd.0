Subject: Re: [PATCH] mtdoops: fix a bit of spin lock usage
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <49AE3384.6040008@nokia.com>
References: <49AE3384.6040008@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 05 Mar 2009 12:29:57 +0200
Message-Id: <1236248997.4261.87.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
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

David, would you please push this patch?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
