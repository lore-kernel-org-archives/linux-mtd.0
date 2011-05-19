Subject: Re: [PATCH v6 1/8] MTD: Add integrator-flash feature to physmap
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marc Zyngier <marc.zyngier@arm.com>
In-Reply-To: <1305637877-24436-2-git-send-email-marc.zyngier@arm.com>
References: <1305637877-24436-1-git-send-email-marc.zyngier@arm.com>
	<1305637877-24436-2-git-send-email-marc.zyngier@arm.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 19 May 2011 14:14:17 +0300
Message-ID: <1305803657.2630.64.camel@localhost>
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

On Tue, 2011-05-17 at 14:11 +0100, Marc Zyngier wrote:
> In the process of moving platforms away from integrator-flash
> (aka armflash), add to physmap the few features that make
> armflash unique:
> 
> - optionnal probing for the AFS partition type
> - init() and exit() methods, used by Integrator to control
>   write access to the various onboard programmable components
> 
> Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Cc: David Woodhouse <dwmw2@infradead.org>

Acked-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
