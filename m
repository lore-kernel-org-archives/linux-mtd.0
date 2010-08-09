Subject: Re: [PATCH] Add quick erase format option
From: David Woodhouse <dwmw2@infradead.org>
To: "stefani@seibold.net" <stefani@seibold.net>
In-Reply-To: <1281342353-18180-1-git-send-email-stefani@seibold.net>
References: <1281342353-18180-1-git-send-email-stefani@seibold.net>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 09 Aug 2010 09:37:18 +0100
Message-ID: <1281343038.12908.25.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-08-09 at 09:25 +0100, stefani@seibold.net wrote:
> From: Stefani Seibold <stefani@seibold.net>
> 
> This patch add a quick format option which skips erasing of already erased
> flash blocks. This is useful for first time production environments where
> the flash arrived erased.
> 
> Signed-off-by: Stefani Seibold <stefani@seibold.net> 

This scares me, given the lengths we had to go to in JFFS2 to cope with
blocks which *look* like they're erased, but which actually start losing
data as soon as you start writing to them because the erase didn't
complete.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
