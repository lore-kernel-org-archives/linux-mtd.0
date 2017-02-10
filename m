Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ccFyp-0005x3-5R
 for linux-mtd@lists.infradead.org; Fri, 10 Feb 2017 18:31:40 +0000
Received: by mail-pg0-x243.google.com with SMTP id 194so3691807pgd.0
 for <linux-mtd@lists.infradead.org>; Fri, 10 Feb 2017 10:31:14 -0800 (PST)
Date: Fri, 10 Feb 2017 10:31:11 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 0/2] Add a "label" property to the mtd device
Message-ID: <20170210183111.GB125303@google.com>
References: <1486632068-14894-1-git-send-email-clg@kaod.org>
 <ceb3ad29-a5fc-86d5-a2f3-dd2c1620fc57@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ceb3ad29-a5fc-86d5-a2f3-dd2c1620fc57@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 09, 2017 at 09:25:32PM +0100, Marek Vasut wrote:
> On 02/09/2017 10:21 AM, Cédric Le Goater wrote:
> > Hello,
> > 
> > Herer are a couple of patches adding a "label" property to the mtd
> > device, which can be used to identify a specific chip on a system with
> > multiple chips. This is common on the OpenPower boards, there can be
> > four chips holding the firmware for the BMC and the firmware for the
> > host, plus chips with golden images for recovery.
> 
> Series is
> Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

Applied to l2-mtd.git.
