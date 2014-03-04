Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKmEa-00068L-ES
 for linux-mtd@lists.infradead.org; Tue, 04 Mar 2014 10:06:01 +0000
Message-ID: <1393927525.3412.200.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v7 3/3] Add UBI block interface documentation
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Tue, 04 Mar 2014 12:05:25 +0200
In-Reply-To: <1393245564-23947-4-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1393245564-23947-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1393245564-23947-4-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-02-24 at 09:39 -0300, Ezequiel Garcia wrote:
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>  doc/general.xml |  4 ++++
>  doc/ubi.xml     | 61 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  faq/ubi.xml     | 16 +++++++--------
>  3 files changed, 73 insertions(+), 8 deletions(-)

Pushed to mtd-www and then massaged a bit. I changed it so that it stops
using "attach" and "detach", but instead, uses "create" and "remove".

Thanks!

-- 
Best Regards,
Artem Bityutskiy
