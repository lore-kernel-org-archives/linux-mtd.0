Date: Tue, 8 Feb 2005 10:31:19 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Sergei Sharonov <Sergei.Sharonov@Halliburton.com>
In-Reply-To: <487B538D08487B4D8FEC138A13D4F6AC21D8A5@HOUEXCH077.corp.halliburton.com>
Message-ID: <Pine.LNX.4.58.0502081028020.13460@phoenix.infradead.org>
References: <487B538D08487B4D8FEC138A13D4F6AC21D8A5@HOUEXCH077.corp.halliburton.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Low write throughput with arm/jffs2/nand
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 7 Feb 2005, Sergei Sharonov wrote:
> Hi,
> 
> Around Jan 18 nand_wait() function in nand_base.c was changed to 
> use msleep(1) instead of yield(). While it is sort of OK on x86
> with its default HZ=1000 (linux 2.6) it slows down the throughput
> on arm where the default is HZ=100. What I believe is happening:
> - on the first pass flash is not ready
> - msleep(1) is invoked, but it actually sleeps 10 or 20 ms
> 
> What will be the right way of fixing that? Replacing msleep(1) with
> yield() does it but philosophically is probably not the right thing 
> to do, changing HZ is much worse..
> 
> Sergei
> 
> P.S. What is the best read/write speed you people are getting with 
> jffs2/nand?
This is highly depended on whether you use compression and the compression 
mode.

> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
