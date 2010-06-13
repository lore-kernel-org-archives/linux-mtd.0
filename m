Subject: Re: [patch] mtd: return success on blktrans_ioctl()
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Dan Carpenter <error27@gmail.com>
In-Reply-To: <20100531140337.GV5483@bicker>
References: <20100531140337.GV5483@bicker>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 13 Jun 2010 12:08:04 +0300
Message-ID: <1276420084.19028.182.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, kernel-janitors@vger.kernel.org,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	linux-mtd@lists.infradead.org, Ben Hutchings <bhutchings@solarflare.com>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-05-31 at 16:03 +0200, Dan Carpenter wrote:
> There was a break missing so we returned -ENOTTY on success instead of
> zero.  This was introduced by 048d8719956: "mtd: blktrans: Hotplug fixes"
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
