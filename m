From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501131219480.17331@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501131219480.17331@phoenix.infradead.org>
Content-Type: text/plain
Date: Thu, 13 Jan 2005 12:31:40 +0000
Message-Id: <1105619501.26551.163.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: CRC on Read-Only partition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-01-13 at 12:25 +0000, Artem B. Bityuckiy wrote:
> The blocks from this partition are not ever erased. They are once writte 
> when the device was shipped, checked.

I don't care. You show me formal proof that there cannot ever be an
error, or we check the CRC anyway :)

-- 
dwmw2
