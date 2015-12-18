Date: Fri, 18 Dec 2015 15:06:06 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Bayi Cheng <bayi.cheng@mediatek.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Kurtz <djkurtz@chromium.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, srv_heupstream@mediatek.com
Subject: Re: [RESEND PATCH] mtd: mtk-nor: adjust sequence of trigger function
 and assignment function
Message-ID: <20151218230606.GV10460@google.com>
References: <1450407760-30030-1-git-send-email-bayi.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1450407760-30030-1-git-send-email-bayi.cheng@mediatek.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 18, 2015 at 11:02:40AM +0800, Bayi Cheng wrote:
> Move write data register before excute command to avoid
> missing first byte write to nor flash
> 
> Signed-off-by: Bayi Cheng <bayi.cheng@mediatek.com>
> ---
> the previous patch didn't drop the Change-Id

Applied to l2-mtd.git
