From: David Brown <davidb@codeaurora.org>
To: Murali Nalajala <mnalajal@codeaurora.org>
Subject: Re: [PATCH V2 1/2] mtd: nand: Allow NAND chip ids to be included
	standalone.
References: <1299542935-20291-1-git-send-email-mnalajal@codeaurora.org>
Date: Thu, 14 Apr 2011 16:33:02 -0700
In-Reply-To: <1299542935-20291-1-git-send-email-mnalajal@codeaurora.org>
	(Murali Nalajala's message of "Tue, 8 Mar 2011 05:38:55 +0530")
Message-ID: <8ya39lk5ryp.fsf@huya.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-arm-msm@vger.kernel.org, dwmw2@infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org, Dima Zavin <dima@android.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 07 2011, Murali Nalajala wrote:

> Lets non-standard NAND drivers take advantage of known NAND
> chip information.
>
> The initial development of msm nand driver, driver uses the supported
> NAND devices information as a hardcoded table. Remove the existing
> hardcoded supported flash device table and read the flash device
> information from the flash id table which are part of the mtd subsystem.
>
> Signed-off-by: Dima Zavin <dima@android.com>
> Signed-off-by: Murali Nalajala <mnalajal@codeaurora.org>

Acked-by: David Brown <davidb@codeaurora.org>

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
