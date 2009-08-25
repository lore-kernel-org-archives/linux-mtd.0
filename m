Message-Id: <51514DBF-F4DF-4CC4-BCE7-96E4726BD854@kernel.crashing.org>
From: Kumar Gala <galak@kernel.crashing.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20090825135241.GA20036@codiert.org>
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v936)
Subject: Re: [PATCH] MTD ofpart: Check availability of reg property instead of
	name property
Date: Tue, 25 Aug 2009 08:55:34 -0500
References: <20090825135241.GA20036@codiert.org>
Cc: linuxppc-dev list <linuxppc-dev@ozlabs.org>, linux-mtd@lists.infradead.org,
	Benjamin Krill <ben@codiert.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Aug 25, 2009, at 8:52 AM, Benjamin Krill wrote:

> The previous implementation breaks the dts binding "mtd- 
> physmap.txt". This
> implementation fixes the issue by checking the availability of the reg
> property instead of the name property.
>
> Signed-off-by: Benjamin Krill <ben@codiert.org>
> ---
> drivers/mtd/ofpart.c |   21 ++++++++++-----------
> 1 files changed, 10 insertions(+), 11 deletions(-)

David,

Can you look at pushing this for .31 if possible.  We have a # of  
device trees in the kernel which have "broken" functionality because  
of this.

- k
