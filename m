Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTWyL-0001HX-VN
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 10:23:51 +0000
Subject: Re: [PATCH 2/2] mtd: nomadik_nand: add missing nand_release in
	nomadik_nand_remove
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Axel Lin <axel.lin@gmail.com>
In-Reply-To: <1307066006.10001.4.camel@phoenix>
References: <1307065913.10001.2.camel@phoenix>
	<1307066006.10001.4.camel@phoenix>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 13:19:30 +0300
Message-ID: <1307355570.3112.27.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sachin Verma <sachin.verma@st.com>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-06-03 at 09:53 +0800, Axel Lin wrote:
> Signed-off-by: Axel Lin <axel.lin@gmail.com>
> ---
>  drivers/mtd/nand/nomadik_nand.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
