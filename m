Subject: Re: [PATCH 2/2] UBI: Remove reboot notifier
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <e5370484641ae54d637ece47f411bb0b0061cc54@localhost.localdomain>
References: <4ccec90e21edfa387822b2cb71c886217c48b4e3@localhost.localdomain>
	<e5370484641ae54d637ece47f411bb0b0061cc54@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 27 Apr 2010 16:25:15 +0300
Message-ID: <1272374715.7750.8.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: saeed.bishara@gmail.com, dwmw2@infradead.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-04-13 at 13:30 -0700, Kevin Cernekee wrote:
> The UBI reboot notifier causes problems with hibernation.  Move this
> functionality into the low-level MTD driver instead.
> 
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
> ---
>  drivers/mtd/ubi/build.c |   35 -----------------------------------
>  drivers/mtd/ubi/ubi.h   |    2 --
>  2 files changed, 0 insertions(+), 37 deletions(-)
> 

Pushed this patch to the ubi-2.6.git tree, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
