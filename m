From: David Woodhouse <dwmw2@infradead.org>
To: Kalev Lember <kalev@colleduc.ee>
In-Reply-To: <4166DC47.5010104@colleduc.ee>
References: <20041004215001.769d8017.nipo@ssji.net>
	<Pine.LNX.4.44.0410051152070.2033-100000@kiire.colleduc.ee>
	<20041006213434.55d36d65.nipo@ssji.net> <4166DC47.5010104@colleduc.ee>
Content-Type: text/plain
Message-Id: <1097262923.318.177.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 08 Oct 2004 20:15:23 +0100
Content-Transfer-Encoding: 7bit
Cc: Nicolas Pouillon <nipo@ssji.net>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]Probing at 0x0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-10-08 at 21:28 +0300, Kalev Lember wrote:
> No, it is not supported. According to 
> http://www.tri-m.com/products/msystems/files/specs/mddoc_spec.pdf the 32 
> MB Millennium Plus has 16 bit data bus while the supported 16 MB Mil+ 
> has 8 bit bus.

I think you can use it in 8-bit mode too though. The old doc2001plus
driver handled them both, didn't it?

-- 
dwmw2
