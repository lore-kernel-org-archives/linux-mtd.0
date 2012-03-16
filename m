Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S8a3b-0006gY-El
 for linux-mtd@lists.infradead.org; Fri, 16 Mar 2012 16:31:11 +0000
Message-ID: <4F636AB4.7080008@newsguy.com>
Date: Fri, 16 Mar 2012 09:30:44 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 0/3] MTD: Change meaning of -EUCLEAN return code on reads
References: <1331832353-15569-1-git-send-email-mikedunn@newsguy.com>
 <20120316111939.GA10362@parrot.com>
 <1331902176.3730.75.camel@sauron.fi.intel.com>
In-Reply-To: <1331902176.3730.75.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Ivan Djelic <ivan.djelic@parrot.com>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/16/2012 05:49 AM, Artem Bityutskiy wrote:
>> Consider the following situation:
>> - a NAND device with 2kB pages and 4 ecc steps per page (4 x 512 bytes)
>> - the driver has chip->ecc.strength = 4, and therefore mtd->ecc_strength = 16
> 
> I would expect in this case we should have mtd->ecc_strength = 4 anyway.


But Ivan is correct; the patches would make it 16 because it is per page, not
per ecc.size.
