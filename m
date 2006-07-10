Subject: Re: [2.6 patch] make drivers/mtd/cmdlinepart.c:mtdpart_setup() static
From: David Woodhouse <dwmw2@infradead.org>
To: Sergei Shtylyov <sshtylyov@ru.mvista.com>
In-Reply-To: <44B23256.8030504@ru.mvista.com>
References: <20060626220215.GI23314@stusta.de>
	<1151416141.17609.140.camel@hades.cambridge.redhat.com>
	<20060629173206.GF19712@stusta.de>
	<1152436332.25567.12.camel@shinybook.infradead.org>
	<44B23256.8030504@ru.mvista.com>
Content-Type: text/plain
Date: Mon, 10 Jul 2006 12:37:33 +0100
Message-Id: <1152531453.3373.48.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: juha.yrjola@solidboot.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, jlavi@iki.fi, Adrian Bunk <bunk@stusta.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-07-10 at 14:56 +0400, Sergei Shtylyov wrote:
>     In addition, this function might be needed to support parsing of the 
> partition info extracted from the OF device tree (if this way of storing it 
> there will be accepted)... 

Yes, we should extend physmap to handle of_devices and partition
information represented as a string. It won't be mtdpart_setup() which
we use for that though.

-- 
dwmw2
