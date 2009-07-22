Subject: Re: [PATCH] OneNAND: Runtime badblock check support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Amit Kumar Sharma <amitsharma.9@samsung.com>
In-Reply-To: <F823D0DDE73149CB894715AF022F8E00@sisodomain.com>
References: <20090721025303.GA3693@july> <4A659ED4.9040702@gmail.com>
	<9c9fda240907210405p7d6982a5yc6db5eca42bfc1e@mail.gmail.com>
	<9c9fda240907211939ud11b9adiae68c076bfbbe36f@mail.gmail.com>
	<1248243590.24676.17.camel@localhost>
	<F823D0DDE73149CB894715AF022F8E00@sisodomain.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 22 Jul 2009 11:26:33 +0300
Message-Id: <1248251193.24676.34.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Kyungmin Park <kmpark@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-07-22 at 13:42 +0530, Amit Kumar Sharma wrote:
>   implmentaing on flash bab block table will save our bbt 
> scan time but flash bbt table may go huge bceuase you have 
> to set full
> mapping table and in big device it may be to huge.

If it is huge, then doing any even one scanning is crazy anyway.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
