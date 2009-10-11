Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MwxjN-0001Vi-Dr
	for linux-mtd@lists.infradead.org; Sun, 11 Oct 2009 12:41:02 +0000
Subject: Re: [PATCH] MTD: Fix MEMGETINFO and MEMGETREGIONINFO for devices
	>= 4GB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Felix Radensky <felix@embedded-sol.com>
In-Reply-To: <1254904002-24913-1-git-send-email-felix@embedded-sol.com>
References: <>  <1254904002-24913-1-git-send-email-felix@embedded-sol.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 11 Oct 2009 15:40:42 +0300
Message-Id: <1255264842.16942.41.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Wed, 2009-10-07 at 10:26 +0200, Felix Radensky wrote:
> Currently MEMGETINFO and MEMGETREGIONINFO report invalid
> information for devices >= 4GB, since relevant fields in
> MTD ABI structures are 32-bit while corresponding fields
> in kernel internal structures are 64-bit. Fix ABI fields
> to be 64-bit as well.
> 
> Signed-off-by: Felix Radensky <felix@embedded-sol.com>
> ---
>  include/mtd/mtd-abi.h |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Nack. As it was discussed several times, you cannot change these data
structure because you will break binary compatibility.

New ioctls is the way out.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
