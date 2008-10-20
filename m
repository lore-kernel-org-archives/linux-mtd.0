Message-ID: <48FC9EB6.10000@nokia.com>
Date: Mon, 20 Oct 2008 18:07:34 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [REFERENCE PATCH][OneNAND] S3C64XX support
References: <20081020093220.GA18312@july>
In-Reply-To: <20081020093220.GA18312@july>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kyungmin Park wrote:
> It's OneNAND support on New Samsung Mobile CPU S3C64XX series 
> Now it's only tested with s3c6410 with UBI & UBIFS.
> If you want to use it on s3c6400, you should change some values.
> 
> There's some ugly hack for support s3c64xx. It will be handled more fancy later.
> 
> Any comments are welcome

Why not just make it a separate driver and skip using onenand_base etc?
