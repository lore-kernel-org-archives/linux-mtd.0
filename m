Subject: Re: [PATCH v5 1/8] MTD: Add integrator-flash feature to physmap
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marc Zyngier <marc.zyngier@arm.com>
In-Reply-To: <1305610643.2630.15.camel@localhost>
References: <1305557977-16871-1-git-send-email-marc.zyngier@arm.com>
	<1305557977-16871-2-git-send-email-marc.zyngier@arm.com>
	<1305610643.2630.15.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 17 May 2011 08:46:18 +0300
Message-ID: <1305611178.2630.21.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-05-17 at 08:37 +0300, Artem Bityutskiy wrote:
> Sorry if this sounds like an attack, it is not. I just think that we
> carry crap for too long and should start forcing people to clean it up
> by not accepting changes :-)

Sorry, I forgot to note that I do not insist that you have to re-work
MTD partitions support - you already do a very good thing by killing a
redundant driver, and delaying this would be counter-productive. But I
anyway wanted to express my thoughts.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
