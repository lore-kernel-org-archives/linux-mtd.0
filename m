Message-ID: <1358965730.13715.0.camel@gitbox>
Subject: Re: [PATCH v3 1/2] mtd: Add a common JEDEC flash device table
From: Tony Prisk <linux@prisktech.co.nz>
To: vt8500-wm8505-linux-kernel@googlegroups.com
Date: Thu, 24 Jan 2013 07:28:50 +1300
In-Reply-To: <50FFA692.2060907@parrot.com>
References: <1358928068-12417-1-git-send-email-linux@prisktech.co.nz>
 <1358928068-12417-2-git-send-email-linux@prisktech.co.nz>
 <50FFA692.2060907@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-01-23 at 10:00 +0100, Matthieu CASTET wrote:
> Tony Prisk a écrit :
> > This patch adds a common JEDEC flash device table which can be
> > expanded on as more features are required.
> > 
> > A simple match function is also included to query the table for
> > a match based on the JEDEC id.
> 
> Why don't you use id from include/linux/mtd/cfi.h that is used by flash driver
> like drivers/mtd/devices/m25p80.c ?
> 

Thanks - have changed for v4.

Regards
Tony P
