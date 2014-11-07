Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmlUw-0001Qo-Cn
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 15:30:50 +0000
Message-ID: <1415374224.22887.24.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V2] mtd: block2mtd: Present block2mtd timely on boot time
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Felix Fietkau <nbd@openwrt.org>
Date: Fri, 07 Nov 2014 17:30:24 +0200
In-Reply-To: <545CE335.8020503@openwrt.org>
References: <371358190.34795877.1410204429882.JavaMail.zimbra@redhat.com>
 <1444809468.34812041.1410206680931.JavaMail.zimbra@redhat.com>
 <20140909170231.GA14429@logfs.org>
 <1807144344.40128259.1410985683342.JavaMail.zimbra@redhat.com>
 <20141105202303.GN23619@ld-irv-0074>
 <1415372340.22887.23.camel@sauron.fi.intel.com>
 <545CE335.8020503@openwrt.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
 Herton Krzesinski <hkrzesin@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Rodrigo Freire <rfreire@redhat.com>,
 Brian Norris <computersforpeace@gmail.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-11-07 at 16:20 +0100, Felix Fietkau wrote:
> > The only usage of this driver is emulating a block device on top of NOR
> > flash, and in most cases, only for debugging / research purposes. This
> > is because (a) this driver does not handle bad blocks (and hence,
> > NAND-incompatible) and (b) it does read-erase-write when you modify a
> > block, so it is extremely slow and does not handle power cuts at all.
> I think you got things mixed up a bit. This is not about emulating a
> block device on top of NOR flash. This is about emulating NOR flash on
> top of a regular block device - e.g. USB sticks, SD cards.

Gosh, I'm sorry, you are right. I did mix things up, please, ignore my
e-mail.
