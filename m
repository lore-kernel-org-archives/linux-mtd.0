From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/7] mtd: nand: davinci: extend description of bindings
Date: Wed, 20 Nov 2013 16:46:21 +0100
References: <1384960945-14528-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1384960945-14528-7-git-send-email-ivan.khoronzhuk@ti.com>
In-Reply-To: <1384960945-14528-7-git-send-email-ivan.khoronzhuk@ti.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201311201646.21435.arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 grygorii.strashko@ti.com, Russell King <linux@arm.linux.org.uk>,
 Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>,
 linux-kernel@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@ti.com>,
 Rob Landley <rob@landley.net>, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 20 November 2013, Ivan Khoronzhuk wrote:
> Extend bindings for davinci_nand driver to be more clear.
> 
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
> ---
>  .../devicetree/bindings/mtd/davinci-nand.txt       |   77 ++++++++++++++------
>  1 file changed, 54 insertions(+), 23 deletions(-)

Hi Ivan,

The changes look good to me, but please clarify in the changeset description
above whether this is a backwards-compatible change, a clarification without
semantic changes, or an incompatible change (which should be avoided).

	Arnd
