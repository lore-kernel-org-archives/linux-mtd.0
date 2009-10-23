Subject: Re: [PATCH v7 2/5]: mtdoops: Keep track of used/unused mtdoops
	pages in an array
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
In-Reply-To: <20091015094731.1627d06e@marrow.netinsight.se>
References: <20091015094057.7298e0d7@marrow.netinsight.se>
	<20091015094731.1627d06e@marrow.netinsight.se>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 23 Oct 2009 07:08:19 +0300
Message-Id: <1256270899.29885.175.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-10-15 at 09:47 +0200, Simon Kagstrom wrote:
> This patch makes mtdoops keep track of used/unused pages in an array
> instead of scanning the flash after a write. The advantage with this
> approach is that it avoids calling mtd->read on a panic, which is not
> possible for all mtd drivers.
> 
> Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
> Reviewed-by: Anders Grafstrom <anders.grafstrom@netinsight.net>
Reviewed-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
