Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uanyn-0007A1-EI
 for linux-mtd@lists.infradead.org; Fri, 10 May 2013 14:07:26 +0000
Message-ID: <1368194990.26780.167.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBIFS: cosmetic: correct mount message
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Fri, 10 May 2013 17:09:50 +0300
In-Reply-To: <1364898277-30146-1-git-send-email-richard.genoud@gmail.com>
References: <1364898277-30146-1-git-send-email-richard.genoud@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-04-02 at 12:24 +0200, Richard Genoud wrote:
> When mounting an UBIFS R/W volume, we have the message:
> UBIFS: mounted UBI device 0, volume 1, name "rootfs"(null)
> With this patch, we'll have:
> UBIFS: mounted UBI device 0, volume 1, name "rootfs"
> Which is, I think, what was intended.
> 
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>

Although this is consmetic, I think it deserves to be added to the
stable kernels, so I pushed this to linux-ubifs.git and added

Cc: stable@vger.kernel.org [v3.7+]

-- 
Best Regards,
Artem Bityutskiy
