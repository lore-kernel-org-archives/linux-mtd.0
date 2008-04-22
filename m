Subject: Re: [PATCH] mtd: support for bit-reversed CFI cmd/query
From: David Woodhouse <dwmw2@infradead.org>
To: "Nikita V. Youshchenko" <yoush@cs.msu.su>
In-Reply-To: <200802272348.13180@blacky.localdomain>
References: <200802272348.13180@blacky.localdomain>
Content-Type: text/plain
Date: Tue, 22 Apr 2008 19:56:31 +0100
Message-Id: <1208890591.9212.654.camel@pmac.infradead.org>
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

On Wed, 2008-02-27 at 23:48 +0300, Nikita V. Youshchenko wrote:
>     mtd: support for bit-reversed CFI cmd/query
>     
>     Some embedded boards have flash chips connected with reversed bit order.
>     Example for 16-bit width:
>      chip D0 is bus D15
>      chip D1 is bus D14
>      ...
>      chip D15 is bus D0
>     It works perfectly for data access, however probing and issuing CFI commands
>     for such chips require bit reversing. This patch adds support for this.
>     
>     Signed-off-by: Nikita Youshchenko <yoush@cs.msu.su>

Am I missing something, or did you only reverse the bits on 16-bit and
64-bit access, and not 8-bit or 32-bit?

-- 
dwmw2
