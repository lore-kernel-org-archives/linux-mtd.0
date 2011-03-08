Subject: Re: [PATCH V2 1/2] mtd: nand: Allow NAND chip ids to be included
	standalone.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Murali Nalajala <mnalajal@codeaurora.org>
In-Reply-To: <1299542935-20291-1-git-send-email-mnalajal@codeaurora.org>
References: <1299542935-20291-1-git-send-email-mnalajal@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 08 Mar 2011 09:50:22 +0200
Message-ID: <1299570622.2754.4.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-arm-msm@vger.kernel.org, dwmw2@infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org, Dima Zavin <dima@android.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-03-08 at 05:38 +0530, Murali Nalajala wrote:
> Lets non-standard NAND drivers take advantage of known NAND
> chip information.
> 
> The initial development of msm nand driver, driver uses the supported
> NAND devices information as a hardcoded table. Remove the existing
> hardcoded supported flash device table and read the flash device
> information from the flash id table which are part of the mtd subsystem.

Why this initial version should be upstream? Why wouldn't you make it
"standard" first?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
