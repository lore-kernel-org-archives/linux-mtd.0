Subject: Re: [PATCH 14/16] pcmcia: use dynamic debug infrastructure,
	deprecate CS_CHECK (misc drivers)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dominik Brodowski <linux@dominikbrodowski.net>
In-Reply-To: <1256413386-20501-14-git-send-email-linux@dominikbrodowski.net>
References: <20091024194219.GA19546@comet.dominikbrodowski.net>
	<1256413386-20501-14-git-send-email-linux@dominikbrodowski.net>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 26 Oct 2009 08:42:11 +0200
Message-Id: <1256539331.29885.360.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-pcmcia@lists.infradead.org, linux-mtd@lists.infradead.org,
	linux-usb@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2009-10-24 at 21:43 +0200, Dominik Brodowski wrote:
> Convert PCMCIA drivers to use the dynamic debug infrastructure, instead of
> requiring manual settings of PCMCIA_DEBUG.
> 
> Also, remove all usages of the CS_CHECK macro and replace them with proper
> Linux style calling and return value checking. The extra error reporting may
> be dropped, as the PCMCIA core already complains about any (non-driver-author)
> errors.
> 
> CC: linux-mtd@lists.infradead.org
> CC: linux-usb@vger.kernel.org
> Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>

Have you been able to test the driver after the clean-up?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
