Subject: Re: [PATCH] mtd: Increase NAND_MAX_OOBSIZE from 128 to 256
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <e511d9573281d8376f800574fac2d72663e2d558@localhost.localdomain>
References: <e511d9573281d8376f800574fac2d72663e2d558@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 05 May 2010 14:19:05 +0300
Message-ID: <1273058345.3702.175.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-05-03 at 21:20 -0700, Kevin Cernekee wrote:
> NAND_MAX_OOBSIZE needs to be increased to support newer parts with
> 218 or 224 byte spare areas.  Tested with Samsung K9GAG08U0D.
> 
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>

Pushed to l2-mtd-2.6 / master

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
