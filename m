Subject: Re: [PATCH] OneNAND: Introduce chip_probe function
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <20100528020311.GA1608@july>
References: <20100528020311.GA1608@july>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 12 Jun 2010 17:26:59 +0300
Message-ID: <1276352819.19028.123.camel@localhost>
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

On Fri, 2010-05-28 at 11:03 +0900, Kyungmin Park wrote:
> Samsung SoCs use the own OneNAND controler and detect OneNAND chip at power on.
> To use this feature, introduce the chip_probe function.
> 
> Also remove workaround for Samsung SoCs.
> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Pushed both to my l2-mtd-2.6.git / dunno.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
