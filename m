Subject: Re: mtdconcat
From: David Woodhouse <dwmw2@infradead.org>
To: Husam <husamsenussi@gmail.com>
In-Reply-To: <200606262324.28262.husamsenussi@gmail.com>
References: <200606262324.28262.husamsenussi@gmail.com>
Content-Type: text/plain
Date: Tue, 27 Jun 2006 14:50:18 +0100
Message-Id: <1151416218.17609.142.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
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

On Mon, 2006-06-26 at 23:24 +0100, Husam wrote:
> I need to concatenate two 32MiB MDoC+ devices into one 64MiB.
> does  anyone knows where I can get sample on how the mtdconcat 
> can be used? 

grep mtd_concat_create -r drivers/mtd/maps

-- 
dwmw2
