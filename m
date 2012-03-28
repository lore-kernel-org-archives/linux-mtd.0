Received: from galois.linutronix.de ([2001:470:1f0b:1c35:abcd:42:0:1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SCpXe-0004y9-QG
 for linux-mtd@lists.infradead.org; Wed, 28 Mar 2012 09:51:48 +0000
Date: Wed, 28 Mar 2012 11:51:42 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: nand_base - kill chip->oob_poi?
In-Reply-To: <CAN8TOE_8sTtuvBq+SOSLv5Kbw_2G8ByX-euiDm=z2btO-kLkcw@mail.gmail.com>
Message-ID: <alpine.LFD.2.02.1203281149010.2542@ionos>
References: <CAN8TOE_8sTtuvBq+SOSLv5Kbw_2G8ByX-euiDm=z2btO-kLkcw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 27 Mar 2012, Brian Norris wrote:

> Hi,
> 
> I'm looking to support a new NAND hardware controller, and it doesn't
> support OOB read/write for its fastest modes of operation, since most
> normal activity (i.e., UBI(FS)) doesn't need OOB. So I'm trying to

And how is ECC working for that "normal" activity ?

Using NAND w/o ECC is doomed for fail.

Aside of that improvements to the NAND code are always welcome,
modifications which are solely done to support insane usage of NAND
FLASH not so much.

Thanks,

	tglx
