Subject: Re: mtd: fix hang-up in cfi erase and read contention
From: David Woodhouse <dwmw2@infradead.org>
To: Tadashi Abe <tabe@mvista.com>
Date: Wed, 25 May 2011 02:11:33 +0100
In-Reply-To: <1306285741.7218.96.camel@i7.infradead.org>
References: <4DD4BF87.6030107@mvista.com>
	<1306285741.7218.96.camel@i7.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1306285897.7218.97.camel@i7.infradead.org>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-05-25 at 02:08 +0100, David Woodhouse wrote:
> I'm confused. You've removed the code which ensures that the chip is in
> a known state.... why? 

Oh, because put_chip() does it :)

-- 
dwmw2
