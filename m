Message-ID: <4C0A86D9.2070106@mvista.com>
Date: Sat, 05 Jun 2010 21:18:17 +0400
From: Sergei Shtylyov <sshtylyov@mvista.com>
MIME-Version: 1.0
To: Wan ZongShun <mcuos.com@gmail.com>
Subject: Re: [PATCHv2 1/3] MTD/pxa: use __devinit for pxa2xx_flash_probe
References: <4C0A13BA.6050700@gmail.com>
In-Reply-To: <4C0A13BA.6050700@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Eric Miao <eric.y.miao@gmail.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Wan ZongShun wrote:

> This patch is to use the '__devinit' for pxa2xx_flash_probe.

    Why? Is it hot-pluggable device? I guess not...

> Signed-off-by: Wan ZongShun <mcuos.com@gmail.com>
> Acked-by: Eric Miao <eric.y.miao@gmail.com>

WBR, Sergei
