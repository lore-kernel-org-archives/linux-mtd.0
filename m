From: David Woodhouse <dwmw2@infradead.org>
To: Alice Hennessy <ahennessy@mvista.com>
In-Reply-To: <401FEA03.7DCCA6F5@mvista.com>
References: <4018514D.6E4DB38A@mvista.com>
	<401FEA03.7DCCA6F5@mvista.com>
Content-Type: text/plain
Message-Id: <1075847401.786.3961.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 03 Feb 2004 22:30:02 +0000
Content-Transfer-Encoding: 7bit
cc: andrzej_mialkowski@o2.pl
cc: linux-mtd@lists.infradead.org
Subject: Re: gen probe.c issue
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-02-03 at 10:35 -0800, Alice Hennessy wrote:
> I believe it's ok to set up partitions for a flash and not have all the flash visible.  Perhaps
> a better way to do this would be to just make another partition and make the protected part
> read only.   But I believe not making the whole flash visible is also acceptable.
> BTW, I don't use redboot partitioning with this flash.
> 
> David,  if you think it's bad practice,  I will change my mapping file instead.

I'd very much prefer to show the chip driver the whole chip and
partition it appropriately, yes please.

-- 
dwmw2
