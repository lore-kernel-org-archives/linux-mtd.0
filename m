Subject: Re: [PATCH 2/2] mtd: nand: Increase NAND_MAX_OOBSIZE
From: David Woodhouse <dwmw2@infradead.org>
To: Brian Norris <norris@broadcom.com>
In-Reply-To: <4C6EF36F.2080306@broadcom.com>
References: <1282332973-12077-1-git-send-email-norris@broadcom.com>
	<1282332973-12077-2-git-send-email-norris@broadcom.com>
	<1282333385.25239.88.camel@localhost> <4C6EF36F.2080306@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 Aug 2010 22:38:42 +0100
Message-ID: <1282340322.25239.137.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Kevin Cernekee <cernekee@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-08-20 at 14:28 -0700, Brian Norris wrote:
> For the MAX macros? I have no idea. There were comments there telling
> me to do this whenever newer chips are supported. 

I was thinking of the nand_ecc_layout stuff, I think.

Perhaps these buffers should be dynamically allocated and we should
ditch the MAX macros altogether?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
