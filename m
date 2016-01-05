Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGM8Z-0001M0-Hp
 for linux-mtd@lists.infradead.org; Tue, 05 Jan 2016 07:34:36 +0000
Subject: Re: [PATCH 0/6] MTD: lantiq: xway: various nand fixes
To: Brian Norris <computersforpeace@gmail.com>
References: <1451941501-42952-1-git-send-email-blogic@openwrt.org>
 <20160104233049.GA128501@google.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
From: John Crispin <blogic@openwrt.org>
Message-ID: <568B71EC.2070309@openwrt.org>
Date: Tue, 5 Jan 2016 08:34:04 +0100
MIME-Version: 1.0
In-Reply-To: <20160104233049.GA128501@google.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 05/01/2016 00:30, Brian Norris wrote:
> On Mon, Jan 04, 2016 at 10:04:55PM +0100, John Crispin wrote:
>> This series adds various fixes for the nand driver used on Lantiq DSL SoC.
> 
> Is there a good reason this driver uses plat_nand? That seems like an
> unnecessary abstraction layer. It'd be clearer to just refactor the
> driver to be a proper platform driver...
> 
> Also, I see that there's no DT binding doc.
> 
> Can these things be cleaned up?
> 
> Brian
> 


grml, i was kinda hoping this would be a no brainer. the problem is that
i don't even have the HW so refactoring / big changes are a no go or
would require me to find users with the HW first.

i'll try to get this resolved for v4.6.

	John
