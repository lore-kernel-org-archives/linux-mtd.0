From: David Woodhouse <dwmw2@infradead.org>
To: tharbaugh@lnxi.com
In-Reply-To: <1095190893.5442.35.camel@tubarao>
References: <MKELJOLMMOHJCMIPKLJKCEMOCAAA.j.karrer@lightmaze.com>
	<1095190893.5442.35.camel@tubarao>
Content-Type: text/plain
Message-Id: <1095194840.9144.273.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Tue, 14 Sep 2004 21:47:20 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Jochen Karrer <j.karrer@lightmaze.com>,
	steven.scholz@imc-berlin.de
Subject: Re: Bug in cfi_cmdset_0002.c in linux-2.6.8.1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-09-14 at 13:41 -0600, Thayne Harbaugh wrote:
> Anyone else that cares should comment now or I'll commit it so that it
> doesn't get forgotten.

Looks good -- best to commit it. Are there other places where we need
the same fix?

-- 
dwmw2
