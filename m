Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OdIEO-0002cN-4t
	for linux-mtd@lists.infradead.org; Mon, 26 Jul 2010 07:36:13 +0000
Subject: Re: [PATCH v3 1/2] mtd-utils: change flash_eraseall to use
	libmtd-wrapped ioctls
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <5a5041da4e200221d33e0e25594438e3@localhost>
References: <5a5041da4e200221d33e0e25594438e3@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 26 Jul 2010 10:35:08 +0300
Message-ID: <1280129708.14917.72.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, jwboyer@gmail.com, saeed.bishara@gmail.com,
	vapier.adi@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-07-23 at 17:46 -0700, Kevin Cernekee wrote:
> ERASE/ERASE64 were tested on 2.6.18 and 2.6.31.  OOB is untested.
> 
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
> ---
>  flash_eraseall.c |   58 +++++++++++++++++++++++++++--------------------------
>  1 files changed, 30 insertions(+), 28 deletions(-)

Pushed, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
