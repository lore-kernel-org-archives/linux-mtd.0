Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PwuhC-000126-5Q
	for linux-mtd@lists.infradead.org; Tue, 08 Mar 2011 11:03:19 +0000
Received: by wwc33 with SMTP id 33so599395wwc.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 08 Mar 2011 03:03:16 -0800 (PST)
Subject: Re: [PATCH 2/3] mtd: add "platform:" prefix for platform modalias
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Axel Lin <axel.lin@gmail.com>
In-Reply-To: <1299467064.3879.3.camel@mola>
References: <1299466949.3879.0.camel@mola>  <1299467064.3879.3.camel@mola>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 08 Mar 2011 13:01:48 +0200
Message-ID: <1299582108.2754.16.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>, linux-kernel@vger.kernel.org,
	Kyungmin Park <kyungmin.park@samsung.com>,
	linux-mtd@lists.infradead.org, Jian Zhang <jzhang@ti.com>,
	Vimal Singh <vimalsingh@ti.com>, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-03-07 at 11:04 +0800, Axel Lin wrote:
> Since 43cc71eed1250755986da4c0f9898f9a635cb3bf (platform: prefix MODALIAS
> with "platform:"), the platform modalias is prefixed with "platform:".
> 
> Signed-off-by: Axel Lin <axel.lin@gmail.com>
> Cc: Jian Zhang <jzhang@ti.com>
> Cc: Vimal Singh <vimalsingh@ti.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
